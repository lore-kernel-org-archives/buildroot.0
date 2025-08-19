Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2398ACA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 12:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCF5F808E7;
	Tue, 19 Aug 2025 12:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXSsUpQRBD0K; Tue, 19 Aug 2025 12:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F6A808B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F6A808B1;
	Tue, 19 Aug 2025 12:40:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 783B6E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A5F340A5D
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IOBr08rcFxA for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 12:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7ADD74032D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ADD74032D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7ADD74032D
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 12:40:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2FA2C1A0C6B;
 Tue, 19 Aug 2025 12:40:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 077C660697;
 Tue, 19 Aug 2025 12:40:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5F81D1C22C887; 
 Tue, 19 Aug 2025 14:39:52 +0200 (CEST)
Date: Tue, 19 Aug 2025 14:39:50 +0200
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Message-ID: <20250819143950.0fe69ce0@windsurf>
In-Reply-To: <76af3a7b1aade5a457440fa4605712aba391bd90.camel@philipmolloy.com>
References: <76af3a7b1aade5a457440fa4605712aba391bd90.camel@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755607200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=l5ndMx6FUYXfKI7DbKl8jASypLiDMQaUUn69hiVp6HY=;
 b=yVaQxBGGI1DruNXxw94Smjh/vISWAPxra8SKpczCk3l2ZxCB2wYLM681GpBXUjyHDcvOk4
 mWcA0Ws4ZdpAFjqWO3KRbVMTslJz/VQ+LhPnIfYfcDAPQ1C94QM/09pqsNeAwG3GhsPMuu
 Wyx0saUwCsTDNAA2XsSVCoUdozTxWmlKI6ZTKyURhjTwRvu+iHDWS+6bo4uqWmAIKcUgbv
 Evm43a4QNE0rQ2VIHfY4dqn0GBhDYnlv9Y4gxWUczao7cXkHTPQsQbCXlTPvQ88h/sPLyL
 vxSNhlR4y/VP2bVn3lD+Fn6vmbysCyyoldcJrFTpCgsFEiDfvc/oDg8xwSJlaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yVaQxBGG
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Philip,

On Tue, 19 Aug 2025 11:53:00 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> Absolutely, renamed it to Config.in.host and updated accordingly. Pushed it, along
> with all other changes to the branch linked to in the cover letter.

You don't need a Config.in.host file. This tool is merely a build
dependency for U-Boot to do its job, so it's sufficient to have U-Boot
add host-adsp-ldr to UBOOT_DEPENDENCIES. No need for a Config.in.host.

> > Are you sure that this license file is correct? Indeed, all source
> > files seem to have a BSD-3-Clause license, for example:
> > https://github.com/analogdevicesinc/adsp-ldr/blob/main/src/ldr/lfd.c.  
> 
> Thanks for noticing this! I'll try to address it in a new release.

But in the mean time? You'll set ADSP_LDR_LICENSE to BSD-3-Clause and
use one of the source files as a license file?

> > Why do you install it with a $(TARGET_CROSS) prefix?  
> 
> It is currently required by mainline U-Boot.[1] More context below.
> 
> [1]: https://elixir.bootlin.com/u-boot/v2025.07/source/Makefile#L405

OK, understood. Then probably a comment in the .mk file makes sense.

> > Also, you seem to be the author of this repo. Why is the ldr code
> > burried in src/ldr, with not much outside of this folder? It would make
> > a lot more sense to have the code directly at the project root, and
> > avoid having to pass ADSP_LDR_SUBDIR = src/ldr.  
> 
> This code is very very old. I was not even able to track down the
> full history internally at ADI.
> 
> The DSP line of processors were (and largely still are) used to run
> baremetal or FreeRTOS applications, which are developed using a IDE
> called CCES, which includes a custom toolchain (hence the prefix
> above). Some DSP processors do not even have ARM cores.
> 
> As they began to support Linux with larger ARM cores, the code
> necessary to generate boot streams was extracted from a CCES related
> mono repo and copied into the Github repository. That happened a few
> years ago and was never updated.
> 
> So far I've renamed the repo, switched from master to main, merged a
> "release" branch into main, and created a Github release. But there
> is still a lot that can be improved.
> 
> I have spent some time cleaning things up[2], but I need to refactor
> it a bit and rebase onto main since merging the release branch. As
> I'm sure you can imagine, this isn't a high priority. :-P

I can understand all of that, but I don't quite understand why all this
history implies that the code should be buried in a sub-subdir of a
brand new Git repo that otherwise doesn't contain anything else?

Basically, just recreate your Git repo with the contents of src/ldr/,
but directly at the root of your repo, and work from there.

> We are also focusing more on mainline U-Boot and Linux support, but
> it is naturally a slow process.

Nice!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
