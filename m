Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C24C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913E881420;
	Mon,  7 Feb 2022 18:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmWFKcEkRUSs; Mon,  7 Feb 2022 18:25:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F64813BB;
	Mon,  7 Feb 2022 18:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95E501BF995
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E14813BB
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6-tdOeUX6ZlQ for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5A2581329
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:24:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AE85582DC5; Mon,  7 Feb 2022 18:17:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 19:23:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8e7e90b839c5411674729326f3f603a5a2c69d9
X-Git-Newrev: e8011a08b6fd83b43babc3b3d91d5636f28154de
X-Patchwork-Hint: ignore
Message-Id: <20220207181734.AE85582DC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ace: needs C++11
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8011a08b6fd83b43babc3b3d91d5636f28154de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ace needs C++11 since its addition in commit
3621918d1bc1ddc9312dd1cc8dec6db61e712fe2 to avoid the following build
failure:

In file included from /home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/chrono:35:0,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/Time_Value.h:23,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/OS_NS_unistd.h:25,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.inl:2,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.h:886,
                 from /home/peko/autobuild/instance-1/output-1/build/ace-7.0.1/ace/ACE.cpp:1:
/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support is currently experimental, and must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support for the \
  ^

Fixes:
 - http://autobuild.buildroot.org/results/13376405e313da112f546076a10859e60631d5d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ace/Config.in | 8 ++++++--
 package/ace/ace.mk    | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/ace/Config.in b/package/ace/Config.in
index 226e34df32..5000f2352f 100644
--- a/package/ace/Config.in
+++ b/package/ace/Config.in
@@ -2,11 +2,15 @@ config BR2_PACKAGE_ACE
 	bool "ace"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	help
 	  The ADAPTIVE Communication Environment (ACE(TM))
 	  An OO Network Programming Toolkit in C++.
 
 	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
 
-comment "ACE needs a glibc toolchain, dynamic library"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
+comment "ACE needs a glibc toolchain, dynamic library, C++, gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index b6b4cfbc24..8df89d8c6f 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -17,6 +17,10 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 # Only compiling ACE libraries (no TAO)
 ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
+ACE_MAKE_OPTS = \
+	ACE_ROOT="$(@D)" \
+	DEFFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ACE_LIBARIES += ace/SSL
 ACE_DEPENDENCIES += openssl
@@ -39,14 +43,15 @@ endef
 
 define ACE_BUILD_CMDS
 	$(foreach lib,$(ACE_LIBARIES), \
-		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" all
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) \
+			$(ACE_MAKE_OPTS) all
 	)
 endef
 
 define  ACE_LIBARIES_INSTALL
 	mkdir -p $(1)/usr/share/ace
 	$(foreach lib,$(ACE_LIBARIES), \
-		$(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" DESTDIR=$(1) install
+		$(MAKE) -C $(@D)/$(lib) $(ACE_MAKE_OPTS) DESTDIR=$(1) install
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
