Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35280C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 12:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C858D40821;
	Sat, 17 May 2025 12:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEFiThnpsUVN; Sat, 17 May 2025 12:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3EFC40C8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3EFC40C8E;
	Sat, 17 May 2025 12:14:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63593E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5427840CB4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW3E2F_ITUAs for <buildroot@buildroot.org>;
 Sat, 17 May 2025 12:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E92B40821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E92B40821
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E92B40821
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:14:13 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BECFE2C83022;
 Sat, 17 May 2025 14:14:10 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 14:14:07 +0200
Message-ID: <20250517121410.347705-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747484051; bh=p0eXWToBsytxuUV1M5YO5PVfVBJAej2DKRh+sIMW4JA=;
 h=From:To:Cc:Subject:Date;
 b=bjoPVahtMIQJq5bUqVsIFMaBTiLc8VDn41g4pBkvWh8AYY+5xIW13ZzBURldqf5nQ
 X+/QjEdNFKg7duPKgUDUicNEFdB/VQegAEO4A6BDB8NfXYcwbEZe9pStdgZ5Cl+BC7
 tDJYVPlkbXId3MCgKe555ZKt+73hgun4h6kOEzVPfqS2Yfvx60UVXpOJIHWWd0dRVD
 AVOWsZynze0FeS2s1B99lUaAh3J2V2K6pnOgkG1kH//qrelqzWWQfkV1m1PurCVKEu
 83Cl8fFn4pCxxoe4ph23FYp2hM02JzJJShyLfvaDU/CZXyoatTBetATOIcoZvFnECW
 NnD0TBXc8gGJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=bjoPVaht
Subject: [Buildroot] [PATCH 1/2] package/python-apscheduler: new package
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
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/python-apscheduler/Config.in              |  7 +++++++
 .../python-apscheduler/python-apscheduler.hash    |  5 +++++
 package/python-apscheduler/python-apscheduler.mk  | 15 +++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/python-apscheduler/Config.in
 create mode 100644 package/python-apscheduler/python-apscheduler.hash
 create mode 100644 package/python-apscheduler/python-apscheduler.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c4df675aaf..454fea0f66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2274,6 +2274,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-apscheduler/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-pydantic/
diff --git a/package/Config.in b/package/Config.in
index 33dc03a28a..1018fca7e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "External python modules"
 	source "package/python-anyio/Config.in"
 	source "package/python-apispec/Config.in"
 	source "package/python-appdirs/Config.in"
+	source "package/python-apscheduler/Config.in"
 	source "package/python-argcomplete/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
diff --git a/package/python-apscheduler/Config.in b/package/python-apscheduler/Config.in
new file mode 100644
index 0000000000..ebb9b13cfa
--- /dev/null
+++ b/package/python-apscheduler/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_APSCHEDULER
+	bool "python-apscheduler"
+	select BR2_PACKAGE_PYTHON_TZLOCAL # runtime
+	help
+	  Task scheduling library for Python.
+
+	  https://apscheduler.readthedocs.io
diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
new file mode 100644
index 0000000000..1f2ba1f82e
--- /dev/null
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/apscheduler/json
+md5  1705663d09aeb1b174f964780c57520a  apscheduler-3.11.0.tar.gz
+sha256  4c622d250b0955a65d5d0eb91c33e6d43fd879834bf541e0a18661ae60460133  apscheduler-3.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
new file mode 100644
index 0000000000..c5d89c5c2d
--- /dev/null
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-apscheduler
+#
+################################################################################
+
+PYTHON_APSCHEDULER_VERSION = 3.11.0
+PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/4e/00/6d6814ddc19be2df62c8c898c4df6b5b1914f3bd024b780028caa392d186
+PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
+PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_APSCHEDULER_LICENSE = MIT
+PYTHON_APSCHEDULER_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
