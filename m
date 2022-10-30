Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF78ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A17D40469;
	Sun, 30 Oct 2022 16:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A17D40469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWEKMpbFzr9f; Sun, 30 Oct 2022 16:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D6D14011F;
	Sun, 30 Oct 2022 16:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D6D14011F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 988F01BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A7C340352
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A7C340352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3TX_hCauKGb for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B8A540198
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B8A540198
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A85D87571; Sun, 30 Oct 2022 16:14:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:10:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e60fb6d252d5ece448a70957ab45389b151f7f79
X-Git-Newrev: 5ef22cb6d10958a9867fc372725826819a8824ef
X-Patchwork-Hint: ignore
Message-Id: <20221030161421.8A85D87571@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: bump to version 1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ef22cb6d10958a9867fc372725826819a8824ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Use WITH_ZLIB which is available since
  https://github.com/taglib/taglib/commit/1644c0dd87f40a2492bde4011fe72257fc72ee0e

https://github.com/taglib/taglib/releases/tag/v1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...latile-on-systems-without-HAVE_GCC_ATOMIC.patch | 34 ----------------------
 package/taglib/taglib.hash                         |  2 +-
 package/taglib/taglib.mk                           |  5 +++-
 3 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
deleted file mode 100644
index d8af73cb08..0000000000
--- a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1d24bd3399f2284104cbe87d017f87325b1797ab Mon Sep 17 00:00:00 2001
-From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
-Date: Thu, 13 May 2021 16:41:35 +0200
-Subject: [PATCH] =?UTF-8?q?Fix=20"error:=20duplicate=20=E2=80=98volatile?=
- =?UTF-8?q?=E2=80=99"=20on=20systems=20without=20HAVE=5FGCC=5FATOMIC=20in?=
- =?UTF-8?q?=201.12=20(#1012)?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* fix error: duplicate volatile
-
-* fix volatile ATOMIC_INT in constructor
-
-[Retrieved from:
-https://github.com/taglib/taglib/commit/1d24bd3399f2284104cbe87d017f87325b1797ab]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- taglib/toolkit/trefcounter.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/taglib/toolkit/trefcounter.cpp b/taglib/toolkit/trefcounter.cpp
-index 18cb596c0..5b089abf9 100644
---- a/taglib/toolkit/trefcounter.cpp
-+++ b/taglib/toolkit/trefcounter.cpp
-@@ -52,7 +52,7 @@
- # define ATOMIC_INC(x) __sync_add_and_fetch(&x, 1)
- # define ATOMIC_DEC(x) __sync_sub_and_fetch(&x, 1)
- #else
--# define ATOMIC_INT volatile int
-+# define ATOMIC_INT int
- # define ATOMIC_INC(x) (++x)
- # define ATOMIC_DEC(x) (--x)
- #endif
diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 38a44b41a5..7d1b2e8422 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703  taglib-1.12.tar.gz
+sha256  58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0  taglib-1.13.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9513e0d0e1..c687891002 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.12
+TAGLIB_VERSION = 1.13
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
@@ -13,6 +13,9 @@ TAGLIB_CPE_ID_VENDOR = taglib
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
+TAGLIB_CONF_OPTS += -DWITH_ZLIB=ON
+else
+TAGLIB_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
 define TAGLIB_REMOVE_DEVFILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
