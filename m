Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC1C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F352580AC4;
	Tue, 23 Jul 2024 12:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTmE6vsdaBRD; Tue, 23 Jul 2024 12:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0CA280B51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0CA280B51;
	Tue, 23 Jul 2024 12:28:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCB71BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 293F46080C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YI1fUV0xdNQn for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19171607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19171607D5
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19171607D5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:28:01 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46N82SlL027054; Tue, 23 Jul 2024 12:28:01 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40hvs0xu46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2024 12:28:01 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NCRw5l019832
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2024 12:27:59 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46NCRwkh028390
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 23 Jul 2024 12:27:58 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 24A69100269D;
 Tue, 23 Jul 2024 07:27:58 -0500 (CDT)
Mime-Version: 1.0
Date: Tue, 23 Jul 2024 12:27:58 +0000
Message-Id: <D2WX2I1CFMB0.2XW0UB74YZV37@collins.com>
To: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240723095614.993000-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240723095614.993000-1-fontaine.fabrice@gmail.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_01,2024-07-23_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_01,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407230089
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407230089
X-Proofpoint-GUID: gipQc-VlHcNMN0_94BTH0OeVuH_VSQO2
X-Proofpoint-ORIG-GUID: gipQc-VlHcNMN0_94BTH0OeVuH_VSQO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_01,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1011 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407230089
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=UkDENWURbMN4oLNDe+XjjCJNikf377TWOFvWI48aYVs=;
 b=hHV1XJeqbghXaJVQKDfvXk06SdBBJj2sjos/VOlUJGaLslgRQp6BI0OviqakUYsyHXi/
 vhu0m7defO7PbYvU+PIB3kSnoFEWG2EGuJCJBba23l+EKBEQINyYf6xAv1DTpNpXLs+E
 +Y0exqSOXLcyt6SVUTRoSFHpRvtY3xyHa9yi1D1+k+8oBHpuM/ISIXMt+Rz3TQ9OZIXE
 d69fzS8afbqkM+rCdnYpAMPprqcWPiUPpfDJPNs3yS4y+4z60GCA7MOkvPzSgXyglvwX
 M72T26my0c8ECcOkbCEnAJ5FZsb2mxu8othgAQGhqor2QIfrwsp7y8WNHUwjAihwoYp1 6A== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=hHV1XJeq
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: fix zlib build
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

Hi Fabric,

On Tue Jul 23, 2024 at 9:56 AM UTC, Fabrice Fontaine wrote:
> Commit bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f forgot to move
> host-pkgconf dependency from BR2_PACKAGE_MTD_JFFS_UTILS condition to the
> new BR2_PACKAGE_ZLIB condition resulting in the following build failure:
>
> hecking for ZLIB... no
> configure: error: cannot find zlib
>
> Fixes: bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
>  - http://autobuild.buildroot.org/results/7cbeead738af6302d5f0048a443e3b57d6776bb2

Thank you for fixing this!
Brandon Maier

>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mtd/mtd.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index fe40cf6c06..d3444c88f2 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -28,7 +28,7 @@ MTD_CONF_OPTS += --without-lzo
>  endif
>
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -MTD_DEPENDENCIES += zlib
> +MTD_DEPENDENCIES += host-pkgconf zlib
>  MTD_CONF_OPTS += --with-zlib
>  else
>  MTD_CONF_OPTS += --without-zlib
> @@ -37,7 +37,6 @@ endif
>  MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
>
>  ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
> -MTD_DEPENDENCIES += host-pkgconf
>  MTD_CONF_OPTS += --with-jffs
>  else
>  MTD_CONF_OPTS += --without-jffs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
