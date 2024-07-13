Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE674C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4766606D0;
	Sat, 13 Jul 2024 16:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iD6S9ss2f1JI; Sat, 13 Jul 2024 16:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B26B460769
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26B460769;
	Sat, 13 Jul 2024 16:10:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80D841BF3FB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A53040661
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MowrlUEj9Ef0 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:10:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D535B40653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D535B40653
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D535B40653
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:10:31 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46D8sf4P018164; Sat, 13 Jul 2024 16:10:29 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bexvufvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:10:28 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DGARwk001706
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:10:27 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DGAQMH010888
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 16:10:27 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id D506F3001627;
 Sat, 13 Jul 2024 11:10:26 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 16:10:26 +0000
Message-Id: <D2OJJE8XA10T.33AXPFIGRGL3L@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713115244.848755-1-fiona.klute@gmx.de>
In-Reply-To: <20240713115244.848755-1-fiona.klute@gmx.de>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130121
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130121
X-Proofpoint-GUID: 7rwI0XKSsCgLzxZtn-9GuCLEZ21WcHx2
X-Proofpoint-ORIG-GUID: 7rwI0XKSsCgLzxZtn-9GuCLEZ21WcHx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407130121
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=NbNHjkcprPd2Pxm/pzUajco5VzZhFPwKk9uaiJxPNpw=;
 b=PyCXEgDFdC0XZsH7TOUiH5aMyUKz+IIJgjZfqVn2TUoMAwllOFJVhJX5yXiPEBDPsj1L
 5CSKG8slvClKuXaBQ7w1r7R6YU+v4lve6q0zPBWsUmO+P/eKGn+XyVEFXLRieMn0qE5y
 v9QBqFyJifG/Zi3BNnz3VFZKflThQC4eG41MfaRqFCVhhevTtO2JoDpbPQMMeAy656ry
 B+dXrALaUTdRLdVQ3eKtsJF184ptXIXPMY/rYO1wO3526SnScaEkakh/OP5kgjkpKXJ4
 xo4obV5QaEVhVQN0Qy7mLHM+CiaSZqUVigMzeou9O8M8BaeZaZftirtGno6CuDpGaKx7 SQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=PyCXEgDF
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/docker-run: mount and pass
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

On Sat Jul 13, 2024 at 11:52 AM UTC, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
>
>  utils/docker-run | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..8024c2d3a3 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,10 +90,21 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
>
> +if [ -v BR2_EXTERNAL ]; then
> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
> +    for br2_ext in "${br2_ext_arr[@]}"; do
> +        mountpoints+=( "${br2_ext}" )
> +    done
> +    docker_opts+=( --env BR2_EXTERNAL )
> +fi
> +
> +# dir names might contain spaces, so split only on linebreaks for this loop
> +IFS=$'\n'
>  # shellcheck disable=SC2013 # can't use while-read because of the assignment
>  for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do

This will invoke Bash glob on '*', '?', and '[...]'. We can fix that by
parsing the lines with `read -r`, for example

    while IFS=$'\n' read -r dir; do
        docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
    done < <(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u)

Thank you,
Brandon

>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
>  done
> +unset IFS
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
