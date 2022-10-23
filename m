Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629FFC433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 20:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F2D813B6;
	Sun, 23 Oct 2022 20:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F2D813B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAh5OPd0Ed07; Sun, 23 Oct 2022 20:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2959B813BF;
	Sun, 23 Oct 2022 20:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2959B813BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 120F91BF95F
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 307744037A
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307744037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjT4gIzxQCd5 for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 20:29:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10F7A40346
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 20:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10F7A40346
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0FA386FA7; Sun, 23 Oct 2022 20:29:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 22:28:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a08b862c6c22e7a7323efb82c8f3b3a662498f6
X-Git-Newrev: bd6e79299fa480ceb8a6942898a45efaa4999f2e
X-Patchwork-Hint: ignore
Message-Id: <20221023202923.F0FA386FA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpciaccess: bump to version 0.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd6e79299fa480ceb8a6942898a45efaa4999f2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://lists.x.org/archives/xorg-announce/2022-October/003226.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-pciaccess.pc.in-add-Libs.Private.patch    | 28 ----------------------
 package/libpciaccess/libpciaccess.hash             |  7 ++----
 package/libpciaccess/libpciaccess.mk               |  4 ++--
 3 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch b/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch
deleted file mode 100644
index e520dd03d8..0000000000
--- a/package/libpciaccess/0001-pciaccess.pc.in-add-Libs.Private.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e1f9fc0a11559c1200005c4bfe34cd217ec117b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Oct 2019 19:03:32 +0200
-Subject: [PATCH] pciaccess.pc.in: add Libs.Private
-
-Add Libs.Private in pciaccess.pc.in so applications that wants to link
-statically with pciaccess will know that they have to link with its
-dependencies such as -lz
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/xorg/lib/libpciaccess/merge_requests/10]
----
- pciaccess.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/pciaccess.pc.in b/pciaccess.pc.in
-index 706c5f7..c2da3d9 100644
---- a/pciaccess.pc.in
-+++ b/pciaccess.pc.in
-@@ -8,3 +8,4 @@ Description: Library providing generic access to the PCI bus and devices.
- Version: @PACKAGE_VERSION@
- Cflags: -I${includedir}
- Libs: -L${libdir} -lpciaccess
-+Libs.Private: @PCIACCESS_LIBS@
--- 
-2.23.0
-
diff --git a/package/libpciaccess/libpciaccess.hash b/package/libpciaccess/libpciaccess.hash
index 2082be7d04..27ec59a452 100644
--- a/package/libpciaccess/libpciaccess.hash
+++ b/package/libpciaccess/libpciaccess.hash
@@ -1,7 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003014.html
-md5  b34e2cbdd6aa8f9cc3fa613fd401a6d6  libpciaccess-0.16.tar.bz2
-sha1  ffaa13f2df5f822da1089b55223b217c142ef919  libpciaccess-0.16.tar.bz2
-sha256  214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489  libpciaccess-0.16.tar.bz2
-sha512  2f250048a270dfc0823d4bdd613aa272c58a80eaafd922850f56c4b6f7a45a263ed4cf521b52b49f04484ea44ebefb7407d079aa058318a5751ffb181e38fed1  libpciaccess-0.16.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003226.html
+sha512  8484605c66ef18c8d8a3e029a6d33e26fcaa450c1263790d89ac8b0a160ffb2dfceaa6140ac9ad7d8087283ecbec8ac801f757e44890d547c3cbecd2c922ca47  libpciaccess-0.17.tar.xz
 # Hash for license file:
 sha256  47012fd746980d1712ac4f3841ab6164bda1d2b84880760e45dbe1e1dc07f608  COPYING
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index d9a3a4e481..68d46b7f50 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPCIACCESS_VERSION = 0.16
-LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
+LIBPCIACCESS_VERSION = 0.17
+LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.xz
 LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
 LIBPCIACCESS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
