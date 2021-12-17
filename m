Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE047C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 17:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7AF684C48;
	Fri, 17 Dec 2021 17:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHjWqYQ1YI4w; Fri, 17 Dec 2021 17:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB4C984C6A;
	Fri, 17 Dec 2021 17:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42DFB1BF2AF
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12FA861139
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 17:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7noKKnSNI8S for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D38F61130
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 17:45:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6232982518; Fri, 17 Dec 2021 17:40:24 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 18:42:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b6235af78d68e1ef58c3993725fbe7192dd1633
X-Git-Newrev: f6229d390124c4563f9e55da80e9bde67d3eff27
X-Patchwork-Hint: ignore
Message-Id: <20211217174024.6232982518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stella: bump to version 6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6229d390124c4563f9e55da80e9bde67d3eff27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- C++17 is mandatory since version 6.5 and
  https://github.com/stella-emu/stella/commit/fe2b4d630e1aeae80d0e90d7fe5e79b396c796a6
- Update hash of Copyright.txt, year updated:
  https://github.com/stella-emu/stella/commit/21438a82cc5245ff7437c9e61425d9d4307f7273

https://github.com/stella-emu/stella/blob/6.6/Changes.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stella/0001-configure-add-CC.patch | 30 ++++++++++++++++++++++++++++++
 package/stella/Config.in                   |  6 +++---
 package/stella/stella.hash                 |  4 ++--
 package/stella/stella.mk                   |  2 +-
 4 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/package/stella/0001-configure-add-CC.patch b/package/stella/0001-configure-add-CC.patch
new file mode 100644
index 0000000000..d4b29e39b5
--- /dev/null
+++ b/package/stella/0001-configure-add-CC.patch
@@ -0,0 +1,30 @@
+From 143cf9fa13a07b827de7065a5e919631406b0941 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Dec 2021 22:46:52 +0100
+Subject: [PATCH] configure: add CC (#854)
+
+Add CC to fix the following build failure when cross-compiling which is
+raised since
+https://github.com/stella-emu/stella/commit/771b5b44e31de1b81a552ee47b65014fbc338776:
+
+out/src/sqlite/sqlite3.o: file not recognized: file format not recognized
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/stella-emu/stella/commit/143cf9fa13a07b827de7065a5e919631406b0941]
+---
+ configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure b/configure
+index df666b377..0101d2567 100755
+--- a/configure
++++ b/configure
+@@ -899,6 +899,7 @@ echo "Creating config.mak"
+ cat > config.mak << EOF
+ # -------- Generated by configure -----------
+ 
++CC := $CC
+ CXX := $CXX
+ CXXFLAGS := $CXXFLAGS
+ LD := $LD
diff --git a/package/stella/Config.in b/package/stella/Config.in
index 7722f8a540..b5d148489a 100644
--- a/package/stella/Config.in
+++ b/package/stella/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_STELLA
 	depends on !BR2_STATIC_LIBS # sdl2
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_SDL2
 	help
@@ -11,10 +11,10 @@ config BR2_PACKAGE_STELLA
 
 	  https://stella-emu.github.io/
 
-comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 6"
+comment "stella needs a toolchain w/ dynamic library, C++, threads, gcc >= 7"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_6
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 comment "stella needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index c40d96616a..8aa5118165 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0346900e9ba4b6d532b72d956adc5078502a9bd6bbc1648bb3dd68f5ffd4859b  stella-6.4-src.tar.xz
-sha256  d207ee9e563fdd062582df8cbb6c8303b9879bd107692c0db2a32477e47dfa35  Copyright.txt
+sha256  d481efc6d27b5294565dfcc10983de2dbc4db8a59932a678ffdb4d2404b8c207  stella-6.6-src.tar.xz
+sha256  d5e5897578c2590e48328986cebd950ff215653f7f506ef93accf981870366a6  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 9e21606155..198a1134dc 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.4
+STELLA_VERSION = 6.6
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
