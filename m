Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD922C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 551BF40148;
	Sat, 13 Jul 2024 19:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aW0aHsrayidz; Sat, 13 Jul 2024 19:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8A074048B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8A074048B;
	Sat, 13 Jul 2024 19:38:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE331BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22BB481FD9
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dfizNcGFV1m for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 122D880DB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122D880DB9
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 122D880DB9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:38:31 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DEcWkJ002055; Sat, 13 Jul 2024 19:38:29 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bjb6ucmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:38:29 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DJcRjs017362
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:38:28 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DJcRrj006097
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 19:38:27 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 1ECBC3003AA3;
 Sat, 13 Jul 2024 14:38:27 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 19:38:27 +0000
Message-Id: <D2ONYNM0BBJP.3KFQM3V7NIQOO@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713192207.873065-1-fiona.klute@gmx.de>
In-Reply-To: <20240713192207.873065-1-fiona.klute@gmx.de>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130149
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130149
X-Proofpoint-ORIG-GUID: sVoOtyUCR6eKMiAYbDrOY4rJr-7d_K-T
X-Proofpoint-GUID: sVoOtyUCR6eKMiAYbDrOY4rJr-7d_K-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=abGJcOiP/O6Y4KpUm8//vgn9bHFEIAECAvL4yxgusGU=;
 b=LHM2PKcFA5NTLd2EYa+GYFcIhmYid7CYKtfiSdvwXMa7EDAQbbIeVgkouLfZv0NVvgyR
 EYxw8r+ZeJTr6ogG7bh37tNbMoKzC4imTxoOVJ3uj2haDiQHIFObbIzfCM9B06juXMfD
 uCOrbwKyQ8vbUAujtQhlh0GhiDD/GbV15Qj3BbSqlsLsu8ciCgrN0CsszsjaO32V01ye
 aZ51Puqs4p4Ll/cXi2JxK/rI0bFKofsUv+Br2ezc+aMQ6q9HokgAV8Smd52Ei5uxV4Km
 DZIZebJylfue6jQdhpwiCCszGG/prC5BZpE9/XOsPxEpqxY1msjZ8iOdH3wCBdM7I4RJ 0g== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=LHM2PKcF
Subject: Re: [Buildroot] [PATCH v3 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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

Hi Fiona,

On Sat Jul 13, 2024 at 7:22 PM UTC, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

> ---
> Changes v2 -> v3:
> * Use read to make the loop that creates mount options more robust,
>   removing pre-exisiting shellcheck override. Suggested by Brandon
>   Maier.
>
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
>
>  utils/docker-run | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..dbb9c45fdd 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,10 +90,17 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
>
> -# shellcheck disable=SC2013 # can't use while-read because of the assignment
> -for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
> +if [ -v BR2_EXTERNAL ]; then
> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
> +    for br2_ext in "${br2_ext_arr[@]}"; do
> +        mountpoints+=( "${br2_ext}" )
> +    done
> +    docker_opts+=( --env BR2_EXTERNAL )
> +fi
> +
> +while IFS=$'\n' read -r dir; do
>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> -done
> +done < <(printf '%s\n' "${mountpoints[@]}" | LC_ALL=C sort -u)
>
>  if tty -s; then
>      docker_opts+=( -t )
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
