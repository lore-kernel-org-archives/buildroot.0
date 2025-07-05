Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56997C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01ECC60EC5;
	Sat,  5 Jul 2025 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkozAJfkvWsF; Sat,  5 Jul 2025 17:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2733160AAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2733160AAC;
	Sat,  5 Jul 2025 17:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6F112E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8090D83A3E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ur0jxUiCbEoP for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C67F983955
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C67F983955
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B305C85FEB; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54895db9c10a26283b25a393cb6c872d72c245d1
X-Git-Newrev: 5495bdd430ed229a844c16da90a8ed597998f4b8
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.B305C85FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: Enable LoongArch64 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5495bdd430ed229a844c16da90a8ed597998f4b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Glibc introduced LoongArch64 support in 2.36, it requires kernel
5.19 to build.

Unselect BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT to reflect we can
build the toolchain.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in                          | 1 -
 package/glibc/Config.in                 | 2 ++
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index f23fdf65b6..34422c0d50 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -85,7 +85,6 @@ config BR2_loongarch64
 	select BR2_USE_MMU
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  LoongArch64 is 64-bit architecture developed by Loongson.
 	  http://www.loongson.cn/
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 52752e975e..9a4fe6f3db 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
@@ -35,6 +36,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	# toolchain/toolchain-buildroot/Config.in
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19 || !BR2_loongarch64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0173f40d97..0bccdc817c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,6 +48,10 @@ comment "glibc needs a toolchain w/ kernel headers >= 3.2"
 	depends on BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
+comment "glibc on LoongArch64 needs a toolchain w/ headers >= 5.19"
+	depends on BR2_loongarch64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
 comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
 	depends on BR2_powerpc64le
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
