Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77689C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D5A540148;
	Sat, 13 Jul 2024 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktBi3J-71ElR; Sat, 13 Jul 2024 19:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE07F4048B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE07F4048B;
	Sat, 13 Jul 2024 19:40:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBBFF1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D51A74133D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJrL-KAwcFWb for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:40:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 946EA41333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946EA41333
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 946EA41333
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:40:48 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46D9ahO8006507; Sat, 13 Jul 2024 19:40:46 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40bg03uv7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:40:45 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46DJehxv007594
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Jul 2024 19:40:44 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46DJeh9a016884
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 13 Jul 2024 19:40:43 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 7144F3003B7C;
 Sat, 13 Jul 2024 14:40:43 -0500 (CDT)
Mime-Version: 1.0
Date: Sat, 13 Jul 2024 19:40:43 +0000
Message-Id: <D2OO0E8B7PKP.3RF4615R38P4G@collins.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240713115244.848755-1-fiona.klute@gmx.de>
 <D2OJJE8XA10T.33AXPFIGRGL3L@collins.com>
 <0607bf8d-1064-4b24-8a90-0bcd6e310b13@gmx.de>
In-Reply-To: <0607bf8d-1064-4b24-8a90-0bcd6e310b13@gmx.de>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407130150
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407130149
X-Proofpoint-GUID: W2tNqBoirYjdNVkECRB5EKFJtY0C_JiU
X-Proofpoint-ORIG-GUID: W2tNqBoirYjdNVkECRB5EKFJtY0C_JiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2407130149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=bL0vvMqrlch0Dr7gCh8fYur4D+BrJ3HYkd5lsgs7RDQ=;
 b=gZKonpGrCZ6AwiceGyhctqrBpLbRRZn5Iz7mxZ68mwxHVJCp3eX5+h5MkOlMv+HmVGKt
 bek+AyTWV2oMad6eRivSZUyvLaz9QfTiD9eETZZnjr3VFWemBxC8HtzqyRBzqNNwtCD0
 62gFCXWHrY+XaKwNkYAVv0M9y+9N4xZ8gH/YUULJXlErKK0dna8Xm63xCOAHJ0qQkCr4
 74SdJEa0yPXNTQOIoC2l6OHE2KpcrfM160q3xQ8EP9muFRqABuYSplOJicsLjwqZRy93
 53vmgexQzNXgF4g5Vqmh8AHRfKHCy5Aim1/6rUgYAMbi45aAvTuo/7daDilpVuxhlhVq ig== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=gZKonpGr
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat Jul 13, 2024 at 7:26 PM UTC, Fiona Klute via buildroot wrote:
> Am 13.07.24 um 18:10 schrieb Brandon Maier:
> > Hi Fiona,
> >
> > On Sat Jul 13, 2024 at 11:52 AM UTC, Fiona Klute via buildroot wrote:
> >> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> >>
> >> The BR2_EXTERNAL environment variable is passed into the container,
> >> and each path listed in it mounted. This allows using external trees
> >> when running a build using utils/docker-run. Testing the existence of
> >> the variable instead of a non-empty value allows passing an empty
> >> BR2_EXTERNAL variable to disable currently set external trees.
> >>
> >> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> >> ---
> >> Changes v1 -> v2:
> >> * Correctly handle spaces in external tree paths
> >>
> >>   utils/docker-run | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/utils/docker-run b/utils/docker-run
> >> index 1adb02d74e..8024c2d3a3 100755
> >> --- a/utils/docker-run
> >> +++ b/utils/docker-run
> >> @@ -90,10 +90,21 @@ if [ "${BR2_DL_DIR}" ]; then
> >>       docker_opts+=( --env BR2_DL_DIR )
> >>   fi
> >>
> >> +if [ -v BR2_EXTERNAL ]; then
> >> +    IFS=":" read -r -a br2_ext_arr <<< "${BR2_EXTERNAL}"
> >> +    for br2_ext in "${br2_ext_arr[@]}"; do
> >> +        mountpoints+=( "${br2_ext}" )
> >> +    done
> >> +    docker_opts+=( --env BR2_EXTERNAL )
> >> +fi
> >> +
> >> +# dir names might contain spaces, so split only on linebreaks for this loop
> >> +IFS=$'\n'
> >>   # shellcheck disable=SC2013 # can't use while-read because of the assignment
> >>   for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
> >
> > This will invoke Bash glob on '*', '?', and '[...]'. We can fix that by
> > parsing the lines with `read -r`, for example
> >
> >      while IFS=$'\n' read -r dir; do
> >          docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> >      done < <(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u)
>
> Good point, thanks. I've added that in v3.
>
> And I just realized I forgot to add your Reviewed-by to patch 2 during
> respin, should I do another one or is it easier to add that on merge?

That's fine, I sent another reviewed-by so the maintainer can grab it on
merge

Thanks for adding the externals support!
Brandon

>
> Best regards,
> Fiona
>
> >>       docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> >>   done
> >> +unset IFS
> >>
> >>   if tty -s; then
> >>       docker_opts+=( -t )
> >> --
> >> 2.45.2
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
