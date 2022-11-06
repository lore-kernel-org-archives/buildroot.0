Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AD0C433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 13:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BB0A404F4;
	Sun,  6 Nov 2022 13:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BB0A404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JATf2_vGCpy; Sun,  6 Nov 2022 13:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C1D404E8;
	Sun,  6 Nov 2022 13:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C1D404E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 225E01BF21A
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 13:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBFD681A23
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 13:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBFD681A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_m4UDPFvDxo for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 13:59:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41BD981334
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41BD981334
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 13:59:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2F0C35FF95;
 Sun,  6 Nov 2022 14:59:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 14:58:59 +0100
Date: Sun, 6 Nov 2022 14:58:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221106135859.GR3918838@scaer>
References: <20221106105309.350587-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106105309.350587-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667743142;
 bh=3RPk9by1OBuEjw8lCFJ950qBAOKo043XmTSlSoWFwtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pikWT4MNQ45TpuaqKyMoWTrrMzEJieo9eTkZBeX47jtlLILOB7S3s9CMtv0VKbd3X
 mrgdXtRn6JsRUEEDOcTQalFIDZICdlM0eBb0+5kgubAK9iYb13OedzcE4T2H4/Jqrb
 CBT/5GN8BTUvT4c+D7lRaqgVbj/ClF1lIo7IgEzgs9OVSXFdgUpMGpGTLNukCcr9k3
 QOyMokfnrMTTSrZJsNdEsB8y/E6pKitIE1vhNAd9fZF9OGnTjuBuYEetA2r+qZvPRt
 peeyhBi0Bfkihj4IAx0mXta7h87isSRAajqAsnMEyD6Hq8qM8gwAa6jd7/oGLY0iOg
 gIk3X6pei7Ovg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pikWT4MN
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: fix musl and uclibc-ng
 builds
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-11-06 11:53 +0100, Fabrice Fontaine spake thusly:
> Fix the following musl and uclibc-ng build failures raised since the
> addition of the package in commit
> 530d6f661e506a4774b7236cb93d65f669adbc92:
> 
> configure: error: *** argp functions not found - install libargp or argp_standalone
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/55b283fa46a797253193fb752638ba88597a416b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/crun/Config.in | 1 +
>  package/crun/crun.mk   | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/crun/Config.in b/package/crun/Config.in
> index 5aca10dcdb..5def7001c1 100644
> --- a/package/crun/Config.in
> +++ b/package/crun/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_CRUN
>  	bool "crun"
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL

I find it a bit weirs that the select uses the uclibc||musl construct,
but that argp-standalone depends on !glibc.

Yes, the two conditions are technical equivalent, but still it is weird.

I looked at what we currently have, and it turns out that we have only
one case where the select uses !glibc (xen), 12 where we use
ublibc||musl, and 1 only uclibc (elfutils, which is glibc or uclibc
only).

so... Applied to master as-is, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_YAJL # libocispec
>  	help
>  	  crun is a fast and low-memory OCI Container Runtime in C.
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index 4a0c150594..65f166e657 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -15,6 +15,10 @@ CRUN_CPE_ID_VENDOR = crun_project
>  CRUN_AUTORECONF = YES
>  CRUN_CONF_OPTS = --disable-embedded-yajl
>  
> +ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> +CRUN_DEPENDENCIES += argp-standalone
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCAP),y)
>  CRUN_DEPENDENCIES += libcap
>  CRUN_CONF_OPTS += --enable-caps
> -- 
> 2.35.1
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
