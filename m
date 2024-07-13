Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808AFC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 16:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9B66076B;
	Sat, 13 Jul 2024 16:04:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JU45XG7zl765; Sat, 13 Jul 2024 16:04:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213BF60777
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213BF60777;
	Sat, 13 Jul 2024 16:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A68CE1BF3FB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 923F340975
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 16:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-uxH7Jvqnu5 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 16:04:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F415940974
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F415940974
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F415940974
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 16:04:44 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46DAL487008653; Sat, 13 Jul 2024 16:04:42 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bjb6tp8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:04:41 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DG4eYC006571
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 16:04:40 GMT
Received: from crulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DG4d5O010332
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 16:04:39 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 8DCAD3003AA6;
 Sat, 13 Jul 2024 11:04:39 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 16:04:39 +0000
Message-Id: <D2OJEYNXRO99.3N87ALJ57FWSR@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240710183917.387437-1-fiona.klute@gmx.de>
 <D2NTNM2UYWN6.3O7CJ5OTL4NDJ@collins.com>
 <5cb4f71a-2ea6-47b8-b70b-7b92088c2b21@gmx.de>
In-Reply-To: <5cb4f71a-2ea6-47b8-b70b-7b92088c2b21@gmx.de>
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
 definitions=main-2407130120
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130120
X-Proofpoint-ORIG-GUID: ltGXQvpuChVrpLYpo2P8H78jHa4uRFlX
X-Proofpoint-GUID: ltGXQvpuChVrpLYpo2P8H78jHa4uRFlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=WOkV3MqssCDV1vpkifSU2lXL3oppQ9slt+HIUcLYQVE=;
 b=bbRPptpSoLWxNS6MZiUwpbHG2FJVp+QW37g59lFOjmhskL34CSHdD3LsB6zDjgUu1S8a
 mvUgX9n2IhufqWj7x1iuVnj4kYDYr5xo1OpBFuCVEG4n5mfetAg0/GFEilqh7zTCVXYI
 TWCvpI2Dp3J0GtM9cdX4864XacDHCYDa9Veaw90WnTPmVXEZxfYSOdpmbFE5jB0ylhr6
 AO9bG1x58Wozmw99a6TzbKpk507PXtgkUTcZZRDhnLdM8rvSrjkdqfXIIp4hxmX5jdvw
 WTWlxVemrzlwzHhw6vJ4D0gAEKZ79JeE1kKTrPkzUwSnjkZMACRbXPrlTS+ZIUutWIfs zA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=bbRPptpS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On Sat Jul 13, 2024 at 11:58 AM UTC, Fiona Klute via buildroot wrote:
> Hi Brandon!
>
> Am 12.07.24 um 21:53 schrieb Brandon Maier:
> > Hi Fiona,
> >
> > On Wed Jul 10, 2024 at 6:39 PM UTC, Fiona Klute via buildroot wrote:
> >> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> >>
> >> The BR2_EXTERNAL environment variable is passed into the container,
> >> and each path listed in it mounted. This allows using external trees
> >> when running a build using utils/docker-run. Testing the existence of
> >> the variable instead of a non-empty value allows passing an empty
> >> BR2_EXTERNAL variable to disable currently set external trees.
> >>
> >> Note that splitting multiple paths listed in BR2_EXTERNAL will break
> >> if any path contains spaces, the added code shares that limitation
> >> with the existing code in support/scripts/br2-external.
> >
> > Looking at the git history for br2-external, that limitation was added
> > in 2016 to accommodate RHEL5. Even Red Hat stopped supporting RHEL5 in
> > 2021. One of the maintaners would know better, but I doubt Buildroot is
> > still usable on those ancient machines anyway.
> >
> > Even though Buildroot doesn't support BR2_EXTERNAL's with whitespace. In
> > this case I think it would be good to handle correctly. As the split
> > BR2_EXTERNAL are passed to Docker before Buildroot, and a malformed
> > Docker command can wreck havoc to a machine.
>
> I've sent an updated version that handles spaces. I'm not making any
> promises how much of an actual build will work that way, though.

Thank you!

To clarify I don't think Buildroot will build with spaces in the
BR2_EXTERNAL, there are too many packages that would be broken. So if
the support/scripts/br2-external still doesn't work that is fine. I just
don't want this script to break a space wrong and run a bad Docker
command, as Docker runs as 'root' user.

>
> >> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> >> ---
> >>   utils/docker-run | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/utils/docker-run b/utils/docker-run
> >> index 1adb02d74e..dffe784d13 100755
> >> --- a/utils/docker-run
> >> +++ b/utils/docker-run
> >> @@ -90,6 +90,13 @@ if [ "${BR2_DL_DIR}" ]; then
> >>       docker_opts+=( --env BR2_DL_DIR )
> >>   fi
> >>
> >> +if [ -v BR2_EXTERNAL ]; then
> >> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> >> +        mountpoints+=( "${br2_ext}" )
> >
> > This doesn't handle git-new-workdir and git-worktree like the $MAIN_DIR
> > mountpoint does. It would be good to take the git-worktree logic and put
> > it into a Bash function, so we can use the same code for $MAIN_DIR and
> > $BR2_EXTERNAL.
>
> Probably doable, but I wonder why this would be needed. Sure, I use Git
> for my external trees, but AFAIK Buildroot doesn't have any
> assumptions/expectations of how the sources of an external tree are
> managed. If I'm missing something there that feels like a pretty major
> thing missing from the manual.

It's not officially supported, git worktrees are a way of managing local
git checkouts. For example I keep a single copy of my Buildroot, Linux,
and BR2_EXTERNALS in one directory and use git-worktrees to create
multiple "clones" under different projects directories. This keeps all
the git internals shared and reduces clone time and disk usage.

>
> Or would this be so people can work with Git on their external trees
> within the container if they choose to? In that case I think that could
> be a separate patch, not something that should hold up merging this one.

That is a good point, it's an extra feature on top of supporting
BR2_EXTERNAL. I will send a follow up patch to do this once your work is
merged.

Thank you,
Brandon

>
> Best regards,
> Fiona
>
> >> +    done
> >> +    docker_opts+=( --env BR2_EXTERNAL )
> >> +fi
> >> +
> >>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
> >>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
> >>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> >> --
> >> 2.45.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
