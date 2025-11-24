Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93813CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 17:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528BB8282C;
	Mon, 24 Nov 2025 17:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eruu0JqHe8BW; Mon, 24 Nov 2025 17:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C4882835
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76C4882835;
	Mon, 24 Nov 2025 17:15:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC3A334E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A38406D2
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:15:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIP0ACnfGXdb for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 17:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D448B406B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D448B406B9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D448B406B9
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:15:34 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C77382C80043;
 Mon, 24 Nov 2025 18:15:31 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 18:15:31 +0100
Message-ID: <20251124171531.3131732-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764004532; bh=WPcT6T/ylScj0sqGPpfKAfQFP/7WATo6wCb+uF2+gNI=;
 h=From:To:Cc:Subject:Date;
 b=QRMeZPqOgfMeFRtSu47OqZUihxQo5THNPFkUjeb6iaJvAxsuecGWft8ncjW5tzPSy
 xzx99Dbk0lHZG0F/MPnaH+2NyHWYnRGQ/23qWBquGFyyzx3/HQoa0JWcjUurL04Hp4
 nAyfFtTrh9WKOnBw+uJgDMCiH1YOQ8m+k7Vy6HTiiTYehcp1V1HvkcLY6BFc80n1Fl
 bgDpIkMOdaFK4fFenroYNfa+FQX7F3uF6DtybZsCp8U7gM7FrPRUqMQQl4yvGb9FMN
 yQLhhs3NFrrRBHE9UTqgGpY77J1DNaf5iFJmzQBqVGEZ5JeCU6IXW5ZM2Oz6E0tX+U
 OksP3GVKyFo0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=QRMeZPqO
Subject: [Buildroot] [PATCH] package/python-wrapt: bump to 2.0.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://wrapt.readthedocs.io/en/latest/changes.html#version-2-0-1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-wrapt/python-wrapt.hash | 4 ++--
 package/python-wrapt/python-wrapt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 69a464ff49..3fc809d9c0 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  bdc6d3460db4cdee3383dfe318b5c317  wrapt-2.0.0.tar.gz
-sha256  35a542cc7a962331d0279735c30995b024e852cf40481e384fd63caaa391cbb9  wrapt-2.0.0.tar.gz
+md5  43c737f84345bc317bbb028d9de1b4e4  wrapt-2.0.1.tar.gz
+sha256  9c9c635e78497cacb81e84f8b11b23e0aacac7a136e73b8e5b2109a1d9fc468f  wrapt-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9abc41aa6b8690c07ede9b44b7c6233d014290ed1e3b5ccc37e292295b5d058f  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 8fff0cf3fa..86454371b2 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 2.0.0
+PYTHON_WRAPT_VERSION = 2.0.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/19/5e5bcd855d808892fe02d49219f97a50f64cd6d8313d75df3494ee97b1a3
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/49/2a/6de8a50cb435b7f42c46126cf1a54b2aab81784e74c8595c8e025e8f36d3
 PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
