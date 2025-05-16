Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6693CC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 22:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED11B8203E;
	Fri, 16 May 2025 22:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WM-Zk7iIfU0p; Fri, 16 May 2025 22:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18C5381263
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C5381263;
	Fri, 16 May 2025 22:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CBD41137
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B9B64167A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8iijBWneC2H for <buildroot@buildroot.org>;
 Fri, 16 May 2025 22:35:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com;
 envelope-from=prvs=4231729db3=brandon.maier@collins.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BE89416F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE89416F1
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BE89416F1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:35:23 +0000 (UTC)
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GI1HrI024056;
 Fri, 16 May 2025 22:22:01 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 46ngbg9034-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 May 2025 22:22:00 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.135])
 by xusxph008rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GMLvLA014993
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 May 2025 22:21:57 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 54GMLuYn006435
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 May 2025 22:21:57 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 58A5420054A5;
 Fri, 16 May 2025 17:21:56 -0500 (CDT)
Mime-Version: 1.0
Date: Fri, 16 May 2025 22:21:56 +0000
Message-Id: <D9XXP2PTG0P7.3473ZSLMS1WCQ@collins.com>
To: "Heiko Thiery" <heiko.thiery@gmail.com>
Cc: <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20250516115331.4E4478694B@busybox.osuosl.org>
 <CAEyMn7YmLVyM46xBtW+soS82ffcqdH9WaeqOQdexX8B8-QgvFg@mail.gmail.com>
In-Reply-To: <CAEyMn7YmLVyM46xBtW+soS82ffcqdH9WaeqOQdexX8B8-QgvFg@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=766 mlxscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505160219
X-DMZapp-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=838
 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505160218
X-Proofpoint-ORIG-GUID: JcQQnLyNnIHxXuDlVY-UsD42hfMDgJ7L
X-Proofpoint-GUID: JcQQnLyNnIHxXuDlVY-UsD42hfMDgJ7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxOCBTYWx0ZWRfX4pTJYHWNeE+x
 6nSrZLm5T63irmS1kQB6HR9smQp5nHJNASRjg837mLgb3+5vhzRle+J0mVbi22SGtYWDIabfzoW
 +Xd+UzaYDwmMX8NfYN5NzlWQFDuhTIhVnq8TLb8uqGyMIBAfxev5KfC1tb+LfKmWH2GmDeBNSG9
 2yJ/KZLb7xuAJgl8TpeGAsp2eMqTYNeUz+vlzXn0ls9E7ZSBrznF7fG5ZK47Kmn2+b4vth83nlY
 lCbPzToLIiSL0MKzyaXBAQciMyjqoFuM66VcEhvo5/H0J5tpQyLxtVNTjwSur1ewYCa1lcvvr88
 WH/Om7b0ml/KDn56F7gqowyurQUcUnXJCKP6GIzQlHYI8ZuoHAl9XcO8EnsBamSqxQdYhxY83fo
 wGVMLCHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-CPOD-Spam-Details: rule=outbound_default_notspam policy=outbound_default
 score=0 clxscore=1011
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxlogscore=912 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505160218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=fNr1K+JMXdvFbLpFeiDtuBwhaaJJmkQM19zzheNUMe0=;
 b=KL86G8P1Y9W03HBv3sHtD6TkkDos2hZ7PX+taL6EpUke51AmjzwbSku/E4ewfo5xS/WP
 JzMpJC/HIPngKhuIcF4d1vl34nakGZlk8DuZV/quLJS1m3eiuJf3cpua4jexbf5IWroy
 eej2FeP367X+Xl512G6tl2VO4otZgAqnDhmYQskGrFeot1eKwj2fOe72Wh8OOKljn1dP
 WLAkYtDe8cHVEe4Kxz98wMumcW5dazztqYwVAyokP0aCuiKThiPXJsKkR0rgEo26IgSs
 1Z77KW2fWWfkHIQ4OrdolBNSVuFoXb2yOtk3EVf+ueLbZVC4nmdCQusN3b3fvc/C05pc SA== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=KL86G8P1
Subject: Re: [Buildroot] [git commit] package/mtd: update to 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Heiko,

On Fri May 16, 2025 at 7:05 PM UTC, Heiko Thiery wrote:
> I just updated master and built the mtd package.
>
> >>> mtd 2.3.0 Building
> GIT_DIR=.
> PATH="/home/hthiery/sources/mainline/buildroot/output/host/bin:/home/hthiery/sources/mainline/buildroot/output/host/sbin:/home/hthiery/.local/bin:/home/hthiery/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
>  /usr/bin/make -j5  -C
> /home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0/
> make[1]: Entering directory
> '/home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0'
>   CC       lib/execinfo.o
> make[1]: *** No rule to make target
> 'tests/ubifs_tools-tests/images/good.gz', needed by 'all-am'.  Stop.
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory
> '/home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0'
> make: *** [package/pkg-generic.mk:273:
> /home/hthiery/sources/mainline/buildroot/output/build/mtd-2.3.0/.stamp_built]
> Error 2
>
> The failure occurs when enabling the MTD_TESTS option
>
> BR2_PACKAGE_MTD=y
> BR2_PACKAGE_MTD_TESTS=y

I found this bug is reported upstream here with a patch:

https://lore.kernel.org/linux-mtd/20250220112554.2150046-1-m.olbrich@pengutronix.de/

However that patch has not been applied to the upstream mtd-utils git
repo and no new version has been released.

Applying the patch won't fix the build, as the issue is with how the
upstream creates the released tarballs.

I don't see any good way to fix this, so I will send a revert patch.

Thanks,
Brandon

>
>
> BR
> Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
