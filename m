Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C9AC52D7C
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 15:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E1D84119;
	Fri,  9 Aug 2024 15:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fPhsLc4ADP7; Fri,  9 Aug 2024 15:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CCE58411E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CCE58411E;
	Fri,  9 Aug 2024 15:02:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDAE41BF29D
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA37240B53
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 15:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCfoxAhG3qzy for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 15:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A43C840754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A43C840754
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A43C840754
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 15:02:23 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4799uo9k027296; Fri, 9 Aug 2024 15:02:19 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40wgx7tk6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Aug 2024 15:02:19 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 479F2HC9021372
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2024 15:02:17 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479F2HVE012696
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Aug 2024 15:02:17 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 30F40100280B;
 Fri,  9 Aug 2024 10:02:17 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 09 Aug 2024 15:02:17 +0000
Message-Id: <D3BGZWZ19TUJ.3MA2J962PXN6E@collins.com>
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240808132318.2473585-1-neal.frager@amd.com>
 <D3ASDF13YKH7.1L058LU6Z9LD5@collins.com>
 <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB50043F73B67812E0158B2C2CF0BA2@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090108
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090109
X-Proofpoint-GUID: xhN3NCUVn3e52YRaPnQPWMTtVatSejyl
X-Proofpoint-ORIG-GUID: xhN3NCUVn3e52YRaPnQPWMTtVatSejyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408090108
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=9lXq5GrFw+IcpT+fnDtPwnZ3KcnJALl/dTBxuB9aDb8=;
 b=h78iuhhuPvSBCk9IFTCd5l/dtMnVCumIDQbETyDwuhnvVezHeix0aE8cU7qxuoixu54v
 A4pu/GypgyG3+aX7cCtxNF1jRp9Y8KcOwfwzuVoQ6bTrXYQ5h1mwvWwFq1V6MwXuDqDi
 6WrXP6pA9FEtzm1HoW5qZSnRQEKJ0EfdCgZXx+z7Lbo9vnDu5OzyWigb9qHGEcNEz8j9
 Mbo4a4E8DdSfdqvVl86Ty3Lqfu++s+AeQyrFglpNitF7gS0JcxMh5iN7HFzjRymhEhQC
 dOG0f0KO8fLPAg4bL4/LLUu2DVw2PYDtDrIqtbhbuDn5Aru5IZEVrvhJN16B4Kc18lQi ZQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=h78iuhhu
Subject: Re: [Buildroot] [PATCH v2 1/1] board/xilinx: bump to linux 6.6.40
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Fri Aug 9, 2024 at 3:52 AM UTC, Frager, Neal via buildroot wrote:
> Hi Brandon,
>
> > This patch bumps all Xilinx board defconfigs to Linux 6.6.40.
> >
> > Xilinx Evaluation Boards:
> > configs/versal_vck190_defconfig
> > configs/versal_vpk180_defconfig
> > configs/zynq_microzed_defconfig
> > configs/zynq_zc702_defconfig
> > configs/zynq_zc706_defconfig
> > configs/zynq_zed_defconfig
> > configs/zynqmp_kria_kd240_defconfig
> > configs/zynqmp_kria_kr260_defconfig
> > configs/zynqmp_kria_kv260_defconfig
> > configs/zynqmp_zcu102_defconfig
> > configs/zynqmp_zcu104_defconfig
> > configs/zynqmp_zcu106_defconfig
>
> > I attempted to boot this patch on a zcu106, but I get no output over the
> > uart port from anything, U-Boot SPL, ATF, etc. So this board may be
> > broken on master.
>
> > Can you verify if it works on your end?
>
> I can help you with this problem.  It is because there are two different
> versions of the zcu106 having different DDR memories.  This is because the
> DDR that came on the revA version of the board became obsolete.
>
> I left the revA device tree in buildroot as I know this is the version of the
> zcu106 that Peter Korsgaard has.  Based on your comment, I believe you have
> the newer version of the zcu106.
>
> To fix this, only the u-boot psu_init_gpl.c needs to be changed, so the
> correct spl psu_init routine will run.
>
> Please implement the following in your zcu106 defconfig:
>
> - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-revA
> + BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=zynqmp-zcu106-rev1.0
>
> This will build in the correct psu_init_gpl.c from the two choices below:
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-rev1.0
> https://github.com/Xilinx/u-boot-xlnx/tree/master/board/xilinx/zynqmp/zynqmp-zcu106-revA
>
> You can read about this issue for the zcu102 and zcu106 here:
> https://support.xilinx.com/s/article/71961?language=en_US

Thank you! Switching to the rev1.0 devicetree does let my board boot.

>
> Do you have any opinions for how this can be better handled in buildroot to
> support both versions of the zcu102 and zcu106?

My preference would be to having two defconfigs, as they are effectively
different boards. But given Thomas would prefer not adding new
defconfigs, documenting it in the defconfig as you did is a good idea.

>
> At the moment, the older version of the zcu106 is supported and the newer
> version of the zcu102 is supported in buildroot natively.

Would it be prudent to default the zcu106 to the newest revision? Is
there any idea of if the zcu106 revA or rev1.0 is more widely used?

>
> In any case, this issue is not related to this patch you have reviewed.

Agreed, I plan to test the vpk180 here then send a reviewed/tested.

Thank you!
Brandon Maier

>
> Best regards,
> Neal Frager
> AMD
>
> >
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> > - Squashed bump of all Xilinx board defconfigs to single patch
> > - Removed linux patch which is no longer necessary
> > ---
> >  board/xilinx/patches/linux/linux.hash | 1 +
> >  configs/versal_vck190_defconfig       | 2 +-
> >  configs/versal_vpk180_defconfig       | 2 +-
> >  configs/zynq_microzed_defconfig       | 2 +-
> >  configs/zynq_zc702_defconfig          | 2 +-
> >  configs/zynq_zc706_defconfig          | 2 +-
> >  configs/zynq_zed_defconfig            | 2 +-
> >  configs/zynqmp_kria_kd240_defconfig   | 2 +-
> >  configs/zynqmp_kria_kr260_defconfig   | 2 +-
> >  configs/zynqmp_kria_kv260_defconfig   | 2 +-
> >  configs/zynqmp_zcu102_defconfig       | 2 +-
> >  configs/zynqmp_zcu104_defconfig       | 2 +-
> >  configs/zynqmp_zcu106_defconfig       | 2 +-
> >  13 files changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
> > index d85f773478..11f4dca651 100644
> > --- a/board/xilinx/patches/linux/linux.hash
> > +++ b/board/xilinx/patches/linux/linux.hash
> > @@ -1,2 +1,3 @@
> >  # Locally calculated
> >  sha256  ea85988e66b9a2e19ccd76d0f5f5e657988a873fed292160917712f45605a805  xlnx_rebase_v6.6_LTS_2024.1.tar.gz
> > +sha256  6415cfcfd74e943d6ae44f6c1edcae09bf6cd89410b03c4290bf1464a8368f84  xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz
> > diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> > index 21dfe2577a..58479c9f2d 100644
> > --- a/configs/versal_vck190_defconfig
> > +++ b/configs/versal_vck190_defconfig
> > @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
> > diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> > index 253a6d2cff..4d3afc0e98 100644
> > --- a/configs/versal_vpk180_defconfig
> > +++ b/configs/versal_vpk180_defconfig
> > @@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vpk180-revA"
> > diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> > index f955a0c4ad..71a5d880b3 100644
> > --- a/configs/zynq_microzed_defconfig
> > +++ b/configs/zynq_microzed_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynq_zc702_defconfig b/configs/zynq_zc702_defconfig
> > index 75ebc2a3ba..f3fc32145b 100644
> > --- a/configs/zynq_zc702_defconfig
> > +++ b/configs/zynq_zc702_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> > index ce539eefaf..f1c9bd6622 100644
> > --- a/configs/zynq_zc706_defconfig
> > +++ b/configs/zynq_zc706_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> > index 925faeac8e..cada3bbd47 100644
> > --- a/configs/zynq_zed_defconfig
> > +++ b/configs/zynq_zed_defconfig
> > @@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> >  BR2_LINUX_KERNEL_UIMAGE=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> > diff --git a/configs/zynqmp_kria_kd240_defconfig b/configs/zynqmp_kria_kd240_defconfig
> > index dff49b9837..262e80a145 100644
> > --- a/configs/zynqmp_kria_kd240_defconfig
> > +++ b/configs/zynqmp_kria_kd240_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k24-revA-sck-kd-g-revA"
> > diff --git a/configs/zynqmp_kria_kr260_defconfig b/configs/zynqmp_kria_kr260_defconfig
> > index 24fdea9c30..65bba693a0 100644
> > --- a/configs/zynqmp_kria_kr260_defconfig
> > +++ b/configs/zynqmp_kria_kr260_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 sda2 ${UBOOT_DIR}"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kr-g-revB"
> > diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
> > index a16da66e38..22df2a4112 100644
> > --- a/configs/zynqmp_kria_kv260_defconfig
> > +++ b/configs/zynqmp_kria_kv260_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS1,115200 mmcblk1p2 ${UBOOT_DIR}"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
> > diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> > index 3f1726a13f..c2feb393de 100644
> > --- a/configs/zynqmp_zcu102_defconfig
> > +++ b/configs/zynqmp_zcu102_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> > diff --git a/configs/zynqmp_zcu104_defconfig b/configs/zynqmp_zcu104_defconfig
> > index b6d943333f..c26210b49c 100644
> > --- a/configs/zynqmp_zcu104_defconfig
> > +++ b/configs/zynqmp_zcu104_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu104-revC"
> > diff --git a/configs/zynqmp_zcu106_defconfig b/configs/zynqmp_zcu106_defconfig
> > index c10ec70ed8..737a8454bb 100644
> > --- a/configs/zynqmp_zcu106_defconfig
> > +++ b/configs/zynqmp_zcu106_defconfig
> > @@ -5,7 +5,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS="ttyPS0,115200 mmcblk0p2"
> >  BR2_LINUX_KERNEL=y
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> > -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_2024.1)/xlnx_rebase_v6.6_LTS_2024.1.tar.gz"
> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.6_LTS_merge_6.6.40)/xlnx_rebase_v6.6_LTS_merge_6.6.40.tar.gz"
> >  BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
