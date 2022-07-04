Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE02DC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 20:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CA00408F2;
	Mon,  4 Jul 2022 20:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA00408F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8tgbWggLILw; Mon,  4 Jul 2022 20:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E592405C0;
	Mon,  4 Jul 2022 20:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E592405C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 495261BF20B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 20:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 313D741691
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 20:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313D741691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8DnJesS3B_W for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 20:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB0F408CF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDB0F408CF
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 20:09:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dbc:d4c9:1472:395c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 20BD87802C2;
 Mon,  4 Jul 2022 22:09:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 22:09:21 +0200
Date: Mon, 4 Jul 2022 22:09:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220704200921.GK2521@scaer>
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656965367;
 bh=Tl3Dlk/fV/QyMn/IBALGTcQZLL8M6tBZ42FHLCtfv8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mdTlmizkr8LZcpRL0xRjZ/HPL5Dx9uFeKNz9Uhbg46V8Dpj3iG0FJ3Q8jc7iqdNTF
 zGRfZIL48ty8hnP+qtnhysZgH8iS9w1Rj+x3S1aa2SsLlyn/awBcTNhsSV4AC4a5zQ
 UlF0r4JNMmS71lF5Dj6pFAJ14Yc9va3NexUiE2gk4FetRQCos5XsIcCOIdqF0GnSsm
 ir7YbtQM74W9tJFzX8CQxKcsiDPrPi5nr4nf2GyOrkQZZ4vb+AGFz0aY6SeWAXD/kv
 sCpkcnidUjjE4Qeep7nra4EeFuQSvdA0/eMaKuDOBOvfVyEN12sXhUQ33egHcEPUEt
 n58Ox3fhGT78A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mdTlmizk
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-04 11:29 -0600, James Hilliard spake thusly:
> On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
[--SNIP--]
> > Buildroot may strip symbols, so we need to do the same before signing.
> > Since meson install target is also signing the IPA shlibs, let's strip
> > them before this happens.
[--SNIP--]
> > +LIBCAMERA_STRIP_FIND_CMD = \
> > +       find $(@D)/build/src/ipa \
> > +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > +       -type f -name 'ipa_*.so' -print0
> Wouldn't this make it difficult to analyze core dumps since we need unstripped
> binaries for that?

This still obeys the BR2_STRIP_EXCLUDE_FILES, so a user investigating a
coredump would be able to rebuild by adding the IPA libs to the list of
files to exclude from stripping.

It also uses STRIPCMD, which a noop when stripping is disabled (see
below).

So this leaves this package in about the same state as all other
packages, I believe.

Regards,
Yann E. MORIN.

> > +
> > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > +endef
> > +
> > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > +
> >  $(eval $(meson-package))
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
