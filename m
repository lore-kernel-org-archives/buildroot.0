Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87068CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 11:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5F1408C4;
	Tue, 19 Aug 2025 11:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe2PyU4Hxa16; Tue, 19 Aug 2025 11:53:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC064095F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC064095F;
	Tue, 19 Aug 2025 11:53:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE16E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D90405A3
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vygPun0jZ6kV for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 11:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.22;
 helo=mail-24422.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E685F405B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E685F405B0
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch
 [109.224.244.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E685F405B0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:53:07 +0000 (UTC)
Date: Tue, 19 Aug 2025 11:53:00 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Message-ID: <76af3a7b1aade5a457440fa4605712aba391bd90.camel@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 5a25bbaec849c4bc789730248620cbf2dd738b83
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755604384; x=1755863584;
 bh=+TDwBQnfOSSERba8RazF1IkO4V7797382AqALqF9LP0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=RI8Sa+dfTiBdewcRftQDjNPtVP9VlSSf2jqcOgO7JvMjl5rV4xDvlOZFDokpnfcXU
 judvkkihc+Ld00GOqUKd1Z3HIc06zYZydCNa7pdw4dfNMF8iOkkClcUtNIe6o3kpW7
 mn5qPiSzy2+XGRSPZ0XXtlTvEdWCVu3cbjfblzL+q7t/KhrTn57bn0dHrIQ2kz3JcE
 hEV76+6o05yCrNPO4Op5s1107iBrmBzBPJvMSCWmORdnYfcCi5Ww525/e5RJJsewno
 bv1hKQO8OMrLT1Q6gNlkqQQGsGyPoTpQmArZGjgmsxZ4cLc2mHxlZhWD2NO82nnteO
 vqPLeRjsohoqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=RI8Sa+df
Subject: Re: [Buildroot] [PATCH 1/4] package/adsp-ldr: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thanks for the super quick review!

On Monday, August 18th, 2025 at 6:31 PM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> Hello Philip,
>
> Thanks for this contribution! See below some feedback.
>
> On Mon, 18 Aug 2025 14:22:30 +0000
> Philip Molloy philip@philipmolloy.com wrote:
>
> > From: Philip Molloy philip.molloy@analog.com
> >
> > Signed-off-by: Philip Molloy philip.molloy@analog.com
> > Signed-off-by: Philip Molloy philip@philipmolloy.com
> > ---
> > package/Config.in | 1 +
> > package/adsp-ldr/Config.in | 9 +++++++++
> > package/adsp-ldr/adsp-ldr.hash | 3 +++
> > package/adsp-ldr/adsp-ldr.mk | 19 +++++++++++++++++++
> > 4 files changed, 32 insertions(+)
>
>
> I see in PATCH 4/4 you add an entry in the DEVELOPERS file for this
> package. You should squash PATCH 4/4 into this patch, so that the
> addition in DEVELOPERS comes in the patch adding the package.
>
> > diff --git a/package/Config.in b/package/Config.in
> > index 579b5ffc87..63aee051e9 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -470,6 +470,7 @@ endmenu
> > source "package/acpica/Config.in"
> > source "package/acpid/Config.in"
> > source "package/acpitool/Config.in"
> > + source "package/adsp-ldr/Config.in"
>
>
> This will not be needed (see below).
>
> > diff --git a/package/adsp-ldr/Config.in b/package/adsp-ldr/Config.in
> > new file mode 100644
> > index 0000000000..a1806df576
> > --- /dev/null
> > +++ b/package/adsp-ldr/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_ADSP_LDR
> > + bool "adsp-ldr"
> > + depends on BR2_arm || BR2_aarch64
>
>
> This file is not relevant: your package is a host only package. In
> fact, if you enable this option and try to build, you should get a
> failure as your .mk file does not create a target variant of this
> package (which is correct).

Absolutely, renamed it to Config.in.host and updated accordingly. Pushed it, along
with all other changes to the branch linked to in the cover letter.

> > diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
> > new file mode 100644
> > index 0000000000..9fdf3c3c4e
> > --- /dev/null
> > +++ b/package/adsp-ldr/adsp-ldr.mk
> > @@ -0,0 +1,19 @@
> > +################################################################################
> > +#
> > +# adsp-ldr
> > +#
> > +################################################################################
> > +
> > +ADSP_LDR_VERSION = 1.0.0
> > +ADSP_LDR_SITE = $(call github,analogdevicesinc,adsp-ldr,v$(ADSP_LDR_VERSION))
> > +ADSP_LDR_LICENSE = GPL-3.0
> > +ADSP_LDR_LICENSE_FILES = LICENSE
>
>
> Are you sure that this license file is correct? Indeed, all source
> files seem to have a BSD-3-Clause license, for example:
> https://github.com/analogdevicesinc/adsp-ldr/blob/main/src/ldr/lfd.c.

Thanks for noticing this! I'll try to address it in a new release.

See https://github.com/analogdevicesinc/adsp-ldr/issues/6

> > +ADSP_LDR_SUBDIR = src/ldr
> > +
> > +define HOST_ADSP_LDR_INSTALL_CMDS
> > + $(INSTALL) -m 755 -D $(@D)/src/ldr/ldr \
> > + $(TARGET_CROSS)ldr
>
>
> Why do you install it with a $(TARGET_CROSS) prefix?

It is currently required by mainline U-Boot.[1] More context below.

[1]: https://elixir.bootlin.com/u-boot/v2025.07/source/Makefile#L405

> Also, you seem to be the author of this repo. Why is the ldr code
> burried in src/ldr, with not much outside of this folder? It would make
> a lot more sense to have the code directly at the project root, and
> avoid having to pass ADSP_LDR_SUBDIR = src/ldr.

This code is very very old. I was not even able to track down the full history internally at ADI.

The DSP line of processors were (and largely still are) used to run baremetal or FreeRTOS applications, which are developed using a IDE called CCES, which includes a custom toolchain (hence the prefix above). Some DSP processors do not even have ARM cores.

As they began to support Linux with larger ARM cores, the code necessary to generate boot streams was extracted from a CCES related mono repo and copied into the Github repository. That happened a few years ago and was never updated.

So far I've renamed the repo, switched from master to main, merged a "release" branch into main, and created a Github release. But there is still a lot that can be improved.

I have spent some time cleaning things up[2], but I need to refactor it a bit and rebase onto main since merging the release branch. As I'm sure you can imagine, this isn't a high priority. :-P

We are also focusing more on mainline U-Boot and Linux support, but it is naturally a slow process.

[2]: https://github.com/analogdevicesinc/adsp-ldr/pull/1

> Thanks a lot!
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
