Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979DFC4321E
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440D581FAC;
	Thu,  3 Nov 2022 20:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440D581FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ENxB6fM77u5f; Thu,  3 Nov 2022 20:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A9D881FA9;
	Thu,  3 Nov 2022 20:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A9D881FA9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8F31BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E2940520
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64E2940520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVrnt4P5KLXE for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8744740BC0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8744740BC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7728B87BCD; Thu,  3 Nov 2022 20:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c9b862b2973aaaebac6dacca6ad20f2b20944f87
X-Git-Newrev: 3c2a62601547ef0666e1883cee0ea110ebff387e
X-Patchwork-Hint: ignore
Message-Id: <20221103205510.7728B87BCD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-bcrypt: bump to
 version 4.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c2a62601547ef0666e1883cee0ea110ebff387e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Replace cffi based backend with pyo3 setuptools-rust based backend.

Propagate rust reverse dependency comment.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bcrypt/Config.in          |  2 +-
 package/python-bcrypt/python-bcrypt.hash |  5 ++---
 package/python-bcrypt/python-bcrypt.mk   | 17 ++++++++++++++---
 package/python-paramiko/Config.in        |  2 +-
 package/python-twisted/Config.in         |  2 +-
 5 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/package/python-bcrypt/Config.in b/package/python-bcrypt/Config.in
index 9e9864e9d2..67800df3e1 100644
--- a/package/python-bcrypt/Config.in
+++ b/package/python-bcrypt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_BCRYPT
 	bool "python-bcrypt"
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	help
 	  Modern password hashing for your software and your servers.
 
diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index b1970d8684..e148078699 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/bcrypt/json
-md5  fe31390dab603728f756cd3d6830c80a  bcrypt-3.2.0.tar.gz
-sha256  5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29  bcrypt-3.2.0.tar.gz
+# Locally calculated after vendoring
+sha256  d64daee0af1afe137718674e67a49b8bb791842aab265b588a6d68d44a449c70  bcrypt-4.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index ad770cc974..cbd6855d9c 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,12 +4,23 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.2.0
+PYTHON_BCRYPT_VERSION = 4.0.1
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/d8/ba/21c475ead997ee21502d30f76fd93ad8d5858d19a3fad7cd153de698c4dd
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/8c/ae/3af7d006aacf513975fd1948a6b4d6f8b4a307f8a244e1a3d3774b297aad
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-PYTHON_BCRYPT_DEPENDENCIES = host-python-cffi
+PYTHON_BCRYPT_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-rustc
+PYTHON_BCRYPT_ENV = \
+	$(PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+# We need to vendor the Cargo crates at download time
+PYTHON_BCRYPT_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_BCRYPT_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_BCRYPT_DL_ENV = \
+	$(PKG_CARGO_ENV) \
+	BR_CARGO_MANIFEST_PATH=src/_bcrypt/Cargo.toml
 
 $(eval $(python-package))
diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index a07af19a4b..aee658c790 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography, python-bcrypt
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index c0acf35560..1f3baf57e2 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -31,7 +31,7 @@ config BR2_PACKAGE_PYTHON_TWISTED_TLS
 
 config BR2_PACKAGE_PYTHON_TWISTED_CONCH
 	bool "Conch support"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography, python-bcrypt
 	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
