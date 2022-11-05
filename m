Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4446DC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1CA5403C2;
	Sat,  5 Nov 2022 20:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1CA5403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzCKAL9cXU8V; Sat,  5 Nov 2022 20:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA5E140222;
	Sat,  5 Nov 2022 20:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA5E140222
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86EA1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 834C840222
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 834C840222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0b2A87KlL2dQ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:24:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C42D0400D9
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C42D0400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:24:05 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id g16so4378307vkl.11
 for <buildroot@buildroot.org>; Sat, 05 Nov 2022 13:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fybBPXf+AWvT+dqT9px+Oje2nJj6uTxHGeRu2khXXoo=;
 b=Aai232vzLfq6lfVHL0qWmtt4NhfqhwFRfHJgO4mzOqUwkTjEzgcreroQA/zanmUu5v
 4b8JEYLLi8MoBoPqPPXn41X0fsEdusC3KwlpG/9xLY2ipSzEHdIUUO6P+rjoMzf4CV/D
 UwQaUWvjiEPs/46qTp4/xENAwQxNR9zcJ0/OJoeYAfXx90Ei4QXnjxoPNN8OSEiFy0ER
 VjbLEL9bD9u6nDYmEPuf/kJlFIyOcsRn5rZt/9MmGFDPNo+obRGyj9BXs1dy2JMQGlSg
 YR+WGHK8HQynjfUIOAWZuR3c7GURqg4WK2OnFeqUJVlBlhyW+ktrGKO3Y1WMxK8SS+yF
 2pTw==
X-Gm-Message-State: ACrzQf2FyYsamOKr1mzEvx0B1Eg72VlRAnL5f9yakK48pa3Pqe4MSfuM
 C2kbXSzYyPvU1gucZ7+wem1GcRsBcmuzVCM26w0sQqzstyw=
X-Google-Smtp-Source: AMsMyM7uOml0mzVws25iMbR4eJd3891MO6lFw/s93DYrPx4SJSZd2hURpZTAJrLMLLJwAI//yKBM0cncSsmkj6PXKT8=
X-Received: by 2002:a1f:5981:0:b0:3a6:6655:831f with SMTP id
 n123-20020a1f5981000000b003a66655831fmr22516397vkb.12.1667679844610; Sat, 05
 Nov 2022 13:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221104235727.587650-1-unixmania@gmail.com>
 <20221104235727.587650-3-unixmania@gmail.com>
 <20221105114433.2a5e6b09@tuxfamily.org>
In-Reply-To: <20221105114433.2a5e6b09@tuxfamily.org>
From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 5 Nov 2022 17:23:53 -0300
Message-ID: <CAJ4jsacyrm_vy13vFbX0sR9K991LeVa=iJsQeevo_V9+OkSA_g@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fybBPXf+AWvT+dqT9px+Oje2nJj6uTxHGeRu2khXXoo=;
 b=GHE+S2zS6lTtizaGOtgD4qhPk7yninbI1AqqchgeUn7nUasyDCc32/hfcOw/a9vilW
 u2scKptxb16FanIkLyiazS89nJaOxLUflDPSXFehUFDy3X7KrNDjkpEEQgBUBNJ54Y0z
 ciIIVNqbmwS6e55FGs5yO7p00Jmy90ZHWGv7YQbHhDkt7p12cBSvNi7GppcL8u8LqEjJ
 i7DpCEoaTXiLAgmwbqUa8qH39AuntdCX9WUmWRlq/U5LFPYw3z4EMwMeWo4o5a9GLXh0
 a2UgMH+FhPPJjsf8l0S+48nvq9YpOAf7XyeMJI2wXWxYYd8CFi8sCRlsBC+2asvqEJQu
 m14g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GHE+S2zS
Subject: Re: [Buildroot] [PATCH 2/3] package/qemu: select FDT for custom
 targets too
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Nov 5, 2022 at 7:44 AM Thomas Huth <huth@tuxfamily.org> wrote:
>
> Am Fri,  4 Nov 2022 20:57:26 -0300
> schrieb unixmania@gmail.com:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Custom targets selects system and Linux user-land emulation, which in
> > their turn require FDT. Move the BR2_PACKAGE_QEMU_FDT selection to the
> > BR2_PACKAGE_QEMU_HAS_EMULS hidden boolean, to cover all cases.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> >  package/qemu/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> > index 8b8a999885..9e0cbd4acf 100644
> > --- a/package/qemu/Config.in
> > +++ b/package/qemu/Config.in
> > @@ -95,7 +95,6 @@ comment "... or you can select emulator families to enable, below:"
> >  config BR2_PACKAGE_QEMU_SYSTEM
> >       bool "Enable all systems emulation"
> >       depends on !BR2_STATIC_LIBS # dtc
> > -     select BR2_PACKAGE_QEMU_FDT
> >       help
> >         Say 'y' to build all system emulators/virtualisers that QEMU
> >         supports.
> > @@ -121,6 +120,7 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
> >  config BR2_PACKAGE_QEMU_HAS_EMULS
> >       def_bool y
> >       depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
> > +     select BR2_PACKAGE_QEMU_FDT
>
> Technically, I think you don't need FDT if you are only compiling the
> linux-user targets ... so maybe it would be better to add this to the
> BR2_PACKAGE_QEMU_CUSTOM_TARGETS switch instead?
>
>  Thomas

BR2_PACKAGE_QEMU_CUSTOM_TARGETS is a string, so adding a "select
BR2_PACKAGE_QEMU_FDT" does not have any effect.

A better solution for the case in which only linux-user targets are
selected requires a more complex approach. I will submit a separate
patch for this purpose. Meanwhile, let's put this series on hold.

-- 
Carlos Santos <unixmania@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
