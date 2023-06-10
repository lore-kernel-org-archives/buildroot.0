Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFBCC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CFBE40734;
	Sat, 10 Jun 2023 17:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CFBE40734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qG_CfbuU5Qqn; Sat, 10 Jun 2023 17:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82CD640588;
	Sat, 10 Jun 2023 17:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82CD640588
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 160741BF32B
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2DC1834F4
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DC1834F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rtKWtN7tDL1 for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 17:39:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82AE883449
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82AE883449
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:39:21 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout12.t-online.de (Postfix) with SMTP id 2599FB235;
 Sat, 10 Jun 2023 19:38:52 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q82Y6-3RNfyz0; Sat, 10 Jun 2023 19:38:50 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52510)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q82Y6-0002j1-0w;
 Sat, 10 Jun 2023 19:38:50 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 19:38:50 +0200
Message-Id: <20230610173850.1108670-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686418730-0AFC8714-A46673E7/0/0 CLEAN NORMAL
X-TOI-MSGID: c29c020c-e0fb-48c1-a641-b85146b7d07a
Subject: [Buildroot] [PATCH 1/1] package/putty: bump version to 0.78
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

Removed patch, the patched file does not exist anymore in this release.

Switched build system to cmake.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                           |  1 -
 ...1-unix-uxutils.h-fix-build-on-uclibc.patch | 41 -------------------
 package/putty/putty.hash                      |  9 ++--
 package/putty/putty.mk                        | 10 ++---
 4 files changed, 7 insertions(+), 54 deletions(-)
 delete mode 100644 package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 69b9b6720e..c6c3c61320 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1252,7 +1252,6 @@ package/pulseaudio/S50pulseaudio ConsecutiveEmptyLines EmptyLastLine Indent Vari
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch Upstream
 package/pulseview/0003-Support-glibmm-2.68.patch Upstream
-package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch Upstream
 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch Upstream
 package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch Upstream
 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch Upstream
diff --git a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
deleted file mode 100644
index 78cef8b908..0000000000
--- a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3f30f3a7e3f07f5ca3cef0f405b02e22a018c6e4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 9 May 2021 15:22:29 +0200
-Subject: [PATCH] unix/uxutils.h: fix build on uclibc
-
-Build on uclibc is broken since version 0.75 and commit
-65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
-even if <sys/auxv.h> is not available:
-
-unix/uxutils.c: In function 'platform_aes_hw_available':
-unix/uxutils.c:13:22: error: 'AT_HWCAP2' undeclared (first use in this function)
-   13 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
-      |                      ^~~~~~~~~
-
-To fix this build failure, include <elf.h>
-
-Fixes:
- - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to Simon Tatham <anakin@pobox.com>]
----
- unix/uxutils.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/unix/uxutils.h b/unix/uxutils.h
-index c9acff53..b80bf972 100644
---- a/unix/uxutils.h
-+++ b/unix/uxutils.h
-@@ -18,6 +18,8 @@
- 
- #if defined __arm__ || defined __aarch64__
- 
-+#include <elf.h>
-+
- #ifdef HAVE_SYS_TYPES_H
- #include <sys/types.h>
- #endif
--- 
-2.30.2
-
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 861d45cb76..0d24768b24 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,8 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.76/{md5,sha1,sha256,sha512}sums
-md5  9d22f8c56c1eaa1c0af3098438f25908  putty-0.76.tar.gz
-sha1  de09f50aee330eb05ad0cb81b970d0cc8e5c9b25  putty-0.76.tar.gz
-sha256  547cd97a8daa87ef71037fab0773bceb54a8abccb2f825a49ef8eba5e045713f  putty-0.76.tar.gz
-sha512  4576b359593928c6eba923f2d7b66ac0f2cf00e0c217cdbbb124471c3b35feb090e623847bfc507a4ef106cb3067aac47419e241b11dd8bf4ae554061fa93c25  putty-0.76.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.78/{sha1,sha256,sha512}sums
+sha1  198f01db6bea708e480fb11dd23026eda7b3f49f  putty-0.78.tar.gz
+sha256  274e01bcac6bd155dfd647b2f18f791b4b17ff313753aa919fcae2e32d34614f  putty-0.78.tar.gz
+sha512  d7a3e2eabd5f1f65fc0f3f1ee0789c30fbe891b57f63ddeac0b92befcb6aecd4a748f04a21c76ee42d992deb77c2e1a0454a71cc620ef26fbf23af660bd84bb5  putty-0.78.tar.gz
 
 # Locally calculated
 sha256  3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index e57a78be96..e816ad04a5 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,18 +4,14 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.76
+PUTTY_VERSION = 0.78
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
-PUTTY_CONF_OPTS = --disable-gtktest
 
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-PUTTY_CONF_OPTS += --with-gtk=2
-PUTTY_DEPENDENCIES += libgtk2
-else
-PUTTY_CONF_OPTS += --without-gtk
+PUTTY_DEPENDENCIES += host-pkgconf libgtk2
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
