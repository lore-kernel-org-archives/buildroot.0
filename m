Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B0BCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5233B403A9;
	Tue, 13 Oct 2026 08:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dNBuIzJkzxQ; Tue, 13 Oct 2026 08:28:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C65F403AA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791880093;
	b=YvCxgS9+4rwrk2VG64cIiVy+8tTHdrTNkEz3eKDaErA2GVYaf9QK4SMo9dfA8IBi9OgH
	 RByBAAh52P9rm3cLuDWFkQl/j+uYin/rSmjAIaX7cXUGu8mN7B9B3wtQDuw2yjxQYs9xI
	 fEn9KmwHTEsY/Pef8I3ej8Wew8IsgGj6t22NrPcCU5iiWVmFLYX9Agq1yu4eKjcUcraD2
	 65XaZbLKIVr9zJ4w5MDEbcnPEmHVeRo98Ar43CM249aaAposEsePjtYMtkZmxAhu/XFL5
	 RH1Yv9ncpxOpEcHlzpECGvclBqEX8+xqHYGNVJEpIFmN6NIAH+9AFr7rprfHfuQBaHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791880093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=i89uKXekC1nGzlliVVppOjuDrMSVc6h2LT0LBRA8/qs=;
	b=bY8h6G36yaAsWwljtmJlWxkAved/0ey037uzODd0QK5jjn97Qxj+knDS0KDxFe5kOOkT
	 3/mRFxPytUupcbljFxirk1Y++QHTWxZaozBozRwk7uYdVjHrikMKBJSWj7DwoafyMJPiq
	 HMEGzEEVStBadp4gHtu2366TDsi1z56dEfq4hBkI6IaVksnnGtRvNy7ctsa61JnCIJ9/P
	 qdBp0UKtKHeRvsV67hlfwg406jrE6LYCUl9x58i1I4ZueFWJY2hP4TRlaBX86HcdZX8bE
	 sCOdXAyE2UZpwmkpNfMezmvUPavFTLKy35hybce2l2CCQpptGFl1UcJXCDdUxTk0k2w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791880093;
	bh=i89uKXekC1nGzlliVVppOjuDrMSVc6h2LT0LBRA8/qs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HwY8kHgl9Y5RAY4DT9VGYvN2R+R+RcfjyKRheFcaurrz4BB9vIMdFJqblTduJKG20
	 0e5UQUv3yujJMjlkKYsKCGoL3/nTM28j15ASUxiSETUDVZX+9wSO+z3kIJ7Wdg8jt1
	 a+ovItpacsqAXyA9ppCtQyAWXW2M5+gapJ9r+H3XwrZxsGx2ObZzTfJ/y3bVOXwkca
	 qVm5ylDGJaxh7qkxtE2G7vBOnfr3K4oGxwkVf0DykoeMHa4exmtKqhz0KTcOE+2NXb
	 5cQAs1BGDEIMFlbycHstofKD9MRC1tMxWAuiW2RqkNoqm/J6v+wJEA2LwzRjj70fEU
	 FevcvBVDWC95A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C65F403AA;
	Tue, 13 Oct 2026 08:28:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6698D1E9
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48328401EC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7Jzm_MwssJU for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:28:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 377D14005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791880090;
 b=U/nSbXcpeOEM5ouUFuv9OIlhio+GeOzk2QKzAgPfeozZKkSBs4TokWTOPbfPL5l7lpbp
 ko6khWq2CG7ZjGqdc7cG9xpH+4OzcQnJ/Gn6CXfbr6mi/BbLYYPFJePI41ePazngttsYC
 PpMuV1j9mIkrjdynArc+qucXVKQg4CwDAkyWRy6Y+whH4pzHbDf2StikAa+r23MCwNd6g
 lj5Lhedk8yUWi6h0fHjwo8v6UTo3ExcVEquRBXDjtf7Ul/IqTPgHkXsvcaVRq5ciMve6/
 jO96NP9IywH4DWKWyXyM8epzVHpZkupxUx/ST3l0W/m4kl5Xew0VBGcWmVw2hbNG87g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791880090;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5vgC6pfBh5HQiER503DpHLeFtrvt09Ftu/49LVF2jyQ=;
 b=smnBh8WZJlO5NKvdgGJ9oomCo2uHSNRvysiR8g4ncsCQJBY8CsTfWkr/djmrgWGMZDxy
 KJB2GilZbcfT17phSA00iYGM+pnEuj7ew7rR2IB5hXpi4DjOjnBEvSGqbVfmmoYyeMYw+
 TOUoRRDBpcmfjynFb0e/QVnVmmj457P3nLhdVlp1jZSKIgH87zCg4fN+OLlgZM0NlmWi2
 uO9LBqtgyAcEE/C5V4uSYlWwlxTJyRQ8lHqeG0YVG5EXHNPWhawynJtbqGeFT6b+hBilA
 swjt+Kuc50CMUsAJLQTuhXHCZ/dGfFfjMUZHxyu3pBVFq0PAvSHopA/gSYL9Ti5WIjg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=j1o2Gcmz; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 377D14005F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:28:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 01BAE1A1145;
 Tue, 13 Oct 2026 08:28:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B41F560362;
 Tue, 13 Oct 2026 08:28:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFF2D11D70D9A; 
 Tue, 13 Oct 2026 10:28:06 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:28:06 +0200
To: Evgueni Tarassov <eugene@largest.net>
Cc: buildroot@buildroot.org, nolange79@gmail.com
Message-ID: <as3rNa_yKJD-VFSA@windsurf>
References: <b4dd6ba1-b7a8-4948-b58d-f768b651b0af@largest.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4dd6ba1-b7a8-4948-b58d-f768b651b0af@largest.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tcf-agent: bump to version
 1.11.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your patch, sorry for the delay in getting back to you. See
below for some comments.

On Tue, Jun 16, 2026 at 09:35:37AM -1000, Evgueni Tarassov wrote:
> Signed-off-by: Eugene Tarassov <eugene@largest.net>

Your commit log is empty, but the commit does more than bumping the
version, could you add some details are about the changes being done
(why is the patch removed, RISC-V support added, etc.).

> ---
>  ...tcf-services-tcf_elf.c-fix-x86-build.patch | 60 -------------------
>  package/tcf-agent/Config.in                   |  4 +-
>  package/tcf-agent/tcf-agent.hash              |  2 +-
>  package/tcf-agent/tcf-agent.mk                |  6 +-
>  4 files changed, 6 insertions(+), 66 deletions(-)
>  delete mode 100644 package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
> 
> diff --git a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch b/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
> deleted file mode 100644
> index 5f08fa485e..0000000000
> --- a/package/tcf-agent/0001-agent-tcf-services-tcf_elf.c-fix-x86-build.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 0a847ca035113540ee44d17f364bf4701fe78355 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Fri, 1 Mar 2024 22:31:05 +0100
> -Subject: [PATCH] agent/tcf/services/tcf_elf.c: fix x86 build
> -
> -Fix the following x86 build failure raised since version 1.8.0 and
> -https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/commit/8df5540c53b862d516ac25f908c2fff4a547b4a6:
> -
> -/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'unpack_elf_symbol_info':
> -/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: error: 'STT_ARM_16BIT' undeclared (first use in this function)
> - 2079 |         if (info->type == STT_ARM_16BIT) {
> -      |                           ^~~~~~~~~~~~~
> -/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2079:27: note: each undeclared identifier is reported only once for each function it appears in
> -/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c: In function 'create_symbol_addr_search_index':
> -/home/buildroot/autobuild/run/instance-1/output-1/build/tcf-agent-1.8.0/agent/tcf/services/tcf_elf.c:2228:78: error: 'STT_ARM_16BIT' undeclared (first use in this function)
> - 2228 |                     if (type == STT_FUNC || type == STT_ARM_TFUNC || type == STT_ARM_16BIT) {
> -      |                                                                              ^~~~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/8388acf59689ed7e621bdf158483e3df1cf9bef7
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Upstream: https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/1

This merge request doesn't seem to have been merged, so why is patch
removed?

> diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
> index a016871e6d..7281e62377 100644
> --- a/package/tcf-agent/Config.in
> +++ b/package/tcf-agent/Config.in
> @@ -27,9 +27,9 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
>  	default "i686"       if BR2_i386 && BR2_ARCH="i686"
>  	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
>  	default "x86_64"     if BR2_x86_64
> -	default "powerpc"    if BR2_powerpc || BR2_powerpc64 || \
> -		BR2_powerpc64le
> +	default "powerpc"    if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le

That seems like an unrelated/unneeded change?

>  	default "microblaze" if BR2_microblaze || BR2_microblazeel
> +	default "riscv64"    if BR2_riscv && BR2_RISCV_64

Could you have a look at those minor comments and submit a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
