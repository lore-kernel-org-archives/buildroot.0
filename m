Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E946CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 16:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA69D40223;
	Thu,  4 Apr 2024 16:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZimjMs3tw0lI; Thu,  4 Apr 2024 16:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CD440489
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4CD440489;
	Thu,  4 Apr 2024 16:29:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A01BF1BF366
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 16:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9845940743
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 16:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGIJAFOW8Btt for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 16:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 489D8406E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 489D8406E3
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 489D8406E3
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 16:29:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 434GT1w3114742;
 Thu, 4 Apr 2024 11:29:01 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 434GT1jS102109
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Apr 2024 11:29:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Apr 2024 11:29:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Apr 2024 11:29:01 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 434GT1rC117946;
 Thu, 4 Apr 2024 11:29:01 -0500
Date: Thu, 4 Apr 2024 11:29:01 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240404162901.ulcdeuzan2nr7e77@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240402153328.1859642-1-bb@ti.com>
 <20240403213617.4d006e69@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403213617.4d006e69@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712248141;
 bh=VCX0J4JWnF4hL/4ALFYQHzpps8g/XVTzx5NJIaLuZ5Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZWXJTe8CAAT65LSpTIjBGbIKV/FBGCej0BH/hZA5TmT7e+a8IDcsXwwrECfIRkr3B
 S7scHlp6uB/fmqVjjAe9NX758yAI8FsS+LS5Yy/DTtAIh1JVhy8PJzuiJL9hT7lIky
 v1HzMIw/s7e0Y0m85yXNv+KxJ2I/KIInNPHQK0vM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZWXJTe8C
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On April  3, 2024 thus sayeth Thomas Petazzoni:
> Hello Bryan,
> 
> On Tue, 2 Apr 2024 10:33:28 -0500
> Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> 
> > The 09.02.00.009 release of ti-linux-firmware has the latest updates to
> > TI's TIFS, DM and DMSC firmware needed for the K3 generation of
> > processors. Update to pull in these latest updates.
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> 
> Thanks for this update! Maybe this question has been asked before, but
> how much version dependency there is between these firmware files, and
> the U-Boot/TF-A/Linux code? Do they need to be exactly in sync to work
> altogether, or do newer firmware versions provide proper backward
> compatibility and therefore continue to work even if the rest of the
> software stack (U-Boot, TF-A, Linux) is older?
> 

We try hard to ensure backward compatibility goes back to when the 
device was first sent upstream. Though some of these features will bring 
in some differences with the traditional way things are handled by the 
firmware. One example I can think of is DM will now warn (NAK) invalid 
clock requests which only really pollutes the logs:

  [    0.956700] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=13, clk=7, ret=-19
  [    0.968958] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=36, clk=9, ret=-19
  [    0.980134] ti-sci-clk 44043000.system-controller:clock-controller: recalc-rate failed for dev=36, clk=15, ret=-19

Other features will update how PLLs are configured but they are 
completely transparent and solely in firmware control.

If you see any issue or regressions in the wild let me know and I'll try 
to get them addressed.

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
