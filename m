Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C5C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2047840BA2;
	Sat, 30 Jul 2022 12:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2047840BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVtzOj0psMnK; Sat, 30 Jul 2022 12:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53C9E40B3B;
	Sat, 30 Jul 2022 12:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C9E40B3B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9A11BF392
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 125804097A
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 125804097A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IG48G8J_0Pf for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:03:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1E22402EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1E22402EA
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:03:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EEF1D60131;
 Sat, 30 Jul 2022 14:03:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 14:03:06 +0200
Date: Sat, 30 Jul 2022 14:03:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220730120306.GQ3168@scaer>
References: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
 <20220727184850.2857314-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727184850.2857314-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659182595;
 bh=XqJCHtomVO6w6j9GvMDhLSrUthtFbniM6tMh69ueLJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKDOfCVWV3Gr3pxIXC2R+kcpLdff6emnwNKjMeUASJ5on7QVvpoJnBneZFDPJH3vz
 /RWUpaYW3gMGRdnocrqHhrKGtt4GmfVe0J4Bq60xLkUxW0AfFGJvVgCBrK2GbrXxzn
 +C/pKpsV/06P9q5/Z69BqrjpK84oRHU113CVNSIXGNzcHrMmAzc+b+ThC1GDPUWwcn
 I0hMbG6bamNVlY42VhnmSQ1Lsy3BtVzFPXdoxmRYJf6ggEwyspMrxMzUVYPEUeqe7S
 LwCllpvvHhjxxuvnDoMuxWvJjqMACRUMD9uU93VfKkT538KPmOORYN3GE5vJwZLJbT
 tDX0rhPZkKsjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jKDOfCVW
Subject: Re: [Buildroot] [PATCH 2/3] docs/manual/ccache-support.txt:
 document the new BR2_USE_CCACHE variable
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 20:48 +0200, Thomas Petazzoni via buildroot spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/ccache-support.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
> index ea64628615..ab4f10be23 100644
> --- a/docs/manual/ccache-support.txt
> +++ b/docs/manual/ccache-support.txt
> @@ -55,3 +55,15 @@ first.
>  See https://ccache.samba.org/manual.html#_compiling_in_different_directories[the
>  ccache manual's section on "Compiling in different directories"] for
>  more details about this rewriting of absolute paths.
> +
> +When +ccache+ is enabled in Buildroot using the +BR2_CCACHE=y+ option:
> +
> +* +ccache+ is used during the Buildroot build itself
> +
> +* +ccache+ is not used when building outside of Buildroot, for example
> +  when directly calling the cross-compiler or using the SDK
> +
> +One can override this behavior using the +BR2_USE_CCACHE+ environment
> +variable: when set to +1+, usage of ccache is enabled (default during
> +the Buildroot build), when unset or set to a value different from +1+,
> +usage of ccache is disabled.
> -- 
> 2.37.1
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
