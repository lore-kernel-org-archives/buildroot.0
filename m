Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF769C54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 03:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC3F81327;
	Mon, 30 Jan 2023 03:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC3F81327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nbMyR-lhwpGV; Mon, 30 Jan 2023 03:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6834281319;
	Mon, 30 Jan 2023 03:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6834281319
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 797191BF8B4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 03:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52F6160D70
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 03:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F6160D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnFIXBQe5vvb for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 03:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C20D607A1
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C20D607A1
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 03:17:41 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id j21so69866oie.4
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 19:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0QBfM76l5HHe8ClTZP0rNAav9vxQJMwnX/4phjIu5s0=;
 b=R9twxhxFtKizy/qcRHm7x18l5FPrJ3cDpwLzjWuRgnshC1ZSQ3M+d4B7gSZkyD9D+S
 FefSF33eGC2/Tt/CXoC/Ov6yu8NXblMKcr0d6bJ7aAugA+mnIoafhF5CW0i1lzVDxEn9
 w+x+X8MrzQgrCn2VDGpqZtkzbb6/nTmMwNqnEYI20uhwhRATPnnHHD6s9HNQglDdBPSE
 bglCFWENJdof+QHYHzlUJnWjpfdPLf8Zj0nTMwAqZO6W1KDiMvZ12y+NbzXGtqUUdBhA
 LRYVmrE/l1J+M1v6+YPks5Vc80HHAgOE554PPAWTmGVoBFwRs43dxVvfnj+0YfxFnh1v
 AUjQ==
X-Gm-Message-State: AO0yUKWFmaSSgfo0Gp32+0yAcnUArt8cf249XYHd5byreizWTAvR29g3
 N5fdzz41iTXmuxaPVf3eXT1QXaqi+PLh81JiN9o=
X-Google-Smtp-Source: AK7set9h3uGlM9ywsDKWsEpQJGijITmTpT4fCRwC47PpHmyQpOwN0Xt6dBI0/PVXhrT9NKBsN0+BAZ0qMYVsNieffpU=
X-Received: by 2002:aca:ef46:0:b0:378:3063:1399 with SMTP id
 n67-20020acaef46000000b0037830631399mr156462oih.18.1675048659999; Sun, 29 Jan
 2023 19:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-4-james.hilliard1@gmail.com>
 <20230129214507.GY2632@scaer>
In-Reply-To: <20230129214507.GY2632@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 Jan 2023 20:17:28 -0700
Message-ID: <CADvTj4rYJHfDyhEmtogs0WQ30=FZQH8zWAcuwZMxmebq_iL7xA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0QBfM76l5HHe8ClTZP0rNAav9vxQJMwnX/4phjIu5s0=;
 b=Lxnu7Dt6L6hHTM6Kq+CNz5YLgwkBY55WT4NnZZrag/c5jYHdsv8ClDB4rHsiwVYq4j
 zdOpY1hCTnmGv6WuvZijP7anSd2P30w7XuRjWqbF341rj/dTTsvU2aD1JO6+9Jh+kTce
 IgBhlTtErpwth/6G5Ub2xR33WTCi2v2TAhlYFeHgXZW+RVVmp6v0pv759/U93JYNl9ZI
 b9AcRtqqTFWRRxWIPTIIQV5oYJ6hdUtIkSg0WQ4Qywe6+4ostDLz00FRAqsIGitQGc9G
 g/UhNT9fTLBxL0iq2Bgj+ggC02Bc3wSenqLiPwFKUHvzgOW95grUyPxwfVVMnO+zRSQZ
 M0uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Lxnu7Dt6
Subject: Re: [Buildroot] [PATCH v4 04/13] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 29, 2023 at 2:45 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> > From: Stefan Hager <stefan.hager@ginzinger.com>
> >
> > This package is required by tensorflow-lite.
> >
> > Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> > Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
> > new file mode 100644
> > index 0000000000..1a36fc48f7
> > --- /dev/null
> > +++ b/package/gemmlowp/gemmlowp.mk
> > @@ -0,0 +1,15 @@
> > +################################################################################
> > +#
> > +# gemmlowp
> > +#
> > +################################################################################
> > +
> > +GEMMLOWP_VERSION = 08e4bb339e34017a0835269d4a37c4ea04d15a69
> > +GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
> > +GEMMLOWP_LICENSE = Apache-2.0
> > +GEMMLOWP_LICENSE_FILES = LICENSE
> > +GEMMLOWP_INSTALL_STAGING = YES
> > +GEMMLOWP_INSTALL_TARGET = NO
> > +GEMMLOWP_SUBDIR = contrib
>
> Upstream is very careful to point to some optimisations that are
> required or performance will suffer.
>
> Notably, should be enabled:
>   - for x86: sse4.1
>   - for ARM: NEON
>
> For NEON, it seems this is automatically handled, though, based on
> looking at some macros:
>
>     internal/detect_platform.h
>     85 #if (defined __ARM_NEON) || (defined __ARM_NEON__)
>     86 #define GEMMLOWP_NEON
>     87 #endif
>
> For x86, we should probably have code like (what we have as
> BR2_X86_CPU_HAS_SSE4 seems to be SSE4.1, but it is not clear whether
> there is an actual delta between SSE4 and SSE4.1 [0], so let's be safe
> and assume that BR2_X86_CPU_HAS_SSE4 is not enough):
>
>     ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
>     GEMMLOWP_OPTIM += -msse4.1
>     endif
>
> However, that same header seems to also have some detection based on
> macros... This needs to be cleared, maybe?

Well gemmlowp is effectively a header only library so optimization flags would
not be set for the gemmlowp package itself but rather in something like the
tensorflow-lite package which consumes the headers AFAIU.

Note there's technically an unused deprecated library that gets installed
to staging, we don't install it to target since we don't have anything consuming
that deprecated interface at all:
https://github.com/google/gemmlowp#old-eightbitintgemm-legacy-deprecated-interface

>
> [0] https://en.wikipedia.org/wiki/SSE4
>
> Regards,
> Yann E. MORIN.
>
> > +$(eval $(cmake-package))
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
