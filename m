Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A0C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4472F6080C;
	Sat, 17 May 2025 11:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xR4VIyEITGLf; Sat, 17 May 2025 11:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4886060893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4886060893;
	Sat, 17 May 2025 11:22:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E161DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9807240F8D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkmmNxk5HxPc for <buildroot@buildroot.org>;
 Sat, 17 May 2025 11:22:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A62D740409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A62D740409
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A62D740409
 for <buildroot@buildroot.org>; Sat, 17 May 2025 11:22:29 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 30CC42C83022;
 Sat, 17 May 2025 13:22:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 13:22:23 +0200
Message-ID: <20250517112226.129662-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747480947; bh=V6Q2tFy2Igwl6bF4mreIvy7ZvbJtA7OyItotEwuyngI=;
 h=From:To:Cc:Subject:Date;
 b=RsaOjjj47bfVfEsaVVhss64gjvaAAlXz1NEJvYCDUlnrrvKIIvoPy+HGRBfgFaXSw
 HklVCNaIpz1+iqN5G97VVhw/pTd8cdMOgPYdfN2Gtxz/L7a1GUC2/4m5hDa/ozZDCA
 FM42tMYjz45KOz/xviiX2IXy9B0ZwZHdTVDkEKSTxtUoY9cSSF119CY29iLCtW3fN1
 FX/+r4+f0McAQLHfnjfctxSuZxAkV0xRaPwHb0vz6GK45vJ61Da8Yeb+CtlB0IZQsL
 E8QML5tD5etWhClOfRGwB2TmIKh14iCra/Kqx4UM3Ax0UXR80APg09exnwj7h4aiZ1
 RffrNUMwukBWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=RsaOjjj4
Subject: [Buildroot] [PATCH 1/2] package/python-crc: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-crc/Config.in       |  6 ++++++
 package/python-crc/python-crc.hash |  5 +++++
 package/python-crc/python-crc.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-crc/Config.in
 create mode 100644 package/python-crc/python-crc.hash
 create mode 100644 package/python-crc/python-crc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4df675aaf..e43d265d7a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2274,6 +2274,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-crc/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-pydantic/
diff --git a/package/Config.in b/package/Config.in
index 33dc03a28a..2d787aebc3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1073,6 +1073,7 @@ menu "External python modules"
 	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
 	source "package/python-crayons/Config.in"
+	source "package/python-crc/Config.in"
 	source "package/python-crc16/Config.in"
 	source "package/python-crcmod/Config.in"
 	source "package/python-crontab/Config.in"
diff --git a/package/python-crc/Config.in b/package/python-crc/Config.in
new file mode 100644
index 0000000000..7f5fb72307
--- /dev/null
+++ b/package/python-crc/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CRC
+	bool "python-crc"
+	help
+	  Pure Python CRC library.
+
+	  https://github.com/Nicoretti/crc
diff --git a/package/python-crc/python-crc.hash b/package/python-crc/python-crc.hash
new file mode 100644
index 0000000000..f54044af5b
--- /dev/null
+++ b/package/python-crc/python-crc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/crc/json
+md5  cca626fb7bc30b4c468216ca67ee21c2  crc-7.1.0.tar.gz
+sha256  99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f331052a41d66c07d  crc-7.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  803152006c87fdfd8b30b087734fd590e7a8d871df1a6de40a8fbdd27673907f  LICENSE.txt
diff --git a/package/python-crc/python-crc.mk b/package/python-crc/python-crc.mk
new file mode 100644
index 0000000000..afee463092
--- /dev/null
+++ b/package/python-crc/python-crc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-crc
+#
+################################################################################
+
+PYTHON_CRC_VERSION = 7.1.0
+PYTHON_CRC_SOURCE = crc-$(PYTHON_CRC_VERSION).tar.gz
+PYTHON_CRC_SITE = https://files.pythonhosted.org/packages/7e/e6/c3488c35ecae290751466252e5ea01ef50fc67bfc1a9aba43983329b7025
+PYTHON_CRC_SETUP_TYPE = poetry
+PYTHON_CRC_LICENSE = BSD-2-Clause
+PYTHON_CRC_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
