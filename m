Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEDCC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 05:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A931D80DF5;
	Sun,  6 Sep 2026 05:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cA4knaBMzBrb; Sun,  6 Sep 2026 05:55:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 534D080DE7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788674126;
	b=QeoscDgNJMtGgUQ6WmUG5jRQe3nCC6LxB9F6VER44Ok7MbSF07r+lKJEwzTMSE3XNp4X
	 BEci9fug9Wc3Vms/udxGIx1qucZOl9dYL8vPszA7QIqFlfc9GL9p6ZFvh37tvJARQ3ZW8
	 02tS5v+/Xmos+NKbRxHyLO2T9XLnj7qb7my2TkY4EmdDqVULTW/mZrMisNdpMq6xX8NWr
	 OtTNtTg33fcKMKYJ7cRe9AwHl/0vliPuEVWSpyk5dxJYF0NrPzZEe3WBbwdEpyhIzqmkd
	 yC4nHfaAjUpv1RWpeuoKM+CSdqXuCDQog2KVS5AcnW6RgB7A9tGQFWRsggnwJBR/grw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788674126;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=OhraumKgtoC8zi0ZJErOXxNjrSKaGii4k2I5epcn1CI=;
	b=KclS9hWOF5fEVR7xZeo9q44vUxq7UjCKPWNzxR30uP46Svgth19qhmQth7NXB96rPTlx
	 /qrjhtFkomnbDzDgRkQImIW0wcOQJnC5/7MlE6T9qEpVdbgXYkI8OLoy94LG80ESKfPp+
	 jDT4o8D2A2yrD8+CB+bnfNvjL/WxvGUvDYzc/15zzsuNu9iDg7q1g64h0KThOxFJ+0GQl
	 V50eyQAV3aID+7IVeEDGNZIdcdqrc3EQhltXTQwiyK+2OKzg3nhanDgPHiaLSGU2XuYIH
	 kym+AbSrHpbhZVBzFLg463eruSGS5TwotAzyQ5zcHvNnND0ulSq04rqhOIEWT4XK+CA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788674126;
	bh=OhraumKgtoC8zi0ZJErOXxNjrSKaGii4k2I5epcn1CI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sT5cSqHaoW3H/bYwt9KgDSj0os5qbbOt6P2Bny1jUiOb+WMXexGkgN47Y93LVyJS8
	 2GZK7nIdosww1GVhddVrfev7durFpj8yePIVC4YmtiO0znv/WqcamEXjgbNzNdjlaN
	 z881gPqj28t3+zCiDg59Bn91axOaDIzZ0w8k7yxva/ZwrCF1fXkImUCsU+QsNnv2cH
	 DWIYGPuwtgRKPixa/CeR79PYn7TcUT+8UqARCBO8QsYA5C26YP/ZUMrxDNAL/8UOUp
	 sAIRownLVqjB6Qil3LuMjQctD//UfpWelWH7x1iVcws0/pEz5pvUrzb/TjbaLuVOgt
	 9L1P7Y7OyPd3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534D080DE7;
	Sun,  6 Sep 2026 05:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09995970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 05:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 067CC4008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 05:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNGZiMbdtB8A for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 05:55:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ADEDA4004C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788674118;
 b=PGcKGJYlG/940QqnPZgAPkxwUE376yumxO8h/wElKrb1OWlOssYl2I6tIrE6wPYaGhvm
 WZtdDY8iQ1mJp47RPqDxlKDAhcgFgABOk95g/UO0AgbzficQxtQ2RA4T1KsUnoos3rFuV
 2dwf2PhM0fHXiZhMALgxxck5Qb/oT1z4mkAowjwgcn91PhL/A66kX0R1BSdxF6+f4OUsW
 swgKg+J0hfbax75H0ZMinIeuyssmc2sVE/Emm8MBOjIdMF+XybCmQP/K2rtufpePov+Nc
 Z8YBt9RPsJFG6gIoLJY0jWiU8h/6/nb6TeLevUSux33MZaCrWXss7K3XF7Z1IIuxzKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788674118;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=Au4sCIrFilIcBFu2Jc33e6U0XH2uWrN7qkJjpCUMnwA=;
 b=BuLjA2fCFd+nRRTEVCPYKBvUGMDzwh6Pr6B4BSsayUvdsVNpU7pR2jbqv6HVOIla6PPK
 kk1h/NdLJB+XnaWVaqWssHirIyzWz4IevBD9Td9J4eLbY8UbkFrWHIxK21sJspZIcYt7m
 UU7RBsU2i2i3ezNJIUyDnkDH0gPT0sr868+pNgRDvP1TfdBz369LRls53ptWrF1rtrqoj
 sYUME89ASfD1YY26Fa5sKOcO9/FF6deAlpz/ASBepvPrN2JRexXCdPkpVrZL3yCYUG2TY
 3EP+vDW6/5ZGDbdvi9w61y5KsxM7mxbeMoJg8MLp+Mt7VEcZqLBB0IhObwRJs4IyhNQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ZAGz4H3q; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ZAGz4H3q
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADEDA4004C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788674108; bh=4CFRM5ndim/VG01I4aldQDmltKHTRWQ7sBR6ly7DF4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZAGz4H3qJsKOgONUDOUaT28aVvHyHDBo616gxxoi3N2DLEK5XYFF+IVLDWcaJm1/1
 6bNUNwfUAJItH0iQabuSU00poECN6yx/efmXKPhy6gkMjY1pWIb6BR6vSX476hLvPr
 iJW1JdIZFU9ob70PL81Sx5vFXmrgCytsydGm8/84=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 75895BDE2F7F;
 Sun, 06 Sep 2026 07:55:08 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 05:55:08 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <mailman.5079.1788156070.3179391.buildroot@buildroot.org>
References: <mailman.5079.1788156070.3179391.buildroot@buildroot.org>
Message-ID: <0b863079fdd5738b4becfcc11e86c93f@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: Bump to 6.04-pre2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexander,

I was curious if I could replace the syslinux host package and tried 
this patch; unfortunately I ran into various issues.

> 
> And change the source URL to use new upstream GIT repo:
> http://repo.or.cz/syslinux.git
> The revision to build comes from Archlinux syslinux package.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  ...bios-Fix-alignment-change-with-gcc-5.patch |  82 ---
>  ...Use-the-host-toolchain-for-prepcore.patch} |   8 +-
>  ...-Disable-PIE-to-avoid-FTBFS-on-amd64.patch |  30 -
>  ...nux-Use-the-host-toolchain-to-build.patch} |   0
>  ...-binutils-note-gnu-property-section.patch} |   0
>  ...sk-Force-ld-output-format-to-32-bits.patch |  32 -
>  ...0004-efi-main.c-include-efisetjmp.h.patch} |   0
>  ...tils-Use-the-host-toolchain-to-build.patch |  60 --
>  ...ition-is-now-part-of-the-exports-of-.patch |  37 --
>  ...ump-calls-to-fit-the-new-declaration.patch |  37 --
>  ...per-build-it-with-the-host-toolchain.patch |  32 -
>  ...-try-to-guess-the-sections-alignment.patch | 295 ---------
>  ...10-core-Clean-up-the-i386-bios-build.patch | 622 ------------------
>  ...-sysmacros-h-for-major-minor-makedev.patch |  34 -
>  ...multiple-definition-of-symbol-errors.patch |  25 +-

utils/check-package shows warnings; you should add "Upstream:" tags for 
the patches you add.

>  boot/syslinux/syslinux.hash                   |   3 +-
>  boot/syslinux/syslinux.mk                     |   6 +-

Building syslinux ran into some errors; this was the sequence:

ERROR: No hash found for syslinux-bf6db5b4-git4.tar.gz

Applying 0004-efi-main.c-include-efisetjmp.h.patch using patch:
patching file efi/main.c
Hunk #1 FAILED at 12.
1 out of 1 hunk FAILED -- saving rejects to file efi/main.c.rej

Applying 0013-Fix-build-with-gnu-efi-version-3.0.9.patch using patch:
patching file mk/lib.mk
Hunk #1 FAILED at 186.
1 out of 2 hunks FAILED -- saving rejects to file mk/lib.mk.rej

Applying 0021-load_linux-correct-a-type.patch using patch:
patching file com32/lib/syslinux/load_linux.c
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file 
com32/lib/syslinux/load_linux.c.rej

Applying 0024-efi-main.c-fix-incorrect-type-of-load_error_buf.patch 
using patch:
patching file efi/main.c
Hunk #1 FAILED at 30.
1 out of 1 hunk FAILED -- saving rejects to file efi/main.c.rej

make[6]: *** No rule to make target 'setjmp.o', needed by 
'libcom32core.a'.  Stop.
make[5]: *** 
[/home/data/buildroot.x86_64/build/syslinux-6.04/com32/Makefile:8: lib] 
Error 2
make[4]: *** 
[/home/data/buildroot.x86_64/build/syslinux-6.04/Makefile:288: com32] 
Error 2
make[3]: *** 
[/home/data/buildroot.x86_64/build/syslinux-6.04/Makefile:257: bios] 
Error 2
make[2]: *** [Makefile:102: bios] Error 2
make[1]: *** [package/pkg-generic.mk:273: 
/home/data/buildroot.x86_64/build/syslinux-6.04/.stamp_built] Error 2

(this and the patch error with 0013 look as if a patch is missing before 
0013)

I gave up after this one.

<...>

> diff --git a/boot/syslinux/syslinux.hash b/boot/syslinux/syslinux.hash
> index 9bec3a20e7..2a98641da5 100644
> --- a/boot/syslinux/syslinux.hash
> +++ b/boot/syslinux/syslinux.hash
> @@ -1,4 +1,3 @@
> -# From 
> https://www.kernel.org/pub/linux/utils/boot/syslinux/sha256sums.asc
> -sha256  
> 26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e  
> syslinux-6.03.tar.xz
>  # Locally computed
> +sha256  
> d6d6ed482ff30358ce203d74d4e35413185485ebb315e89db24790e769e23e4c  
> syslinux-bf6db5b4-br1.tar.gz
>  sha256  
> dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  
> COPYING
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index f938634c35..3d24869e59 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -4,9 +4,9 @@s
>  #
>  
> ################################################################################
> 
> -SYSLINUX_VERSION = 6.03
> -SYSLINUX_SOURCE = syslinux-$(SYSLINUX_VERSION).tar.xz
> -SYSLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
> +SYSLINUX_VERSION = bf6db5b4
> +SYSLINUX_SITE = http://repo.or.cz/syslinux.git
> +SYSLINUX_SITE_METHOD = git

You could also use the Debian archive for this version, it would save 
cloning ~50 MB of repository:

https://snapshot.debian.org/archive/debian/20260905T023709Z/pool/main/s/syslinux/syslinux_6.04~git20190206.bf6db5b4%2Bdfsg1.orig.tar.xz

>  SYSLINUX_LICENSE = GPL-2.0+
>  SYSLINUX_LICENSE_FILES = COPYING
> --
> 2.55.0
> 

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
