Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92141C83F09
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 21:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3752140BBD;
	Wed,  9 Jul 2025 21:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1k55giUCJq2; Wed,  9 Jul 2025 21:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7832040B29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7832040B29;
	Wed,  9 Jul 2025 21:26:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53F2269
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A49881354
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gn3jMKx1Qpn for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 21:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 574328128A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 574328128A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 574328128A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 21:26:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9B4AB2003C6;
 Wed,  9 Jul 2025 23:26:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 09 Jul 2025 23:26:40 +0200
MIME-Version: 1.0
Date: Wed, 09 Jul 2025 23:26:40 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250708-loongarch-fabi-v1-1-1c9b4df3dee9@flygoat.com>
References: <20250708-loongarch-fabi-v1-1-1c9b4df3dee9@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e17da108d1fb4e6abda26445dc053b35@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752096401;
 bh=Iqx+EVyS79sgIhloxXc/qytt2W1oYsZySN6sLTajPJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m3b8wqphPP4mhNzss91z3J9vc/Ln3CxrQ4C5XFL6VOqmIg+Qtahp9Y1PYfhv/6CZt
 eTPoyMaOwkwYenzts5GfyQgnHJAVbWkj4AWoU97pgh/jMsnOIvrWnmxyx7C0/7ia0l
 3mBvNO3FvFMrWpXCK6JLbNujRSl+QYXCilkT4aXIxy/K7scLZWcpvlj98XTA8RCfhp
 FrHb577CZ/s2y+sRNiplCOfANrPw5h1jnggp4n6ngDKHW2GyjcnyJS/QO/SVkCL3Vm
 x7ggrs5w06kV8pKgWR10h8MFljTlfJZ11uRwgVxbuFQk0ltd/ueTDbug2UmarwTPOT
 SfDTQT98M5nbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m3b8wqph
Subject: Re: [Buildroot] [PATCH] arch/loongarch: Fix toolchain triple ABI
 suffix
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jiaxun,

Thanks for the patch!

On 09/07/2025 00:56, Jiaxun Yang wrote:
> LoongArch GCC infers ABI from triple suffix, thus it's necesessary
> to set up proper triple ABI suffixes for different ABI types.
> 
> Adjust ABI suffix as per Table 10. List of possible <fabi-suffix>
> in "LoongArch Toolchain Conventions Version 1.00".
> 
> Link: 
> https://loongson.github.io/LoongArch-Documentation/LoongArch-toolchain-conventions-EN.html
> Link: https://lore.kernel.org/all/20250706105859.292908-1-ju.o@free.fr/
> Suggested-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  package/Makefile.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 
> 829636900ba950f4e2af4e070b7f979646600bcc..5ebb5f9ba8abd55cf9519cf3eb2a9a774ef9e271 
> 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -83,6 +83,14 @@ ABI := $(ABI)hf
>  endif
>  endif
> 
> +# LoongArch Float ABI suffixes
> +ifeq ($(BR2_LOONGARCH_ABI_LP64F),y)
> +ABI = f32
> +endif
> +ifeq ($(BR2_LOONGARCH_ABI_LP64S),y)
> +ABI = sf
> +endif
> +

Unfortunately, while this patch fixes the configure error and goes a bit
further, it is not sufficient for a complete a build for the lp64f and
lp64s ABIs.

The following config to test "lp64d" ABI works
(same as without with patch).

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     BR2_TARGET_EDK2=y
     BR2_TARGET_GRUB2=y
     BR2_TARGET_GRUB2_LOONGARCH64_EFI=y
     EOF
     make olddefconfig
     make

Testing the "lp64f" ABI with commands:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_32=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

fails in host-gcc-initial with output:

     Assembler messages:
     /tmp/ccEkwSsD.s:28: Error: register save offset not a multiple of 8
     /tmp/ccEkwSsD.s:30: Error: register save offset not a multiple of 8
     /tmp/ccEkwSsD.s:50: Error: register save offset not a multiple of 8

Testing the "lp46s" ABI with commands:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_NONE=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

fails in host-gcc-final with output:

     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: 
cannot find crti.o: No such file or directory
     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: 
cannot find -lc: No such file or directory
     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: 
cannot find crtn.o: No such file or directory

Note, the crt files are in "sf" subdirectory:
output/host/loongarch64-buildroot-linux-gnusf/sysroot/usr/lib/sf/crti.o

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
