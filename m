Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7439C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 842D04064C;
	Tue,  9 Aug 2022 11:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 842D04064C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wf_nm84czNlx; Tue,  9 Aug 2022 11:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D0E24097F;
	Tue,  9 Aug 2022 11:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D0E24097F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B05B1BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1EEF404C0
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1EEF404C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXBniNVEPCSK for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0E5E400A6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0E5E400A6
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:42:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE2581C0005;
 Tue,  9 Aug 2022 11:42:01 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:42:00 +0200
To: Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220809134200.66762b0a@windsurf>
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660045322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUHuUXGBeZLoq7SuAyfiOUA1XtqkGveo/EYQYWsj/7M=;
 b=VffDuI9fBQiwfmLxzyFza+6l1QjcibmCcqfP0mzyKnetanU7OT4VIDSncmiVqLxk1P91JG
 OZcTSGdjsOJ0E1OyGB0YxPi7vyUOg8EA/WqBGJxkmqNmweUBHZ1S6II6jhxP8/NxQme8rO
 8g/kNapFoF/gCz4r9OTKKtKTNAaaYVIw1YA29MFXZ2pIDZl1SYJWfch6rKVbqvvlC4JhGB
 4Mix6rlAECHXpMdTGhJ4SOXv/1MYTyGM43pP5Nr6+ueq57NZRqKB0wSeyEW53QaFbFghmJ
 DEIeVxxJcG8eXQga5ZDgjlCk0iL55qNWtHtIqUbMmZh85DDdeBlI+eH5UZmw1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VffDuI9f
Subject: Re: [Buildroot] [PATCH 00/13] package/nodejs: rework cross-building
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
Cc: fontaine.fabrice@gmail.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexandru,

First of all, thanks a lot for your work on NodeJS. It is obviously a
complex package, which has already seen quite a lot of effort, so we
need to be careful when changing it.

On Tue,  9 Aug 2022 10:56:51 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> I tried to build nodejs from Buildroot master, but I couldn't.
> It could be that I did not setup something properly with regards to the
> 'v8-qemu-wrapper' stuff. I kept getting execution errors, when trying to
> run the nodejs build-tools scripts (see details in the patches).
> Either the host-qemu stuff isn't working correctly, or it needs some extra
> setup.

I will give a test to your patch series and report back, but I'm
fearing that PATCH 03/18 will break the build.

> That eventually sent me down the rabbit-hole of trying to get nodejs to
> build for ARM64 (where I wanted it). It seems that nodejs cross-building
> can be done via their own infra-structure, which isn't perfect, but it
> seems usable; and it also looks like a good idea.
> 
> Using their cross-building stuff, has some issues/considerations:
> * it's easiest when building a 32/64-bit target on a (same bit-width) 
>   32/64-bit host; the host-{c-ares,icu,libuv,zlib} tools can be used
>   for nodejs' host tools (in their cross-build infrastructure/tools)
> * when building a 32-bit target on a 64-bit host, the nodejs cross-building
>   logic will add the -m32 CFLAG, which will mean that the
>   host-{c-ares,icu,libuv,zlib} tools will be unusable (they got compiled
>   for 64-bit and are un-linkable to 32-bit binaries)
>   This requires that the user install on their system the
>   host-{c-ares,icu,libuv,zlib} 32 bit versions. I suspect that the
>   BR2_HOSTARCH_NEEDS_IA32_{LIBS,COMPILER} symbols are intented for this
> * I haven't tried to build 64-bit targets on 32-bit hosts, though I'd
>   guess this is a rare corner case.

No, unfortunately it is not. A solution that doesn't support building a
64-bit target on a 32-bit host is not going to be acceptable for
Buildroot at this point I'm afraid.

I will try to have a look in more details, even though I must say I'm
pretty hermetic to the overall NodeJS build system :-/

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
