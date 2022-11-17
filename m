Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9087EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 20:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7F060A7A;
	Thu, 17 Nov 2022 20:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7F060A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sXaVLgOeotV; Thu, 17 Nov 2022 20:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3485B60A98;
	Thu, 17 Nov 2022 20:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3485B60A98
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC2721BF39D
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95CFE4159F
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 20:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CFE4159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXRt4Nr_fC5P for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 20:10:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38048402BA
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38048402BA
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 20:10:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AHKAYI6056291;
 Thu, 17 Nov 2022 14:10:34 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AHKAY8P048160
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Nov 2022 14:10:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 17
 Nov 2022 14:10:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 17 Nov 2022 14:10:34 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AHKAYVr081005;
 Thu, 17 Nov 2022 14:10:34 -0600
Date: Thu, 17 Nov 2022 14:10:34 -0600
To: Anand Gadiyar <gadiyar@ti.com>
Message-ID: <20221117201034.hk4dlgduw6aw7347@bryanbrattlof.com>
References: <20221117001511.1753592-1-gadiyar@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117001511.1753592-1-gadiyar@ti.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1668715834;
 bh=J3LfyJWNxFm0sqTPd4IbcM2h779p+KttNXyo42LuiSk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ojGdrlsp6egX6jwWcahtH09utnjVvlK6wfDE3YXJbmkiaP0dboSd5SVFbv+317xKU
 wtPr9mxXxj2XboqXHWG7LPr4aQYX/yfnRb4WJQMqtHZ/AqZGBY45tQnGbbfn8Baqx8
 +f4240JCsU8ZNyDgJlfHt56L01YNt1NNg2H4ZPyI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ojGdrlsp
Subject: Re: [Buildroot] [PATCH v6 0/3] add support for TI's AM64x boards
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Andrew Davis <afd@ti.com>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On November 16, 2022 thus sayeth Anand Gadiyar:
> This series introduces support for TI's AM64x SK boards.
> 
> We would like to add support for the AM62x SK as well, but are
> currently blocked by availability of some firmware. That's still
> on the list, as is the SK-TDA4VM. We should also be able to
> enable the beagleboard-ai64 alongside that at the same time.
> 
> 
> This series was previously sent out by Xuanhao in August and
> was reviewed by Giulio Benetti up to v5 (Thanks!).
> 
> This series addresses further review comments for v5 from Romain
> Naour. Thanks for the review Romain!
> 
> Andrew Davis acked the previous series, except for one new change
> that I've addressed in this version.
> 
> I addressed all of Romain's comments except one - I couldn't get
> the sha256sum for the k3-image-gen package to be updated in the
> source repository, so for now it's still manually computed. I'll
> see what I can do about getting the repository owners to generate
> these automatically at release time.
> 
> Changes in v6:
> - rebased to latest next branch and retested
> - updated u-boot and kernel to latest released versions as of today
> From Andrew's comments:
> - added a new SOC_TYPE option for k3-image-gen, as requested by Andrew
>   Davis in a review comment.
> From Romain's comments:
> - use "if" instead of "depends on" for sub-options
> - move TI K3 R5 Loader defconfig selection to Kconfig
> - use $(HOST_DIR) instead of $(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)
> - Retain Xuanhao's gmail ID in the MAINTAINERs file, but drop his TI
>   email from CC list as it will be inactive till he rejoins TI
> - Add a plain-text license file into the k3-image-gen repository and use
>   it instead of the HTML manifest file. Confirmed that this is still
>   BSD-3-Clause license.
> - Add comments in the ti-k3-image-gen.mk file for a couple of options
> 

Sorry for the noise everyone.. I wasn't subscribed to the lists and it 
rejected my mail :(

Tested-by: Bryan Brattlof <bb@ti.com>


The patches still look great to me :)
~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
