Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C727BC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFAD840467;
	Sat, 13 Jul 2024 16:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mqj1seI4oaOG; Sat, 13 Jul 2024 16:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38AC040359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38AC040359;
	Sat, 13 Jul 2024 16:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4C121BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A267160616
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZoawM5tpH6y for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3D5460614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3D5460614
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3D5460614
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:33:45 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46D7RT2J022179; Sat, 13 Jul 2024 16:33:44 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bj602t0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:33:44 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DGXgXo028708
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:33:43 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DGXgC6004000
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 16:33:42 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id E6591ABEE;
 Sat, 13 Jul 2024 11:33:41 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 16:33:41 +0000
Message-Id: <D2OK174T21RK.3UMDWJLPTP3AQ@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713144316.403640-1-arnout@mind.be>
 <20240713144316.403640-2-arnout@mind.be>
In-Reply-To: <20240713144316.403640-2-arnout@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130124
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130124
X-Proofpoint-ORIG-GUID: igYxEzl2ZUv1pnsw364CykQlWKk_HwDp
X-Proofpoint-GUID: igYxEzl2ZUv1pnsw364CykQlWKk_HwDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_13,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130124
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=Z+EEFmoKbTOj+sNGQNiyzxs4BKwEogaxxVwoxqgEmHc=;
 b=U91NprLCr+IHus7CLTYlkIhhcFAB6KHAtqp2fcdTkpsIaMQmTChwFNtCtV8RzCQpjsoT
 j6Epy/N2eI4/FAhEoh3XPDvPpXB7cMM7YVUGNtr8KhmpxxuV4ivCQeD4jewukIZF1nWV
 etM3kPjHYGz1vKo/ZzzbH+xl82H8zzrWBQjblzkiEBMD+Hq5AgsDYjc33q3fmJ7qV3hB
 il+s9CyIh73hwcjlBcdNqHEdF1RM7OvxcVwuB5NVsoRBSG58MFTkB/NZVfzpMwci6N3+
 W+z+1DM2fpUH8uXLZ8vee9t+6HPMKS+czvctfvQHv5Yu9CnRDD76PehkB9xcnxlzFnzU dA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=U91NprLC
Subject: Re: [Buildroot] [PATCH 2/3] utils/docker-run: also mount externals
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Sat Jul 13, 2024 at 2:43 PM UTC, Arnout Vandecappelle via buildroot wrote:
> When building in docker, we may want to include BR2_EXTERNALs that are
> not in the current directory. These need to be mounted into the
> container as well.
>
> There is unfortunately no easy, generic way to find the list of
> externals, except by running `make printvars`, but we'd need to run that
> inside the container with all the command-line overrides set in order to
> be fully correct. That is pretty hopeless, so as an approximation we
> look for `.br2-external.mk` in the current directory.

I have a maybe bad idea. But Buildroot does have a feature where it will
call `make` inside of `make` to set umask and other args, the '_all'
target in '$(TOPDIR)/Makefile'. Could we support all of these features
like this?

    ifeq ($(BR2_ENABLE_DOCKER),y)
    ifeq ($(BR2_SOME_VARIABLE_SET_INSIDE_DOCKER),)
    _all:
        $(TOPDIR)/utils/docker-run umask $(REQ_UMASK) && $(MAKE) ...
    else
    _all:
        ...
    endif

Buildroot has access to the actual BR2_EXTERNAL, OUTPUT_DIR, etc. So it
would be able to call docker-run with the correct arguments. And then it
would work when calling make from $(TOPDIR), or from inside custom
scripts like `brmake`.

Thanks,
Brandon

>
> Clearly this is quite limited because it doesn't support O= or
> BR2_EXTERNAL= passed on the command line. This also means that the first
> time, it doesn't work at all, because .br2-external.mk doesn't exist
> yet. The EXTRA_MOUNTPOINTS feature can be used for that.
>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
> Since this feature is not bulletproof, and EXTRA_MOUNTPOINTS already
> covers the use case, it's perhaps not necessary to include this patch.
> ---
>  utils/docker-run | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 3bb7b6a41b..76fb81b074 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -29,6 +29,19 @@ declare -a mountpoints=(
>      "$(pwd)"
>  )
>
> +# If any externals are defined, mount them as well. We assume that the current
> +# directory is OUTPUT_DIR - ideally we'd parse O= and BR2_EXTERNAL= from the
> +# command line but that's not really feasible in practice.
> +if [ -e '.br2-external.mk' ]; then
> +    mapfile -t mountpoints_external < <(
> +        # We obviously want to quote the make syntax here
> +        # shellcheck disable=SC2016
> +        make -f .br2-external.mk -E \
> +            'default:; @:$(foreach external,$(BR2_EXTERNAL_DIRS),$(info $(external)))'
> +    )
> +    mountpoints+=("${mountpoints_external[@]}")
> +fi
> +
>  # We use the PODMAN_USERNS environment variable rather than using the
>  # --userns command line argument because Fedora system may have the
>  # podman-docker package installed, providing the "docker"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
