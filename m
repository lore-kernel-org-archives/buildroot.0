Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713F6C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B3B812E3;
	Sun,  9 Jan 2022 22:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5iC-3vQup1F; Sun,  9 Jan 2022 22:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60737812CD;
	Sun,  9 Jan 2022 22:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0D21BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 896E6812CD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrMj-igICByz for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:31:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4B6B812C6
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 22:31:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 998455FF27;
 Sun,  9 Jan 2022 23:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641767508;
 bh=XX1/Kwi1Rj1Ry7eALvDjVP/5578//hzNgbciLGM7evY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mhEmeCnU1JUbuOCaoG5iM3gh3ZSw0KNEcXkNFGIQLqLBxbpk73pBMi9fVaFI8s3Xi
 BXji0/0uuPt00m5urLpAqdK0tdrcs0+gj4pubE5mNyL9fm7bNZdww0nGSw8HeNKz+7
 DJAgybtos68/lnPqc27VJVmVGQrgr0qF8JZNjOw5a6ajtEhCmZysZMrNqcd/gGYXxu
 S1016QBmvaXJQCDKsSmqiZAh3VBmM465cvi0bjIE6rbUk6rBoBX8XKpLUXWBWeh4Hf
 baq0np0RHPSsEA7JHgjkLmdOG4ga7Vxu6PXdS7seKyuCJVKsbELtUGeW6cEXYuoLi1
 csEUdj7yR5h+g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 23:31:45 +0100
Date: Sun, 9 Jan 2022 23:31:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220109223145.GK1477939@scaer>
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-4-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017221743.160029-4-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 4/4] package/glibc: force -fno-lto
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
> glibc requires compilation barriers between files, and will
> fail with LTO enabled.
> So force LTO off by appending -fno-lto to the flags, but only
> if the GCC version is recent enough that an LTO build would
> be possible.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Applied to master, thanks.

Are the other C libraries (uClibc, musl) also affected by such an issue?

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 4721177d83..6d07495edc 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -67,6 +67,11 @@ ifeq ($(BR2_ENABLE_DEBUG),y)
>  GLIBC_EXTRA_CFLAGS += -g
>  endif
>  
> +# glibc explicitly requires compile barriers between files
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),y)
> +GLIBC_EXTRA_CFLAGS += -fno-lto
> +endif
> +
>  # The stubs.h header is not installed by install-headers, but is
>  # needed for the gcc build. An empty stubs.h will work, as explained
>  # in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick
> -- 
> 2.28.0

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
