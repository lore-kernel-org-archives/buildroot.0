Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5539E82CA1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 17:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AAC441B67;
	Wed, 27 Sep 2023 17:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AAC441B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ywm7LJSEAPlZ; Wed, 27 Sep 2023 17:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B9CF41B72;
	Wed, 27 Sep 2023 17:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B9CF41B72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8892A1BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A3BA419A4
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 17:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3BA419A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKlEhjnLa2ui for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60E994148A
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60E994148A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4266282586; Wed, 27 Sep 2023 17:56:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 19:46:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 285f136a1528a7ebfb881c41b026c794d6b14438
X-Git-Newrev: c76f5f24c7b06e276a471aa618d4b5c2f7f7975a
X-Patchwork-Hint: ignore
Message-Id: <20230927175642.4266282586@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdnet: bump to version 1.16.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=c76f5f24c7b06e276a471aa618d4b5c2f7f7975a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.2
https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.3
https://github.com/ofalk/libdnet/releases/tag/libdnet-1.16.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 .../0002-Correct-path-to-string-h-from-bsd.patch   | 26 ----------------------
 package/libdnet/libdnet.hash                       |  2 +-
 package/libdnet/libdnet.mk                         |  2 +-
 4 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 72fd5ac404..cb1d333fe3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -653,7 +653,6 @@ package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch
 package/libcuefile/0001-fix-static-link.patch Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch Upstream
 package/libdnet/0001-python-makefile.patch Upstream
-package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch Upstream
 package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch Upstream
 package/libdvbcsa/0001-altivec-powerpc64.patch Upstream
 package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch Upstream
diff --git a/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch b/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch
deleted file mode 100644
index 2aa4f4516b..0000000000
--- a/package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 347c23da1ec6f19b0b0143d53edcc209e522bbf2 Mon Sep 17 00:00:00 2001
-From: Oliver Falk <oliver@linux-kernel.at>
-Date: Wed, 29 Jun 2022 13:27:45 +0200
-Subject: [PATCH] Correct path to string.h (from bsd); Fixes #74
-
-[Retrieved (and backported) from:
-https://github.com/ofalk/libdnet/commit/347c23da1ec6f19b0b0143d53edcc209e522bbf2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- python/dnet.c   | 64 +++++++++++++++++++++++--------------------------
- python/dnet.pyx |  2 +-
- 2 files changed, 31 insertions(+), 35 deletions(-)
-
-diff --git a/python/dnet.pyx b/python/dnet.pyx
-index d9cbc90..af65a11 100644
---- a/python/dnet.pyx
-+++ b/python/dnet.pyx
-@@ -40,7 +40,7 @@ cdef extern from *:
-     unsigned long htonl(unsigned long n)
-     unsigned long ntohl(unsigned long n)
- 
--cdef extern from "string.h":
-+cdef extern from "bsd/string.h":
-     int     strlcpy(char *dst, char *src, int size)
- 
- cdef __memcpy(char *dst, object src, int n):
diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index c31ec90596..0ffeca603a 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b151c4913758ef80daf4558361b4f2680a37b01d59272625bb78c77183062c63  libdnet-1.16.1.tar.gz
+sha256  7df1f0a3db9cf03b48cf50ab273fd6a20c1be99eb9344b9663fe3fd9ed9dab65  libdnet-1.16.4.tar.gz
 sha256  6b46ec86e290066c47b6607d322135b3c473566e7225ac23d35a7c0588a82da6  LICENSE
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 14af07e6d5..fc2995979d 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDNET_VERSION = 1.16.1
+LIBDNET_VERSION = 1.16.4
 LIBDNET_SITE = $(call github,ofalk,libdnet,libdnet-$(LIBDNET_VERSION))
 LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
