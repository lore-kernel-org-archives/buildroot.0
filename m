Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47932C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00FC41706;
	Sun, 17 Jul 2022 13:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A00FC41706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zII_t419L-bJ; Sun, 17 Jul 2022 13:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30124416C4;
	Sun, 17 Jul 2022 13:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30124416C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAB571BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EE9F60AE2
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EE9F60AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcIeo7yasXjw for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:57:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FD960ACC
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4FD960ACC
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9CCE383BFC; Sun, 17 Jul 2022 13:43:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:45:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d8b03359672e195dae31b49c07623ece7308dbe
X-Git-Newrev: 16a8c68b2103e36c491712e4697b945a6684874f
X-Patchwork-Hint: ignore
Message-Id: <20220717134338.9CCE383BFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: drop host-gtest
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

commit: https://git.buildroot.net/buildroot/commit/?id=16a8c68b2103e36c491712e4697b945a6684874f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop host-gtest to avoid the following build failure raised since bump
to version 1.12.0 in commit a336b731af5979a25213b33c5840de6d1ed88bdc and
https://github.com/google/googletest/commit/6202251f0963187a7781f181365cf8c19bf343d5:

/usr/bin/install -D -m 0755 /home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/gmock_gen
/usr/bin/install: cannot stat '/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-gtest-1.12.0/googlemock/scripts/generator/gmock_gen.py': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/6a8fb259760f84c67a3482cc5964c6610f9b70a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
