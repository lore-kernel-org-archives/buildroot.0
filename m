Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F76BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 13:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D666B408EA;
	Mon, 14 Nov 2022 13:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D666B408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyjm9H3NF-it; Mon, 14 Nov 2022 13:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C4D40347;
	Mon, 14 Nov 2022 13:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C4D40347
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3DC1BF379
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24F0060DFC
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 13:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F0060DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdVqgV2131uW for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 13:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B970160DFA
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B970160DFA
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 13:35:47 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id l6so10370776pjj.0
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 05:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ucpbgfsMkDFsz567f0EbKzVzP1y1Dc5YGNyBDzTb5+A=;
 b=hJI831fVVJ9+QRwQdaF+2J85Ji78Y1DjVqLZteehDouiPALUjkQNqAsBAYPSYyFacF
 w2eZt3bUZ0N6sKX4Dd8UUveLnV5BYf5vcfpaf1HQzZhzRvZbM3gsx8ysgNL6k1xzB6re
 Oqq7U+GtfPYDzUSB+xFiOL2RoeNzQ6g21KKO5k+vj8NLbidwyOjxppDCDsMrM/lln3iB
 rZK0RyXbxz7/JMz2Ik95cJPRy+vuMcvmrVTAM3QUSr5ugU12ZY57/z8YaWP/jnMp5DXd
 V+e+Mui17JGjJdbnh9cPtCZTVOgUU7jK2bmCD1uVG5/nkGX/hB8ma1tWFp2lzNOmFYxn
 Ax6g==
X-Gm-Message-State: ANoB5pmVuRA8IlWXgMBEbspqTSqqhvGCx0w2aVfg9xtHizWJ9iEkPXke
 kzlOozpwEibrBhR4NxUwPhLu3fx3NtijUfsD8BK/cIaMLKxxsQ==
X-Google-Smtp-Source: AA0mqf5f5b32FFWChEBMdVxmlV06i3M+evTAAe6Kxzur6zZcDvGj6/Rpb4col8r5RWybbm4h5o54GqKfm5K5yoSl6EE=
X-Received: by 2002:a17:902:d587:b0:186:878e:3b0d with SMTP id
 k7-20020a170902d58700b00186878e3b0dmr13400107plh.149.1668432946965; Mon, 14
 Nov 2022 05:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20221031174959.604094-1-james.hilliard1@gmail.com>
 <VI1P190MB0493457FD4CA083C3A5D56FF9F059@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <VI1P190MB0493457FD4CA083C3A5D56FF9F059@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Nov 2022 09:35:35 -0400
Message-ID: <CADvTj4rd1Zo=Gju2jgvw6NDjsKBP-T+xYFTw+dJX_YLA+8kvVQ@mail.gmail.com>
To: Lang Daniel <d.lang@abatec.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ucpbgfsMkDFsz567f0EbKzVzP1y1Dc5YGNyBDzTb5+A=;
 b=Afj7D8LwRwjG0UHZx3/3mPRIfBlo6Xqj4zLnk7V5zxApMHjADOX2ssOVFEjgC+Bu7O
 qflPLNaARpro+dhCaipK9IL4xsV4y0ysIBZMTJSBweWr5r0GYViAIuzLgnv4Nt7JvJV4
 +bvuhRqGa+8wDKDg9dDuzw8UZxqO0wnxLWqxRX17On8eDGLjQvmqxFw6jRqry5Z/qYVg
 kUE7PouYCYsATRgOrIidGMQrmjrJhx5MsgbcSZ4l9sukTXDt1Rf5+pe0zPQ6/gznmTGf
 lRiTNOhS9oktn0dXSlRTXHYqQpU3MSS0ulGrZ0gq3dUsUi2K98jwMYsC4kDDXhu8hpt2
 bJbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Afj7D8Lw
Subject: Re: [Buildroot] [PATCH v3 1/1] package/iwd: add dbus compile time
 dependency
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 14, 2022 at 3:18 AM Lang Daniel <d.lang@abatec.at> wrote:
>
> Hi James,
>
> > In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
> > dependency, however we still need it when building with systemd so
> > that the service directory is available via pkg-config.
>
> Sorry for getting this whole mess started.
> I only did a compile test without systemd before submitting the patch.
>
> I guess the comment in package/iwd/Config.in:8 should be removed then,
> since that's what got me started.

It's not entirely wrong as dbus isn't strictly needed as a build dependency,
see discussion in my original v1 fix patch which leaves it as runtime only:
https://patchwork.ozlabs.org/project/buildroot/patch/20221031010904.1109541-1-james.hilliard1@gmail.com/

>
> > In addition we can drop --with-dbus-datadir by unconditionally
> > requiring dbus as the datadir will then be fetched from pkg-config.
> >
> > Fixes:
> > checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >   - always depend on dbus
> > Changes v1 -> v2:
> >   - depend on dbus when depending on systemd
> > ---
> >  package/iwd/iwd.mk | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> > index 002988cf33..5ffbde334e 100644
> > --- a/package/iwd/iwd.mk
> > +++ b/package/iwd/iwd.mk
> > @@ -16,9 +16,8 @@ IWD_SELINUX_MODULES = networkmanager
> >  IWD_CONF_OPTS = \
> >          --disable-manual-pages \
> >          --enable-external-ell \
> > -       --enable-dbus-policy \
> > -       --with-dbus-datadir=/usr/share
> > -IWD_DEPENDENCIES = ell
> > +       --enable-dbus-policy
> > +IWD_DEPENDENCIES = dbus ell
> >
> >  ifeq ($(BR2_PACKAGE_READLINE),y)
> >  # iwd client depends on readline (GPL-3.0+)
> > --
> > 2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
