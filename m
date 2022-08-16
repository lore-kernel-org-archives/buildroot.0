Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E244FC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 05:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A25B82F39;
	Wed, 17 Aug 2022 05:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A25B82F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EzbTnhYyu3fP; Wed, 17 Aug 2022 05:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58CAC82F41;
	Wed, 17 Aug 2022 05:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58CAC82F41
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1093B1BF947
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38ED240CA0
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38ED240CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4Rf7VNCaWGh for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 05:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4714E40C92
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 05:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4714E40C92
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E0058780C; Wed, 17 Aug 2022 05:24:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 23:26:14 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 71c6ba101d72d233b187be36ca134eb5bbd750ba
X-Git-Newrev: c6720de9c0b02c9923574457a6896aa55068083c
X-Patchwork-Hint: ignore
Message-Id: <20220817052417.1E0058780C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gtest: drop
 host-gtest
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6720de9c0b02c9923574457a6896aa55068083c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Drop host-gtest to avoid the following build failure raised since bump
to version 1.12.0 in commit a336b731af5979a25213b33c5840de6d1ed88bdc and
https://github.com/google/googletest/commit/6202251f0963187a7781f181365cf8c19bf343d5:

/usr/bin/install -D -m 0755 /home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/gmock_gen
/usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/6a8fb259760f84c67a3482cc5964c6610f9b70a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 16a8c68b2103e36c491712e4697b945a6684874f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/Config.in |  9 ---------
 package/gtest/gtest.mk  | 15 ---------------
 2 files changed, 24 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 4355e9c9c5..4591cb5e48 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -26,7 +26,6 @@ if BR2_PACKAGE_GTEST
 
 config BR2_PACKAGE_GTEST_GMOCK
 	bool "gmock"
-	depends on BR2_HOST_GCC_AT_LEAST_5 # host-gtest
 	help
 	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
 	  C++'s specifics in mind, Google C++ Mocking Framework (or
@@ -43,14 +42,6 @@ config BR2_PACKAGE_GTEST_GMOCK
 	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW,
 	      and Symbian.
 
-	  There are both host and target packages. The target one has
-	  include files required to compile the tests and the static
-	  libraries required to link/run them. The host package installs
-	  gmock_gen, a Python script used to generate code mocks.
-
-comment "gmock needs host gcc >= 5"
-	depends on !BR2_HOST_GCC_AT_LEAST_5
-
 endif # BR2_PACKAGE_GTEST
 
 comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 5"
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index f3f3f9c296..236c8f3730 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -13,10 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_PRODUCT = google_test
 
-HOST_GTEST_LICENSE = Apache-2.0
-HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
-HOST_GTEST_DEPENDENCIES = host-python3
-
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
 # gtest.
@@ -34,20 +30,9 @@ GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-GTEST_DEPENDENCIES += host-gtest
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
 else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
-define HOST_GTEST_POST_INSTALL_PYTHON
-	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
-		$(HOST_DIR)/bin/gmock_gen
-	cp -rp $(@D)/googlemock/scripts/generator/cpp \
-		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
-endef
-
-HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
-
 $(eval $(cmake-package))
-$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
