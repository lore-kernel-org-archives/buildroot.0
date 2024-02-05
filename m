Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A503C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 13:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7FE260E50;
	Mon,  5 Feb 2024 13:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7FE260E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_9hS3xJgVNr; Mon,  5 Feb 2024 13:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1243560BDD;
	Mon,  5 Feb 2024 13:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1243560BDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43DEB1BF40D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA0FA41841
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 13:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0FA41841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvGPQ56wQ3w8 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 13:24:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14E04182F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 13:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14E04182F
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7CD82000D;
 Mon,  5 Feb 2024 13:24:15 +0000 (UTC)
Date: Mon, 5 Feb 2024 14:24:14 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205142414.07741505@windsurf>
In-Reply-To: <20240110215515.1263859-1-fontaine.fabrice@gmail.com>
References: <20240110215515.1263859-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707139456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJRApU+NgsgsG0QJK26OUD0B0W7Bi7igGYIvj4UHpEg=;
 b=ke6MBjASwFh9FXtIiRPPdl8w7t9tNz6NHW/KUfhzcT3uYBY7Et4UgRe4IdWp4PBEP6o381
 V4jFH0Z7fZKYCKBHeIWcQuzwtF7h5tpzFV/6lg8rTi3wn0kTH9RTqb/M0KPySOf9vA4R8A
 woHIeHGZr66jpleIUiqOzzgYDV1dnqiplJ1/xUOlORJ1yTONK2njmZtHgttdFDCwk8ldjV
 xbfds5qH+odmLegYjrEuKGYCu0VIehi+vRPtWM2l3VAfNYyHLMSOmaivvH+MowK6guIeV4
 mEL7sBrKHNQSLDOEQRCd8m4OlhWJz67ZxUhhiFmOsexuZIsgIPcm4fjZPAbujA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ke6MBjAS
Subject: Re: [Buildroot] [PATCH 1/1] package/libzenoh-pico: fix or1k build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alex Michel <alex.michel@wiedemann-group.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Jan 2024 22:55:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with or1k raises since the addition of
> the package in commit a96361901dcc7b962a0c43f163e97a2de65687f3:
> 
> /home/autobuild/autobuild/instance-1/output-1/build/libzenoh-pico-0.10.0-rc/src/link/endpoint.c: Assembler messages:
> /home/autobuild/autobuild/instance-1/output-1/build/libzenoh-pico-0.10.0-rc/src/link/endpoint.c:358: Error: unrecognized instruction `nop'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fd0b2c666a1dc1537162d15b27743abd270243ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-Remove-nop-or-replace-with-macro.patch | 131 ++++++++++++++++++
>  package/libzenoh-pico/libzenoh-pico.mk        |   6 +
>  2 files changed, 137 insertions(+)
>  create mode 100644 package/libzenoh-pico/0001-Remove-nop-or-replace-with-macro.patch

Thanks a lot for this new patch. We discussed it with Arnout, and even
with this upstream patch the whole thing is still very messy. There
seems to be absolutely no reason for upstream to need this ZP_ASM_NOP
macro. So rather than piling bogus things on top of more bogus things,
I went ahead and applied a fix that just disables this package on or1k.
Ideally, we should explain to upstream that these asm("nop") are
useless.

Thanks for your work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
