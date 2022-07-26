Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFF2C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30C6F61B9D;
	Tue, 26 Jul 2022 15:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C6F61B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBSf36jr7yvr; Tue, 26 Jul 2022 15:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428D8613FB;
	Tue, 26 Jul 2022 15:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 428D8613FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 178761BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B1D4173F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B1D4173F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPMkmhbPDoxW for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:32:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9399140158
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9399140158
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:32:03 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v130so12271509oie.13
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yGiMlX0Kp/cPPXlRL40wSS8eNp+Riy43tuE4eZwBTeg=;
 b=r3PTwmJM9Ki1DFdnNvXl2JKOr1RjeAbJ9ZaWewLd/+meCWXIvqqWN2SumibgVXAsGn
 Xa2vN4MwEzzcM909B13FWrHe7fRP9YXCRwDMdOWKUNVYN/89HgMcVzLhbqnh+44Ohk7d
 8IuNVaFTGZj9IUt1yLfq0ilN9zwgpCC7y2nTCgBTYrVqEm9e2paJZNMjZDc5WCIKJqqI
 Vc/YZaIUqqt1bjbvZ9wY77c5Z8f3cgND0NyDsKKbx9R0i/X7QuUh1icQ0sBZ3ynVDscJ
 SlY0imip7FnGS9QCdNO9Yi2js6SKi/jWt0s4SA4iBKJVGJ80JghJdbImHJe5QzZK9sTd
 J3XA==
X-Gm-Message-State: AJIora/y4hWKmaQtrChon6WTDGJFc502iRSimIpuLUn2Ytb/yWP6lbJz
 SjRIbUQRmXOr44cjZtz65Vn/8RHtAd68dWZCYb8=
X-Google-Smtp-Source: AGRyM1vqMwIGP3yKaLCYINyDLaPh2T3/9bHrNRtWUIah0iprzkFGxk/xzFx5LYddSdmnTj+iEi112pLRNvc+HRYktFs=
X-Received: by 2002:a05:6808:211a:b0:33a:9a59:fb31 with SMTP id
 r26-20020a056808211a00b0033a9a59fb31mr8007752oiw.147.1658849522611; Tue, 26
 Jul 2022 08:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220726063400.2321251-1-james.hilliard1@gmail.com>
 <20220726084726.GI3168@scaer>
In-Reply-To: <20220726084726.GI3168@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 Jul 2022 09:31:51 -0600
Message-ID: <CADvTj4oJCWJ2Pq4US_QAo34sSi_w6LZqt-t=w_v78VvviVfRfg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yGiMlX0Kp/cPPXlRL40wSS8eNp+Riy43tuE4eZwBTeg=;
 b=cWuxJPp9KaWXhlGcXOAMOZyarFjDm8Q7NVdM2Im/M79GeJWoAKTNlLMs/b+7A/czS3
 kHpywbOgEYId9wfHihBLVsP24COK7iQDFEWPeJAld50BqDOrWVUOnQ0eSeNq4MKR9jiq
 tR7InZHSkBMI1I1LiArRSJsS9SfrRH8dpqrEatOE3fYipk6Ruf/PRPlC17wZyxmxHf6c
 JfXenLfls9iziEJyX943MpFcm204s4kqOhoBcwuucgSeMUU75EQa9au/p8A+wEHd7OlF
 8uzLgn5KC9nQDd6LMBs7kLfyIyQYMAskx8THUKxxmNsmvqcdYkmEXZKdvAVROtGIdJ0e
 jN0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cWuxJPp9
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: set cpp_rtti option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 26, 2022 at 2:47 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, Al;,
>
> On 2022-07-26 00:34 -0600, James Hilliard spake thusly:
> > This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.
>
> BR2_PACKAGE_LLVM_RTTI is a sub-option of llvm, so it somehow means
> that llvm should be a dependency of mesa3d, which your patch does not
> add.

It's an optional dependency.

>
> But we already have a conditional dependency on llvm, so this nex rtti
> option should be a sub-condition of BR2_PACKAGE_MESA3D_LLVM?

Setting -Dcpp_rtti=false when llvm isn't used is harmless, it seemed clearer
to just have the single independent conditional for BR2_PACKAGE_LLVM_RTTI.

>
> Regards,
> Yann E. MORIN.
>
> > Fixes:
> >  - http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/mesa3d/mesa3d.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> > index 96520e2efd..652b5168d2 100644
> > --- a/package/mesa3d/mesa3d.mk
> > +++ b/package/mesa3d/mesa3d.mk
> > @@ -94,6 +94,12 @@ else
> >  MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
> > +MESA3D_CONF_OPTS += -Dcpp_rtti=true
> > +else
> > +MESA3D_CONF_OPTS += -Dcpp_rtti=false
> > +endif
> > +
> >  # Drivers
> >
> >  #Gallium Drivers
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
