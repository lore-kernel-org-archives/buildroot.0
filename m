Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F5ECD1292
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 11:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6A41400FB;
	Thu, 11 Apr 2024 11:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sb9_LDDIqCEn; Thu, 11 Apr 2024 11:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C861840443
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C861840443;
	Thu, 11 Apr 2024 11:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76D491BF86C
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 11:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C4BE80B95
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 11:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa7blqa5uiNz for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 11:43:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69C7180B7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C7180B7C
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69C7180B7C
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 11:43:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43BBhaub067744;
 Thu, 11 Apr 2024 06:43:36 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43BBhaNe072563
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Apr 2024 06:43:36 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Apr 2024 06:43:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 Apr 2024 06:43:35 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43BBhZN5071237;
 Thu, 11 Apr 2024 06:43:35 -0500
Date: Thu, 11 Apr 2024 06:43:35 -0500
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20240411114335.e6mmjfcfol2tjbzy@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240402153328.1859642-1-bb@ti.com>
 <20240403213617.4d006e69@windsurf>
 <20240404162901.ulcdeuzan2nr7e77@bryanbrattlof.com>
 <20240409213013.2bloukkzi6mzg3qb@dasso>
 <20240410000901.aijcyn7ltpsbyflm@bryanbrattlof.com>
 <20240410004833.h2n5na5dgqduqyrg@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410004833.h2n5na5dgqduqyrg@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712835816;
 bh=LGxk6pOXFp0z8CcKmtOmK8ZsydnzzMvKz5D7Drez6Zs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=LrTnceqtJfAeqLF7SfSvNvwj7IgLwxYvnIhDvfUD3Aj3GLdy+TgXj2rjYYKpHghnk
 G8H7Xaoc7M15SBpIR7yHnDvSdt3l/myfzAxqE/N7X7XKjAotCandSUb/BDAtPKNBjT
 nmB1N1wS7ejXmzXZjTaoL/OVF1P7DVgbzT2bW6As=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=LrTnceqt
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-boot-firmware: bump to latest
 version
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On April  9, 2024 thus sayeth Andreas Dannenberg:
> Hi Bryan,
> 
> On Tue, Apr 09, 2024 at 07:09:01PM -0500, Bryan Brattlof wrote:
> > Hi Andreas,
> > 
> > On April  9, 2024 thus sayeth Andreas Dannenberg:
> > > Bryan,
> > > 
> > > On Thu, Apr 04, 2024 at 11:29:01AM -0500, Bryan Brattlof via buildroot wrote:
> > > > Hi Thomas,
> > > > 
> > > > On April  3, 2024 thus sayeth Thomas Petazzoni:
> > > > > Hello Bryan,
> > > > > 
> > > > > On Tue, 2 Apr 2024 10:33:28 -0500
> > > > > Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> > > > > 
> > > > > > The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> > > > > > TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> > > > > > processors. Update to pull in these latest updates.
> > > > > > 
> > > > > > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > > > > 
> > > > > Thanks for this update! Maybe this question has been asked before, but
> > > > > how much version dependency there is between these firmware files, and
> > > > > the U-Boot/TF-A/Linux code? Do they need to be exactly in sync to work
> > > > > altogether, or do newer firmware versions provide proper backward
> > > > > compatibility and therefore continue to work even if the rest of the
> > > > > software stack (U-Boot, TF-A, Linux) is older?
> > > > > 
> > > > 
> > > > We try hard to ensure backward compatibility goes back to when the 
> > > > device was first sent upstream.
> > > 
> > > How about compatibility with different iterations of the "boardconfig"?
> > > As you know it's a binary blob that gets consumed/used by SYSFW/TIFS
> > > during the boot. Is this also considered "stable ABI"?
> > >
> > 
> > It is considered a stable ABI but there have been some updates to what 
> > resources are reserved by firmware that shouldn't have any impact on 
> > boards.
> 
> Thanks, I just wanted to have this quick discussion here so folks can
> learn from it. These aspects are quite TI-specific and not immediately
> obvious to anyone not familiar with our K3 family of devices.
> 

No worries! I knew you knew all of this so I was curious :)

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
