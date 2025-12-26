Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EF3E8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE26040762;
	Fri, 26 Dec 2025 18:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ih4Jvvg2q3OD; Fri, 26 Dec 2025 18:21:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B01040877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773273;
	bh=o7M7kpOw/V3mktu/5Ku5GwZSPh8dAhar9q7pQd0q0tU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DN/XcH2W6oCMDk5Hbhm+RCQgnPasIT9McmBaVZIpb8SWHhhgAW+DSjN+m6+6JCDmk
	 JtwUHB+WDIGD83nxxRtjT/zzVz213XAbj1UDpzJhh5b+4MR3Ec8MvcWDRo9giDLSR5
	 LpQgm/6DPsG/znMgZOLo+Bo1q6Sjd7CTgHn9lFXPybjgIZ5BueMsNWfcrJOb3SWMwi
	 kssBD3fPMi1n6kkRT07AP3slwXYdIC+OyZdqYAJWVd2PZEkgfGfaUeS4V+F+kOdUGf
	 vz6DeifiTgwsAXvxtErdR4GKeILC85l5m38uBnIZT5ClFOsacc+Z+MamzulYqK9hGD
	 zLzt0Av0oRtLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B01040877;
	Fri, 26 Dec 2025 18:21:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1730EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3030F80AB0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZz3DMpcXxNA for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A6A80AAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A6A80AAF
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6473A81840; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8c2ab39950037882a527315425b96f0dbbae215
X-Git-Newrev: 35b32556477ef30bde9215b76647bc53ab977ec9
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.6473A81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linknx: bump version to 0.0.1.39
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=35b32556477ef30bde9215b76647bc53ab977ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/linknx/linknx/compare/0.0.1.38...0.0.1.39

Removed patches which are included in this release.

Fixes:
https://autobuild.buildroot.net/results/492/492b46b997758bbe6b8ec8510e5b2e2bad2aa704/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 -
 ...01-configure-ac-tweak-CPPUNIT-conditional.patch | 47 ----------------------
 ...-src-Makefile.am-fix-linking-with-log4cpp.patch | 37 -----------------
 package/linknx/linknx.hash                         |  2 +-
 package/linknx/linknx.mk                           |  4 +-
 5 files changed, 2 insertions(+), 90 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0d61d3c69b..1f406c3426 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -622,8 +622,6 @@ package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch lib_patc
 package/libyuv/0001-i386-sse2.patch lib_patch.Upstream
 package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch lib_patch.Upstream
 package/lighttpd/S50lighttpd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch lib_patch.Upstream
-package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch lib_patch.Upstream
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch lib_patch.Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch lib_patch.Upstream
 package/linuxptp/S65ptp4l Shellcheck lib_sysv.Indent
diff --git a/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch b/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
deleted file mode 100644
index 733e2927dd..0000000000
--- a/package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8e7da14647dada5eee8f583b0814bffb31d1b91e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Apr 2019 23:17:34 +0200
-Subject: [PATCH] configure.ac: tweak CPPUNIT conditional
-
-Following review of buildroot's patch
-(http://patchwork.ozlabs.org/patch/1088520), tweak CPPUNIT to move call
-to AM_CONDITIONAL outside condition
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linknx/linknx/commit/8e7da14647dada5eee8f583b0814bffb31d1b91e]
----
- configure.ac | 10 ++++------
- 1 file changed, 4 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 51d8ae66..4d9d8efa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -135,22 +135,20 @@ if test x"$WITH_CPPUNIT" != xno; then
-       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
-       AC_SUBST(CPPUNIT_CFLAGS)
-       AC_SUBST(CPPUNIT_LIBS)
--      AM_CONDITIONAL(CPPUNIT, true)
-+      found_cppunit=yes
-     ],[
-       AC_MSG_RESULT([no])
--      AM_CONDITIONAL(CPPUNIT, false)
-     ])
-   else
-     PKG_CHECK_MODULES(CPPUNIT, $CPPUNITPC >= 1.9.6, [
-       AC_DEFINE([HAVE_CPPUNIT], [1], [cppunit])
-       AC_SUBST(CPPUNIT_CFLAGS)
-       AC_SUBST(CPPUNIT_LIBS)
--      AM_CONDITIONAL([CPPUNIT], true)
--    ],[AM_CONDITIONAL([CPPUNIT], false)])
-+      found_cppunit=yes
-+    ])
-   fi
--else
--  AM_CONDITIONAL([CPPUNIT], false)
- fi
-+AM_CONDITIONAL([CPPUNIT], [test x"$found_cppunit" = xyes])
- 
- dnl #########################################################################
- dnl Check if using log4cpp
diff --git a/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch b/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
deleted file mode 100644
index 4f1a8e4356..0000000000
--- a/package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 048b9ae8f3c07be217f1738c35ab995ab6394453 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 Mar 2020 10:02:07 +0100
-Subject: [PATCH] src/Makefile.am: fix linking with log4cpp
-
-linknx fails to build with log4cpp because LOG4CPP_CFLAGS (which
-contains -pthread) is added to AM_CPPFLAGS (which is not used at link
-time) instead of AM_CXXFLAGS:
-
-/home/buildroot/autobuild/instance-0/output/host/bin/mipsel-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os     -o linknx linknx.o logger.o ruleserver.o objectcontroller.o eibclient.o threads.o timermanager.o persistentstorage.o xmlserver.o smsgateway.o emailgateway.o knxconnection.o services.o suncalc.o luacondition.o ioport.o ../ticpp/libticpp.a  -L/home/buildroot/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib -lpthsem  -L/home/buildroot/autobuild/instance-0/output/host/bin/../mipsel-buildroot-linux-gnu/sysroot/usr/lib -llog4cpp     -lm
-/home/buildroot/autobuild/instance-0/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib/liblog4cpp.so: undefined reference to `pthread_key_create'
-
-So move LOG4CPP_CFLAGS to AM_CXXFLAGS
-
-Fixes:
- - http://autobuild.buildroot.org/results/1863f8f27041bc15ca68e786ba3b8e4764c40574
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/linknx/linknx/commit/048b9ae8f3c07be217f1738c35ab995ab6394453]
----
- src/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 6e0dc03b..5065c248 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -6,6 +6,7 @@ else
- B64_CFLAGS=
- B64_LIBS=
- endif
--AM_CPPFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(B64_CFLAGS) $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LOG4CPP_CFLAGS) $(LUA_CFLAGS) $(MYSQL_CFLAGS) $(ESMTP_CFLAGS)
-+AM_CPPFLAGS=-I$(top_srcdir)/include -I$(top_srcdir)/ticpp $(B64_CFLAGS) $(PTH_CPPFLAGS) $(LIBCURL_CPPFLAGS) $(LUA_CFLAGS) $(MYSQL_CFLAGS) $(ESMTP_CFLAGS)
-+AM_CXXFLAGS=$(LOG4CPP_CFLAGS)
- linknx_LDADD=$(top_srcdir)/ticpp/libticpp.a $(LIBICONV) $(B64_LIBS) $(PTH_LDFLAGS) $(PTH_LIBS) $(LIBCURL) $(LOG4CPP_LIBS) $(LUA_LIBS) $(MYSQL_LIBS) $(ESMTP_LIBS) -lm
- linknx_SOURCES=linknx.cpp logger.cpp ruleserver.cpp objectcontroller.cpp eibclient.c threads.cpp timermanager.cpp  persistentstorage.cpp xmlserver.cpp smsgateway.cpp emailgateway.cpp knxconnection.cpp services.cpp suncalc.cpp  luacondition.cpp ioport.cpp ruleserver.h objectcontroller.h threads.h timermanager.h persistentstorage.h xmlserver.h smsgateway.h emailgateway.h knxconnection.h services.h suncalc.h luacondition.h ioport.h logger.h
diff --git a/package/linknx/linknx.hash b/package/linknx/linknx.hash
index 86ec522809..d12d4aa8f2 100644
--- a/package/linknx/linknx.hash
+++ b/package/linknx/linknx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  00c53776c2e871295459ede922402d8ad0208367d2364781fdb92ddafad94d3d  linknx-0.0.1.38.tar.gz
+sha256  d07199875c6e3f90871308989dd7d4240b67ce971d5908cb39592690341f8d0a  linknx-0.0.1.39.tar.gz
 sha256  c03cea027b4b40e4402fabd08557736727ec3d5bc54ad64ab6472de432198cad  LICENSE
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 683e0c49cb..d67f010093 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LINKNX_VERSION = 0.0.1.38
+LINKNX_VERSION = 0.0.1.39
 LINKNX_SITE = $(call github,linknx,linknx,$(LINKNX_VERSION))
 LINKNX_LICENSE = GPL-2.0+
 LINKNX_LICENSE_FILES = LICENSE
 LINKNX_INSTALL_STAGING = YES
-# We're patching configure.ac
-LINKNX_AUTORECONF = YES
 LINKNX_CONF_OPTS = \
 	--without-cppunit \
 	--without-pth-test \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
