Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B0C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D6D83E96;
	Mon,  7 Jul 2025 17:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWdMl48rV6nu; Mon,  7 Jul 2025 17:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDBC183DE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDBC183DE3;
	Mon,  7 Jul 2025 17:41:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F8C15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A82F183E95
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxsqD1pPxOGM for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 035FD83DD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 035FD83DD6
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:41:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE36C86166; Mon,  7 Jul 2025 17:41:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 19:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c46549f890977a805ecbf460bb2f022f482feaa
X-Git-Newrev: 7981df0c82b3f2456749cb4badfa7a0a05d5f0a9
X-Patchwork-Hint: ignore
Message-Id: <20250707174109.BE36C86166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libunwind: enable on riscv 64-bit
 glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=7981df0c82b3f2456749cb4badfa7a0a05d5f0a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit [1], first included in version 1.6.0,
libunwind supports 64-bit riscv, at least with glibc.

[1] https://github.com/libunwind/libunwind/commit/abd15da8afb35b92ed0cb2c47f6564775b976c24

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
[Julien: add link to upstream commit and fix version in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libunwind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 08f7f879c9..dd8cc72926 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_sh || \
-		 BR2_i386 || BR2_x86_64)
+		 BR2_i386 || BR2_x86_64 || (BR2_riscv && BR2_ARCH_IS_64))
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
