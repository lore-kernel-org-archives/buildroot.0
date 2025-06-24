Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDB3C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B2664199A;
	Thu, 26 Jun 2025 19:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fk1DtysX2pYF; Thu, 26 Jun 2025 19:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6DC41992
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B6DC41992;
	Thu, 26 Jun 2025 19:49:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 680C0154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 736A6843D9
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAAd74DhigH3 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D498980A9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D498980A9A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0B908467E; Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:39:33 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d173b8d722dc18201a7271a73741300eab5724f0
X-Git-Newrev: c5e93c53d240ddcd3d603dc3c0c539819d557be3
X-Patchwork-Hint: ignore
Message-Id: <20250626194921.D0B908467E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/dht: fix cmake4
 compatibility
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5e93c53d240ddcd3d603dc3c0c539819d557be3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The only dependee of dht, transmission, forked dht due to upstream
rejection of cmake support:
https://github.com/jech/dht/pull/50
https://github.com/jech/dht/pull/19

A fix was added to this fork for building with cmake 4.x:
https://github.com/transmission/dht/commits/post-0.27-transmission/

Instead of adding yet another patch to buildroot we switch to the repo
maintained by transmission.

Fixes:
https://autobuild.buildroot.org/results/30339a4fdb9c0b608ca3c5ae0692596b21b2fc3f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: use "git describe --abbrev=40" format in _VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1b5f8d04c8798e0d4def0ea2b5dfb20329f2fc38)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore          |  1 -
 package/dht/0001-cmake.patch | 67 --------------------------------------------
 package/dht/dht.hash         |  2 +-
 package/dht/dht.mk           |  4 +--
 4 files changed, 3 insertions(+), 71 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5a427fe0f1..a0cbbdb7c4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -386,7 +386,6 @@ package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
 package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
 package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
-package/dht/0001-cmake.patch lib_patch.Upstream
 package/dillo/0001-usr-local-include.patch lib_patch.Upstream
 package/dillo/0002-Fix-openssl-detection.patch lib_patch.Upstream
 package/dillo/0004-fix-build-with-gcc-10.patch lib_patch.Upstream
diff --git a/package/dht/0001-cmake.patch b/package/dht/0001-cmake.patch
deleted file mode 100644
index bbac639044..0000000000
--- a/package/dht/0001-cmake.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 25e12bb39eea3d433602de6390796fec8a8f3620 Mon Sep 17 00:00:00 2001
-From: Mike Gelfand <mikedld@mikedld.com>
-Date: Sun, 1 Jan 2017 16:23:21 +0300
-Subject: [PATCH] Remove Makefile, add Makefile.am and CMakeLists.txt
-
-Downloaded from transmission repo:
-https://github.com/transmission/dht/commit/25e12bb39eea3d433602de6390796fec8a8f3620
-
-Upstream status: rejected (https://github.com/jech/dht/pull/19)
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt |  9 +++++++++
- Makefile       |  9 ---------
- Makefile.am    | 11 +++++++++++
- 3 files changed, 20 insertions(+), 9 deletions(-)
- create mode 100644 CMakeLists.txt
- delete mode 100644 Makefile
- create mode 100644 Makefile.am
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-new file mode 100644
-index 0000000..6d4aa99
---- /dev/null
-+++ b/CMakeLists.txt
-@@ -0,0 +1,9 @@
-+cmake_minimum_required(VERSION 2.8)
-+project(dht C)
-+
-+add_library(${PROJECT_NAME} STATIC
-+    dht.c
-+)
-+
-+install(TARGETS ${PROJECT_NAME} DESTINATION lib)
-+install(FILES dht.h DESTINATION include/dht)
-diff --git a/Makefile b/Makefile
-deleted file mode 100644
-index e012945..0000000
---- a/Makefile
-+++ /dev/null
-@@ -1,9 +0,0 @@
--CFLAGS = -g -Wall
--LDLIBS = -lcrypt
--
--dht-example: dht-example.o dht.o
--
--all: dht-example
--
--clean:
--	-rm -f dht-example dht-example.o dht-example.id dht.o *~ core
-diff --git a/Makefile.am b/Makefile.am
-new file mode 100644
-index 0000000..2dba648
---- /dev/null
-+++ b/Makefile.am
-@@ -0,0 +1,11 @@
-+AM_CFLAGS = @PTHREAD_CFLAGS@
-+
-+noinst_LIBRARIES = libdht.a
-+libdht_a_SOURCES = dht.c
-+libdht_a_DEPENDENCIES = $(builddir)/include/dht
-+noinst_HEADERS = dht.h
-+EXTRA_DIST = CHANGES CMakeLists.txt dht-example.c LICENCE README
-+
-+$(builddir)/include/dht:
-+	$(MKDIR_P) $(builddir)/include
-+	(cd $(builddir)/include && $(LN_S) $(abs_srcdir) dht)
diff --git a/package/dht/dht.hash b/package/dht/dht.hash
index 2b641b9dcb..dec9a97124 100644
--- a/package/dht/dht.hash
+++ b/package/dht/dht.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  caba469a784a5c359c084099fdc025cfe09b1faec2ba9ba257b7384351c43c0a  dht-0.27.tar.gz
+sha256  c61493be7f036b59df0c921829f15e5c57b1e29d99bca737923e83d028fd736c  dht-0.27-2-g38c9f261d9b58b76b9eaf85f84ec1b35151a1eac.tar.gz
 sha256  06ce07293caf8c8ddfaf47797ad1fb18d1c040a8375231d8f8a6105cef51a8e6  LICENCE
diff --git a/package/dht/dht.mk b/package/dht/dht.mk
index 4f78f027c7..9f4e8b1bbd 100644
--- a/package/dht/dht.mk
+++ b/package/dht/dht.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DHT_VERSION = 0.27
-DHT_SITE = $(call github,jech,dht,dht-$(DHT_VERSION))
+DHT_VERSION = 0.27-2-g38c9f261d9b58b76b9eaf85f84ec1b35151a1eac
+DHT_SITE = $(call github,transmission,dht,dht-$(DHT_VERSION))
 DHT_LICENSE = MIT
 DHT_LICENSE_FILES = LICENCE
 DHT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
