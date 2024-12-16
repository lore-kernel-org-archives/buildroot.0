Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0BC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352E94F623;
	Fri, 28 Feb 2025 16:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDLAIcgv3Ov2; Fri, 28 Feb 2025 16:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B034F650
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9B034F650;
	Fri, 28 Feb 2025 16:40:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F53E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17AAA42567
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drSROX1-h9ta for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7652424CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7652424CF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E07B8820F8; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Dec 2024 22:11:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 24615d1502e2293da0bcbc34ad6042ef35e665d1
X-Git-Newrev: 310d46ca9646491d295547904d9c8f574dc52424
X-Patchwork-Hint: ignore
Message-Id: <20250228162941.E07B8820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-m2crypto:
 remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=310d46ca9646491d295547904d9c8f574dc52424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The python-m2crypto package was removed as it is in maintained
only mode and is not recommended for new projects.

See:
https://gitlab.com/m2crypto/m2crypto/-/commit/3721ec298f3b62625f6d62bd06e767be11ff7abb

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: add reference url]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                             |  7 +++++++
 DEVELOPERS                                   |  3 ---
 package/Config.in                            |  1 -
 package/python-m2crypto/Config.in            |  9 ---------
 package/python-m2crypto/python-m2crypto.hash |  5 -----
 package/python-m2crypto/python-m2crypto.mk   | 18 ------------------
 6 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 066be19a75..2e6dfce5ea 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_PYTHON_M2CRYPTO
+	bool "python-m2crypto has been removed"
+	select BR2_LEGACY
+	help
+	  The python-m2crypto package was removed as it is in maintained
+	  only mode and is not recommended for new projects.
+
 config BR2_KERNEL_HEADERS_4_19
 	bool "kernel headers version 4.19.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 047dc4a88f..eabbc7eb20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1351,9 +1351,6 @@ F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_pybind.py
 F:	support/testing/tests/package/test_python_scipy.py
 
-N:	Gustavo Heinz <gustavo@gsthnz.com>
-F:	package/python-m2crypto/
-
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 F:	board/terasic/de10nano_cyclone5/
 F:	configs/terasic_de10nano_cyclone5_defconfig
diff --git a/package/Config.in b/package/Config.in
index 5fa344c321..1541c85e53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1206,7 +1206,6 @@ menu "External python modules"
 	source "package/python-logbook/Config.in"
 	source "package/python-logstash/Config.in"
 	source "package/python-lxml/Config.in"
-	source "package/python-m2crypto/Config.in"
 	source "package/python-magic-wormhole/Config.in"
 	source "package/python-magic-wormhole-mailbox-server/Config.in"
 	source "package/python-magic-wormhole-transit-relay/Config.in"
diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
deleted file mode 100644
index af710d5351..0000000000
--- a/package/python-m2crypto/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_M2CRYPTO
-	bool "python-m2crypto"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
-	select BR2_PACKAGE_PYTHON3_SSL # runtime
-	help
-	  M2Crypto: A Python crypto and SSL toolkit.
-
-	  https://gitlab.com/m2crypto/m2crypto
diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
deleted file mode 100644
index 98307af0cf..0000000000
--- a/package/python-m2crypto/python-m2crypto.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  75c50150857eb60e4f447b04d13ff507  m2crypto-0.43.0.tar.gz
-sha256  6c2c1c7bb0e8aa768f7ca803da7dbc2666d4003b26bd7adf70233afc59d8cf33  m2crypto-0.43.0.tar.gz
-# Locally computed sha256 checksums
-sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
deleted file mode 100644
index b5142c9bb2..0000000000
--- a/package/python-m2crypto/python-m2crypto.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python-m2crypto
-#
-################################################################################
-
-PYTHON_M2CRYPTO_VERSION = 0.43.0
-PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/1b/4771f0ecfdd9df6752ae5d0cf040545bb3cfe8a504af87e05c9ac4a6a499
-PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
-PYTHON_M2CRYPTO_LICENSE = MIT
-PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
-PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
-PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
-PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_ENV = OPENSSL_PATH="$(STAGING_DIR)/usr"
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
