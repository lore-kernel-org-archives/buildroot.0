Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2E0C54E68
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 02:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA0FE40B80;
	Wed, 20 Mar 2024 02:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJCailLVPRNK; Wed, 20 Mar 2024 02:18:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9543B4150C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9543B4150C;
	Wed, 20 Mar 2024 02:18:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F170C1BF831
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 02:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBBC541517
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 02:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGEokc3FYLf0 for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 02:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AD0640571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD0640571
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AD0640571
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 02:18:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42K2INbU044123;
 Tue, 19 Mar 2024 21:18:23 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42K2ING4108938
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Mar 2024 21:18:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 21:18:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 21:18:23 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42K2INUU002679;
 Tue, 19 Mar 2024 21:18:23 -0500
Date: Tue, 19 Mar 2024 21:18:23 -0500
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240320021823.gbwmzxmfmgqmbyiw@dasso>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
 <ZfoNHD-DlqkkYCRh@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZfoNHD-DlqkkYCRh@landeda>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1710901103;
 bh=Xa7YYluhrJX+1uBKh6cvBeOStmanSFAbBvx8KEFgang=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=C+UGkyh0I/4qYc1c7hC/TfkBSXPMTDg8CJLIHZDCMepi9+nWv449yfOe2CIVL7mIh
 Kc+xTW4Hr33/l1gd+iXzyOHfH5l+UjfV7/z17Hf1KSelvKf/Q3dx4I/89uHz6grTm3
 RV/zlMEtR315p+WXD0ybf7WqHDOLQ5PIu+xHZ47c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=C+UGkyh0
Subject: Re: [Buildroot] [PATCH v9 05/22] boot/ti-k3-r5-loader: bump to
 version 2024.01
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
Cc: michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Tue, Mar 19, 2024 at 11:09:32PM +0100, Yann E. MORIN wrote:
> Dario, All,
> 
> On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
> > All in-tree configs with the ti-k3-r5 bootloader use a custom version,
> > so this patch is mostly for the menuconfig default version
> > 
> > Suggested-by: Romain Naour <romain.naour@smile.fr>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> [--SNIP--]
> > diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> > index c5d1cb8e09f0..fbe5d215409d 100644
> > --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> > +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> > @@ -1,3 +1,3 @@
> >  # Locally computed:
> > -sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
> 
> Removing this hash means that defconfigs that still reference the
> 2022.10 version, no longer have a hash to validate the download against,
> which make it susceptible to CVE-2023-43608 [0] [1].
> 
> That was already the case for the two ti-am6?x defconfig in the the two
> previous patches, as they already used a custom kernel, a custm ATF, a
> custom u-boot: the hashes can't be checked for those versions, so the
> two ti am?x defconfigs already hit CVE-2023-43608.
> 
> We already fixed another defconfig for a similar issue, see commit
> 9ebbfeff387 (configs/rock5b: add hash for custom kernel).
> 
> Could you look into doing the same for those to TI am6?x defconfig,
> please?
> 
> In the meantime, I kept the hash for 2022.10 for ti-k3-r5-loader
> (really, for uboot), to abvoid the issue at least for ti-k3-r5-loader.
> 
> Speaking of that, by the way, ti-k3-r5-loader really is uboot, so I
> think that it should share:
> 
>  1. the same DL_DIR:   TI_K3_R5_LOADER_DL_SUBDIR = uboot
> 
>  2. the same hash file:  have ti-k3-r5-loader.hash be a symlink to
>     uboot.hash  (and have a xomment at the top of that hash file that it
>     is shared and that old hashes should/can be kept)
>

The entire boot chain for TI K3 devices (like all of AM62x) comprising
what's known as ti-k3-r5-loaer in Buildroot as well as U-Boot SPL/U-Boot
[proper] should _always_ be built from the same U-Boot source commit, as
this is how it's developed, tested, and used by pretty much everybody.
So your suggestion to more closely tie those things together makes a lot
of sense IMHO.

--
Andreas Dannenberg
Texas Instruments Inc



> Do you think that makes sense? If so, would you like to look into it?
> 
> [0] https://cve.mitre.org/cgi-bin/cvename.cgi?name=2023-43608
> [1] https://talosintelligence.com/vulnerability_reports/TALOS-2023-1844
> 
> Regards,
> Yann E. MORIN.
> 
> > +sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
> >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
> > -- 
> > 2.43.0
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
