Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B16C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D277C40634;
	Mon, 12 Aug 2024 13:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXX8PeDDyC_A; Mon, 12 Aug 2024 13:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C79F40772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C79F40772;
	Mon, 12 Aug 2024 13:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 967FE1BF951
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD9A811BE
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0g47R9lqbYc for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:01:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 443B18113C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 443B18113C
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 443B18113C
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:01:19 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47CCUaep032089; Mon, 12 Aug 2024 13:01:13 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40wyt4k26a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2024 13:01:08 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47CD164U015190
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2024 13:01:07 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47CD16gZ013208
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 12 Aug 2024 13:01:06 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 447763026D4F;
 Mon, 12 Aug 2024 08:01:06 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 12 Aug 2024 13:01:06 +0000
Message-Id: <D3DYARJL5VND.19ERKZ05BBC98@collins.com>
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
 <CH2PR12MB5004250FF91D0CADB98CF309F0BB2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004250FF91D0CADB98CF309F0BB2@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_03,2024-08-12_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_03,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=929
 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408120097
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=870 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408120097
X-Proofpoint-ORIG-GUID: w5mCBf4FYyur5S-E1XKHUhdHSz7_rGhJ
X-Proofpoint-GUID: w5mCBf4FYyur5S-E1XKHUhdHSz7_rGhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_03,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2408120097
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=G1yizh0GNChBlUgsb1d0Sqmo9j6xyb1eakRUngUhtLs=;
 b=etHDgwER6p12tbCo8QC7E2mPPnFKbePOF/dlTIMIM+i4E11Vo/XaZsnbMINUkNJqN2ye
 fF/2yPbPx/XLIqbrWEdvvx6Cml56np2eDnlyyAd1S3TxrFy1mxTKGZ346fESx67ztvdu
 yC/FXqCGGF4E+z5DBabSZcisX/UFoNH7UKYnFLsfzVbeGWFeq8Zhh0el5rj/rlyYdw2N
 YfuDcB2B6ztHRMDoyB3PT/DRH7l+q7YPO6a6LlaUVrdxUvt7SgwOLeRURIYNzhFSvVXx
 nW5E67Ke//cxrNasAXYol+v1uUnmqzbEzYNGDeVpwZMcnVeLGm3Z7V/JuesfgDJftL+8 YQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=etHDgwER
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Sat Aug 10, 2024 at 7:01 AM UTC, Frager, Neal via buildroot wrote:
> Hi Brandon,
>
> > When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> > condition occurs between xilinx-prebuilt and u-boot, resulting in the
> > following error.
>
> >  objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
> >  objcopy: '.../images/pmufw.elf': No such file
>
> > U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> > xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> > DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> > fixup.
>
> > Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> > after xilinx-prebuilt has finished.
>
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>
> Thank you for looking into this.  I am adding Luca on copy as he developed
> the uboot.mk code you are modifying.
>
> Shouldn't line 448 of u-boot.mk prevent this issue?
> UBOOT_DEPENDENCIES += xilinx-prebuilt

It doesn't, the dependency graph looks something like this

  UBOOT_KCONFIG_DEPENDENCIES -> uboot-kconfig
  uboot-kconfig -> uboot-configure
  UBOOT_DEPENDENCIES -> uboot-configure

The `objcopy` call is happening during `uboot-kconfig`, so
UBOOT_DEPENDENCIES is not a prerequisite.

There is a UBOOT_KCONFIG_DEPENDENCIES, but it seemed more appropriate
that the `objcopy` should be a build step.

>
> Do you have the following config when you see this error?
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT

Yes, this happened when I was building configs/zynqmp_zcu106_defconfig
but with PER_PACKAGE_DIRECTORIES enabled, to speed up build with.

>
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
