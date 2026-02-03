Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653E5E8305D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DAA440908;
	Tue,  3 Feb 2026 08:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rr0BQcuymQTc; Tue,  3 Feb 2026 08:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C720409B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106383;
	bh=/ryfBi+Q3wYE5ZVngaXKDXt9V/kcHNyoko8x1RI8uNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sUVI451WV3AUwVS7BVWaCy3jHucmGrnfC9P+KW+7NPfEhG0gmwGa2EbzkcfNQjtgG
	 9KlMKQXBkjQU95eWotbMTDw0QVVS05QPuTkoIB6UGzJCe2dnjyMaUvbCLYboQtVMaQ
	 UMT9+yTAL5T6B+v2xq6WqRVbXx2YkX6/144ufRaAa+ucbhpxh1R1StupkRV8znVKWw
	 Wq0jS0NUaV1Pi5JAWgwJ402r133JAoL5QE1Hih3cnT5s0eH5EgMNHi6W/DfJoY6OmB
	 m5S3v2sPoEjONDOgaXcTX4LSjGuxcgDyZpJLHzVdLmljrCN21HYJSnIHUff9NWA1qw
	 rVDyNxaQ7bJCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C720409B6;
	Tue,  3 Feb 2026 08:13:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F0D9F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C803403FD
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3C4k5eFhHp9 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71D9440345
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71D9440345
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:13:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D1748653E; Tue,  3 Feb 2026 08:13:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:03:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d35664ad35e9ade271e1358b92f700c1b7a78558
X-Git-Newrev: 3aaf596b60c71fdcadad0a9709189efd466eacef
X-Patchwork-Hint: ignore
Message-Id: <20260203081301.5D1748653E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: depends on little
 endian
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3aaf596b60c71fdcadad0a9709189efd466eacef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit f9a91bf60e35617157b950eea05fc6f6144d650c bumped
igt-gpu-tools to 2.3 which includes upstream commit
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/ff3b7435bc56e34cf8b97c44ff32b7a1cc5dab7a
which limits the package to little endian archs causing build errors
on big endian archs:

In file included from ../lib/igt_panthor.c:5:
../lib/igt_panthor.h:61:2: error: #error "big endian not supported"
   61 | #error "big endian not supported"

Fixes:

  https://autobuild.buildroot.org/results/e3faeba1bff3d0e781032ddc9a760f34a9bf5714/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/igt-gpu-tools/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
index 184acb4cf1..87268969a1 100644
--- a/package/igt-gpu-tools/Config.in
+++ b/package/igt-gpu-tools/Config.in
@@ -1,5 +1,10 @@
+config BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
+	bool
+	default y if BR2_ENDIAN = "LITTLE"
+
 config BR2_PACKAGE_IGT_GPU_TOOLS
 	bool "igt-gpu-tools"
+	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS
@@ -35,6 +40,7 @@ config BR2_PACKAGE_IGT_GPU_TOOLS_TESTS
 endif
 
 comment "igt-gpu-tools needs udev /dev management and toolchain w/ NPTL, wchar, dynamic library, locale, headers >= 4.11"
+	depends on BR2_PACKAGE_IGT_GPU_TOOLS_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
