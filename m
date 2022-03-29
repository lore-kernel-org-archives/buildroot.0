Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F3CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 23:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D6F40360;
	Tue, 29 Mar 2022 23:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K36JjDrytp6I; Tue, 29 Mar 2022 23:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D47402ED;
	Tue, 29 Mar 2022 23:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C79A31BF954
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B57974028E
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 23:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVwhXWaAteIj for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 23:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9CCC4025E
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 23:08:09 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-de48295467so20408609fac.2
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 16:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i17wQhW4KPorB0NBbTCa8yI0MezKmx1p2En1q/In4b0=;
 b=Vn60LS74NR+982cpITuHx49EPCXusyT411A4I/Cg2uBTwFCRAmnej0jX0qgcop+G2p
 o6gfk9DkBPTUiqtXG5nhE/TZ8Uswkl92ITHFWIRcmcahQnx/c52kw7pV3baWGqbnvQRL
 JjRZctvTvd/JNMBOztUuFGJIKHa1hKd5RPakQsHipNufYYnFhD60C1LHRF8FNXkWL3tI
 DQuBszXM6elKrZK3siSHdecEWBYs2a1iKUOugi77cFFwV6uHWIR5tk4HipwR9dh2EmXE
 eg8VMRCaZYzkTIZJwkDwirYIuNVtOnoVC4tp1Y2tfYquYicAG7SMfeilFp9mth2+rBUy
 Zs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i17wQhW4KPorB0NBbTCa8yI0MezKmx1p2En1q/In4b0=;
 b=Gmfq6smCcDiSVSPLbwMFXepLYf16RrMiePNHwjw0gfEnY1W0rabP5IiZ2o9T8uB/VA
 jnBA0UwdXQ0sSe5265bWMsrouKLqzanGSvdJo6m2UreCWURs3kRRTjqFyUqcJN63/Opa
 IZXuSYTlf8HuxIIJv44AThfvQdTspagYCQ0UexQtIHwyEQ6hdhlVASnr6mnTDsAlplry
 aaYTMaiUCvmLpfmEoWjRnvNotgy/d89YVoL72TWr+9zuetCN00dul9IYP2oga9wWQ8u0
 8nx/CaJCmHOx1GzC5fLnfqMpgmrSf+seXC4wavnSFrB+/HrNsm/ecxRdznkI3BrmVsKb
 nwNg==
X-Gm-Message-State: AOAM531ahFmJrKfRvNSl1ndQI7dtKo80AlKdMRly56ZzBGIs8518iRs3
 9n4CD3VYY7r1Kj8rYVxA4iQHI3rytsi5EqZ0+VQ=
X-Google-Smtp-Source: ABdhPJwlG+7LtEJaagjb7c1CBSMJgVm3iab+K1C3Ra9jNQNkaBOhcM0lbp23YmFt28Yl4lu0snTRKNKrVginyyppDG0=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr845188oaa.99.1648595288517; Tue, 29 Mar
 2022 16:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220329164036.4045575-1-james.hilliard1@gmail.com>
 <20220330013403.GB1671742@momiji>
In-Reply-To: <20220330013403.GB1671742@momiji>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 29 Mar 2022 17:07:57 -0600
Message-ID: <CADvTj4oPW=4P46fAbYmXdE8oNNOXTkJ7tyeAfz=z21oy=OuioA@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: fix software rendering
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Mar 29, 2022 at 4:34 PM Adrian Perez de Castro
<aperez@igalia.com> wrote:
>
> Hi James,
>
> On Tue, 29 Mar 2022 10:40:36 -0600 James Hilliard <james.hilliard1@gmail.com> wrote:
> > We need to backport a patch to fix software rendering with cog.
>
> I have cherry-picked this fix (and one more) in the cog-0.12 branch, and I am
> planning to release version 0.12.4 in the next hours. WDYT about waiting
> until we have that and skip ahead to .4 -- that way it will not be needed to
> import this patch in Buildroot.

Yeah, that's probably better.

>
> Cheers,
> -Adrian
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  ...K_VERSION-macro-name-and-fdo-buffer-.patch | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch
> >
> > diff --git a/package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch b/package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch
> > new file mode 100644
> > index 0000000000..fec21c225c
> > --- /dev/null
> > +++ b/package/cog/0001-Fix-WPE_FDO_CHECK_VERSION-macro-name-and-fdo-buffer-.patch
> > @@ -0,0 +1,42 @@
> > +From 717fadb2f16fcb28b3b72dc6d796c8ce9ae14afc Mon Sep 17 00:00:00 2001
> > +From: James Hilliard <james.hilliard1@gmail.com>
> > +Date: Sat, 26 Mar 2022 13:30:47 -0600
> > +Subject: [PATCH] Fix WPE_FDO_CHECK_VERSION macro name and fdo buffer release
> > + function name.
> > +
> > +(cherry picked from commit d2720103ff8a5c3c5c056487586ed0b5acdc2b91)
> > +
> > +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > +[james.hilliard1@gmail.com: backport from upstream commit
> > +717fadb2f16fcb28b3b72dc6d796c8ce9ae14afc]
> > +---
> > + platform/wayland/cog-platform-wl.c | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/platform/wayland/cog-platform-wl.c b/platform/wayland/cog-platform-wl.c
> > +index 0ff9e6f..46c5185 100644
> > +--- a/platform/wayland/cog-platform-wl.c
> > ++++ b/platform/wayland/cog-platform-wl.c
> > +@@ -63,7 +63,7 @@
> > +
> > + #define DEFAULT_ZOOM_STEP 0.1f
> > +
> > +-#if defined(WPE_WL_CHECK_VERSION)
> > ++#if defined(WPE_FDO_CHECK_VERSION)
> > + #    define HAVE_SHM_EXPORTED_BUFFER WPE_FDO_CHECK_VERSION(1, 9, 0)
> > + #    define HAVE_FULLSCREEN_HANDLING WPE_FDO_CHECK_VERSION(1, 11, 1)
> > + #else
> > +@@ -1705,8 +1705,8 @@ static void
> > + shm_buffer_destroy(struct shm_buffer *buffer)
> > + {
> > +     if (buffer->exported_buffer) {
> > +-        wpe_view_backend_exportable_wl_egl_dispatch_release_shm_exported_buffer(wpe_host_data.exportable,
> > +-                                                                                buffer->exported_buffer);
> > ++        wpe_view_backend_exportable_fdo_egl_dispatch_release_shm_exported_buffer(wpe_host_data.exportable,
> > ++                                                                                 buffer->exported_buffer);
> > +     }
> > +
> > +     wl_buffer_destroy(buffer->buffer);
> > +--
> > +2.25.1
> > +
> > --
> > 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
