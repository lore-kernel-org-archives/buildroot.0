Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8B7C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 20:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9157660E35;
	Mon,  4 Jul 2022 20:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9157660E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Or2kP0nIAXk; Mon,  4 Jul 2022 20:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0252460E3B;
	Mon,  4 Jul 2022 20:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0252460E3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C94E1BF20B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 20:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45D6A828DD
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 20:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D6A828DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6mh72p2IqTv for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 20:18:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D172828DA
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D172828DA
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 20:18:46 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10be0d7476aso7615054fac.2
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 13:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpinEbb9m6iI+FtAnWUM7gGn2TWcGdwDyKdrBO/hgh0=;
 b=agl8zfl/ftvK8sek/uP4D4l6z5b0/DzZLa9uPr+D606mhWupe6P/fI6loz+IpKZDmG
 sd0gAN71536Lxin1e0htqjSKAmOeMs71W1GgmepxF/9mDh2Kw+9aYgH9eTR6Urs9Imyr
 +HA6FtLkBdtI7st9ZxKFl/EIlzQ281a/qy/T2edt6C6nauqdG+5poZbzdJWUVmp1TRCT
 ltFNkFDY3RSOE2g6d22onxEThtzeQK/QZKHMZdyiNf+VdLw2Se3u0164g5ubSJYtdmuK
 hOojvBmQYFawAQ7Sp98goGJ7X4teZUT3ml2xMORsyaR70gbBMj0+RmOEYvXGkqoM3PNt
 vonA==
X-Gm-Message-State: AJIora9dLMwZjrnzwa1s6QzJcRD3uQj4JtafnPbKVyqyO6L/QJKmEI36
 Ny4El360NGTEvsLqq5Vn1ZEixJD0WaPiyQ0XLBE=
X-Google-Smtp-Source: AGRyM1vK7rWcjlpMDLG67Ps6VHhBIP7XcXSBHsrtjSmPQ00wnmemVD45KbHlB60hwYfAf02u11OIo6ZsH0eDjQpgM9I=
X-Received: by 2002:a05:6870:538b:b0:101:17f2:d6e with SMTP id
 h11-20020a056870538b00b0010117f20d6emr20262043oan.200.1656965925090; Mon, 04
 Jul 2022 13:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
 <CADvTj4p_22ayfvpD=+pKWppGJHD-Q2g48XwFnoKmmB22fw+g+g@mail.gmail.com>
 <20220704200921.GK2521@scaer>
In-Reply-To: <20220704200921.GK2521@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Jul 2022 14:18:34 -0600
Message-ID: <CADvTj4oyNY7J0E46VkOeVQGiBN+3=6MMQB2P-mVbVdQE6y6b0Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bpinEbb9m6iI+FtAnWUM7gGn2TWcGdwDyKdrBO/hgh0=;
 b=D4j75LiU/lQRs78MGTv6xaMueztsQeAG1WOQ2Mh/F5X0vKxThmWtOyUpg7yDEysMdY
 RM/vNJdsqenXTpxRCypqrr1mrGdSTalXSnrKgnC7rSVolysYZeQUk9BNFPxwDwp8jmqx
 DITMrVMCyfIyWfmVuQ040tRo3SGDlRHFmJj+C43oICOn9CpByRcMQQBdDQy3IrAHHJhv
 g11gMnHsl/9WK8gxyadCY46bAKrPldwNPAHFY75MlGH0kcaT3deYFfzAfzfhCKNMU0Nv
 MZL2A9VP71qc1p1bH4YPseznLIcGYe1SrDV+SApI/vK93DhjfWXPrL/f0A+bNKC4PNhP
 dAGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D4j75LiU
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

On Mon, Jul 4, 2022 at 2:09 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-07-04 11:29 -0600, James Hilliard spake thusly:
> > On Fri, May 6, 2022 at 4:47 AM Quentin Schulz <foss+buildroot@0leil.net> wrote:
> > > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> [--SNIP--]
> > > Buildroot may strip symbols, so we need to do the same before signing.
> > > Since meson install target is also signing the IPA shlibs, let's strip
> > > them before this happens.
> [--SNIP--]
> > > +LIBCAMERA_STRIP_FIND_CMD = \
> > > +       find $(@D)/build/src/ipa \
> > > +       $(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> > > +               -not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> > > +       -type f -name 'ipa_*.so' -print0
> > Wouldn't this make it difficult to analyze core dumps since we need unstripped
> > binaries for that?
>
> This still obeys the BR2_STRIP_EXCLUDE_FILES, so a user investigating a
> coredump would be able to rebuild by adding the IPA libs to the list of
> files to exclude from stripping.

I mean normally you would not have to rebuild since the files in the
build directory
would retain their debug symbols and only get stripped in the target directory.

>
> It also uses STRIPCMD, which a noop when stripping is disabled (see
> below).
>
> So this leaves this package in about the same state as all other
> packages, I believe.
>
> Regards,
> Yann E. MORIN.
>
> > > +
> > > +define LIBCAMERA_BUILD_STRIP_IPA_SO
> > > +       $(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> > > +endef
> > > +
> > > +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> > > +
> > >  $(eval $(meson-package))
> > > --
> > > 2.35.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
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
