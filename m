Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A745E6FE3B
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 14:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE64242245;
	Fri, 22 Sep 2023 14:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE64242245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJDYqtg8Cr48; Fri, 22 Sep 2023 14:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87C942241;
	Fri, 22 Sep 2023 14:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87C942241
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF291BF2F0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED50F830C1
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 14:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED50F830C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQwuzvVobQdn for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 14:32:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358DE82F2D
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 14:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 358DE82F2D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94F0060006;
 Fri, 22 Sep 2023 14:32:41 +0000 (UTC)
Date: Fri, 22 Sep 2023 16:32:40 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20230922163240.6e3c1dcd@booty>
In-Reply-To: <20230907105621.205396-1-neal.frager@amd.com>
References: <20230907105621.205396-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695393162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLzjsh8LLyrTdmkaILE2OkZSQoCHdpipceVA9kQ/nmU=;
 b=OyOwcMgg/kOFJv1i+HeN1riHsHDrT504JF5bOSRCMhlOXg1VkELEeK0SZoQZeOQkYsAIME
 1QqIfJs1nLUjqZsmUK9RCnqpm2rnWukYB7IFbuJHWwzDqURAh3LP5U2Mu8VbbBsk7H3a0w
 Uf13tsMlAV0xDOr1Sog/w5WxLMRdjotelWghl6yD1E5CaZzTec652s3IvC4SFvGNhLPBV0
 4GSCe6P3ZhoqdCuOjDXvChr5en8lIksUJTekgEizeIqfwjiTzkxyVWJPy6UeuXARIqL7Fd
 lA4xHcm/47m/2QZtTPLwur3YwgugxLxIcMXYDyx2BVQhcIf29SzCtL3KPG/8xQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OyOwcMgg
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/versal-firmware: use microblaze
 toolchain
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Thu, 7 Sep 2023 11:56:21 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch moves the versal-firmware package from the package directory to the
> boot directory because it is actually boot firmware.

This should be a separate patch. Not only because it is an indipentent
change, but also because the diff is not very useful with the old and
new code spread apart as one set of deleted files and a set of new
files.

> In addition, this patch uses the microblaze bare-metal toolchain from the
> patch set below in order to now build the plm and psmfw applications.
> 
> Microblaze bare-metal toolchain patch set:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=371570

Of course that needs to be applied first. I don't see a problem with
this patch being around before that, however it probably won't attract
much attention at least until the  bare-metal toolchain approach is
accepted (not necessarily the actual patches).

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
