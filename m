Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1512CC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 21:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4DB0406A4;
	Wed, 24 Jul 2024 21:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvUe-RXydD65; Wed, 24 Jul 2024 21:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DD32406AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD32406AA;
	Wed, 24 Jul 2024 21:26:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13FD71BF277
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1113E80F88
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 21:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acviukw_0-9P for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 21:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E401980F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E401980F4B
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E401980F4B
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 21:26:06 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46OKEflN031248; Wed, 24 Jul 2024 21:26:04 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40k4mr459r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:26:04 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46OLQ3PA028371
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2024 21:26:03 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46OLQ3dN002323
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 24 Jul 2024 21:26:03 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id ECDD610136A7;
 Wed, 24 Jul 2024 16:26:02 -0500 (CDT)
Mime-Version: 1.0
Date: Wed, 24 Jul 2024 21:26:02 +0000
Message-Id: <D2Y3513NMO2J.37L0NUZM5OD55@collins.com>
To: "Bryan Brattlof" <bb@ti.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240626-gitignore-output-new-v4-1-fcb3ebc263ca@collins.com>
 <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
In-Reply-To: <20240722234911.2u4obhhk6srzomsr@bryanbrattlof.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407240152
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407240152
X-Proofpoint-GUID: 6R2vpp__wrRJlL9Tt0H78DjMQMDeJqLB
X-Proofpoint-ORIG-GUID: 6R2vpp__wrRJlL9Tt0H78DjMQMDeJqLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_24,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2407110000 definitions=main-2407240152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=MWhM9cCyl3iFzR6JQjWw7L0UK7u+fUp6hWogI9yIyI4=;
 b=tCB1dviBtnJYyqFTy7F02XM4D2IOQK2qgRCQUz9FO8IMOu/4Tp95gmxGQMHO9jdvYoqh
 iTDA9snRLcjZGDdOBQtEApeIS7oeBgySlcfhRcYsqGPlMwjPpNxSWy1K+OLSVSqdHEtr
 tmU+HVGl0P6b/yAAm4bzWYHLNi4wnqT93sRH+7c6ERLjcB1ixnINdElfR5dZu+aWZstK
 EEssIm79Gk1vJUaSkz1wTyiEc9ZZc1Ij9dDK+cDn7mHIiCe7QSlkh0j5BPvC4Co7db45
 KV063wV66tdsBcn6RCqzFoHXrhL8SGcNGBA6nlde6u/LddYU3uNE2Hywoo0HHbD2OQnw fQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=tCB1dviB
Subject: Re: [Buildroot] [PATCH v4] Create a .gitignore file in the
 CANONICAL_O directory
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

On Mon Jul 22, 2024 at 11:49 PM UTC, Bryan Brattlof via buildroot wrote:
> Hello everyone!
>
> On June 26, 2024 thus sayeth Brandon Maier via buildroot:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > This .gitignore file ignores all files in an output directory and
> > hence doesn't change the git status.
> >
> > Remove "/output" entry from the main .gitignore file as it is already
> > handled by this general approach.
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> > This is a resend of the v1 of this patch from Yegor Yefremov, as the
> > original patch series seems to have stalled.
> >
> > I'm not familiar with the process for resending someone else's patches,
> > so let me know if I should redo anything.
> >
> > I find having the output folders gitignore'd is useful as some newer
> > tools like fd-find and ripgrep will automatically respect gitignore.
> > Otherwise the output directories are huge and quick searches can
> > suddenly take a long time if I have created a few.
> > ---
>
> For some odd reason this seems to have broken
> python-jsonschema-specifications in a fairly weird way that I'm not
> fully sure I understand.
>
> Somehow when downloading the source with this patch applied the build
> will succeed but it will never be installed in the host directory.
> Reverting this patch and deleting the package in the dl/ directory fixes
> everything. (at least for TI's reference boards)
>
> I'll continue to look into this, just wanted to start the thread just in
> the off chance someone else is doing the same :)

Thanks for spotting this. I did some test builds locally and can
reproduce the issue.

I tried various different gitignore patterns, but haven't found one that
unbreaks python-jsonschema-specifications. To get this package back to a
working state I sent a new patch to revert the gitignore change.

Thanks!
Brandon

>
> ~Bryan
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
