Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F67CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B41004091A;
	Sun, 10 Apr 2022 14:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z30Y4z9y_32K; Sun, 10 Apr 2022 14:13:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 622834091B;
	Sun, 10 Apr 2022 14:13:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD9911BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AD92408B3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 91IlCovALtIU for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:13:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 489DD4089D
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:13:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t1so1680734wra.4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fXJjmeORntqXesJymr5+49+P7wduvqiJD3rl1w4o1Yw=;
 b=ATrrCysIwJC4P+Dx2V9a7NcVxasRVc8Pp1SGFhkzFHdEZyr/5nQgWnJQnxKA2+VudM
 lpVOHOPg5eW1/C08ig/LDUrbFqd8CTu3tmcgqvs5nAlc1oRLIgLLpXpXhJIvKGUcn3ZX
 vDW80w79TEJU+ObE7zwsc1WAFN41GDaCPLb8SPM6KoIii03UiokO56BLdmtyOdtKE0qp
 7j6V6GJ1Asyipz40vb3UpWfEZDv+/PGEIxjF99nz94frbuhH/FaGwnwqxhv4ZvTLsx35
 XX6mVUGtDZ9lGTjT01ZZkVwOu0mHFu9aYVyJcWwiYZN3uznt4XR8rl+2yRcZvU7kaDwD
 OXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fXJjmeORntqXesJymr5+49+P7wduvqiJD3rl1w4o1Yw=;
 b=RsoxLgsgrVTpgV5mmS6SqYAkmnalKRxKTGYNBrthCE+sxosaMKVV1u0LjuhCCf7a10
 /WsJ56yN7+Wn7N+tciS0Z18ytwg8F1ygMcAHG443oog9us8CVA9GbFGpkmzNcMOWsMFF
 uEhfvCj9svRFqDVxD7FA98PzUxH4Z8s8PYfmQpLsb+R2PTHHGNfV+GQTV+YdS6JbZ6cO
 bw5RtrWJYUR9e7Nyeb2KEyZQ8tVW7CrkBdG3fcWxxR0ixJjQFH2rRHJ+NyPp8YM+KANG
 R8Fqtjb6ZVCIYYWTisZD7ktuMAEXyUwOafGYDvTrIPkMlSDBvQoP4hsyPpn43ejKhV7W
 JIUA==
X-Gm-Message-State: AOAM530DYbe0IlSYLhBcMtU2ctm2z5pNpH74Kv9KkROBdhYxcvi6CoGE
 48cIGN3j4blEDq9cOU0B6pwQ/w==
X-Google-Smtp-Source: ABdhPJwTGrVfjjMDL9ML+XXntz5Ge7Z1D9U9irDdH4Y0lhv5JI+RE+g4bMZs5lIHM21spYmo4+gsMg==
X-Received: by 2002:a05:6000:2c9:b0:204:1cdb:8f8d with SMTP id
 o9-20020a05600002c900b002041cdb8f8dmr22684028wry.49.1649600012287; 
 Sun, 10 Apr 2022 07:13:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm23546267wrm.82.2022.04.10.07.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 07:13:31 -0700 (PDT)
Message-ID: <0548ce7b-225b-1520-61ea-ddd2a7bf76f9@mind.be>
Date: Sun, 10 Apr 2022 16:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405200615.1755287-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405200615.1755287-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/igh-ethercat: needs kernel < 3.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 22:06, Fabrice Fontaine wrote:
> igh-ethercat needs kernel < 3.5 since bump to version 1.5.2 in commit
> 88cd215169d6875a5ed0543b15254b98f9f83104:

  Sorry, but no. If this is really true, we should just remove the package. It 
makes no sense to try to maintain packages that rely on such ancient kernels.
IMHO, of course ;-)

  However, there seems to be a new upstream [1] that (based on the git history) 
at least supports kernel 4.19. So switching to that would be a good idea.

  There's another concern however, for which I included James in Cc. Quite a lot 
of external kernel modules and other extensions (e.g. rtai) will only work with 
specific kernel versions. I don't know if we can afford to really encode that in 
the Config.in, especially because we don't have a good idea of the kernel 
version that is being built (the headers version is just a strong hint, but e.g. 
in case you build with an external toolchain it can be completely wrong). Up 
until recently, this wasn't really a problem because we don't build them in the 
autobuilders anyway. However, now James has added support for building kernels 
in his autobuilder, we do get failures like this. How will we handle that?

  Regards,
  Arnout

[1] https://gitlab.com/etherlab.org/ethercat

> 
> checking for kernel for 8139too driver... configure: error: kernel 5.15 not available for 8139too driver!
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e8122e9d7c13d07a6ddc7d9a2d3a078c21521ecd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/igh-ethercat/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
> index e600ef5fcd..51b8584f78 100644
> --- a/package/igh-ethercat/Config.in
> +++ b/package/igh-ethercat/Config.in
> @@ -1,9 +1,14 @@
>   comment "igh-ethercat needs a Linux kernel to be built"
>   	depends on !BR2_LINUX_KERNEL
>   
> +comment "igh-ethercat needs a toolchain w/ headers < 3.5"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> +
>   config BR2_PACKAGE_IGH_ETHERCAT
>   	bool "igh-ethercat"
>   	depends on BR2_LINUX_KERNEL
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
>   	help
>   	  IgH EtherCAT Master for Linux.
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
