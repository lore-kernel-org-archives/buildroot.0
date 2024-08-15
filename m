Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E251C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 13:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADE140248;
	Thu, 15 Aug 2024 13:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jl9cU4Hg-VW; Thu, 15 Aug 2024 13:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CB94074B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CB94074B;
	Thu, 15 Aug 2024 13:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 548BC1BF2A2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A7B4074B
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 13:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbhsgvB-C9Kt for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 13:58:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 020B340248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020B340248
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 020B340248
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 13:58:13 +0000 (UTC)
Received: from pps.filterd (m0346909.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 47F65ANq005222; Thu, 15 Aug 2024 13:58:10 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 410qr75smm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 13:58:09 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 47FDw86u001874
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2024 13:58:09 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph009rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 47FDw7UM021058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 15 Aug 2024 13:58:08 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id DF56B3000440;
 Thu, 15 Aug 2024 08:58:07 -0500 (CDT)
Mime-Version: 1.0
Date: Thu, 15 Aug 2024 13:58:07 +0000
Message-Id: <D3GJE2B5H120.3AGKGHGRX6YB@collins.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Brandon Maier via
 buildroot" <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240809-boot-uboot-fix-dependency-on-xilinx-prebuilt-v1-1-7014697db0c6@collins.com>
 <20240815111415.25844e3a@windsurf>
In-Reply-To: <20240815111415.25844e3a@windsurf>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=968 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 mlxlogscore=951 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150101
X-Proofpoint-ORIG-GUID: 3AW_2EthxBaC9-askrgK02QAIMq9D-aM
X-Proofpoint-GUID: 3AW_2EthxBaC9-askrgK02QAIMq9D-aM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_06,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408150101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=POD051818;
 bh=FwCQLEpbfnTMEz7UoDupdCUr34Gk6q+fL0OtvPbaKq0=;
 b=TzLOLBuq563ZcRQQnF/U2zExm+IY1RfJHo/pk2ELKFCz1gw2Y12ppW7ojtW10zpDOUD9
 Hfun/6TXpwvu6QhZkgk6RpgZ6CYC4fjnxYcv5djXZZAHNzRn8KLj+vp04cwsWW2SHOZC
 81cGCHhL4oMisi4MCrIp3bOkZrJO/Adg1u4u0z39vJZSN8kPJE1rGAzUxZEvZwfyuXjs
 uyRRjP4mCG9Tp7skBqVTJzi9pndxiqaeXMBxR08cs+J+mpm4u7P3etKWNKYGNGwQXDMj
 rlxUP7ZJOn2KBDyYVeK3AwkUtNtqKf+vgXzUPbvZD4QRqvfb6TUd+npnhQeUiAAyymdZ ew== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=TzLOLBuq
Subject: Re: [Buildroot] [PATCH] boot/uboot: fix dependency on
 xilinx-prebuilt
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Thu Aug 15, 2024 at 9:14 AM UTC, Thomas Petazzoni via buildroot wrote:
> Hello Brandon,
>
> On Fri, 09 Aug 2024 16:30:18 +0000
> Brandon Maier via buildroot <buildroot@buildroot.org> wrote:
>
> > When building with `make -j` and PER_PACKAGE_DIRECTORIES, a race
> > condition occurs between xilinx-prebuilt and u-boot, resulting in the
> > following error.
> >
> >   objcopy -O binary -I elf32-little .../images/pmufw.elf .../images/pmufw.bin
> >   objcopy: '.../images/pmufw.elf': No such file
> >
> > U-Boot registers a KCONFIG_FIXUP_CMD that uses the pmufw.elf from
> > xilinx-prebuilt. But KCONFIG_FIXUP_CMDS does not use the normal
> > DEPENDENCIES, so xilinx-prebuilt is not guaranteed to have run before
> > fixup.
> >
> > Instead move the `objcopy` call out to a PRE_BUILD_HOOK so it will run
> > after xilinx-prebuilt has finished.
> >
> > Signed-off-by: Brandon Maier <brandon.maier@collins.com>
>
> Thanks for fixing this, I have applied to master. I have a few
> questions/suggestions below.
>
> > +ifeq ($(suffix $(UBOOT_ZYNQMP_PMUFW_PATH)),.elf)
> > +UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(basename $(UBOOT_ZYNQMP_PMUFW_PATH)).bin
> > +define UBOOT_ZYNQMP_PMUFW_CONVERT
> > +	objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_PATH) $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)
>
> Should we be using $(TARGET_OBJCOPY) instead of objcopy to use the
> target toolchain objcopy?

I'm not certain, as Neal pointed out the PMU.elf is a microblaze. I'm
guessing this works today as `objcopy` probably doesn't need to support
the target architecture to convert an ELF to a binary.

If that is true, then maybe we should use $(TARGET_OBJCOPY) anyway. So
we aren't relying on the build system's version of `objcopy`.

>
> > +endef
> > +UBOOT_PRE_BUILD_HOOKS += UBOOT_ZYNQMP_PMUFW_CONVERT
> > +else
> > +UBOOT_ZYNQMP_PMUFW_PATH_FINAL = $(UBOOT_ZYNQMP_PMUFW_PATH)
> > +endif
> >  define UBOOT_ZYNQMP_KCONFIG_PMUFW
> > -	$(if $(filter %.elf,$(UBOOT_ZYNQMP_PMUFW_PATH)),
> > -		objcopy -O binary -I elf32-little $(UBOOT_ZYNQMP_PMUFW_BASENAME).elf $(UBOOT_ZYNQMP_PMUFW_BASENAME).bin
> > -		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_BASENAME).bin"),
> > -		$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)"))
> > +	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH_FINAL)")
>
> This means this KCONFIG_SET_OPT is not unconditionally if I'm not
> wrong (so even on platforms that are not Xilinx ones). Shouldn't it
> only be done if $(UBOOT_ZYNQMP_PMUFW_PATH_FINAL) is not empty?

This whole section is inside a `ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)`
block, so it will only run on Xilinx ZynqMP platforms. However it's
possible to set the PMUFW to an empty string and then it will set
CONFIG_PMUFW_INIT_FILE to an empty string.

If a developer set CONFIG_PMUFW_INIT_FILE in a custom U-Boot defconfig
or frag, then this could overwrite it. Though I'm not sure if there's
any practical use-case where this is an issue.

I can send a patch to add the empty string check though, it seems
harmless to add.

Thanks,
Brandon Maier

>
> Best regards,
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
