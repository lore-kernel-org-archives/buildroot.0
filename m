Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929BBCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 16:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F40810FC;
	Tue, 19 Aug 2025 16:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUYwQwbhRZ2f; Tue, 19 Aug 2025 16:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47733810F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47733810F9;
	Tue, 19 Aug 2025 16:22:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB27E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CEA04077F
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtjTkrClk-_6 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 16:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE6AF4002B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE6AF4002B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE6AF4002B
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 16:22:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CDA8A1A0718;
 Tue, 19 Aug 2025 16:22:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A7AD760697;
 Tue, 19 Aug 2025 16:22:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3689D1C22C587; 
 Tue, 19 Aug 2025 18:21:53 +0200 (CEST)
Date: Tue, 19 Aug 2025 18:21:47 +0200
To: Philip Molloy <philip@philipmolloy.com>
Cc: buildroot@buildroot.org, Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>
Message-ID: <20250819182147.7327c8a7@windsurf>
In-Reply-To: <cad96fd9e7449c747de6e6f0613f24fc37f285cf.camel@philipmolloy.com>
References: <76af3a7b1aade5a457440fa4605712aba391bd90.camel@philipmolloy.com>
 <20250819143950.0fe69ce0@windsurf>
 <cad96fd9e7449c747de6e6f0613f24fc37f285cf.camel@philipmolloy.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755620522; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LUmmuB79p1zgK6ybXeHhS0EXPkEXIWa4w/Q+72odcp4=;
 b=xH5mO4xEscnvz+YL8ubKEum2xYb3O5FNPIB9mciLppAmPpLq04Ye0xLfHNdEhGCO3xFnnU
 9Wp/I4qQJbL1hgUO8lYg3ZqkV9I+R3stSyL1RzGJWFe4vyVc3KQTdFdbZ7+jLXJdiWyf3o
 OgYn2IN7b5lFDtydfFOU/IlWX8umXem0WOkhQPjdUleKbOlLY29ddeMXQHA+t913uxzB9F
 6uk3wowPgZWklpZ4pQ2fn821xmtyEEx1KNTqU4cFXDpyGmegMHtquPqVU3vEdj9lLeMrb0
 d3PIcUEuHY9Cypk55mUOL6ZcZeYjesZrNYYz5vZh+2Jsbyu4i/X7CZMe2oAc7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xH5mO4xE
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

On Tue, 19 Aug 2025 16:00:43 +0000
Philip Molloy <philip@philipmolloy.com> wrote:

> ldr basically just generates a header describing data to be loaded and
> executed by the boot ROM. That data could be U-Boot SPL, U-Boot Proper,
> ATF, Linux, FreeRTOS or a baremetal application, for the ARM Cortex or
> ADI SHARC DSP cores.
> 
> I don't mind dropping it, but it is much more than just a U-Boot
> dependency. Perhaps more context in the Config.in.host description
> would help?

OK, fine for keeping a Config.in.host then. Thanks for the
clarifications.

> src/ldr/COPYING originally contained GPL v2. It was then moved to
> LICENSE in the project root. Then around 9/2022 LICENSE was updated to
> GPL v3.
> 
> I'm checking internally, but I assume at this point we'll change
> everything to GPL v2 in a new release. If so, then I'll just bump the
> version and update the package mk file accordingly in v2 of this
> series.

Sounds good.

> The git repo is at least 3 years old. The repo has been in use by the
> ADI Yocto layer since at least May, 2022.[1] All of the commits
> currently on main (which I recently merged without making any changes)
> have been in use since October, 2022.[2]

OK, so I guess we have to live with its odd organization. Fair enough :)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
