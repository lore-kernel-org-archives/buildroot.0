Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D94C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BAB2404D8;
	Wed, 12 Jun 2024 19:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd5584hyjvh1; Wed, 12 Jun 2024 19:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEABE404F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEABE404F9;
	Wed, 12 Jun 2024 19:05:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3B431BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B184D60B01
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OP2mo7NR2s_T for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:05:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DDD6960A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD6960A9A
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDD6960A9A
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:05:06 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45CG1SJT007460; Wed, 12 Jun 2024 19:05:02 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yqeu4td53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:05:02 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CJ51cf017491
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2024 19:05:01 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45CJ51pi009271
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 12 Jun 2024 19:05:01 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 0B0493025C15;
 Wed, 12 Jun 2024 14:05:01 -0500 (CDT)
Date: Wed, 12 Jun 2024 19:05:00 +0000
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <ZmnxXLQBdi1E2noi@bspbox.kirk>
Mail-Followup-To: Neal Frager via buildroot <buildroot@buildroot.org>,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
References: <20240612075559.436482-1-neal.frager@amd.com>
 <20240612075559.436482-4-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612075559.436482-4-neal.frager@amd.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=522 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=537
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406120136
X-Proofpoint-GUID: LW8FJKLrVrZCBhgUh6nLYEPdQ24aFABj
X-Proofpoint-ORIG-GUID: LW8FJKLrVrZCBhgUh6nLYEPdQ24aFABj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=586 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2406120136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=POD051818;
 bh=q5mPCOvykMiyGmvXJWxsWH+L57TFQgqRAIAgndOUIZI=;
 b=uMyy87yluIXHAFy+t31ftnvyiUkrrv1sndcKbVoePfma4Zr1QsG7FWnzpWoD2S5IR5Oc
 w63OvUCbVCS+w7pK699BBrz4s3KLn+abLScX69srteTosC+D+5JDgE9CfG5YLvn7/9Vy
 gY06sqCFeKX3Ge2yuDbUB1+UlUB0sbQhIAizBSbewF5FMK6rM90Kz28vqLFJ8Qag/NmH
 E5PISvp/q7dJncqZyBRbyjdQDLafGlm4PRqSY1tUTYk7CQtoJrWfjw0Ms7BAvcCILEkX
 qu0/84VznJGdFc4UDij+6ep70ty1fsbkIEq4WDOLlil6rkCv0YfMtWG8/Je9oYO3KNut Jg== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=uMyy87yl
Subject: Re: [Buildroot] [PATCH v1 4/5] configs/versal_vck190_defconfig:
 migrate to xilinx-prebuilt
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 thomas.petazzoni@bootlin.com, Neal Frager <neal.frager@amd.com>,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024.06.12 08:55, Neal Frager via buildroot wrote:
> Migrate versal_vck190_defconfig to xilinx-prebuilt.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  configs/versal_vck190_defconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
> index 69272e721c..ef5c0a4929 100644
> --- a/configs/versal_vck190_defconfig
> +++ b/configs/versal_vck190_defconfig
> @@ -32,9 +32,10 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
>  BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
>  BR2_TARGET_UBOOT_FORMAT_DTB=y
> -BR2_PACKAGE_VERSAL_FIRMWARE=y
> -BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2024.1"
> -BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
> +BR2_TARGET_XILINX_PREBUILT=y
> +BR2_TARGET_XILINX_PREBUILT_VERSION="xilinx_v2024.1"
> +BR2_TARGET_XILINX_PREBUILT_BOARD="vck190"
> +BR2_TARGET_XILINX_PREBUILT_VERSAL=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> -- 
> 2.25.1

Reviewed-by: Brandon Maier <brandon.maier@collins.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
