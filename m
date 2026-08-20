Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F41C5DF8C
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11CC40816;
	Thu, 20 Aug 2026 22:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bprWkQhyC64l; Thu, 20 Aug 2026 22:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787264263;
	bh=wUQlLUT2PFQc9sFzI0XHQEYRyMRJnDQWB5zKe0ejHrI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CB+e7QsUYndVAokUCG8Zwl1qhodEBJDU2nGC6UpEEuK23FtpxAxU8yXlRYHhjjRiG
	 lCDaR9Nzvk45LwWREBaOzdC1J67auj4GoVjkesRR3/No4k1t7tJLQnZJEplL1UulwG
	 nBWa7V/Pc+0lTw5KK3bo76Xv2Z/CpDqf9zTQYx1QJlUpvav7cit1tPcBfqpVTEwO5i
	 +Fj/yEjtaCr7/HyXSH+MLLvEDKXPNVTx+ZOx3Mw+Wpv4eIl08H/a7h+zuVxEkwN9UG
	 LoMbokx868xkp2TT0H/R962GZhMrJkkwm5yNkt/4VAbpzO1vK4WoLUdvYDzztqK2Nu
	 IWOKhEoHV56Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C34D94081B;
	Thu, 20 Aug 2026 22:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C25EA3
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4EFF80C41
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOTUAAeK2tEZ for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 22:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F32F80B63
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:17:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4A138DAE4; Thu, 20 Aug 2026 22:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 00:15:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 139025f79328e1a93be972ed46d75366449c6695
X-Git-Newrev: 86102dd8279ac6c4c0244f3e490af98dc7460d5e
X-Patchwork-Hint: ignore
Message-Id: <20260820221648.E4A138DAE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: add upstream patch to fix
 build on s390, mark unavailable on m68k
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5252882834858727738=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5252882834858727738==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86102dd8279ac6c4c0244f3e490af98dc7460d5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Build errors were found by the Gitlab pipelines with these defconfigs:

- bootlin-m68k-68040-uclibc
  CMake Error at cmake/scripts/linux/ArchSetup.cmake:50 (message):
    Unknown CPU: m68k

- bootlin-s390x-z13-glibc
  CMake Error at cmake/scripts/linux/ArchSetup.cmake:50 (message):
    Unknown CPU: s390x

Backport an upstream commit from the upcoming Piers branch to fix the
restriction in ArchSetup.cmake.

This caused a different build error on m68k later on:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-68040-uclibc/build/kodi-21.3-Omega/xbmc/utils/MathUtils.h:142:5:
 error: unknown register name ‘st’ in ‘asm’
  142 |     __asm__ __volatile__ (

because m68k is not part of the list of archs to disable asm code:
https://github.com/xbmc/xbmc/blob/Omega/xbmc/utils/MathUtils.h#L26

Upstream rejected to add m68k there:
https://github.com/xbmc/xbmc/pull/22519
https://github.com/xbmc/xbmc/pull/22357#issuecomment-1368358471

so we disable m68k in BR2_PACKAGE_KODI_ARCH_SUPPORTS.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0006-cmake-Set-ARCH-to-CPU-by-default.patch    | 41 ++++++++++++++++++++++
 package/kodi/Config.in                             |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch b/package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
new file mode 100644
index 0000000000..c5bbbe9636
--- /dev/null
+++ b/package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
@@ -0,0 +1,41 @@
+From 1695ba12380272056f369f434747839b2ae38d91 Mon Sep 17 00:00:00 2001
+From: fossdd <fossdd@pwned.life>
+Date: Sat, 22 Feb 2025 20:59:28 +0100
+Subject: [PATCH] [cmake] Set ARCH to CPU by default
+
+Reduces complexity of redundant architecture names and allows building
+for other architectures implicitly.
+
+Upstream: https://github.com/xbmc/xbmc/commit/1695ba12380272056f369f434747839b2ae38d91
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cmake/scripts/linux/ArchSetup.cmake | 11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/cmake/scripts/linux/ArchSetup.cmake b/cmake/scripts/linux/ArchSetup.cmake
+index ab142177c8..f29a870a1e 100644
+--- a/cmake/scripts/linux/ArchSetup.cmake
++++ b/cmake/scripts/linux/ArchSetup.cmake
+@@ -37,17 +37,8 @@ else()
+   elseif(CPU MATCHES aarch64 OR CPU MATCHES arm64)
+     set(ARCH aarch64)
+     set(NEON True)
+-  elseif(CPU MATCHES riscv64)
+-    set(ARCH riscv64)
+-    set(NEON False)
+-  elseif(CPU MATCHES ppc64le)
+-    set(ARCH ppc64le)
+-    set(NEON False)
+-  elseif(CPU MATCHES loongarch64)
+-    set(ARCH loongarch64)
+-    set(NEON False)
+   else()
+-    message(SEND_ERROR "Unknown CPU: ${CPU}")
++    set(ARCH ${CPU})
+   endif()
+ endif()
+ 
+-- 
+2.47.3
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 6f256ada43..08a7caae2c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
+	# m68k not supported upstream
+	depends on !BR2_m68k
 	depends on BR2_USE_MMU # libcdio, and others
 
 comment "kodi needs python3 w/ .py modules, a uClibc or glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 9.x, host gcc >= 9.x"

--===============5252882834858727738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5252882834858727738==--
