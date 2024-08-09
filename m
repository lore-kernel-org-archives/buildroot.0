Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64DDC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 16:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 867DE84149;
	Fri,  9 Aug 2024 16:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSzPCApwL7TF; Fri,  9 Aug 2024 16:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D09B8414C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D09B8414C;
	Fri,  9 Aug 2024 16:33:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2B3C1BF867
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 16:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90A85612D3
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44jJ7PBCenC0 for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 16:33:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D1C660624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D1C660624
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D1C660624
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 16:33:39 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 479En8TP017003; Fri, 9 Aug 2024 16:33:35 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40w45fg93b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Aug 2024 16:33:35 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 479GXX1b029168
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2024 16:33:34 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479GXIIs006088
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Aug 2024 16:33:18 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 5B800300D4F6;
 Fri,  9 Aug 2024 11:33:18 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 09 Aug 2024 16:33:13 +0000
Message-Id: <D3BIXJIGBOG1.12FSPNHXB02KA@collins.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240809155527.3821320-1-neal.frager@amd.com>
In-Reply-To: <20240809155527.3821320-1-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_12,2024-08-07_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=740
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090118
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=723 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090118
X-Proofpoint-GUID: ldE04P-BFCZjdhDxM5FEqpjXX49KW2Kt
X-Proofpoint-ORIG-GUID: ldE04P-BFCZjdhDxM5FEqpjXX49KW2Kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=830 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2408090119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=vIWBIgEZZZP68saCbJR2yAl4r+E7GCuEPDKFWrKbUpg=;
 b=nWdd7brWOwmpWEv7+/Om5ffyCaT95bzNloGZQII8LWcax7L+5Tk7hTMSsOJSyMDYdLsS
 mBE7QMesiTHBV7fdZ8g5A9tg+5nE9d4aw4FiXka6gyPv9KNFD3qLX59haTCmR6GvvVlq
 5oKHLGnuHIRdVjCjFosw9W3zNpcNJr0dk9ThxCxYyv9EaX9QvAB9uiXiFHt4THA0wgnG
 mjBjRPfXHuNDhHWSHokDBbj6L8Rf+SxDroGIqBeIGwC8xiQwAoTgWbYQ7gGGc3Efr76v
 sJ7hEtD6AQXuPcny/ztFO0vISOdwRiuCHVE1O39Jia8C7rxVi249Phy6mSAokxanGjtN TA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=nWdd7brW
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig:
 move to board rev1.0
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
Cc: michal.simek@amd.com, romain.naour@smile.fr, luca.ceresoli@bootlin.com,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri Aug 9, 2024 at 3:55 PM UTC, Neal Frager via buildroot wrote:
> Migrate the zynqmp_zcu106_defconfig to rev1.0 ddr memory, since all new boards
> will be using the rev1.0 ddr memory.
>
> This patch also adds documentation in the board/zynqmp/readme.txt explaining
> the issue related to the change in ddr memory.  Should users not see anything
> printing from the board during boot, the most likely issue is that the board
> has the original ddr memory and the u-boot device tree needs to be configured
> accordingly to revA.
>
> Original DDR Memory:
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
>
> More information regarding this issue can be found here:
> https://support.xilinx.com/s/article/71961?language=en_US
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
>  board/zynqmp/readme.txt         | 26 ++++++++++++++++++++++++++
>  configs/zynqmp_zcu106_defconfig |  2 +-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/board/zynqmp/readme.txt b/board/zynqmp/readme.txt
> index 3a8a9b03ac..3f1b3a80c2 100644
> --- a/board/zynqmp/readme.txt
> +++ b/board/zynqmp/readme.txt
> @@ -64,3 +64,29 @@ card:
>  Where 'sdX' is the device node of the SD.
>  
>  Eject the SD card, insert it in the board, and power it up.
> +
> +==============
> +Important Note
> +==============
> +
> +The DDR memory on the original ZCU102 and ZCU106 boards is EOL.
> +The Buildroot defconfigs for these boards use the new DDR memory
> +which is configured by the u-boot spl initialization with the
> +Buildroot config options below.
> +
> +New DDR Memories:
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-rev1.0"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
> +
> +If nothing is printing upon boot, most likely it is because the
> +board has the original DDR memories.  To fix the problem, modify
> +the Buildroot defconfig file to use the u-boot spl initialization
> +for the original DDR memory using the config below for the target
> +board.
> +
> +Original DDR Memories:
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu102-revA"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
> +
> +For more information on this issue:
> +https://support.xilinx.com/s/article/71961?language=en_US
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index c10ec70ed8..970ed40d2c 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -23,7 +23,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> -BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
