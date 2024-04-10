Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF49CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 00:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13FE260677;
	Wed, 10 Apr 2024 00:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22UMd7_b5QO0; Wed, 10 Apr 2024 00:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EDB60651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EDB60651;
	Wed, 10 Apr 2024 00:09:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55C071BF97F
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 00:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4184C405DA
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 00:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqGzleM_dr0O for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 00:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92126405BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92126405BF
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92126405BF
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 00:09:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43A091AK105602;
 Tue, 9 Apr 2024 19:09:01 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43A091hM097446
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Apr 2024 19:09:01 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 Apr 2024 19:09:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 Apr 2024 19:09:01 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43A091ks063609;
 Tue, 9 Apr 2024 19:09:01 -0500
Date: Tue, 9 Apr 2024 19:09:01 -0500
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20240410000901.aijcyn7ltpsbyflm@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240402153328.1859642-1-bb@ti.com>
 <20240403213617.4d006e69@windsurf>
 <20240404162901.ulcdeuzan2nr7e77@bryanbrattlof.com>
 <20240409213013.2bloukkzi6mzg3qb@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240409213013.2bloukkzi6mzg3qb@dasso>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712707741;
 bh=G8NhafLBMrpVzMJ6WOXsyfeW34w2uiofFNqFWB8FigA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=DBvryHKR++zEklCoBPrsgiLmMwYX8SECKpqzWR7CY/JAeJjFUa4Imk+d9nxaUs+vE
 z99P17drmN8uVQOUrY+iRzBmdYxW7yVDm39i9DcLKcFV4l1GrcReFWZ35wXd1CN4uV
 ULloCxKW0GLuzgKvXEk/1wOuCDmvMP67yixcuBgw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DBvryHKR
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

Hi Andreas,

On April  9, 2024 thus sayeth Andreas Dannenberg:
> Bryan,
> 
> On Thu, Apr 04, 2024 at 11:29:01AM -0500, Bryan Brattlof via buildroot wrote:
> > Hi Thomas,
> > 
> > On April  3, 2024 thus sayeth Thomas Petazzoni:
> > > Hello Bryan,
> > > 
> > > On Tue, 2 Apr 2024 10:33:28 -0500
> > > Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> > > 
> > > > The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> > > > TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> > > > processors. Update to pull in these latest updates.
> > > > 
> > > > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > > 
> > > Thanks for this update! Maybe this question has been asked before, but
> > > how much version dependency there is between these firmware files, and
> > > the U-Boot/TF-A/Linux code? Do they need to be exactly in sync to work
> > > altogether, or do newer firmware versions provide proper backward
> > > compatibility and therefore continue to work even if the rest of the
> > > software stack (U-Boot, TF-A, Linux) is older?
> > > 
> > 
> > We try hard to ensure backward compatibility goes back to when the 
> > device was first sent upstream.
> 
> How about compatibility with different iterations of the "boardconfig"?
> As you know it's a binary blob that gets consumed/used by SYSFW/TIFS
> during the boot. Is this also considered "stable ABI"?
>

It is considered a stable ABI but there have been some updates to what 
resources are reserved by firmware that shouldn't have any impact on 
boards.

Firmware now reserves an extra resource on the am62x and am62ax so we 
can put the R5, running DM firmware, into WFI so TIFS can interrupt it 
once a message comes in. Not giving that interrupt to TIFS will prevent 
DM from going into WFI and we lose out on a tiny bit of power savings 
with the R5 spinning.

eg: 87720385ab69396d045b9d9cf045896593f1774c in U-Boot

~Bryan

> 
> > Though some of these features will bring 
> > in some differences with the traditional way things are handled by the 
> > firmware. One example I can think of is DM will now warn (NAK) invalid 
> > clock requests which only really pollutes the logs:
> > 
> >   [    0.956700] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=13, clk=7, ret=-19
> >   [    0.968958] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=36, clk=9, ret=-19
> >   [    0.980134] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=36, clk=15, ret=-19
> > 
> > Other features will update how PLLs are configured but they are 
> > completely transparent and solely in firmware control.
> > 
> > If you see any issue or regressions in the wild let me know and I'll try 
> > to get them addressed.
> > 
> > ~Bryan
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
