Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9135AC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42F16404C6;
	Sat, 13 Jul 2024 19:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_zRHJutkdde; Sat, 13 Jul 2024 19:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2B06404C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2B06404C8;
	Sat, 13 Jul 2024 19:39:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 757341BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C717402F4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwVH0t5ipbJw for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17427402CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17427402CD
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17427402CD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:38:59 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DItD3c003640; Sat, 13 Jul 2024 19:38:57 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj603dhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:38:57 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DJcuXx013393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:38:56 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DJcu4e015007
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 19:38:56 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id DC1B83026500;
 Sat, 13 Jul 2024 14:38:55 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 19:38:55 +0000
Message-Id: <D2ONZ0RR73DH.35R00HVJVLPMQ@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713192207.873065-1-fiona.klute@gmx.de>
 <20240713192207.873065-2-fiona.klute@gmx.de>
In-Reply-To: <20240713192207.873065-2-fiona.klute@gmx.de>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130149
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130149
X-Proofpoint-ORIG-GUID: GFrNKpWfWP86pwpCATyiP6SzHY_unVV2
X-Proofpoint-GUID: GFrNKpWfWP86pwpCATyiP6SzHY_unVV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=F+yVyjKSROgeMKEZLYTMPcNRmxjnsD6QPjMH0mZsOPk=;
 b=TrLZLxw9ZAEmT4QkMMCJqtaSRPC6bM3HAlmiXAbB2VM6l7+UYWrra3KwH1M+nuyL5ZdP
 0ZQHVO78KrwhJZqVD39Ti1qdLdBDwyHS3fSj2d8h5AUiKT4tulWQuHMCkfW8z7NSCLa5
 ySsfFprH+3M30Eg86r+tjQ159sfk+aLUKLkE5dyMQrH5JbaXw2hoQxiCFSZRY2tkFw13
 Tdm1lEvI9+1RLM7XYdIaGGpvdV082ETtb7Q1z+i3F5xJuA4Ipsb42uE5+66DyMsJI2qp
 qMikMjy8NL29OtfXRA7/ENiuuRfVxxDMUwdO3WAHtihaPM/Edx/hv09JHSaZ27yriciZ hQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=TrLZLxw9
Subject: Re: [Buildroot] [PATCH v3 2/2] support/scripts/br2-external: allow
 spaces in dirname
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat Jul 13, 2024 at 7:22 PM UTC, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> "make list-defconfigs" and "make nconfig" work in the container used
> by utils/docker-run with external trees with spaces in the directory
> name. Other build steps may or may not work.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
> This is mostly a proof-of-concept to show the previous patch works,
> there might still be things that break in other parts of the build. I
> have not checked if "printf '%q'" works in Bash 3.1 (like a comment
> claims the script needs to support, not sure if still current).
>
> Changes v1 -> v2:
> * Added this patch
>
>  support/scripts/br2-external | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 8aea479d20..b8b6179aa8 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -34,7 +34,8 @@ main() {
>      trap "error 'unexpected error while generating ${ofile}\n'" ERR
>
>      mkdir -p "${outputdir}"
> -    do_validate "${outputdir}" ${@//:/ }
> +    IFS=":" read -r -a br2_extdirs <<< "${@}"
> +    do_validate "${outputdir}" "${br2_extdirs[@]}"
>      do_mk "${outputdir}"
>      do_kconfig "${outputdir}"
>  }
> @@ -144,9 +145,9 @@ do_mk() {
>              eval br2_ver="\"\${BR2_EXT_VERS_${br2_name}}\""
>              printf '\n'
>              printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
> -            printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
> -            printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
> -            printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
> +            printf 'BR2_EXTERNAL_DIRS += %q\n' "${br2_ext}"
> +            printf 'BR2_EXTERNAL_MKS += %q/external.mk\n' "${br2_ext}"
> +            printf 'export BR2_EXTERNAL_%s_PATH = %q\n' "${br2_name}" "${br2_ext}"
>              printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
>              printf 'export BR2_EXTERNAL_%s_VERSION = %s\n' "${br2_name}" "${br2_ver}"
>          done
> --
> 2.45.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
