Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E63EE49A8
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 21:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED6164063C;
	Mon, 21 Aug 2023 21:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6164063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CR5wElrlYkyU; Mon, 21 Aug 2023 21:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53CB94011A;
	Mon, 21 Aug 2023 21:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53CB94011A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7381BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 21:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 803BA60FB9
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 21:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 803BA60FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rrwSb_c6Jlp7 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 21:44:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D131560F13
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 21:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D131560F13
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E7FCE0002;
 Mon, 21 Aug 2023 21:44:02 +0000 (UTC)
Date: Mon, 21 Aug 2023 23:43:59 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230821234359.06008b73@windsurf>
In-Reply-To: <4850715.GXAFRqVoOG@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYjoouGOSwOy1Fh4muYnU3E-yY6jp8GOcy1f=MhCaaAx8w@mail.gmail.com>
 <CAOCHtYiuJimX-pF-hUhuK35X+63eE1GJbK=xAZOR73gb8iZkog@mail.gmail.com>
 <4850715.GXAFRqVoOG@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692654243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqTRaf3mBqO8NFtjoCmmwsKP3wQEna2m7OhS58tjy6k=;
 b=asM74YZw19XZPDArGM9XC3FnF/Jv5bM5wOHavJJbUObiFTZtjGtruwBSBpkQzUsz6Q+Ic1
 2y40AhnnpY6G8sM5EIVl9BZtSXnM9rd8bqaGxT4pWMUGZi1gik8bWCcII1eq73hrmst3A8
 NgTCgi/d6BjCu4Dm6mc3GBg5kF0BSyn8gZ7vRz3I+M3FY8Nm/BzitQa473quaSLhFiuXrd
 EnpGUcHiSWrjejckQrhFXQPRMuCWdxSetaD9JnfuSJqYXF9xxvXt2hsK2uIjgD9m9W1nxj
 tf9NDGoU5xmARCrUHL6s4xn3OHO/SSuDMVAVtIfeTVJVnvN5mwjH5aRacypOEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=asM74YZw
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Robert Nelson <robertcnelson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 18 Aug 2023 19:18:28 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> When buildroot compiles opensbi, I get a lot of "undefined reference to 
> `__stack_chk_guard'" errors. I think that either the necessary "-fno-stack-
> protector" flag is not active during build, or that the toolchain does not 
> provide the necessary functions. I tried adding something similar like this

undefined reference to __stack_chk_guard happens when the code is built
with Stack Smashing Protection enabled, but that doesn't work well for
freestanding code (like bootloader/firmware code), unless it explicitly
provides the runtime code needed to support Stack Smashing Protection.
So indeed to override that, -fno-stack-protector needs to be passed
when building such bootloader/firmware code.

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
