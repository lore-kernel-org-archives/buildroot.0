Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269E0C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A2641A48;
	Thu, 29 Feb 2024 15:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOHeFKO_41UV; Thu, 29 Feb 2024 15:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CAD641A32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CAD641A32;
	Thu, 29 Feb 2024 15:52:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 196761BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4D141926
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JcOE-YfW1-MW for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 082B14190C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 082B14190C
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0457D87D73; Thu, 29 Feb 2024 15:33:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:29:23 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9bea8aa5cc6456d911cfcf9f73add4b6b5839325
X-Git-Newrev: 891a18201a2189c38a6e1ee12fb03680414d24bd
X-Patchwork-Hint: ignore
Message-Id: <20240229153305.0457D87D73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/ngrep: fix build
 with libnet
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

commit: https://git.buildroot.net/buildroot/commit/?id=891a18201a2189c38a6e1ee12fb03680414d24bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Use pkg-config to find libnet and avoid the following build failure
raised since commit 100ba8351c088fd764effdcaba848cfd92de79dd if
libnet-config is found on the host:

/home/autobuild/autobuild/instance-4/output-1/host/bin/mips64el-buildroot-linux-gnu-gcc -s -o ngrep ngrep.o  tcpkill.o   -lpcap -lnet   -lpcre -L/usr/lib -lnet
mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

While at it, format Upstream tag of other patches

Fixes:
 - http://autobuild.buildroot.org/results/05c916162b9c1027cf53f1699a1f5653151098ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 14c0c37eaf0f91ef61a88b3085c15028f566a394)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...in-configure-in-when-testing-for-use_pcre.patch |  3 +-
 ...002-Check-for-libnet_init-in-configure-in.patch |  3 +-
 package/ngrep/0003-fix-disable-tcpkill.patch       |  2 +-
 ...onfigure.in-use-pkg-config-to-find-libnet.patch | 38 ++++++++++++++++++++++
 package/ngrep/ngrep.mk                             |  2 +-
 5 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
index 69c5c887e8..c7f0dec360 100644
--- a/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
+++ b/package/ngrep/0001-Fix-typo-in-configure-in-when-testing-for-use_pcre.patch
@@ -4,8 +4,7 @@ Date: Mon, 1 Jan 2018 18:00:34 +0100
 Subject: [PATCH] Fix typo in configure.in when testing for use_pcre
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe]
+Upstream: https://github.com/jpr5/ngrep/commit/b8b1e9751e1d074af0dd77c2554c1b25fd8f7abe
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
index 22b18ab7ee..7fa2e2f3bc 100644
--- a/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
+++ b/package/ngrep/0002-Check-for-libnet_init-in-configure-in.patch
@@ -7,8 +7,7 @@ libnet_init_packet was the old libnet 1.0 function which is now long
 deprecated.
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5]
+Upstream: https://github.com/jpr5/ngrep/commit/0a51c8bc62c7b49b8d67a360daa6b1957256f4f5
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ngrep/0003-fix-disable-tcpkill.patch b/package/ngrep/0003-fix-disable-tcpkill.patch
index 1264fd7e3b..894cd95b0f 100644
--- a/package/ngrep/0003-fix-disable-tcpkill.patch
+++ b/package/ngrep/0003-fix-disable-tcpkill.patch
@@ -9,7 +9,7 @@ found on the system.
 To fix this, move AC_CHECK_LIB to found libnet outside AC_ARG_ENABLE
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/jpr5/ngrep/pull/15]
+Upstream: https://github.com/jpr5/ngrep/pull/15
 ---
  configure.in | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
diff --git a/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
new file mode 100644
index 0000000000..71550da943
--- /dev/null
+++ b/package/ngrep/0004-configure.in-use-pkg-config-to-find-libnet.patch
@@ -0,0 +1,38 @@
+From 4788988827bf4c0d996d3e1e3b6ac52a23b97941 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Jan 2024 21:15:47 +0100
+Subject: [PATCH] configure.in: use pkg-config to find libnet
+
+libnet-config is deprecated:
+https://github.com/libnet/libnet/commit/1ec4a6e7d1d23811f0a14ecb51e46489a0175727
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: unsent (upstream seems dead, no commit since 5 years
+---
+ configure.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 7c3dd43..882ff86 100644
+--- a/configure.in
++++ b/configure.in
+@@ -176,12 +176,14 @@ AC_ARG_ENABLE(tcpkill,
+ [ use_tcpkill="$enableval" ],
+ [ use_tcpkill="no" ])
+ 
++PKG_PROG_PKG_CONFIG
+ if test $use_tcpkill = yes; then
+   AC_CHECK_LIB(net, libnet_init,,echo !!! error: tcpkill feature enabled but no libnet found; exit)
+   USE_TCPKILL="1"
+   EXTRA_OBJS="$EXTRA_OBJS tcpkill.o"
+-  EXTRA_DEFINES="$EXTRA_DEFINES $(libnet-config --defines)"
+-  EXTRA_LIBS="$EXTRA_LIBS $(libnet-config --libs)"
++  PKG_CHECK_MODULES(LIBNET, libnet)
++  EXTRA_DEFINES="$EXTRA_DEFINES $LIBNET_CFLAGS"
++  EXTRA_LIBS="$EXTRA_LIBS $LIBNET_LIBS"
+ else
+   USE_TCPKILL="0"
+ fi
+-- 
+2.43.0
+
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index c4750f7504..dc69a34235 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -22,7 +22,7 @@ NGREP_CONF_OPTS = \
 	--disable-dropprivs \
 	--disable-pcap-restart
 
-NGREP_DEPENDENCIES = libpcap pcre
+NGREP_DEPENDENCIES = host-pkgconf libpcap pcre
 
 ifeq ($(BR2_PACKAGE_LIBNET),y)
 NGREP_DEPENDENCIES += libnet
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
