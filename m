Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7AAC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:28:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6D560E09
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C6D560E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389FE607C8;
	Sat, 24 Jul 2021 20:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7I4lPHENwe_z; Sat, 24 Jul 2021 20:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB576074E;
	Sat, 24 Jul 2021 20:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0F71BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D21694045F
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qT8XRvyVrol3 for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:27:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA7D640463
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:27:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EF28588C70; Sat, 24 Jul 2021 19:53:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:27:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ce3b5db5403f9d04faee02f33acc0fc48b2d41
X-Git-Newrev: 9dfbbbb4105c47602da048c9bb9499fb8862e768
X-Patchwork-Hint: ignore
Message-Id: <20210724195323.EF28588C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: bump to version 1.11.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9dfbbbb4105c47602da048c9bb9499fb8862e768
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python is removed as dependency.
gtest uses python for self-tests which are not run by buildroot,
and the remaining scripts are not used by the build, and aren't
maintained or supported.

Special handling for gtest-config and gmock-config is removed as well,
the CMake Buildsystem now does take care of those.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: still install gmock_gen.py]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gtest/gtest.hash |  4 ++--
 package/gtest/gtest.mk   | 40 +---------------------------------------
 2 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 082c597780..d21fea7142 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb	gtest-1.10.0.tar.gz
-sha256	9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138	googletest/LICENSE
+sha256  b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5  gtest-1.11.0.tar.gz
+sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index f8b2339d7e..3e8220cddf 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.10.0
+GTEST_VERSION = 1.11.0
 GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
@@ -21,10 +21,8 @@ HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python3
 else
 HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python
 endif
 
 HOST_GTEST_GMOCK_PYTHONPATH = \
@@ -48,44 +46,8 @@ endif
 
 GTEST_CONF_OPTS += -DBUILD_GTEST=ON
 
-# Generate the gtest-config script manually, since the CMake build system is
-# not doing it.
-define GTEST_INSTALL_GTEST_CONFIG
-	sed 's%@PACKAGE_TARNAME@%gtest%;\
-		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
-		s%@prefix@%$(STAGING_DIR)/usr%;\
-		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
-		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
-		s%@includedir@%$(STAGING_DIR)/usr/include%;\
-		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
-		s%@PTHREAD_CFLAGS@%%;\
-		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/googletest/scripts/gtest-config.in \
-		> $(STAGING_DIR)/usr/bin/gtest-config
-	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
-endef
-GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_GTEST_CONFIG
-
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
-
-# Generate the gmock-config script manually, since the CMake build system is
-# not doing it.
-define GTEST_INSTALL_GMOCK_CONFIG
-	sed 's%@PACKAGE_TARNAME@%gmock%;\
-		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
-		s%@prefix@%$(STAGING_DIR)/usr%;\
-		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
-		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
-		s%@includedir@%$(STAGING_DIR)/usr/include%;\
-		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
-		s%@PTHREAD_CFLAGS@%%;\
-		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/googlemock/scripts/gmock-config.in \
-		> $(STAGING_DIR)/usr/bin/gmock-config
-	chmod +x $(STAGING_DIR)/usr/bin/gmock-config
-endef
-GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_GMOCK_CONFIG
 else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
