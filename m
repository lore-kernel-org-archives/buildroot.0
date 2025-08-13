Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659A0CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 16:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26696812A5;
	Wed, 13 Aug 2025 16:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ly23BechtVJr; Wed, 13 Aug 2025 16:02:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B1BE81342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1BE81342;
	Wed, 13 Aug 2025 16:02:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF2F51B5
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB7EB40366
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Evt8Iwz9ZrjJ for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 16:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D364035B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1D364035B
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 16:02:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA37687578; Wed, 13 Aug 2025 16:02:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 18:00:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b3bf7b29c49848dd29d778f4041dd90cd5556cc
X-Git-Newrev: da8587d2db2620efe9461213bbecb7c532776e64
X-Patchwork-Hint: ignore
Message-Id: <20250813160213.EA37687578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/frr: bump to version
 10.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=da8587d2db2620efe9461213bbecb7c532776e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update FRR to the latest stable version (10.4.1 see [1], 10.4.0 see [2]).

As protobuf-c is no longer mandatory (see [3]), a new option
BR2_PACKAGE_FRR_PROTOBUF is added to enable/disable it.

getloadavg function [4] is now used by FRR but older libcs (e.g. uClibc,
dietlibc) lack this function, to fix the compilation, a patch must be
applied on FRR.

[1] https://github.com/FRRouting/frr/commit/88f5c06cbc1c
[2] https://github.com/FRRouting/frr/releases/tag/frr-10.4.0
[3] https://github.com/FRRouting/frr/commit/e51c16a4ca92
[4] https://github.com/FRRouting/frr/commit/ff76fb21d7b3

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...etloadavg-optional-in-late-timer-warnings.patch | 49 ++++++++++++++++++++++
 package/frr/Config.in                              | 27 ++++++++----
 package/frr/frr.hash                               |  2 +-
 package/frr/frr.mk                                 | 11 ++++-
 4 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
new file mode 100644
index 0000000000..d03f64882e
--- /dev/null
+++ b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
@@ -0,0 +1,49 @@
+From d76100a2b9a2ec814ad0a1fb844a395a6dc2f6bd Mon Sep 17 00:00:00 2001
+From: Maxime Leroy <maxime@leroys.fr>
+Date: Mon, 11 Aug 2025 13:44:02 +0200
+Subject: [PATCH] lib: make getloadavg() optional in late timer warnings
+
+Commit ff76fb21d7b3 ("lib: improve late timer warnings") added an
+unconditional getloadavg() call. Older libcs (e.g. uClibc, dietlibc)
+lack this function, breaking the build. Before, no system load was
+shown, so skipping it restores prior behavior.
+
+Fixes: ff76fb21d7b3 ("lib: improve late timer warnings")
+Signed-off-by: Maxime Leroy <maxime@leroys.fr>
+Upstream: https://github.com/FRRouting/frr/pull/19366
+---
+ configure.ac | 1 +
+ lib/event.c  | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 87eba6784a..b8ef7bb777 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1369,6 +1369,7 @@ dnl ---------------
+ AC_CHECK_FUNCS([ \
+ 	strlcat strlcpy \
+ 	getgrouplist \
++	getloadavg \
+ 	openat \
+ 	unlinkat \
+ 	posix_fallocate \
+diff --git a/lib/event.c b/lib/event.c
+index 1eb41d07ce..22876574fb 100644
+--- a/lib/event.c
++++ b/lib/event.c
+@@ -1924,7 +1924,11 @@ static void event_tardy_warn(struct event *thread, unsigned long since_us)
+ 	double loadavg[3];
+ 	int rv;
+ 
++#ifdef HAVE_GETLOADAVG
+ 	rv = getloadavg(loadavg, array_size(loadavg));
++#else
++	rv = -1;
++#endif
+ 	if (rv < 0)
+ 		bprintfrr(&fb, "not available");
+ 	else {
+-- 
+2.43.0
+
diff --git a/package/frr/Config.in b/package/frr/Config.in
index 211eb83419..feb1aef05a 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_FRR
 	bool "frr"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	depends on !BR2_STATIC_LIBS # libyang
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
-	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  The FRRouting Protocol Suite.
 
@@ -43,11 +39,24 @@ config BR2_PACKAGE_FRR_NHRPD
 	help
 	  Build Next Hop Routing Protocol daemon.
 
+config BR2_PACKAGE_FRR_PROTOBUF
+	bool "Protobuf support (Binary-FPM and MLAG)"
+	default y
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
+	select  BR2_PACKAGE_PROTOBUF_C
+	help
+	  Build FRR with protobuf-based Binary-FPM export and MLAG
+	  peer synchronization.
+
 endif
 
-comment "frr needs a toolchain w/ threads, dynamic library, C++, host gcc >= 7"
-	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+comment "frr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "protobuf support for frr needs a toolchain w/ protobuf, C++, host gcc >= 7"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 414aaec7dd..12030a0df8 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  df4bc4f644f93be09f75c0e0e325b2f6a3ee6d1c6db429b6f36874e88a66ee33  frr-10.3.1.tar.gz
+sha256  8e4003eaba168626c5ea7a6735f2c85c87b04214e6f8c8f2715b21f8ae40970b  frr-10.4.1.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 23a2ca6037..fb7477a211 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.3.1
+FRR_VERSION = 10.4.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
@@ -25,7 +25,6 @@ FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
-	protobuf-c \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
@@ -89,6 +88,14 @@ else
 FRR_CONF_OPTS += --disable-bfdd
 endif
 
+# Optional protobuf support
+ifeq ($(BR2_PACKAGE_FRR_PROTOBUF),y)
+FRR_DEPENDENCIES += protobuf-c
+FRR_CONF_OPTS += --enable-protobuf
+else
+FRR_CONF_OPTS += --disable-protobuf
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FRR_CONF_ENV += LIBS=-latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
