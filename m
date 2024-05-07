Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA02C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 06:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06AE34031C;
	Tue,  7 May 2024 06:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sWqj_qs5ZNZ; Tue,  7 May 2024 06:17:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB109404EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB109404EB;
	Tue,  7 May 2024 06:17:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83B641BF34F
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 06:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CD698234D
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 06:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuchT6MKdFUB for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 06:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B8DA8232E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8DA8232E
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B8DA8232E
 for <buildroot@buildroot.org>; Tue,  7 May 2024 06:17:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4476HpJT038639;
 Tue, 7 May 2024 01:17:51 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4476Hpfv018225
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 May 2024 01:17:51 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 May 2024 01:17:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 May 2024 01:17:51 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4476Hpn2079417;
 Tue, 7 May 2024 01:17:51 -0500
Date: Tue, 7 May 2024 01:17:51 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240507061751.pzljxk2hd6al5fkj@dasso>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-2-5bdc2f940db1@ti.com>
 <20240506085315.lb4frefetaffps6i@dasso>
 <20240506220948.7baeea19@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506220948.7baeea19@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715062671;
 bh=ULaaeiu7WsIe0po9UWHLZgL6axlMRwUlDngw5JEFkSg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=IM6G5gI2PbFs1AORWeZyBgNVu8sDsk8uBBDIGiR1dmq+FEyIyot50gj/SC7uaJhqJ
 efhjLXI6rr2C9KBORvqzHWGHnD6xgXvPmoeQczcJtMHOS9EewjV+zJol3SjmHXBUfE
 rJHTQc65K5AISSIbuqxCeiBJBx7dnixkB1gFKTok=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=IM6G5gI2
Subject: Re: [Buildroot] [PATCH RESEND v2 02/11] boot/uboot: bump to version
 v2024.04
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Bryan Brattlof <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Andreas Dannenberg via buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@smile.fr>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, May 06, 2024 at 10:09:48PM +0200, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Mon, 6 May 2024 03:53:15 -0500
> Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:
> 
> > Similar to your other patch ("boot/optee-os: bump to release v4.2.0")
> > changing the global default will affect other platforms so there's some
> > risk for breakage I suppose. Why not keeping those specific changes to
> > the AM62/AM64 platforms?
> 
> What Bryan did is totally fine and in line with how we handle things in
> Buildroot. For packages that are close the hardware (OP-TEE, TF-A,
> U-Boot, Linux), Buildroot offers:
> 
> - Using a "latest" version, which is regularly updated to the latest
>   upstream version, which means that if you change Buildroot version,
>   this version changes, like for any other package.
> 
> - Using a "custom" version, which is provided as an URL to a custom
>   tarball, a tag/commit in a Git repo, etc. In this case, the version
>   is explicitly specified in the user's .config file, and doesn't
>   change when Buildroot is updated.
> 
> So, what Bryan did is update the "latest" version, and this is
> perfectly correct.
> 
> All our defconfigs use a "custom" version for all of Linux, U-Boot,
> OP-TEE, TF-A, specifically to ensure that despite the update in
> Buildroot, our defconfig keep on using the versions that were tested by
> the developer who submitted the defconfig.

Ah, that's the piece I wasn't fully aware of, that all of the defconfigs
use a "custom" version, very much limiting the impact of the change here.
Thanks for clarifying!

Regards,
Andreas

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
