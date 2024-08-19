Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37127C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6BE40263;
	Mon, 19 Aug 2024 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvLhA99FtND8; Mon, 19 Aug 2024 19:41:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A14D040259
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A14D040259;
	Mon, 19 Aug 2024 19:41:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21A371BF355
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1D54025C
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbFALzjSel-6 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 19:41:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0ECE640257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ECE640257
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0ECE640257
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 19:41:11 +0000 (UTC)
Received: from pps.filterd (m0346903.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEqV1V032489;
 Mon, 19 Aug 2024 19:41:07 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 412m96q7cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2024 19:41:07 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47JJf5Fm021580
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2024 19:41:05 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47JJf5K3001774
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 19 Aug 2024 19:41:05 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 30ADE300049F;
 Mon, 19 Aug 2024 14:41:05 -0500 (CDT)
Mime-Version: 1.0
Date: Mon, 19 Aug 2024 19:41:05 +0000
Message-Id: <D3K56TUK6WZB.3US46FGAHBH98@collins.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240815-boot-uboot-clean-for-pmufw-v1-0-3f0d9909c0b4@collins.com>
 <20240815-boot-uboot-clean-for-pmufw-v1-2-3f0d9909c0b4@collins.com>
 <20240819103803.35e5cea1@booty>
In-Reply-To: <20240819103803.35e5cea1@booty>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=734 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190134
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=704 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190134
X-Proofpoint-GUID: zG6y4KjOG03zh_YbCdigkKdWF-ZUZCMU
X-Proofpoint-ORIG-GUID: zG6y4KjOG03zh_YbCdigkKdWF-ZUZCMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=806 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=DhOgW+NLDDAMlIz5eUMHPKle43rBE+ouFebV8fpbzWE=;
 b=m4yCQtrYoYlcwD+hjDzJUmluBp+93lUb8+HkJkikyppxpOKTKpVU3iU2Jmmxl6e89evm
 2/0/4tJ4uO7mzwdv8XzvZhA93MWiofW2HPI7LJkkiplN0D1d6dxySarjfMgMRrVt5WzE
 C/X3rkc4kPJSEowwII2iQ02JPOxhnJ5KIg5v/37TMKvT/cfnUwM7qLG7GD/luJFbYC3Q
 5bBpbqtGo7Zz4KywOanvJM+1ZYYf62hR5ZfuH9xsx+R7otZwooK+mav87dxxFqneoHr9
 Imbos6RrLNvJGKBHMQLUHsnp3X/8SGFmVNhrQkWELoFOPh7XXaP2rdiJFfC2mJNXNgLB lA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=m4yCQtrY
Subject: Re: [Buildroot] [PATCH 2/2] boot/uboot: use $(TARGET_OBJCOPY) for
 ZynqMP pmufw.elf
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
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

On Mon Aug 19, 2024 at 8:38 AM UTC, Luca Ceresoli via buildroot wrote:
> Hello Brandon,
>
> On Thu, 15 Aug 2024 14:22:31 +0000
> Brandon Maier <brandon.maier@collins.com> wrote:
>
> > Converting the pmufw.elf to a binary works with any objcopy, regardless
> > if it's from the host or cross-compiler. Prefer to use the
> > $(TARGET_OBJCOPY) as it's always available and reproducible.
> >
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> > ---
> >  boot/uboot/uboot.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index 9de0776ace..08493996e5 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -463,7 +463,7 @@ endif #BR2_TARGET_UBOOT_ZYNQMP_PMUFW_PREBUILT
> >  ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
> >  UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
> >  define UBOOT_ZYNQMP_PMUFW_CONVERT
> > -	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
> > +	$(TARGET_OBJCOPY) -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
>
> As I wrote earlier today (way after you sent this patch, so surely not
> blaming you!) a short comment would help understand why we are using
> the "wrong" objcopy.
>
> E.g.:
>
>  # objcopy is arch-agnostic so we can use $(TARGET_OBJCOPY) in lack of
>  # a microblaze objcopy

Agreed a comment would be good, I sent a v2 with this change.

Thank you!
Brandon Maier

>
> But this can be added later, or in v2 in case you send one, so:
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
