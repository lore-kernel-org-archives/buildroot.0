Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DACC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 534D4404BF;
	Sat, 13 Jul 2024 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVDciKsM0mKO; Sat, 13 Jul 2024 19:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05FE640498
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05FE640498;
	Sat, 13 Jul 2024 19:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B64D51BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A359D80CD1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKw_TCjwgXWw for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:49:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C35B80CAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C35B80CAE
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C35B80CAE
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:49:01 +0000 (UTC)
Received: from pps.filterd (m0346907.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46D9bURg005643; Sat, 13 Jul 2024 19:49:01 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bh643nrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:49:00 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DJmwvC007282
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:48:59 GMT
Received: from crulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DJmwnd028761
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 19:48:58 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr01.rockwellcollins.com (Postfix) with ESMTP id 76E44A6EC;
 Sat, 13 Jul 2024 14:48:58 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 19:48:58 +0000
Message-Id: <D2OO6PNKP35Q.14U0XE937JIFO@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713144316.403640-1-arnout@mind.be>
 <D2OJUFSZ6Y3N.CIWMCVYF7ZFS@collins.com>
 <6fc04f1a-a96e-4cf2-86cf-f9d996330fae@mind.be>
In-Reply-To: <6fc04f1a-a96e-4cf2-86cf-f9d996330fae@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130150
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130151
X-Proofpoint-GUID: 1FwxNr_QJ5r7E5d9P0ePg3LezousnQO1
X-Proofpoint-ORIG-GUID: 1FwxNr_QJ5r7E5d9P0ePg3LezousnQO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_16,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=5C7z8pmTByPrwW48XtMxP+CsSDGCu+2mjBOnFZUsP1E=;
 b=py1W3ffIA92WHghZhXS2WRbL4uPabxTHeDp0OwBwD6IZn0LkNuiaTK1NucH5/XASAbrk
 W3LHPQDlsEprJ+jWL+incmQr4RmaC5fy8ydCc6ut9IBlwNxPhIfDYO3xBH3xRh8YRdA7
 cOFVisE4TWbPMXa6q36zWYefwzj7j/FExdaIo5U3tF9Acw+iDR6jAFwsxj4ITu1duWUu
 7ymfjuJq07aBADdt3jSwenAimoJbYDKQmogiA+IdHSQ78AHMCcmUV19oCjjkd9mavUR0
 RudhFZf998ivCotYGD+X9LiK4xNMH5UXY69ydzJX9F6IxWciC2sTnx7iBloSdUcF3VtS wQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=py1W3ffI
Subject: Re: [Buildroot] [PATCH 1/3] utils/docker-run: allow to specify
 extra mount points to propagate
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
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat Jul 13, 2024 at 4:30 PM UTC, Arnout Vandecappelle via buildroot wrote:
>
>
> On 13/07/2024 18:24, Brandon Maier wrote:
> > Hi Arnout,
> >
> > On Sat Jul 13, 2024 at 2:43 PM UTC, Arnout Vandecappelle via buildroot wrote:
> >> Sometimes, the build needs access to directories which are outside of
> >> the current directory, e.g. for pre-downloaded toolchains, local kernel
> >> sources, OVERRIDE_SRCDIR, BR2_EXTERNALs, ... We need these to be mounted
> >> into the container to be able to perform the build.
> >>
> >> Since there is no generic way to find out all the directories that are
> >> needed, we need a manual mechanism. We choose the environment variable
> >> EXTRA_MOUNTPOINTS which contains a space-separated list of directories
> >> (or files) to mount.
> >>
> >> We choose an environment variable to avoid having to parse command-line
> >> arguments to docker-run.
> >>
> >> Update the terse documentation in utils/readme.txt with this
> >> information.
> >>
> >> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> >> ---
> >>   utils/docker-run | 5 +++++
> >>   utils/readme.txt | 5 ++++-
> >>   2 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/utils/docker-run b/utils/docker-run
> >> index 1adb02d74e..3bb7b6a41b 100755
> >> --- a/utils/docker-run
> >> +++ b/utils/docker-run
> >> @@ -90,6 +90,11 @@ if [ "${BR2_DL_DIR}" ]; then
> >>       docker_opts+=( --env BR2_DL_DIR )
> >>   fi
> >>
> >> +if [ -n "${EXTRA_MOUNTPOINTS:-}" ]; then
> >> +    read -r -a extra_mountpoints <<<"${EXTRA_MOUNTPOINTS}"
> >
> > I think it would be good to use `IFS=:` here and split EXTRA_MOUNTPOINTS
> > on ':'. That would make sure we don't split on other unexpected
> > characters like spaces, tabs, and newlines. And it would be consistent
> > with how BR2_EXTERNAL works.
>
>   Well, there's a bigger chance that a file/directory contains a colon than that
> it contains a newline or tab, so : is not _that_ much better. Between tab and
> space I'd say they are about equally likely.
>
>   However, a path with a space will simply not be supported by Buildroot. So if
> that extra mountpoint has a space and is used for a BR2_EXTERNAL, for a local
> tarball, for an override srcdir, for an output directory, for a host directory,
> for a download directory, or for some more things I'm forgetting, it simply will
> not work.
>
>   On the other hand, a path that has a colon in it _can_ be used for all of
> these things, except for a BR2_EXTERNAL.
>
>   So I'm no fan of using a colon.

Yes that's a good point, it would be preferable to allow any characters
in a mount path, and a colon is probably more common then whitespace.

One thing I also thought of, a colon would be consistent not only with
$BR2_EXTERNAL, but many common env variables use colons to seperate
paths. E.g. $PATH, $LD_LIBRARY_PATH, $MANPATH, etc. I'm assuming that
was why $BR2_EXTERNAL chose to use colons as well.

But this is a policy decision, so whichever one is used the code itself
look good.

Reviewed-by: Brandon Maier <brandon.maier@collins.com>

Thanks,
Brandon

>
>   Yann typically has a useful opinion about this kind of thing, so I'm putting
> him in Cc.
>
>   Regards,
>   Arnout
>
>
> >
> > Thanks,
> > Brandon
> >
> >> +    mountpoints+=( "${extra_mountpoints[@]}" )
> >> +fi
> >> +
> >>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
> >>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
> >>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> >> diff --git a/utils/readme.txt b/utils/readme.txt
> >> index 6488d13c75..0cc665e478 100644
> >> --- a/utils/readme.txt
> >> +++ b/utils/readme.txt
> >> @@ -21,7 +21,10 @@ check-package
> >>   docker-run
> >>       a script that runs a command (like make check-package) inside the
> >>       buildroot CI docker container; pass no command to get an interactive
> >> -    shell.
> >> +    shell. If additional directories need to be accessible inside the
> >> +    container, specify them with the environment variable EXTRA_MOUNTPOINTS.
> >> +    The buildroot directory, the current directory, and the download
> >> +    directory are automatically propagated.
> >>
> >>   genrandconfig
> >>       a script that generates a random configuration, used by the autobuilders
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
