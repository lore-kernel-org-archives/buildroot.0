Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6F4C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 15:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F23A84125;
	Fri,  9 Aug 2024 15:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnROKDblTPqs; Fri,  9 Aug 2024 15:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5264284127
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5264284127;
	Fri,  9 Aug 2024 15:07:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 888C61BF3AA
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 764E384127
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGtqYfx2GExN for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 15:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8630284125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8630284125
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8630284125
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 15:07:36 +0000 (UTC)
Received: from pps.filterd (m0346910.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47972XaT017158; Fri, 9 Aug 2024 15:07:28 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40wechbecw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Aug 2024 15:07:28 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 479F7QF4018891
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2024 15:07:27 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479F7Qm0019505
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Aug 2024 15:07:26 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 5423A20054B6;
 Fri,  9 Aug 2024 10:07:26 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 09 Aug 2024 15:07:25 +0000
Message-Id: <D3BH3UVZ3BVB.29L1DI6KRZ1JU@collins.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240809060336.3326177-1-neal.frager@amd.com>
In-Reply-To: <20240809060336.3326177-1-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=950 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090109
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 mlxlogscore=891 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090109
X-Proofpoint-GUID: BoEHuf_XlV1uJ8IZwb42k4HHaHIjpnzA
X-Proofpoint-ORIG-GUID: BoEHuf_XlV1uJ8IZwb42k4HHaHIjpnzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2408090109
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=OAQpZgcNL7kFLYRaHC9AJb8NWFb+LmQ9Hdbp9QCBINo=;
 b=VLcybSjEnBcVEaSafDL1+HMdjoi4UeW0B9jn9BoljGbJ+kPboCIP/OXgJDDiqeq/MY4Z
 ng2ZWxHGHNDJ3ht0rWvLpBZe8H7VOtz4edU1ugDlalgVHJsUATnAHpMdbhcbJLy42uv5
 iYq6SyFKmRPGrgbM2HR8ZP6U0rg4bBvZkFQVmVN2PJ0xVvcbhRoGBAF84lwplOj8Z2Dt
 32hpnz8dO69kB6XOhZepHk/xym1UOuJeYutLz5uKfWezm17BFyGHwEBJaojtV9z2DxCw
 OTLnHyGVSP0oBs5CK/H/2fcxrfWXqjofLvARYbXqzwsg2fmqqb3MSZIL5TgRcJ1eOuEI Dg== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=VLcybSjE
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu106_defconfig: add
 ddr comment
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

Hi Neal,

On Fri Aug 9, 2024 at 6:03 AM UTC, Neal Frager via buildroot wrote:
> Add a comment to the zynqmp_zcu106_defconfig alerting users that the newer
> version of the board has a different ddr memory requiring a different
> psu_init_gpl.c file in u-boot.
>
> Users with zcu106 boards with the updated ddr memory need to use the following
> config:
> BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
>
> The issue is documented here:
> https://support.xilinx.com/s/article/71961?language=en_US
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/zynqmp_zcu106_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> index c10ec70ed8..6491f49d71 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -23,6 +23,12 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>  BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2024.01_2024.1)/xlnx_rebase_v2024.01_2024.1.tar.gz"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> +# The original DDR memory that was used with the zcu106 revA is obsolete.
> +# Newer boards with the replacement DDR memory need to use the following
> +# u-boot device tree:
> +# BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0"
> +# For more information:
> +# https://support.xilinx.com/s/article/71961?language=en_US

There is a board/zynqmp/readme.txt that has build instructions. It would
be helpful to call out the zcu102 and zcu106 variants there.

>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
