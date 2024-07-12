Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A440C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 081CD8408D;
	Fri, 12 Jul 2024 19:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqPUQmiJd4Ao; Fri, 12 Jul 2024 19:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 122398418E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122398418E;
	Fri, 12 Jul 2024 19:53:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B9521BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC9B94011D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEy6aYHaVOxz for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B70094000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B70094000B
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B70094000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:53:36 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46CHCmc4009325; Fri, 12 Jul 2024 19:53:34 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40ana82q4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2024 19:53:34 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CJrW3T015291
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2024 19:53:32 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46CJrSnq021507
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 12 Jul 2024 19:53:32 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 7DF2F100276C;
 Fri, 12 Jul 2024 14:53:28 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 12 Jul 2024 19:53:28 +0000
Message-Id: <D2NTNM2UYWN6.3O7CJ5OTL4NDJ@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240710183917.387437-1-fiona.klute@gmx.de>
In-Reply-To: <20240710183917.387437-1-fiona.klute@gmx.de>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407120134
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407120134
X-Proofpoint-ORIG-GUID: geHJl2PIilfxP3jx4PcV0WD34XI27thG
X-Proofpoint-GUID: geHJl2PIilfxP3jx4PcV0WD34XI27thG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407120134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=CRZpgOZ7r4nHKO0F9oqZK+KRxgAbrUWDgJWAjrJz0sw=;
 b=M2TE9HEavo6P8M4K9sNp7F4DKC3HQf/KTV7qUFAySj8saDc5AXR5dMs4Y7lnuFikvYlR
 lCpUcpXqParSsk47dH7dV1oacmkslFse8EXLg2wpgGmbhaomtYqoSty5VSbsfrti4/Np
 hooRKIG4Ik9oFHDCunxCcTsyHWuoV4oN37uztla4Q1bj9WfGX3ihBV0oW/yEYUobl7y3
 EWZ4v0XNRIozIWafuTSRUcfoePcKhBiV7LlXGkZfLd3NMgX8SbXrcowt8+fxrwdjn4sj
 tgfXQwtRJnJ3bbyKFI9hmKN4x7hPFAMpvKuD0pVp0gZhN3QoUvb7kw+1p8ZzxftdmTyM vQ== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=M2TE9HEa
Subject: Re: [Buildroot] [PATCH 1/1] utils/docker-run: mount and pass
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

On Wed Jul 10, 2024 at 6:39 PM UTC, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
>
> Note that splitting multiple paths listed in BR2_EXTERNAL will break
> if any path contains spaces, the added code shares that limitation
> with the existing code in support/scripts/br2-external.

Looking at the git history for br2-external, that limitation was added
in 2016 to accommodate RHEL5. Even Red Hat stopped supporting RHEL5 in
2021. One of the maintaners would know better, but I doubt Buildroot is
still usable on those ancient machines anyway.

Even though Buildroot doesn't support BR2_EXTERNAL's with whitespace. In
this case I think it would be good to handle correctly. As the split
BR2_EXTERNAL are passed to Docker before Buildroot, and a malformed
Docker command can wreck havoc to a machine.

>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  utils/docker-run | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 1adb02d74e..dffe784d13 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
>
> +if [ -v BR2_EXTERNAL ]; then
> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> +        mountpoints+=( "${br2_ext}" )

This doesn't handle git-new-workdir and git-worktree like the $MAIN_DIR
mountpoint does. It would be good to take the git-worktree logic and put
it into a Bash function, so we can use the same code for $MAIN_DIR and
$BR2_EXTERNAL.

Thanks,
Brandon

> +    done
> +    docker_opts+=( --env BR2_EXTERNAL )
> +fi
> +
>  # shellcheck disable=SC2013 # can't use while-read because of the assignment
>  for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
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
