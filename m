Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CDAC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 120384057B;
	Wed,  7 Aug 2024 09:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFTKwbBX48Qk; Wed,  7 Aug 2024 09:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD82F405FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD82F405FD;
	Wed,  7 Aug 2024 09:28:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA231BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C8680ED0
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC_ev_UsLqyQ for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:28:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2EA880ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2EA880ECA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2EA880ECA
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:28:16 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B54CD2C8021C;
 Wed, 07 Aug 2024 11:28:14 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 11:28:13 +0200
Message-Id: <20240807092813.113613-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723022894; bh=JpWyNYoaUXS22E9F9AQ3q0+UIk0KWpC9j0Cg46RDkMU=;
 h=From:To:Cc:Subject:Date;
 b=i6KRcBsxo73aZap6gWtgLtY8kwDJ5tGzIBNisPSu3ywbqoBuDOeg7wTfLFJhQrMcm
 PA/zqWgb80g9aG3/sNRMxJNnYVoLFfWRoLTT8QF5Jbti30kYonYkLvHtXv9UMs3VwV
 gJhIJnNyULMu7nlRjBqDiGT1jIg4MJg+PTowVBFMGA8O/6jZi86ovla8clCc5rUUjq
 vCGBaeEdVFyEkxWc5yv47tPREAhKHDvWz8/7LdhDcksPmRoQQq87+gInYMILVtnlHk
 GpwDDf2mulqr9EhuEwmHGwEwznOUOEepP7dizRd+8TW8bQT1wZZUlrIWuK+NAWTkSg
 a+PodJrGEWctA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=i6KRcBsx
Subject: [Buildroot] [PATCH] package/python-pymodbus: bump to 3.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.7.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 37c44f6a06..7c8f352de4 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  5201e93420b9ac9dc5e3e64a656101cc  pymodbus-3.6.9.tar.gz
-sha256  f4223b72c20cd00a2cf25f6ddb31ecb2c0587309111a55283b2f4a1ac115e4cc  pymodbus-3.6.9.tar.gz
+md5  3bdc2a574cbfd10ec6dddf38c3f26598  pymodbus-3.7.0.tar.gz
+sha256  5c772babaa61a65ff908293faa668aedcd9d9e10f4bcf5c77a8fe51a6fd9ed47  pymodbus-3.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index cba94896bb..6a7c384cf6 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.6.9
+PYTHON_PYMODBUS_VERSION = 3.7.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/b4/a4/5322c8e3be3bb2db7ab3eb7c2160fd2ec325083d7e60a76cd9cc896dd7bd
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/cc/83/de0c3596f17ac4833f591e96cafee7ae6109d846d607387b48f88d66759a
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
