Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A031CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA3E84B7F;
	Fri, 14 Jan 2022 16:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnxBI9Ja4LqI; Fri, 14 Jan 2022 16:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB7284BB0;
	Fri, 14 Jan 2022 16:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31C991BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE2D084B83
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxWIg1krtFVT for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:18:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4A0B84BA4
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CFB9A835A7; Fri, 14 Jan 2022 16:11:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:14:17 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f0cca242d34133349c0026d281559b69c6134aec
X-Git-Newrev: 1f67a4dc06559f77b3c505f3e81168090b0aeb2b
X-Patchwork-Hint: ignore
Message-Id: <20220114161146.CFB9A835A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/capnproto: bump
 to version 0.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f67a4dc06559f77b3c505f3e81168090b0aeb2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Drop patch (already in version)
- Fix build on musl by disabling fibers through the new KJ_USE_FIBERS
  variable:
  https://github.com/capnproto/capnproto/issues/1167
  https://github.com/capnproto/capnproto/pull/1313
- Update indentation in hash file (two spaces)

https://capnproto.org/news

Fixes:
 - http://autobuild.buildroot.org/results/1a54cf9e7223c2bd67a5c85a6f2f42aa98da3a53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ee3e17a7179a68c25b2a420ef7a26d3f3fba14c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-32-bit-architectures-using-64-bit-time_t.patch | 37 ----------------------
 package/capnproto/capnproto.hash                   |  4 +--
 package/capnproto/capnproto.mk                     |  7 +++-
 3 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
deleted file mode 100644
index ce70ab8f29..0000000000
--- a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 12:10:28 -0800
-Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
-
-mutex code uses SYS_futex, which it expects from system C library.
-in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
-rv32 is using 64bit time_t from get go unlike other 32bit architectures
-in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
-this aliases it to NR_futex so that SYS_futex is then defined for rv32
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Retrieved from:
-https://github.com/capnproto/capnproto/commit/e2a05a19e9dc51287e19cc9f11fd91449219e361]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- c++/src/kj/mutex.c++ | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
-index c81cead7b..e1594b117 100644
---- a/c++/src/kj/mutex.c++
-+++ b/c++/src/kj/mutex.c++
-@@ -39,7 +39,13 @@
- 
- #ifndef SYS_futex
- // Missing on Android/Bionic.
-+#ifdef __NR_futex
- #define SYS_futex __NR_futex
-+#elif defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#else
-+#error "Need working SYS_futex"
-+#endif
- #endif
- 
- #ifndef FUTEX_WAIT_PRIVATE
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index d4500e0aad..7fd0e6158b 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6d8b43a7ec2a764b4dfe4139a7cdd070ad9057f106898050d9f4db3754b98820  capnproto-0.8.0.tar.gz
-sha256	9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
+sha256  daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535  capnproto-0.9.1.tar.gz
+sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 901b57ecda..7fc07043fb 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.8.0
+CAPNPROTO_VERSION = 0.9.1
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
@@ -29,5 +29,10 @@ else
 CAPNPROTO_CONF_OPTS += --without-openssl
 endif
 
+# musl doesn't support getcontext/setcontext
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+CAPNPROTO_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DKJ_USE_FIBERS=0"
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
