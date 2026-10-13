Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEF4CA9ED0
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 04:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4257280C11;
	Tue, 13 Oct 2026 04:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLtb1BJkO3wu; Tue, 13 Oct 2026 04:28:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6AF3180AEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791865722;
	b=thmnO12rpzcaVdotxosS47REL5HudwRvF00Vxkr5Utk06OGP8sVIet+LyiJdefzqa66c
	 6u4/kY2AXacVLzIJUZjOLS1Y5+EGAYUlF5jL5BAg0idVlfYAIKpf+Y/7Mz8EMiM8CnVKh
	 hSaerrkho1JNaEfJBDluCN5ug2yii3W5+qQLoA0qbDg4ez6PWh9mHD8ovJ3+s31KEBft1
	 AOBvYQWXwPjYpJl0GKnzj5WnjUL2darVQsg3iqFWnL7Qr39nur/+CtnrrTYmFYFbsNLBs
	 h5Tf49sx+iwsJTTQqzwvNGFa4jMMxgf+Lqxy8V6JMEgefYEp3cdLJ4R7D9SpUf1JERw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791865722;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Operating-System:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Kb/Ljm2LrhlzfmBaUz9f4O2kjhbLbHmXfW+8lNqkEes=;
	b=N8mSODb08gVGBeSZK8veV1rwohd69WYKIFD4K9jCeT1+uXH5Nzj7DZZ18IJ4keeS8a5Q
	 vJpVpR9OGW8f2z7g4JfdzoqohypjBqkyqH9Utj2LoAe8m2RzJAToRbLdvb4JvvWAC/j5Y
	 0dcG6oD6xkHj+lI6C+OfE7ANQJJKxkJB58L36CvRidMay26tNThMZmSscLMmLwvjaclQf
	 2GoqA87ETtXnhCruKqiuc+PBZg/B/GMLO/PIQ49w30i/q/r/gYMiIXiyL9LoXeqUs/0Mq
	 MkwwsWKdiq0Fhs12rzg0zuzO5RoBOHA7igy71mdpEGSgso0BePsVTa0W1XXzyFY5+vA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791865722;
	bh=Kb/Ljm2LrhlzfmBaUz9f4O2kjhbLbHmXfW+8lNqkEes=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WQU7tZDFVZagBUyGAk/HhASueHGqgSc7zkCMZiaS5L+HGppPCMZ7cCEHmu8oP0h9W
	 2PCTN/wQiS5QZZzx/QNd+sPccOVstrzUCVxhPACf6FfgpVYIVdI2dNeJFxf9e6GNF7
	 xVmdwkS+h27/JLIe38oXZe8CSOBwoOlLelxqRzZ0GaS/PY7MyDwwRozob3wmXP9PUG
	 SrqVPw/NB3pzf/rpjzjvQGi8y6aY8Zg8xjklY8CuM/k+/Gq4lA4ETZ7BucZoki2XWZ
	 uh1oVAZfgyjAhK62SXFNSetB4v3hQVl9jwOePJbUHUvclb/UH0qs7BSHbR2Cru5N9N
	 eLwCIvT3TSv3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AF3180AEA;
	Tue, 13 Oct 2026 04:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 034AA1E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7ED40187
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7CczJk2c1HM for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 04:28:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EFE4B4008C
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791865720;
 b=HwfwxuAX4eLr7/fqlKfefhHmsdTzQObYbFKSa7KTd3Q0mYX1GzkvzUEN6zGu7W2gLp2v
 ILtTZdyuMHE5BH8+aSNsGh2c05i8hQlGyBVhP7qf1iwaV8s4MPaWYT0vb3OmbQ0cE3w5j
 XkcUZ+4URhhFoSlI0nNz5lohGSvA5gawA4ydT0GGQKsEv+TzpA48IscOKtvSZOa+TFKaV
 gLoB/Ts7o4+r21NUVVOB2S8V88SZG0gWoUIn4DayXhUF/jVLtdj5g/3AQ5pzjQDYT82Xt
 KrqHw+4rcFWl3wG2fMF3sMsYa0ZF2zsuY4LpyogYrGb8iB2FdGza9gyhBlln3FcS/4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791865720;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
 X-Operating-System;
 bh=KQFv1dtFppqLVsD07rC9C7yh46hu5/rkSnmjwaJdAvQ=;
 b=guyhti/3/g5Om9zWWpqCtMsH0xCMwS+587Ld174NDWpx37x0EpWtahD14dHmSC3cok/q
 BlYrj55YaHmnj+7X8USLxI4NpPfnD+RVvJuFBc8QxlI4PEGrFBxod8OflTN0KcO46LdDZ
 3bCTw91uV+umTx7MmgWgT1IC+cKDxsHBleIH7Wa5jVzScZlDFhVTKMvxdfwU46jb/GcTM
 MMyhQorMQEWKoqVKQpw8LEW7B+eUhi4mbJxFCsSugpd00vabFesQO/cO7RMkxR9g0h+fd
 16A9e5sex7oWeWRtbsPWM50GwfABf/fU0930jFjb2ZTJbePSQonSoxh5D1PxLQqsAKg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFE4B4008C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 04:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791865717; bh=/EIocDkKOtOEUT1MeX5BmYEuJLbnIN/n0EaTR0JJc2M=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=OpDiDkQ82ycHKc5C4UsmxYQWjfvtUxD7o7nhQeuHaU4LEUpeGyTXIFruJ/ASPyrcn
 1oB2o8yhcmo9oI8Sx2Lw3J8F03u1mlq1Tgwi61A/Zhx+qzfhgF01pDg16/z59umfmi
 2zzaYIDp8SfusPIOhPV5TjYaiOr1sVpyn3g20GAZAVidiSy0KMJTgtGJH9Mb/pj6tG
 EztrauxE7kyasdlebsZ+2bfXDVvxkkwGQLuxOUnakWSVBJeVVrZCDPkeTE7olaWVjj
 X7kObGf7qkdb0jT8yTbrAIponjt7aBHgSEXS51RRSXb6EmchVD7Qm3UJoCKNfTKjOG
 BWTBeIFpRNEKw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4239231E063F; Tue, 13 Oct 2026 06:28:37 +0200 (CEST)
Date: Tue, 13 Oct 2026 06:28:36 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <as2zdIl22eDqRNW9@waldemar-brodkorb.de>
References: <aoycxGKgl6IjLCPv@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aoycxGKgl6IjLCPv@waldemar-brodkorb.de>
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] arch/Config.in.arc: clarify float
 configuration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

friendly ping. 

best regards
 Waldemar

Waldemar Brodkorb wrote,

> Select soft-float configurations where appropriate,
> checked with all selectable CPU's and uClibc-ng toolchains.
> 
> uClibc-ng enabled FENV support for hard-float toolchains
> unconditionally in commit 4c5039b80ebbe42db35af189afcff7fb7d5cace6.
> 
> Glibc has a preconfigure script to check if the toolchain is a
> soft-float toolchain.
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/d0e735bcd9de979ab74df0c2f5229f7534d1539a
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  arch/Config.in.arc | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index f250ae5eeb..8fac281045 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -7,12 +7,15 @@ choice
>  
>  config BR2_arc750d
>  	bool "ARC 750D"
> +	select BR2_SOFT_FLOAT
>  
>  config BR2_arc770d
>  	bool "ARC 770D"
> +	select BR2_SOFT_FLOAT
>  
>  config BR2_archs38
>  	bool "ARC HS38"
> +	select BR2_SOFT_FLOAT
>  	help
>  	  Generic ARC HS capable of running Linux, i.e. with MMU,
>  	  caches and 32-bit multiplier. Also it corresponds to the
> @@ -20,6 +23,7 @@ config BR2_archs38
>  
>  config BR2_archs38_64mpy
>  	bool "ARC HS38 with 64-bit mpy"
> +	select BR2_SOFT_FLOAT
>  	help
>  	  Fully featured ARC HS capable of running Linux, i.e. with
>  	  MMU, caches and 64-bit multiplier.
> @@ -39,15 +43,17 @@ config BR2_archs38_full
>  
>  config BR2_archs4x_rel31
>  	bool "ARC HS48 rel 31"
> +	select BR2_SOFT_FLOAT
>  	help
>  	  Build for HS48 release 3.1
>  
>  config BR2_archs4x
>  	bool "ARC HS48"
> +	select BR2_SOFT_FLOAT
>  	help
>  	  Latest release of HS48 processor
>  	   - Dual and Quad multiply and MAC operations
> -	   - Double-precision FPU
> +	   - Double-precision FPU (optional)
>  
>  endchoice
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
