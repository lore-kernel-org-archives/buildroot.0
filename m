Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7EEC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 19:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 982A741A5A;
	Fri,  7 Jun 2024 19:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsXsycL8_8y2; Fri,  7 Jun 2024 19:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09E8340BBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09E8340BBE;
	Fri,  7 Jun 2024 19:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 724FA1BF475
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 19:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DCDE427CC
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 19:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNpnRFsCTrd4 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 19:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9BBA427C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9BBA427C8
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9BBA427C8
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 19:06:35 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457J6Yvr005069;
 Fri, 7 Jun 2024 14:06:34 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457J6YbY070334
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2024 14:06:34 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 14:06:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 14:06:34 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457J6YEf070146;
 Fri, 7 Jun 2024 14:06:34 -0500
Date: Fri, 7 Jun 2024 14:06:34 -0500
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240607190634.salcy2c3jnpjzs57@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
 <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
 <ZmNNKV_vaTkG0JpW@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmNNKV_vaTkG0JpW@landeda>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717787194;
 bh=gfFck5Ji7NOdKTiRiHb7ZqJqB8ArPZ00uQ8FpbLVvMY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Mi5dJraasjA0B+QDbC9BmfzP/Uy009Wgg9U3UeVfq4AtNXkAjs0CJIebEnLkIEWTO
 vKYIIjauaLDlOHM8M8lAullLgkHaxUW+eDFNkuaUDLn5tFwg2DqSTlEhLJaQ5B1tgJ
 8u3v0tH9q7mIvZ6Qa81Gx3iVJJa+j6j8X5to7LRs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Mi5dJraa
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files
 with uboot
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Paresh Bhagat <p-bhagat@ti.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On June  7, 2024 thus sayeth Yann E. MORIN:
> Bryan, All,
> 
> On 2024-06-07 12:26 -0500, Bryan Brattlof via buildroot spake thusly:
> > On June  7, 2024 thus sayeth Yann E. MORIN:
> > > ti-k3-r5-loader is just a U-Boot SPL running on the R5 core on TI's K3
> > > processors, so it makes sense to just share the downloads with U-Boot.
> [--SNIP--]
> > This should also free us from the ti-k3-r5-loader.hash files correct? I 
> > can send the cleanup once this is merged unless you would like to.
> >     $ find -iname ti-k3-r5-loader.hash
> >     ./boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> >     ./board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
> >     ./board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
> 
> I also pondered that. However, it is going to be a little bit
> complicated, INHO. Indeed, the two can use different versions, so it
> would be difficult to maintain the uboot.hash file: it would be easy to
> drop a hash in uboot.hash while it is still used by ti-k3-r5-loader;
> similarly for defconfigs: since they can be different versions, we can't
> even share the hashes for the two, so they will have different hashes.
> 
> So that's why I did not merge the hash files.
> 
> Of course, now I notice that the two defconfigs use the same versions
> for uboot and ti-k3-r5-loader. Which got me thinking that maybe we
> should make that explicit (and easier!) in the menuconfig:
> 
> 
>     diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
>     index c276528fad..303f448f8b 100644
>     --- a/boot/ti-k3-r5-loader/Config.in
>     +++ b/boot/ti-k3-r5-loader/Config.in
>     @@ -16,6 +16,10 @@ choice
>           use cases you will want to use the exact same version/source
>           here as it is used to build the main U-Boot package.
> 
>     +config BR2_TARGET_TI_K3_R5_LOADER_SAME_AS_UBOOT
>     +   bool "same as uboot"
>     +   depends on BR2_TARGET_UBOOT
>     +
>      config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
>         bool "2024.04"
> 
> And then with a bit of sorcey/trickery in ti-k3-r5-loader (like we have
> in package/linux-headers for example) to handle the same-as case.
> 
> Then that would make sense to merge the hash files, maybe.
> 

Ah Ok! Ideally they should never be different as it can only lead to 
hard to debug issues between the jump from tiboot3.bin to tispl.bin with 
vague error messages or no message at all. It's unfortunate that we even 
have the ability to select a version which can be different from uboot/

IMHO the K3 boot is complicated enough even without the ability to have 
different U-Boot version thrown into the mix. :) 

~Bryan

>
> Thoughts?
> 
> > > ---
> > > PS. Not sure if we should do that in the package infra, though, or even
> > > if we can even do it. It's a special case for packages that are both
> > > sharing their downloads, *and* being downloaded from a VCS, which is
> > > not a situation common enough to warrant a generic implementation in the
> > > infras... Thoughts?
> > My thinking is these are unique enough cases and I'm not too sure how 
> > common the need will be to do this kind of thing. So it should be fine 
> > to keep it out of the core package system.
> 
> Exactly my thinking too.
> 
> Thanks for the review! :-)
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
