Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B30CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49EE81261;
	Sun, 12 Oct 2025 18:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f28TXc5Bxa_k; Sun, 12 Oct 2025 18:22:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D5BD812B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D5BD812B8;
	Sun, 12 Oct 2025 18:22:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A4EEBC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67AB4607DE
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwu7-QwQwB5I for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 689EA60725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 689EA60725
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 689EA60725
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4940A4C670F;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g6-000000000yp-0BFD;
 Sun, 12 Oct 2025 18:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:07 +0200
Message-ID: <20251012182016.2711834-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=7EL5gJdTHKQcHq43Y5i1nrUv33CueIRNlf9EC+mDAXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W5YoM8vgoI+BqpsV1hRTOW7ioA0nv0pisSEyc0hiULI424tBvOGiFpg97eIkK7IV+
 yi0L5UD1yjfIxYqb6ysl8K+JBTWSY/riCOGb9p+u9Oq4IiyfCq5asRjhCDYyxZQtqW
 iUTctOrau+rKYSOZMuDf+I7OCVxi8VRUe0bFwAmvvHEOj7XFKcoDJa8+4NKLOxXdAN
 01mISqtBClM340cgukbXzduohfVaRezVR46ze1MmDFvRjs4aFnXmrEJWF4fBzXw04t
 D8JGZ+B3PDPNzj541f/I6dwpFkeUo6yiLE3zc2GgEnPpc1Wxm7/bMI6IzKA7123V98
 k4MAU/qfB97Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=W5YoM8vg
Subject: [Buildroot] [PATCH 12/21] package/python-canopen: bump version to
 2.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-canopen/python-canopen.hash | 4 ++--
 package/python-canopen/python-canopen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-canopen/python-canopen.hash b/package/python-canopen/python-canopen.hash
index 8a38dc16a3..ac7a3d325f 100644
--- a/package/python-canopen/python-canopen.hash
+++ b/package/python-canopen/python-canopen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/canopen/json
-md5  808c04aa0394210be9eeb46fb6e3bf96  canopen-2.3.0.tar.gz
-sha256  792084a93c138d5b2a406ddd2d4eb5ce208f03bd8fda60f81ad2bb8d56c6b827  canopen-2.3.0.tar.gz
+md5  8d79bea6f61915c300f619cc32cfc7a9  canopen-2.4.1.tar.gz
+sha256  20a84bc498b34dadd79cece467d3bbe19591c1c02a8f39331bcc6065c4d8b2eb  canopen-2.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0740d30978affcd91c0fc817b7cf942a332381bf0380fe17e60c6a0b377c6e0d  LICENSE.txt
diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index e9747dcdf2..b36acf8c0b 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CANOPEN_VERSION = 2.3.0
+PYTHON_CANOPEN_VERSION = 2.4.1
 PYTHON_CANOPEN_SOURCE = canopen-$(PYTHON_CANOPEN_VERSION).tar.gz
-PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/1a/b3/733e5f98c995d7f3e82853bc5ee2f0677df6203d51d8a4387af188322523
+PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/be/ea/f2654cb432988dfe9ab93140ff502f7e2e7eaa1835e8aaa4ee5a935af736
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
