Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E31C6379F
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 043F581DFD;
	Tue,  7 Feb 2023 13:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 043F581DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIhTjaB-uVux; Tue,  7 Feb 2023 13:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350F381E09;
	Tue,  7 Feb 2023 13:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350F381E09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 564261BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37CD6417D5
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CD6417D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYYgC5_ArAZy for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:55:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F8D417CF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0F8D417CF
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:55:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 07D5F13F85A;
 Tue,  7 Feb 2023 14:55:03 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 14:55:03 +0100
Date: Tue, 7 Feb 2023 14:55:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: John Keeping <john@metanate.com>
Message-ID: <20230207135503.GF4124@scaer>
References: <20230206162617.1907911-1-john@metanate.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206162617.1907911-1-john@metanate.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675778110;
 bh=i3w4OQTTasdgAv7c6ZOAMCwAMtVvD/B43rq8U6fl2jY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sW3b8/0vroAgzpYA5AlsEsLfTUWJg90OJccOpgEZ0FLBIqbpLBTHzYqmnjB48Nk+4
 4m9c1NK0cuFW8ZZIgsUakO6CozvQo1fIy1xKjEX5O7bIr7BVTUkXhR6wmOTt52zM4D
 vLdMimEW5FTpaNG/sfP0wLk7aSMwE1q6hzEGOaXynQLPhyFVIgESFqkxW6KVsETA85
 dIwKsyg9HHJqaWS4XVWRXYEVUtRBnaVIXVTyg7slHYcRDIAXzQNQYngUNoSWhrtgJ/
 VQ2H1ZP0uTvohmB0yipONgJLToao+AcK9CKFmXxWSaCUWYwVmTa14zqT3/SVm7a+nz
 wfDAmfRas5XDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sW3b8/0v
Subject: Re: [Buildroot] [PATCH] package/gcc/gcc-final: map debug prefix
 when reproducible
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

John, All,

On 2023-02-06 16:26 +0000, John Keeping spake thusly:
> When building with BR2_REPRODUCIBLE the toolchain wrapper passes
> -fdebug-prefix-map for all packages that are built.  But this doesn't
> affect the target libraries (like libgcc) built by GCC's build system.
> 
> GCC 4.3 added a configure option to set the debug prefix map for these
> libraries, which is used here to avoid encoding potentially
> non-reproducible build paths into the debug data.

Thanks, this is indeed very interesting. We (briefly) discussed this at
the developers day minutes ago, and the question that was brought up
was: why is not needed for the first-stage compiler?

Indeed, the first-stage compiler builds objects files that are then used
by the C library, we would expect the debug symbols for those to also
need prefix mapping.

Could you look into that, and either pass the option to both the initial
and final gcc if needed, or explain in the commit log why it is not
needed for the initial gcc, please?

In the meantime, I've marked this patch as changes-requested in
patchwork.

Regards,
Yann E. MORIN.

> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index aa883beb7b..5f222a324c 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -108,6 +108,10 @@ else
>  HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
>  endif
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +HOST_GCC_FINAL_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
> +endif
> +
>  # End with user-provided options, so that they can override previously
>  # defined options.
>  HOST_GCC_FINAL_CONF_OPTS += \
> -- 
> 2.39.1
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
