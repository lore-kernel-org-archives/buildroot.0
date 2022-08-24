Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DB4C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 036058414A;
	Sun, 11 Sep 2022 09:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 036058414A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CybHhAjz88a8; Sun, 11 Sep 2022 09:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A8581D34;
	Sun, 11 Sep 2022 09:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2A8581D34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 593461BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DF6E6FB3F
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF6E6FB3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnWUSCSda8oN for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF156FB25
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF156FB25
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7D39783620; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:33:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab105fda88047e21cfcd7e02b85220918b8b134b
X-Git-Newrev: 075658a88f10636b1448496a9e6e6d9caf949b6f
X-Patchwork-Hint: ignore
Message-Id: <20220911084827.7D39783620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sord: bump to version 0.16.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=075658a88f10636b1448496a9e6e6d9caf949b6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson-package and so drop patch

https://github.com/drobilla/sord/blob/v0.16.12/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../sord/0001-wscript-add-no-threads-option.patch  | 59 ----------------------
 package/sord/sord.hash                             |  4 +-
 package/sord/sord.mk                               | 16 ++----
 3 files changed, 6 insertions(+), 73 deletions(-)

diff --git a/package/sord/0001-wscript-add-no-threads-option.patch b/package/sord/0001-wscript-add-no-threads-option.patch
deleted file mode 100644
index 750ea8f4ad..0000000000
--- a/package/sord/0001-wscript-add-no-threads-option.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 82ab045a45c06187dca5e9d2a9a4003fcfbfa830 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 22 Feb 2022 21:22:31 +0100
-Subject: [PATCH] wscript: add -no-threads option
-
-Add -no-threads options to avoid the following build failure on embedded
-toolchains without threads support:
-
-/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
-
-Fixes:
- - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/drobilla/sord/pull/3]
----
- wscript | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index fd8578e..d71d78c 100644
---- a/wscript
-+++ b/wscript
-@@ -35,6 +35,7 @@ def options(ctx):
-         {'no-utils':     'do not build command line utilities',
-          'static':       'build static library',
-          'no-shared':    'do not build shared library',
-+         'no-threads':   'disable threads',
-          'static-progs': 'build programs as static binaries'})
- 
-     opt.add_option('--dump', type='string', default='', dest='dump',
-@@ -55,6 +56,7 @@ def configure(conf):
- 
-     conf.env.BUILD_UTILS  = not Options.options.no_utils
-     conf.env.BUILD_SHARED = not Options.options.no_shared
-+    conf.env.ENABLE_THREADS = not Options.options.no_threads
-     conf.env.STATIC_PROGS = Options.options.static_progs
-     conf.env.BUILD_STATIC = (Options.options.static or
-                              Options.options.static_progs)
-@@ -124,7 +126,7 @@ def configure(conf):
-     conf.check_pkg('serd-0 >= 0.30.0', uselib_store='SERD')
-     conf.check_pkg('libpcre', uselib_store='PCRE', mandatory=False)
- 
--    if conf.env.HAVE_PCRE:
-+    if conf.env.HAVE_PCRE and conf.env.ENABLE_THREADS:
-         if conf.check(cflags=['-pthread'], mandatory=False):
-             conf.env.PTHREAD_CFLAGS    = ['-pthread']
-             if conf.env.CC_NAME != 'clang':
-@@ -160,6 +162,7 @@ def configure(conf):
-         conf,
-         {'Static library': bool(conf.env.BUILD_STATIC),
-          'Shared library': bool(conf.env.BUILD_SHARED),
-+         'Threads':        bool(conf.env.ENABLE_THREADS),
-          'Utilities':      bool(conf.env.BUILD_UTILS),
-          'Unit tests':     bool(conf.env.BUILD_TESTS),
-          'Debug dumping':  dump})
--- 
-2.34.1
-
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
index af175f91f0..ec5c88a43c 100644
--- a/package/sord/sord.hash
+++ b/package/sord/sord.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/sord-0.16.8.tar.bz2.asc
-sha256  7c289d2eaabf82fa6ac219107ce632d704672dcfb966e1a7ff0bbc4ce93f5e14  sord-0.16.8.tar.bz2
+# https://download.drobilla.net/sord-0.16.12.tar.xz.sig
+sha256  fde269893cb24b2ab7b75708d7a349c6e760c47a0d967aeca5b1c651294ff9f2  sord-0.16.12.tar.xz
 sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
index c06ef9c55c..9fcf98858a 100644
--- a/package/sord/sord.mk
+++ b/package/sord/sord.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SORD_VERSION = 0.16.8
+SORD_VERSION = 0.16.12
 SORD_SITE = https://download.drobilla.net
-SORD_SOURCE = sord-$(SORD_VERSION).tar.bz2
+SORD_SOURCE = sord-$(SORD_VERSION).tar.xz
 SORD_LICENSE = ISC
 SORD_LICENSE_FILES = COPYING
 SORD_DEPENDENCIES = host-pkgconf serd
@@ -16,14 +16,6 @@ ifeq ($(BR2_PACKAGE_PCRE),y)
 SORD_DEPENDENCIES += pcre
 endif
 
-SORD_CONF_OPTS += --no-coverage
+SORD_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
 
-ifeq ($(BR2_STATIC_LIBS),y)
-SORD_CONF_OPTS += --static --no-shared --static-progs
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-SORD_CONF_OPTS += --no-threads
-endif
-
-$(eval $(waf-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
