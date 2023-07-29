Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B12BC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D84CB40974;
	Sat, 29 Jul 2023 21:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84CB40974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwa5ZU3xn_dW; Sat, 29 Jul 2023 21:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD6D940932;
	Sat, 29 Jul 2023 21:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6D940932
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4D7D1BF310
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE0D960F18
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0D960F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cWwxvJYQERr for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:05:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5756460E43
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5756460E43
Received: by mail.gandi.net (Postfix) with ESMTPSA id 672ADFF802;
 Sat, 29 Jul 2023 21:05:05 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:05:03 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230729230503.774545db@windsurf>
In-Reply-To: <CA+h8R2qG4w+mHrZTZ0EmTXjH=txfGQT8-p3f_K_GqP0+8bP8hQ@mail.gmail.com>
References: <20230728052530.1122268-1-christian@aperture.us>
 <20230728092656.5ae69f0f@windsurf>
 <CA+h8R2qG4w+mHrZTZ0EmTXjH=txfGQT8-p3f_K_GqP0+8bP8hQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690664706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAxYBBorGMMBdN5LCpDvJ+a/AJP+yovvaUP2U8H1J/U=;
 b=V/YN4i0dIbR2U6L4VCEJ7NL/tclLXNWtkRNtBshcreIwlaaP1WqUNewgaCFidFW3S+hANr
 6x3ogPbBSr6irnJa6fAuGJsJv5Hm/rBuRjBM6b2h6ct1u+b+QSXdajnrbv+GOUMaQLikZX
 LLxX/UYcDJ++lkPwe6Ri3tdvMYyJJNFJ4f/J8YHukpbhQH30Lev1vPZxWB7PW2koBb/I5r
 FDk6Rpk3B4jJogMJ4jf3z7YKKhJPXaggrMXnzZdvFJHWWRoZtvpOC703HV7Sq49/qorfcN
 E3Djvu2e8U8JxTsXu3szUxjDX5rg/KPiOymL0bbHE2EVc9pCqDh6+W8aJypXbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V/YN4i0d
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: add toolchain as
 dependency of host-go
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
Cc: "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Jul 2023 18:19:46 -0700
Christian Stewart <christian@aperture.us> wrote:

> > to ensure we build a host-go compiler capable of building code for the
> > target if the target is supported, but in all cases builds a Go
> > compiler capable of compiling code for the host. Indeed, host-go might
> > also be needed solely to build host utilities, which would be relevant
> > even if the target architecture isn't supported by Go.  
> 
> I suppose if you don't set CC_FOR_TARGET nor CXX_FOR_TARGET then the
> Go compiler will simply use CC and CXX which are HOSTCC_NOCCACHE and
> HOSTCXX_NOCCACHE.

It'd be nicer to have more certainty than "I suppose" :-)

> I noticed there's already a line which adds toolchain as a dependency
> if cgo is enabled.

Hu, where is that?

> Will mark this patch as not applicable for now and consider why the
> build failed in the TestMender test case when running "make host-go"
> without building the toolchain first. I guess that's a case where cgo
> is not enabled and yet BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS=y.
> 
> We should move the toolchain dependency to be if
> BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS instead of if Cgo is enabled,
> I think.

Possibly, and this would make sense, if indeed Go needs the target
C/C++ compiler to build the target Go stuff.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
