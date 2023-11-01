Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B27C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F0581ADE;
	Wed,  1 Nov 2023 10:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F0581ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3QSbCQSiULi; Wed,  1 Nov 2023 10:36:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D0AB84ADB;
	Wed,  1 Nov 2023 10:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D0AB84ADB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C13091BF296
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D67A41499
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D67A41499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nw2gkvixT-jN for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEDEA4ECDE
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEDEA4ECDE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB08C862EA; Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 11:34:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a8fa2006846cd3480741f03372e17fedb811898
X-Git-Newrev: eac8e641fab503077a7801aeb80b05e91db48138
X-Patchwork-Hint: ignore
Message-Id: <20231101103600.AB08C862EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: bump to version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=eac8e641fab503077a7801aeb80b05e91db48138
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumps OP-TEE test package version to OP-TEE release 4.0.0.
Removes the local patch on OpenSSL support that has been integrated
into mainline repository before release tag 4.0.0.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch | 57 ----------------------
 package/optee-test/optee-test.hash                 |  4 +-
 package/optee-test/optee-test.mk                   |  2 +-
 3 files changed, 3 insertions(+), 60 deletions(-)

diff --git a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch b/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
deleted file mode 100644
index b876c3385f..0000000000
--- a/package/optee-test/0001-xtest-add-DOPENSSL_API_COMPAT-10100.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a0db2b60b9f5c14e9f69c0e06e1a8d35f9fb1b5a Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 25 Jul 2023 14:39:25 +0200
-Subject: [PATCH] xtest: add -DOPENSSL_API_COMPAT=10100
-
-regression_1000.c uses OpenSSL functions that have been deprecated
-after version 1.1. In particular, building with version 3.0 causes the
-following error (and other similar ones not pasted here):
-
- optee_test/host/xtest/regression_1000.c: In function 'check_signature':
- optee_test/host/xtest/regression_1000.c:2735:9: error: 'SHA256_Init' is deprecated: Since OpenSSL 3.0 [-Werror=deprecated-declarations]
-  2735 |         SHA256_Init(&ctx);
-       |         ^~~~~~~~~~~
-
-Add -DOPENSSL_API_COMPAT=10100 to the build flags to avoid this and be
-flexible with regards to which version of OpenSSL build environment has
-to provide.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-(cherry picked from commit cf111604c4c32a76be90f29aab25fa9b882c8715)
-Upstream: https://github.com/OP-TEE/optee_test/commit/cf111604c4c32a76be90f29aab25fa9b882c8715
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- host/xtest/CMakeLists.txt | 2 +-
- host/xtest/Makefile       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/host/xtest/CMakeLists.txt b/host/xtest/CMakeLists.txt
-index 776787b..ae0f4e0 100644
---- a/host/xtest/CMakeLists.txt
-+++ b/host/xtest/CMakeLists.txt
-@@ -12,7 +12,7 @@ endif()
- 
- find_package(OpenSSL)
- if(OPENSSL_FOUND)
--	add_compile_options(-DOPENSSL_FOUND=1)
-+	add_compile_options(-DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100)
- 	set (OPENSSL_PRIVATE_LINK OpenSSL::Crypto)
- endif()
- 
-diff --git a/host/xtest/Makefile b/host/xtest/Makefile
-index 8505629..2497850 100644
---- a/host/xtest/Makefile
-+++ b/host/xtest/Makefile
-@@ -39,7 +39,7 @@ endef
- # - User/group login tests 1027 and 1028
- WITH_OPENSSL ?= y
- ifeq ($(WITH_OPENSSL),y)
--CFLAGS += -DOPENSSL_FOUND=1
-+CFLAGS += -DOPENSSL_FOUND=1 -DOPENSSL_API_COMPAT=10100
- ifneq ($(OPTEE_OPENSSL_EXPORT),)
- LDFLAGS += -lcrypto
- CFLAGS += -I$(OPTEE_OPENSSL_EXPORT)
--- 
-2.41.0
-
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 08b3331374..9744ab6d92 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.21.0/optee-test-3.21.0.tar.gz
-sha256  44c7dc3df48e9d73f12bbbef1cc2a4e22d859ab8a5e67a07923267f924175d65  optee-test-3.21.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/4.0.0/optee-test-4.0.0.tar.gz
+sha256  dc37b90c98db54068e61b31e20378878e2cfdf3c71f90c8a635786164651c62f  optee-test-4.0.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index d306ef8269..44d3015ae1 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.21.0
+OPTEE_TEST_VERSION = 4.0.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
