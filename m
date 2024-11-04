Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C433D1BDDB
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 18:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46CD7403A6;
	Mon,  4 Nov 2024 18:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXX9kburbF7Q; Mon,  4 Nov 2024 18:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F206F403B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F206F403B0;
	Mon,  4 Nov 2024 18:18:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 525CC962
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4E9605FE
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7MqVFO0Ergt for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 18:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41ED1605C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41ED1605C4
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41ED1605C4
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:18:40 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4EE4cc021702;
 Mon, 4 Nov 2024 18:18:35 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42ncu5pyun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2024 18:18:35 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.135])
 by xusxph005rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4IIYvp022519
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2024 18:18:34 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 4A4IIXqt011361
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 4 Nov 2024 18:18:34 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 8408D30016B9;
 Mon,  4 Nov 2024 12:18:33 -0600 (CST)
Mime-Version: 1.0
Date: Mon, 04 Nov 2024 18:18:33 +0000
Message-Id: <D5DLNL4HEWDF.2UFA0CCJBT02F@collins.com>
Cc: <luca.ceresoli@bootlin.com>, <ju.o@free.fr>,
 <thomas.petazzoni@bootlin.com>, <romain.naour@smile.fr>,
 <michal.simek@amd.com>, <yann.morin.1998@free.fr>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20241104081453.430619-1-neal.frager@amd.com>
In-Reply-To: <20241104081453.430619-1-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_16,2024-11-04_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_16,2024-11-04_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=942 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040151
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=970 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040150
X-Proofpoint-ORIG-GUID: iMm-2JpmnUjfZa2bc_v-X1WTLC_eq8_y
X-Proofpoint-GUID: iMm-2JpmnUjfZa2bc_v-X1WTLC_eq8_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_16,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2409260000 definitions=main-2411040151
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=Rr7LsGoXUD/Ug4FmSqIx1s3qK8aJFYV+ZjImbhpBiwg=;
 b=HqpFHHU0mPfr1CvIQivYCpp7ecLT3iM28v+xJPXhjllaIUVfYUXjxBgaXqCwbbRp6QRS
 5wx7UBPyt+RtEqGJ6h3xOccP8JExt0OhXF09pW71IDeWtwHiUlU2kIcCLYaCeFOoKuUO
 wb0OUsKrsR9Hw7Dci7Z4vZlpfcI0n4MryJ4wLOwNXHRSPAn3q1Ohds8kO4uQA1goZ4JL
 EO30lGC+JRXDIB9epItjKnQBLx8Rj9OGRWMJtpeRjaKoJDoYzGU+W6z9h5/9Ncfi7jBn
 DS4S0IjzAN23ZHWhfsNYdk58YpMzy86IJ0iiAsng2dDxZDsMbfiJztK8IYz/wseO2fMn 9g== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=HqpFHHU0
Subject: Re: [Buildroot] [PATCH v1 1/2] configs/versal: re-adding
 xilinx-prebuilt version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On Mon Nov 4, 2024 at 8:14 AM UTC, Neal Frager via buildroot wrote:
> The regenerate all defconfigs commit removed the xilinx-prebuilt version from
> the versal defconfigs.  If the version is not defined in the defconfig, then
> it is not possible to change the xilinx-prebuilt default version number
> independently of the board configs.  For this reason, this patch re-adds
> the xilinx-prebuilt version to the versal defconfigs.
>
> Also, the vck190 board name has been added to the versal_vck190_defconfig in
> case the default versal board name ever changes.
>
> https://github.com/buildroot/buildroot/commit/edc0a6b1a43689fb832bc024b5997312e0770e99

This commit refers to the new "Rules for defconfigs"[1]. Those say that
defconfigs should now be formatted by `make savedefconfig`. So setting
these options manually wouldn't be consistent.

Yann had a similar problem for the Linux package which they fixed by
setting the default version to the oldest supported[2]. So we could set
the xilinx-prebuilt default to "xilinx_v2023.1" and then set it
in each config to 2024.1.

I don't know of a solution for the board name, but the default shouldn't
be changing normally.

[1] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
[2] https://github.com/buildroot/buildroot/commit/b2fdc16c47

Thanks,
Brandon Maier

>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/versal_vck190_defconfig | 2 ++
>  configs/versal_vpk180_defconfig | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 697b6c5169..448195d6ac 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -35,7 +35,9 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
>  BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vck190"
>  BR2_PACKAGE_HOST_BOOTGEN=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/versal_vpk180_defconfig b/configs/versal_vpk180_defconfig
> index 9fc694a898..a4a6ed98ff 100644
> --- a/configs/versal_vpk180_defconfig
> +++ b/configs/versal_vpk180_defconfig
> @@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_FORMAT_DTB=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vpk180-revA"
>  BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
>  BR2_TARGET_XILINX_PREBUILT_VERSAL=y
>  BR2_TARGET_XILINX_PREBUILT_BOARD="vpk180"
>  BR2_PACKAGE_HOST_BOOTGEN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
