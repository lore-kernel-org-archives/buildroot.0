Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA77CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 20:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CB9140A05;
	Sat, 21 Sep 2024 20:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5UAeVFlS6w4; Sat, 21 Sep 2024 20:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D88D140A23
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D88D140A23;
	Sat, 21 Sep 2024 20:17:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD5951BF48B
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65DEC400DD
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAMC1eBAUP94 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 20:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A4B440015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A4B440015
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:17:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 326298415D; Sat, 21 Sep 2024 20:17:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 205486f5bca2c078b75cd61abbd7b891b9e33d51
X-Git-Newrev: 39176edc7b09cbcfb96ec11b2badb91a248857c4
X-Patchwork-Hint: ignore
Message-Id: <20240921201722.326298415D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-m2crypto: bump to version
 0.42.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39176edc7b09cbcfb96ec11b2badb91a248857c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set openssl path via env instead of build options which is no longer
supported.

The openssl build option was removed when the env variable was added:
https://git.sr.ht/~mcepl/m2crypto/commit/e181abc72b1b9d5a18fe2a2e26bfffffe90e5b35

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-m2crypto/python-m2crypto.hash |  4 ++--
 package/python-m2crypto/python-m2crypto.mk   | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 782837081e..aa8fe09c14 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5  280c20072afbe7010cf9e9620ea25c7b  M2Crypto-0.40.1.tar.gz
-sha256  bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d257bbb30  M2Crypto-0.40.1.tar.gz
+md5  b88bcb1d4aeb817f91eb627d08b673a2  m2crypto-0.42.0.tar.gz
+sha256  42b62df2caf623161b1d643a7235464c2fe2a3105049ebc498a6d47dc08f64b4  m2crypto-0.42.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 6c07f42d06..79dfc1beb2 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,17 +4,15 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.40.1
-PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/9e/a3/9433817493ea250db67a05de3361cb0a1d58531847d50406f2f28455e68c
+PYTHON_M2CRYPTO_VERSION = 0.42.0
+PYTHON_M2CRYPTO_SOURCE = m2crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/85/9f/b8977ce2971cf5f823db3fdb31e7e061b9662da318a17b6bf0c653f84aee
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
 PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
 PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
-PYTHON_M2CRYPTO_BUILD_OPTS = \
-	-C--build-option=build_ext \
-	-C--build-option=--openssl=$(STAGING_DIR)/usr
+PYTHON_M2CRYPTO_ENV = OPENSSL_PATH="$(STAGING_DIR)/usr"
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
