Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4E0109446F
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 19:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFF861C1E;
	Sat, 21 Mar 2026 19:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIN2sxv3zAxm; Sat, 21 Mar 2026 19:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C568A61C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774122326;
	bh=FlS1hql3P9hUSc8XpYsttj2YLnVySdR7TEnGUoqw2Eg=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XYXaMbg6bdvgCDa8jGSP1K6DsiRdYxYQ9L4ay4MVDOjQfnwkDtAwsz3yIDKNchFxI
	 Wo/6Gue3FDqPfHngg1M/zEY3P7K+2d+m/0BAkBE8WfdHbNfexP/Yq1RFsuR2IVNA5w
	 DAhtSKcz2vnuZYqwzly14M5Q5/F3pvry2s9qXlXLVmM8Q3yturp4C1A9U0C+UjyvsX
	 GHckr3hu7PYX9zjKrk0hPDIYQ+KnH0XzrKnZAWL5hIAgMZ22drpWTwrjd1fTiICgWq
	 juqy7ERJAB4r+q2uI/XswBQibHRY5JM6vQxo5AFI0MhLrZiwHDbkznS1/9vaujqOZR
	 79mw9rq4Z3Qsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C568A61C17;
	Sat, 21 Mar 2026 19:45:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87751265
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7863541F6C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guoM3uROIEur for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 19:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFBA641F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFBA641F68
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFBA641F68
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 19:45:23 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 356C9440459;
 Sat, 21 Mar 2026 21:45:09 +0200 (IST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260321180002.2450859-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sat, 21 Mar 2026 19:00:02 +0100")
References: <20260321180002.2450859-1-giulio.benetti@benettiengineering.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 21 Mar 2026 21:45:18 +0200
Message-ID: <87h5q9otkh.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1774122310;
 bh=iBdpx5Fq6tqJgzTBSBpoTHpLrUXXk2xFmdSE9lBxJEs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JhWHPqW/LbdIfiYhHMCFQscU8SYfZ9s5ca57sVnCscqlgzSQdG2MgMreyKrGJYDs3
 DGY/BAC17bC9ZnC6d+mAudWopSZuWjjNYdQTBDl10Ks0U2NSfappoSePiVIkG6hNY2
 0+Swx/hQC3iWFLjxQ/0EvSD8OlXyUSIhqGa4NYZvyhRFoN700UE9rlJsOgvqhal+qp
 uQCLrhz8D+aTn1cmsqIuN6nVs6SRuicadMAKaowuILmsGYLdP3IXR1ZSfiHj78EAxO
 scVWy7wkKq5rRWlkexNnrQwacLh9NCm+2JC/B0CNQRfYRV3BE7oxzYiwdfKSCF73OE
 jhx9ERue2X0lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=JhWHPqW/
Subject: Re: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.2
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Sat, Mar 21 2026, Giulio Benetti wrote:
> For change log, see:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=b308564a1ff6530f9fd3e7dd7b19aabae32ed375
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/dash/dash.hash | 6 +++---
>  package/dash/dash.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/dash/dash.hash b/package/dash/dash.hash
> index 85f8f3bf82..7ed0f0d3da 100644
> --- a/package/dash/dash.hash
> +++ b/package/dash/dash.hash
> @@ -1,7 +1,7 @@
> -# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
> +# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.2.tar.gz.sha512sum
>  # After checking pgp signature
>  # using key 9F9D45FE50AE361530983792C7271D0A49B18BA7

Actually, the hash below appears in the linked signed message. No check
of signature is required to validate the hash. So mention of pgp
signature can be removed.

baruch

> -sha512
> 6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d
> dash-0.5.13.1.tar.gz
> +sha512
> 7e9a06409eec925fc83c81192cab420a76ec25821f0a4cec8db4a93b00e51d343438b8cfe56069b4d7fb185f529d1b5171a7603525de00a7852298425b2f433f
> dash-0.5.13.2.tar.gz
>  # Locally calculated
> -sha256  d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370  dash-0.5.13.1.tar.gz
> +sha256  e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe  dash-0.5.13.2.tar.gz
>  sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
> diff --git a/package/dash/dash.mk b/package/dash/dash.mk
> index 143972f01a..547fe8c9b0 100644
> --- a/package/dash/dash.mk
> +++ b/package/dash/dash.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DASH_VERSION = 0.5.13.1
> +DASH_VERSION = 0.5.13.2
>  DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
>  DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
>  DASH_LICENSE_FILES = COPYING

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
