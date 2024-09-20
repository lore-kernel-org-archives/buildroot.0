Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB21CF3974
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708A540015;
	Fri, 20 Sep 2024 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm5TFAmx_qZQ; Fri, 20 Sep 2024 10:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3018F40059
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3018F40059;
	Fri, 20 Sep 2024 10:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDF3D1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC08742AC5
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y09iVcB9GsAP for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=peterlin@andestech.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43E3142AB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E3142AB5
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43E3142AB5
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:17:14 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 48KAH0L0070241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Fri, 20 Sep 2024 18:17:00 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS34.andestech.com (10.0.1.134) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 18:17:01 +0800
Date: Fri, 20 Sep 2024 18:16:10 +0800
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zu1LajtUwyZi8WdK@APC323>
References: <20240910062635.4193650-1-peterlin@andestech.com>
 <20240910062635.4193650-2-peterlin@andestech.com>
 <20240914210030.20a1d5fe@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914210030.20a1d5fe@windsurf>
User-Agent: Mutt/2.2.13 (00d56288) (2024-03-09)
X-Originating-IP: [10.0.12.98]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 48KAH0L0070241
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH v3 1/4] package/andes-spi-burn: new package
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
From: Yu-Chien Peter Lin via buildroot <buildroot@buildroot.org>
Reply-To: Yu-Chien Peter Lin <peterlin@andestech.com>
Cc: tim609@andestech.com, ycliang@andestech.com,
 Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat, Sep 14, 2024 at 09:00:30PM +0200, Thomas Petazzoni wrote:
> [EXTERNAL MAIL]
> 
> Hello,
> 
> On Tue, 10 Sep 2024 14:26:32 +0800
> Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> wrote:
> 
> > Add a new package for Andes AE350 SPI_burn tool to program
> > flash memory.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> 
> Thanks for this new iteration. Unfortunately, there's still something
> that doesn't work. It fails to build for me with:
> 
> /usr/bin/ld: cannot find -lm: No such file or directory
> /usr/bin/ld: cannot find -lc: No such file or directory
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile_SPIburn_linux:25: SPI_burn] Error 1
> 
> that's because you link with -static, and I don't have the static
> version of libc/libm installed on my machine.
> 
> So I wanted to patch that out, but the code is not even in the Github
> repo at https://github.com/andestech/meta-andes/, so I can't create
> a pull request. All you have published is a ZIP file with the source
> code, buried deep inside the meta-andes Yocto layer repository. This
> really isn't nice, and prevents people (like me) from actually
> contributing fixes (like removing this bogus -static flag).
> 
> Could you instead create a proper Github repository for this project,
> so that people can submit fixes, so that you can do tags, releases, etc.

Thank you for the review. I am in the process of creating a
dedicated GitHub repository for SPI_burn and will send PATCHv4
once the logistical issues are resolved.

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 069965680b..aab5a6c05f 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2487,6 +2487,7 @@ N:      Yu Chien Peter Lin <peterlin@andestech.com>
> >  F:   board/andes
> >  F:   configs/andes_ae350_45_defconfig
> >  F:   package/kmon/
> > +F:   package/andes-spi-burn/
> 
> Alphabetic ordering is not correct here.

Will fix, thanks.

Best regards,
Peter Lin

> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
