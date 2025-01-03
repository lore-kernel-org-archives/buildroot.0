Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887ADC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D31B42D41;
	Fri, 28 Feb 2025 16:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JcYlyevSj35; Fri, 28 Feb 2025 16:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F744F141
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F744F141;
	Fri, 28 Feb 2025 16:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1274468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F09E642E8F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNItud3T4FOq for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E21A042500
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E21A042500
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6DD987C2C; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 3 Jan 2025 19:04:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c26da4256031989df1d4a11c2dc2028e16c95fcc
X-Git-Newrev: 1a5d680c53f41dae6b6f67b526927d08b335212d
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.D6DD987C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openrc: bump to
 version 0.56
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a5d680c53f41dae6b6f67b526927d08b335212d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note since 0.52.1, see:
https://github.com/OpenRC/openrc/blob/0.56/NEWS.md

Other changes:
  - Update 0007-allow-setting-rc_libexecdir-path.patch to apply cleanly
  - Remove the split-usr logic, as it was removed in version 0.54. This
    logic is now handled by passing the following to meson during the
    configure stage: --bindir /bin --libdir /lib64 --libexecdir /lib
                     --sbindir /sbin
  - libcap is now a dependency
  - The audit package must be explicity set as disabled if not available.
    If not, configuration errors occure if audit is not found.

./support/testing/run-tests tests.init.test_openrc

11:45:44 TestInitSystemOpenrcRwFull               Starting
11:45:57 TestInitSystemOpenrcRwFull               Cleaning up
11:45:57 TestInitSystemOpenrcRoFull               Starting
11:46:10 TestInitSystemOpenrcRoFull               Cleaning up
11:46:10 TestInitSystemOpenrcMergedUsrFull        Starting
11:46:10 TestInitSystemOpenrcMergedUsrFull        Building
11:51:59 TestInitSystemOpenrcMergedUsrFull        Building done
11:52:12 TestInitSystemOpenrcMergedUsrFull        Cleaning up

----------------------------------------------------------------------
Ran 3 tests in 388.180s
OK

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../openrc/0007-allow-setting-rc_libexecdir-path.patch | 16 ++++++++--------
 package/openrc/Config.in                               |  1 +
 package/openrc/openrc.hash                             |  2 +-
 package/openrc/openrc.mk                               | 18 +++++++++---------
 4 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch b/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
index a11c789275..5787c26dde 100644
--- a/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
+++ b/package/openrc/0007-allow-setting-rc_libexecdir-path.patch
@@ -4,12 +4,12 @@ Date: Wed, 8 Sep 2021 22:41:58 +0200
 Subject: [PATCH] allow setting rc_libexecdir path
 
   - Allow to change the rc dir name of the rc_libexecdir path
-  - Introduce a librcdir option for override with value 'rc'
+  - Introduce a librcdir option for override with value 'rc'6
 
 Upstream: https://github.com/OpenRC/openrc/pull/443
 
 Signed-off-by: artoo <artoo@artixlinux.org>
-[Adam: update for 0.50]
+[Adam: update for 0.56]
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 ---
  meson.build       | 2 +-
@@ -20,10 +20,10 @@ diff --git a/meson.build b/meson.build
 index 5b3f8fa..40d4be1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -102,7 +102,7 @@ if os == 'Linux' and libexecdir == 'libexec'
-   libexecdir = 'lib'
- endif
- libexecdir = rootprefix / libexecdir
+@@ -85,7 +85,7 @@ bindir = get_option('prefix') / get_option('bindir')
+ libdir = get_option('prefix') / get_option('libdir')
+ pluginsdir = libdir / 'rc/plugins'
+ libexecdir = get_option('prefix') / get_option('libexecdir')
 -rc_libexecdir = libexecdir / 'rc'
 +rc_libexecdir = libexecdir / get_option('librcdir')
  rc_bindir = rc_libexecdir / 'bin'
@@ -33,8 +33,8 @@ diff --git a/meson_options.txt b/meson_options.txt
 index 2c74152..d2f67e4 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -37,3 +37,5 @@ option('termcap', type : 'combo',
-   description : 'the termcap library to use')
+@@ -26,3 +26,5 @@ option('sysvinit', type : 'boolean', value : false,
+   description : 'enable SysVinit compatibility (linux only)')
  option('zsh-completions', type : 'boolean',
    description : 'install zsh completions')
 +option('librcdir', type : 'string', value : 'rc',
diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index 42d7347b0e..e1f004212b 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_OPENRC
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod tools
 	select BR2_PACKAGE_KMOD # runtime
 	select BR2_PACKAGE_KMOD_TOOLS # runtime
+	select BR2_PACKAGE_LIBCAP # runtime
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NCURSES
 	help
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index c1c16a8c45..85e869f82a 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0b911eee4e64ad5e6945c6fed572220d537dfd0108838fa6d6797a2d7ff9f052  openrc-0.52.1.tar.gz
+sha256  a06b530290057637eab17fc943cbf79c0335eb734ba71ece38b9f3acd8a341d4  openrc-0.56.tar.gz
 sha256  6ac2bf77510808fbec7dc86cbfbca98dfc4c6b47dc99e4ca77b5370e097d8e70  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 69f5b3a121..67846ce0ea 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,22 +4,28 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.52.1
+OPENRC_VERSION = 0.56
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
 OPENRC_CPE_ID_VALID = YES
 
-OPENRC_DEPENDENCIES = ncurses
+OPENRC_DEPENDENCIES = libcap ncurses
 
 OPENRC_CONF_OPTS = \
 	-Dos=Linux \
 	-Dlibrcdir=/usr/libexec/rc \
 	-Dpkgconfig=false \
 	-Dsysvinit=true \
-	-Drootprefix=/ \
 	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+OPENRC_CONF_OPTS += -Daudit=enabled
+OPENRC_DEPENDENCIES += audit
+else
+OPENRC_CONF_OPTS += -Daudit=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 OPENRC_CONF_OPTS += -Dbash-completions=true
 else
@@ -44,12 +50,6 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-OPENRC_CONF_OPTS += -Dsplit-usr=false
-else
-OPENRC_CONF_OPTS += -Dsplit-usr=true
-endif
-
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
