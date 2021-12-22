Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B96C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 00:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B18D860F87;
	Wed, 22 Dec 2021 00:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ByiIXI8C8qak; Wed, 22 Dec 2021 00:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 149E760F85;
	Wed, 22 Dec 2021 00:04:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB1E1BF9AC
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 00:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A0D260F85
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 00:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jh00w1ZrajPB for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 00:03:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D00E60F7E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 00:03:59 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so578253otl.3
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 16:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgHr7odkKIc/ezGTQiYAFT/ZVFitPYw0Ft2C7sQFD88=;
 b=W8si8j7dc/ldIQQeJgWOaqDhF7sRmSBpxit89LDkOUva3isDznV3H1VOCnXo0tWCVn
 ZAmi1HGrdThptZvRRCljyRm2eD3Ddzs0yaIlgYmmtEMXhn+fz6+LTZkeEICtLgbjNGyY
 uZcwULDMSLxIibrNMb/K4psB+vrVNjsoGSMCCPi1zBdPeUd3SwDS9+OtIB4L1/lPhMBQ
 Hux9O/ss+RLKvbbwgcB0vkVkUrot5HD6/2TJFCe2Sv2X3q+2AatzSCWCjB4QMX+u1GLG
 g2LtDhaqjHLnuSOtnWuaeYGYWH1AQRt71/a1xmTu2Li4V903No4yatIdPwbC81BLoiEN
 Jo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgHr7odkKIc/ezGTQiYAFT/ZVFitPYw0Ft2C7sQFD88=;
 b=6LBtP8Ql2WMRqb2dPBNTJrc3U5hVHWnr6lkrnet3M1KHqTYdxCI3Ke4fqiJvyUOuqQ
 9OUMTyBCOjSxL3DFDz3nXdC1z+Mxs3LCXXN5mf4cZLmwD9dZtbkUJ0Huio1Otvm5gxZ8
 QIlezm80L+veI0RZxGDcSjqw1aJp/jPwt88aGRtAnVAu7Rg34ow7tp/f4N4P4rmlEdxN
 VoWv4IKoE8AL1QxFMbfPAPKcHNQKeGl5kQ74r7TiCMV29V/g5wWUNyj0gcO0ExBlqyox
 xHGde1WYHjZrMVgJ8FFDLK0L5t30Ww6zg3Aiv/1K05XCvXIdlSxuscqa/FgBjhQdKfFQ
 N96Q==
X-Gm-Message-State: AOAM532sfBGTrT1OL+DHsSMgA2l7/RxeQsNppxdqInEehDPVY9Segr0q
 R846icP/aj/sfcatb06MB9X3dzgoGdfQ0lbPgYdOjDoEPdO1iw==
X-Google-Smtp-Source: ABdhPJxIo1AedU+waxEn/xtxwi2VxJ+HbNP74BMF83Ve8Gwuc8ZX7A5AqKvvlCITA0mM7R9nco+MtJrX/Hp+6t7OgYw=
X-Received: by 2002:a05:6830:2aa7:: with SMTP id
 s39mr500787otu.151.1640131438251; 
 Tue, 21 Dec 2021 16:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20211220084645.28659-1-james.hilliard1@gmail.com>
 <7f99f3a3-cc60-a874-afbf-8f89259f63ff@mind.be>
 <CADvTj4rb=3jCU6+bBOM7GEt2Cym5pSTJELWcAiwN-Uup+LxwQA@mail.gmail.com>
 <6cca2e39-f15a-c453-0226-7d02f055e3ea@mind.be>
In-Reply-To: <6cca2e39-f15a-c453-0226-7d02f055e3ea@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 21 Dec 2021 17:03:47 -0700
Message-ID: <CADvTj4pMo61sRZyAtMUWwLcEw9ObABiGeePkCLLdaUULaC5usA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: add iwd support
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
Cc: Martin Bark <martin@barkynet.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Dec 21, 2021 at 2:47 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 21/12/2021 20:07, James Hilliard wrote:
> > On Mon, Dec 20, 2021 at 3:34 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 20/12/2021 09:46, James Hilliard wrote:
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>    package/connman/connman.mk | 7 +++++++
> >>>    1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> >>> index e5e596c973..d3ebb40a1c 100644
> >>> --- a/package/connman/connman.mk
> >>> +++ b/package/connman/connman.mk
> >>> @@ -85,6 +85,13 @@ else
> >>>    CONNMAN_CONF_OPTS += --disable-wispr
> >>>    endif
> >>>
> >>> +ifeq ($(BR2_PACKAGE_IWD),y)
> >>> +CONNMAN_CONF_OPTS += --enable-iwd
> >>
> >>    No need to add iwd to CONNMAN_DEPENDENCIES?
> >
> >  From what I can tell iwd is only needed at runtime.
>
>   It helps if you mention that in the commit message :-)

Added to commit message in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20211222000241.1894807-1-james.hilliard1@gmail.com/

>
>   Regards,
>   Arnout
>
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>> +else
> >>> +CONNMAN_CONF_OPTS += --disable-iwd
> >>> +endif
> >>> +
> >>> +
> >>>    define CONNMAN_INSTALL_INIT_SYSV
> >>>        $(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
> >>>    endef
> >>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
