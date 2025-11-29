Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89169D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5306B83DD9;
	Fri, 12 Dec 2025 07:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3So565NoUGlw; Fri, 12 Dec 2025 07:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D2D183CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526222;
	bh=EUn+tI+oEa0yKLYiduXgCwPZxbwbsT/2JAoktbaWMgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KkleAJtxZzytCdT8JV+nMtDUDHggPk+b8euLD1eff33BE5RmpWBNqu5Y+dBBk7ynH
	 t63W0vbdtGT6oDqNa+6N9rMQSJNKvMpE/AdUiNEP/Q6gEIoGAdeurHLdMdEBSumdNf
	 iNW6qZ/ZVVcVfMf6ZYl+3m/dFybM3d3dicFdxfQn+0kkif4hlc9sBhHUs5U5BfScnx
	 TAPwQzTV5aFTcXauNzyyWs7hyYWcErgpM7N4LMU27OVbtGhuw1AgwOYGo1uzMEsJvR
	 fJ9I6y/kJDC60sBPFCp6vkER6ZEAPGIm2hv6jo6yF2z+HbAyq6m6IKhg00N1oaLlxU
	 DP7waYcirvIEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D2D183CD8;
	Fri, 12 Dec 2025 07:57:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D6A72C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A2041137
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mu8WNRH88Q4v for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1C74113F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC1C74113F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAFEF86C9A; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 17:05:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16528da35a0de376b0403891797bb88e2fe78965
X-Git-Newrev: d06976eeb02c2fa4f28141ef3b6e92f9f499f69d
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.CAFEF86C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pixman: bump version to 0.46.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d06976eeb02c2fa4f28141ef3b6e92f9f499f69d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.46.0 includes the patch to fix building on riscv without
vector support so drop the patch from the tree.

Release notes:
0.46.0: https://lists.freedesktop.org/archives/pixman/2025-April/005025.html
0.46.2: https://lists.freedesktop.org/archives/pixman/2025-June/005026.html
0.46.4: https://lists.freedesktop.org/archives/pixman/2025-July/005028.html

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
[Bernd: bumped to version 0.46.4, added release notes]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: change mailing list links to use lists.freedesktop.org]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-enable-RVV-on-linux-if-hwcap-headers-are.patch | 44 ----------------------
 package/pixman/pixman.hash                         |  4 +-
 package/pixman/pixman.mk                           |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)

diff --git a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch b/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
deleted file mode 100644
index ad1a0902e2..0000000000
--- a/package/pixman/0001-RISC-V-Only-enable-RVV-on-linux-if-hwcap-headers-are.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d0045f1fc32635d9629ea9e361631b07d9ca4140 Mon Sep 17 00:00:00 2001
-From: Charlie Jenkins <charlie@rivosinc.com>
-Date: Mon, 21 Apr 2025 13:08:50 -0700
-Subject: [PATCH] RISC-V: Only enable RVV on linux if hwcap headers are
- available
-
-Linux 6.4 introduced COMPAT_HWCAP_ISA_V. When trying to compile pixman
-against linux headers older than this, pixman will fail to compile
-because it assumes COMPAT_HWCAP_ISA_V exists.
-
-During meson configuration, do not enable have_rvv if the platform is
-Linux and COMPAT_HWCAP_ISA_V doesn't exist.
-
-Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
-Fixes: 0e424031bda2 ("RISC-V floating point operations")
-Upstream: https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/149
----
- meson.build | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index fdea28f..cb10931 100644
---- a/meson.build
-+++ b/meson.build
-@@ -379,7 +379,15 @@ if not use_rvv.disabled()
-         }
-       ''',
-       args : rvv_flags,
--      name : 'RISC-V Vector Intrinsic Support')
-+      name : 'RISC-V Vector Intrinsic Support') and cc.compiles('''
-+      #if defined(__linux__)
-+      #include <asm/hwcap.h>
-+      #include <sys/auxv.h>
-+      COMPAT_HWCAP_ISA_V
-+      #endif
-+      ''',
-+      args : rvv_flags,
-+      name: 'RISC-V Vector Linux HWCAP Support')
-       have_rvv = true
-     endif
-   endif
--- 
-2.43.0
-
diff --git a/package/pixman/pixman.hash b/package/pixman/pixman.hash
index c49b9c9e76..bd386d3458 100644
--- a/package/pixman/pixman.hash
+++ b/package/pixman/pixman.hash
@@ -1,5 +1,5 @@
-# From https://lists.cairographics.org/archives/cairo/2024-December/029586.html
-sha512  b24907f9a0bf6a9aa3278d31986c562c5f2d68f8c178021497c8648aca9f91e4c6f1ecfacf93eb01ba4f03ce4cfc5970fc40bb0fe6724bac9210fc57da09cba4  pixman-0.44.2.tar.xz
+# From https://lists.freedesktop.org/archives/pixman/2025-July/005028.html
+sha512  83b133e7969ba34f883f4e08dcc5d388c4397f43ce836c191c05945fe77c16ff501d531600780c12678a0d08105828a6bdeff2156b63f9c1a84087bc7f40ae9f  pixman-0.46.4.tar.xz
 
 # Locally computed
 sha256  fac9270f0987b96ff4533fca3548c633e02083cbba4a0172a3b149b2e4019793  COPYING
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 76e72d6d96..1b66b41719 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.44.2
+PIXMAN_VERSION = 0.46.4
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
