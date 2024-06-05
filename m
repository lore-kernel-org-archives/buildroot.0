Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38325C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5214417C3;
	Wed,  5 Jun 2024 17:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mvRik7kg0Bs; Wed,  5 Jun 2024 17:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52AD34196A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AD34196A;
	Wed,  5 Jun 2024 17:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB4091BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B49AB41984
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sE0wuBg45iy7 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FEB74196A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FEB74196A
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FEB74196A
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:30:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 455HUKGF084984;
 Wed, 5 Jun 2024 12:30:20 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 455HUKrW042582
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 12:30:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 12:30:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 12:30:20 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 455HUKup119659;
 Wed, 5 Jun 2024 12:30:20 -0500
Date: Wed, 5 Jun 2024 12:30:20 -0500
To: Marc Murphy <marc.murphy@sancloud.com>
Message-ID: <20240605173020.dbxkef36d2g3ijba@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240516200837.244258-1-marc.murphy@sancloud.com>
 <20240517143005.lu4x4afty6t7qo7b@bryanbrattlof.com>
 <SEZPR06MB64850609B6CDAB16559658FF80EE2@SEZPR06MB6485.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SEZPR06MB64850609B6CDAB16559658FF80EE2@SEZPR06MB6485.apcprd06.prod.outlook.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717608620;
 bh=dRlT/1FPzv2rVpjOamUTEDFV8MAhA3Ttm6tVhpdr2pg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=J1eHwKs20iwC2QOHJ5Deb2XgEeJA8DGuEpupod8PXQCjnBkc/xu3WUtANmM/7bhbs
 5QC94vC1I2vQ4ywfOy8gA26l7T2f0U3H9bA4b9swtWdKyS7dvTPz95aJQbmjV9AzuX
 vR9sCXBXAO5BMvU0gVHga8XT9wBATab4POYFfg6g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=J1eHwKs2
Subject: Re: [Buildroot] [PATCH 1/1] package/ti-k3-r5-loader: support
 patching in same way as u-boot
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 SanCloud <mailer@sancloud.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On May 17, 2024 thus sayeth Marc Murphy:
> Hi Bryan,
> 
> > Hi Marc,
> > 
> > On May 16, 2024 thus sayeth Marc Murphy:
> > > Signed-off-by: Marc Murphy <marc.murphy@sancloud.com>
> > > ---
> > >  boot/ti-k3-r5-loader/Config.in          | 12 ++++++++++++
> > >  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 19 +++++++++++++++++++
> > >  2 files changed, 31 insertions(+)
> > >
> > > diff --git a/boot/ti-k3-r5-loader/Config.in
> > > b/boot/ti-k3-r5-loader/Config.in index c276528fad..0e26a15369 100644
> > > --- a/boot/ti-k3-r5-loader/Config.in
> > > +++ b/boot/ti-k3-r5-loader/Config.in
> > > @@ -69,6 +69,18 @@ config BR2_TARGET_TI_K3_R5_LOADER_VERSION
> > >  		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || \
> > >  		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG  || \
> > >  		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
> > > +
> > > +config BR2_TARGET_TI_K3_R5_LOADER_PATCH
> > > +	string "Custom U-Boot patches"
> > > +	default ""
> > > +	help
> > > +	  A space-separated list of patches to apply to U-Boot.
> > > +	  Each patch can be described as an URL, a local file path,
> > > +	  or a directory. In the case of a directory, all files
> > > +	  matching *.patch in the directory will be applied.
> > > +
> > > +	  Most users may leave this empty
> > > +
> > 
> > Thanks for the patch! Just trying to understand what we're trying to do.
> 
> When we use an external config (BR2_EXTERNAL) and specify the version of u-boot to use we need to apply platform specific patches we normally use:
> $BR2_EXTERNAL /board/board-type/patches/uboot
> 
> If we want to use a dedicated Ti release e.g. 08.06.00.007 and apply our patches to it, this is good for the normal uboot bootloader.  If we need to apply patches to the k3 bootloader it is not possible and buildroot checks out a dedicated folder for building:
> drwxr-xr-x  25 marc marc    4096 May 16 14:34 ti-k3-r5-loader-custom
> drwxr-xr-x  25 marc marc    4096 May 16 14:34 uboot-custom
> 
> We have dedicated board configs, device tree and some code changes that are not in mainline and need applying to both builds of uboot.
> If there is another way to do this I would appreciate the feedback.
> 

Ah yeah. I've been trying to find a way good way to do that myself. 
Ideally these packages should be exactly the same with a different cross 
compiler. My end goal is trying to find a way to short-circuit the DL 
path and the PATCH directory to point to U-Boot but I haven't found a 
way to do that yet. :/

This solution works for me as a stopgap for now but if you know of a way 
to point these variables to whatever uboot/ is using let me know

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
