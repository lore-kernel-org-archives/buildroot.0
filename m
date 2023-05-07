Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2694CC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAC9240CBD;
	Sun,  7 May 2023 13:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC9240CBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-dRSDHO4st6; Sun,  7 May 2023 13:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAB49404F4;
	Sun,  7 May 2023 13:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAB49404F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2386E1BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F171382182
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F171382182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGsT7W2Aowal for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:15:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD41B80BAC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD41B80BAC
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:15:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EB2EE19F73B;
 Sun,  7 May 2023 15:15:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 15:15:41 +0200
Date: Sun, 7 May 2023 15:15:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230507131541.GT252090@scaer>
References: <20230502211158.2832484-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502211158.2832484-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683465345;
 bh=UDllHxeMcOfs/+wU//pBNPJxmLfQHsjO8aUFeeHC2to=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fIYxblmHIp98tl3bPzF3I/tVVZSrBEKAVTs74tFHiat8IBDrUeFlZNtS7r5HMUY2y
 NU4C+4GScQRSmAzannB5MocD8chFiq01omUPYdXlzjch2jTmzSgXfohnNjJKz9SeM9
 nh2Xc5r9w0TC9obPQ1vyr7DYN3SIWDxDW/wI2mQ5Jhd0EhV+uKlOy7TSUlvjjIyR5e
 6EihGj+6vjfdwfZW0A+DJ9ycH36n9/Z8Z7fcSqYJviQLJdb97K4ybt+L8g/yoNeTOa
 /ZFU3zlFjqxX2nR2PApI4LmGfj1uOQ1VuZ1oW8PU5Xs1WvHThDLBqmVdhXLVpp7RiC
 W2SwYVZ4rCAyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fIYxblmH
Subject: Re: [Buildroot] [PATCH] package/gdb: disable gdb for or1k builds
 with musl libc
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
Cc: Stafford Horne <shorne@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-05-02 23:11 +0200, Romain Naour spake thusly:
> The or1k musl port is incomplete, elf_gregset_t definition is missing
> (user.h is empty) [1]. It fail to build gdbserver and the full gdb.
> 
> [1] https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276569
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Stafford Horne <shorne@gmail.com>
> ---
> host-gdb build fine but it's useless without a gdbserver on the target.
> Keep it enabled for now to avoid dependency handling for or1k with musl...
> ---
>  package/gdb/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 80b1185b5e..0800d39ced 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -17,6 +17,9 @@ config BR2_PACKAGE_GDB
>  	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	# The or1k musl port is incomplete, elf_gregset_t definition is missing:
> +	# https://git.musl-libc.org/cgit/musl/tree/arch/or1k/bits/user.h?h=v1.2.3
> +	depends on !BR2_or1k || (BR2_or1k && !BR2_TOOLCHAIN_USES_MUSL)

We can somplify the logic here:
    depends on !BR2_or1k || !BR2_TOOLCHAIN_USES_MUSL

Also, I added a comment:

    comment "gdb needs a glibc or uclibc toolchain"
        depends on BR2_or1k
        depends on BR2_TOOLCHAIN_USES_MUSL

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_ZLIB
>  	# When the external toolchain gdbserver is copied to the
>  	# target, we don't allow building a separate gdbserver. The
> -- 
> 2.34.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
