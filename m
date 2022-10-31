Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AA7ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 16:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E9081A33;
	Mon, 31 Oct 2022 16:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E9081A33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9h3Ol0k9ATUh; Mon, 31 Oct 2022 16:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C735481A15;
	Mon, 31 Oct 2022 16:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C735481A15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5E41BF384
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 16:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E1260BEC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 16:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E1260BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rZ_qwoqdPsJo for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 16:15:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E284600C6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E284600C6
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:15:51 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id l2so11153749pld.13
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GELP4U3Dn5JxfYwQ+USmjgOaslIECjxutiPTADUiDg=;
 b=3UzFCmtG01hJVZAcQwYL8j6pBGLSPyRRMy9fssS0aWZ89g14wwUwGHCdpbtZlCHvEG
 PMETO7Lipi1bWq8Oxt+yEU3u0wTGzTpIYdHAwlGOluqYPlgAq8Cjs8kq02CPYHihmzL8
 ZBv26JYUpPgVV/LmZ3rtc4SOlZNpeRE7ygVlQIFW/kNhIH4AAUnRvka3/8WFifqEov+r
 Ew01lF6hYk9bm8yI0HnjV/+fM668/LuE8onWCdE0QfiOZnJG5Hx7X/EJmMz8oveFr4cU
 BkCc/KJxvwpcvEpWDSJPObvYqXJK0XEs821wp5fEObytYHyG+JO3xOV+0whP0KbTNWUA
 rUQA==
X-Gm-Message-State: ACrzQf1mC/iMcl7X+9VlBBgldOPjTSEXWYPPgca5qxWRO9pbCNwj834C
 Wc/bqOLko8MxjrmiexcCbhJ4GSEQQ68xQkrx7isZBalQY3eJ+w==
X-Google-Smtp-Source: AMsMyM4gN8eXMdkqDLg1n8Z/Vr+WNflJOhEJC5MzZ12D8XaCutl/13sUTkDMbbXESyxV4Bm9IAyFzND1JVyjstRtMbs=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr14894909plf.57.1667232950616; Mon, 31
 Oct 2022 09:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221031010904.1109541-1-james.hilliard1@gmail.com>
 <20221031081735.GK1058960@scaer>
In-Reply-To: <20221031081735.GK1058960@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 31 Oct 2022 12:15:38 -0400
Message-ID: <CADvTj4obo9_4aT5B_cJ-kM1MEacQUck8jFFTr6ZsuzvG0JkyPw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0GELP4U3Dn5JxfYwQ+USmjgOaslIECjxutiPTADUiDg=;
 b=m2fPBa4hKLKstMsWMKDTSjjfQ/g63IE3zIhZOWylPncFQsWxHPcnfJhS1E2Ynwj1Ag
 r67DZWaGIvTg5JpYnKOCTAWf4ekvCIiN68WzdPMkF2Pq4Z7IGvKKvjVRjTTW21Iyahgf
 I/VRMnkP2uy8xXpjEZejOubcCfyy6XvFrwdJ5nZSFbCQHpFexYZ0gi9zVjLif5fID5kN
 CjgM4vy76I9qntqB//l/aQ2R09/0mfOm0zfIHW49OmsU8DT7zBsh6VaKqBM0TH7BkyVY
 fNlOR8EjztjRasZAd8bM4Q57ZTWLSliLrrJ1JJnUP61EyyaR7WZzswbYJC7UBvmrqsHk
 RgHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m2fPBa4h
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: set dbus busdir
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
Cc: Daniel Lang <d.lang@abatec.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Oct 31, 2022 at 4:17 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> +Daniel
>
> On 2022-10-30 19:09 -0600, James Hilliard spake thusly:
> > In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
> > dependency, as such we also need to set --with-dbus-busdir which would
> > otherwise be pulled via pkg-config.
> >
> > Fixes:
> > checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required
>
> I was surprised that I did not have this error locally, but it only
> happens when systemd is enabled.
>
> So, rather than hard-code the path, I think I would prefer we add back a
> buid dependency on dbus when systemd is enabled:
>
>     diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
>     index 002988cf33..6e366e094d 100644
>     --- a/package/iwd/iwd.mk
>     +++ b/package/iwd/iwd.mk
>     @@ -31,7 +31,8 @@ endif
>
>      ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>      IWD_CONF_OPTS += --enable-systemd-service
>     -IWD_DEPENDENCIES += systemd
>     +# Need dbus for system_bus_services_dir variable provided by dbus' .pc
>     +IWD_DEPENDENCIES += dbus systemd
>      else
>      IWD_CONF_OPTS += --disable-systemd-service
>      endif

Sent as suggested in v2 patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20221031161451.2604400-1-james.hilliard1@gmail.com/

>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/iwd/iwd.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> > index 002988cf33..e53ae595d7 100644
> > --- a/package/iwd/iwd.mk
> > +++ b/package/iwd/iwd.mk
> > @@ -17,7 +17,8 @@ IWD_CONF_OPTS = \
> >       --disable-manual-pages \
> >       --enable-external-ell \
> >       --enable-dbus-policy \
> > -     --with-dbus-datadir=/usr/share
> > +     --with-dbus-datadir=/usr/share \
> > +     --with-dbus-busdir=/usr/share/dbus-1/system-services
> >  IWD_DEPENDENCIES = ell
> >
> >  ifeq ($(BR2_PACKAGE_READLINE),y)
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
