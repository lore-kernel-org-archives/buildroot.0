Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65852C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 13:29:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D076113D
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 13:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23D076113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D684442513;
	Thu, 19 Aug 2021 13:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lc26pEBxrcF; Thu, 19 Aug 2021 13:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5713842515;
	Thu, 19 Aug 2021 13:29:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A0D41BF3CB
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 13:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB81B4250D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 13:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 952aDL6B9apt for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 13:29:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DF01403AC
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 13:29:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EE66BFF804;
 Thu, 19 Aug 2021 13:28:53 +0000 (UTC)
Date: Thu, 19 Aug 2021 15:28:52 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210819152852.760ec08d@windsurf>
In-Reply-To: <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
 <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Herve Codina <herve.codina@bootlin.com>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Thu, 19 Aug 2021 00:24:06 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This waits for you to release new OpenRisc Bootlin toolchain. At 
> Buildroot level all OpenRisc patches we're covered(on gcc 11.1.0 too 
> from yesterday). So with that you should be able to create the new 
> Bootlin OpenRisc Toolchain that will also enable -mcmodel=large for 
> libgeos and protobuf, basically they will be both re-enabled for 
> OpenRisc :-)

ACK, thanks for confirming.

> >>      or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/92c086b0c5c2a298a82a6eb9c289dc53c58a5e5e |  
> > 
> > Top-level parallel build, no idea what the issue is.  
> 
> Can somebody point me some idea on how to approach Top-level parallel 
> build debugging? I also have some udisks package failure due to that.
> I mean, now what I do is ./br_reproduce_build SHA1, then I CTRL-C and:
> # cd SHA1
> # cd output
> # make package-that-fails
> 
> But with Top-level I have more output-x, how can I reissue the command 
> and are there any trick to debug it?

I would go in two steps:

 (1) First see if you can reproduce without top-level parallel build,
     i.e you keep BR2_PER_PACKAGE_DIRECTORIES=y, but you do the build with
     "make". I am pretty sure that 95% of the issues will also be
     reproducible this way, and are more related to per-package
     directories than top-level parallel build.

 (2) If that doesn't allow to reproduce the issue, then you'll want to
     rebuild with "make -jX". However, here it would mean the issue is
     really with parallel build, so it's not because one build succeeds
     that another build won't fail: we might have race conditions that only
     rarely happen, just like the parallel build of individual packages. Of
     course, in principle with per-package directories, we are not supposed
     to have this kind of race conditions, but who knows what unforeseen
     issues still exist?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
