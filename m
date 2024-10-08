Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4C9CEFC54
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B21A6076C;
	Tue,  8 Oct 2024 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6gpA118KOjT; Tue,  8 Oct 2024 20:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A2DB60663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2DB60663;
	Tue,  8 Oct 2024 20:05:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5EC71BF59E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C283780D0E
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOcgcACFTUTO for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE04080D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE04080D03
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE04080D03
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:05:39 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498IiI4h019781;
 Tue, 8 Oct 2024 20:05:38 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 4259gw1n51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Oct 2024 20:05:38 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 498K5amr003771
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 20:05:37 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 498K5aMK006030
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 8 Oct 2024 20:05:36 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id EC1F83000419;
 Tue,  8 Oct 2024 15:05:35 -0500 (CDT)
Mime-Version: 1.0
Date: Tue, 08 Oct 2024 20:05:35 +0000
Message-Id: <D4QP0U338VIW.3VTDL3JMM6ZVZ@collins.com>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
 <20241008-check-package-requirements-v1-2-a137acc133e6@collins.com>
 <a2ed6255-b50f-443c-9125-50ff68a3adc4@mind.be>
In-Reply-To: <a2ed6255-b50f-443c-9125-50ff68a3adc4@mind.be>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_19,2024-10-08_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_19,2024-10-08_01,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080129
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410080129
X-Proofpoint-GUID: mT-8HwbzeYvoywOokiAhrNYOHwSA2XnU
X-Proofpoint-ORIG-GUID: mT-8HwbzeYvoywOokiAhrNYOHwSA2XnU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_19,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 phishscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410080129
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=HDIqlRDSO0eIM1McfWQMy8T/kh7YfX54OQFrSsX9JoE=;
 b=msD6Yy5tvqXx/q5fyxzJts3WWHtGSDjRbv29rCgVKZTF+cHxI/WOGoFrLNLTzwHzx2/G
 j1TvYyGpTi7Wx6+lyRpukog+pE0JxbVIXR15zolSwr6ogyBim0RJDKOSzyjxS4Px/GD0
 bvyxWratbuxxN3cLf9xfKCtfa4bO6BrBo2rwaMsCO3Max/gs8PLwygjjZrU8J/SumTcl
 dfp51J3rm306L0LqAK4k/NT7Eo+WX3MDiuXHu12R7E8ONIn9J0U2NMlG55ixz1JkGH06
 o4S+s0hk3dgtnJ+kBhrnAheVCOa+u29Gsxrn+GZBngKTDDUcMKxWTDw0/UYuNpUiwKOs Uw== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=msD6Yy5t
Subject: Re: [Buildroot] [PATCH 2/3] utils/check-package: add inline script
 requirements
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Tue Oct 8, 2024 at 7:51 PM UTC, Arnout Vandecappelle via buildroot wrote:
>
>
> On 08/10/2024 17:57, Brandon Maier via buildroot wrote:
...
> >
> > diff --git a/utils/check-package b/utils/check-package
> > index 872e66c126b8ec4d5207235d69f0c02ad1757a06..227d9fee8666636e1b0c7e5b3d89015b8e850c51 100755
> > --- a/utils/check-package
> > +++ b/utils/check-package
> > @@ -1,5 +1,12 @@
> >   #!/usr/bin/env python3
> >   # See utils/checkpackagelib/readme.txt before editing this file.
> > +# /// script
> > +# requires-python = ">=3.8"
>
>   Above, you say the minimum Python version is 3.9...

Yeah that was a mistake. I originally had this at 3.8 as it became
end-of-life only recently. I tested with 3.9 and updated the patch
description, but forgot to update it here. Will send a v2

Thanks,
Brandon

>
>   Regards,
>   Arnout
>
> > +# dependencies = [
> > +#     "flake8",
> > +#     "python-magic",
> > +# ]
> > +# ///
> >
> >   import argparse
> >   import inspect
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
