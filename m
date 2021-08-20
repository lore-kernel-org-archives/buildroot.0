Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8243C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:59:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ADD561130
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ADD561130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0DF780BC8;
	Fri, 20 Aug 2021 22:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45dGzJDmNeQd; Fri, 20 Aug 2021 22:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1812180B74;
	Fri, 20 Aug 2021 22:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6421BF215
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FD93406DF
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnP8zS_cqgKD for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 22:59:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10111.aruba.it (smtpcmd10111.aruba.it [62.149.156.111])
 by smtp2.osuosl.org (Postfix) with ESMTP id C762F400D7
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 22:59:20 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.181.120])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HDTpm2RyznyXHHDTqmAoe2; Sat, 21 Aug 2021 00:59:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629500358; bh=IBrtsKwNQRynJaWwPh8+jNZ7lqoVjMRYX+wv+bZeHfA=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Zcyb8M6a1YcLnbka0ef5Pk+1z7Z1ULdO1+fGO6vTowtUsefFxeI6VXqzTjIS8BUNN
 MDZuFPRecKM4JM+LqMNCsXQ4o4deKPRxbeDKc95lNufM6cpIXJmO7ZJdiulGOgDW+o
 mYdkbloYp/RyQy6iNKPI2pKekXycBpJ02ev3VT25s/a7CNW2jPMDP/u5uMKJssTsi3
 HeBS8uGtasbsGvTOX21LFAI+ycFfZDr1hmjeVEIiH/Ce7TKT54ochQcny2NuCY4vyb
 RIWWomOhIUHIsZNOHEzJLIYWdVeOQ54w6hE8uYkz3T7LPBRQxX2lzTKyVSJe8a3F6Y
 X4GD6grUBFO2Q==
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210820225341.1131147-1-romain.naour@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <62964b45-9ad7-c951-889c-84387ec3220a@benettiengineering.com>
Date: Sat, 21 Aug 2021 00:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820225341.1131147-1-romain.naour@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfF0kRzZXwNFaQX4nTt9NiZPGLRfE49WN+m4WTb0dB2u4hbWkaq4OUGnOKj3KWgr1JltEjLSlbkTqNuGWmbKvaQZhcNm2NtvzkXzY9F7c/VJXseM2yuoW
 mF0u+jM3fc+gO20RmlCUMAyPZJWF0u6ZCEhaI3z1djrAaFYWfGXb0KNKEYXN0k/BhZG59XAnZu4uHU7OQIYRTK2uC7w1h/I1ubJP3Zm5TiRHBZZCfRcAQ7qj
 wklIjTicywW8TiALeercX8tbGxdS7aCVb4petoN0yJMGEGGmZYOmzdlIAWsrgMYV
Subject: Re: [Buildroot] [PATCH] Config.in: disable Fortify Source for
 microblaze
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Romain, All,

On 8/21/21 12:53 AM, Romain Naour wrote:
> As reported by Toolchain-builder project [1], the system doesn't
> boot when Fortify Source is enabled for glibc based toolchain
> (the init process hang).
> 
> Also, hardening features may not be wanted or possible for such
> slow soft-core cpus [2].
> 
> [1] https://gitlab.com/bootlin/toolchains-builder/-/jobs/1467624500
> [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312416.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> With BR2_RELRO_PARTIAL enabled, the system boot.
> ---
>   Config.in | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 2ef5d407e4..84f7fa6e8d 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -853,9 +853,16 @@ endchoice
>   comment "RELocation Read Only (RELRO) needs shared libraries"
>   	depends on !BR2_SHARED_LIBS
>   
> +config BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
> +	bool
> +	default y
> +	# Microblaze glibc toolchains don't work with Fortify Source enabled > +	depends on !BR2_microblaze

here you say it doesn't work with glibc toolchains, so you could add 
'&& !BR2_TOOLCHAIN_USES_GLIBC'. I think it's worth if it works with 
uclibc and musl.

What do you think about it?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> +
>   choice
>   	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
>   	default BR2_FORTIFY_SOURCE_1
> +	depends on BR2_FORTIFY_SOURCE_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	depends on !BR2_OPTIMIZE_0
>   	help
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
