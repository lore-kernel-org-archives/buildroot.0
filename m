Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ACFC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 237B7810CF;
	Fri,  7 Jun 2024 20:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7oIafa8Hx2x; Fri,  7 Jun 2024 20:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F383810D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F383810D2;
	Fri,  7 Jun 2024 20:34:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DACBB1BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C775E4027F
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSF35FULfibs for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A3724020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3724020B
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A3724020B
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:34:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457KYSCf106850;
 Fri, 7 Jun 2024 15:34:28 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457KYSnE124770
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2024 15:34:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 15:34:27 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 15:34:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457KYR1r065966;
 Fri, 7 Jun 2024 15:34:28 -0500
Date: Fri, 7 Jun 2024 15:34:27 -0500
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240607203427.feo5giguhthammt2@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
 <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
 <ZmNNKV_vaTkG0JpW@landeda>
 <20240607190634.salcy2c3jnpjzs57@bryanbrattlof.com>
 <ZmNdLpmIeiA83M9B@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZmNdLpmIeiA83M9B@landeda>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717792468;
 bh=/BJxa65FaAxZPd6d99WhPABjRCd7cJ14EPg5/nrJHMQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bv3YVfpEPZSbT/7X+IdqTmbF368AIgSX37+X4TZrqJ6XTuYk/MC+yOGfMQaYlU/j1
 W7xBV6g9AgJXKVlvpr8tJObf2Q1FUDF9NgzLewX+pkjlMiuqVlaC0B0hFU1xg5X2BH
 5bJUaMEJjXeVicLo+ZBsV7yE9ZiXkia6tw7b4Khc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bv3YVfpE
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On June  7, 2024 thus sayeth Yann E. MORIN:
> Bryan, All,
> 
> On 2024-06-07 14:06 -0500, Bryan Brattlof spake thusly:
> > On June  7, 2024 thus sayeth Yann E. MORIN:
> > > Of course, now I notice that the two defconfigs use the same versions
> > > for uboot and ti-k3-r5-loader. Which got me thinking that maybe we
> > > should make that explicit (and easier!) in the menuconfig:
> [--SNIP--]
> > > And then with a bit of sorcey/trickery in ti-k3-r5-loader (like we have
> > > in package/linux-headers for example) to handle the same-as case.
> > Ah Ok! Ideally they should never be different as it can only lead to 
> > hard to debug issues between the jump from tiboot3.bin to tispl.bin with 
> > vague error messages or no message at all. It's unfortunate that we even 
> > have the ability to select a version which can be different from uboot/
> > 
> > IMHO the K3 boot is complicated enough even without the ability to have 
> > different U-Boot version thrown into the mix. :) 
> 
> Oh, so would it make sense to completely drop that big choice, and just
> always use the same version as uboot, always?
> 

Absolutely!

>
> But nowadays, it is possible to enable ti-k3-r5-loader even when uboot
> is not enabled. Does that even make sense, or should we tie
> ti-k3-r5-loader to depend on uboot?
> 

There is the falcon mode option but I haven't typed out the support for 
any K3 SoCs yet (on my to-do soon list) and I haven't seen anyone use a 
separate fitimage made outside of U-Boot for falcon mode. But that 
doesn't eliminate the possibility of a future package being introduced 
to do that.

If you're OK with it, I would probably make ti-k3-r5-loader/ depend on 
uboot/ and tie the versions together until that mythical falcon mode 
package arrives.

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
