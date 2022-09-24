Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45870C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 21:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8FA940142;
	Sat, 24 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8FA940142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gime4_8BW4Wc; Sat, 24 Sep 2022 21:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07FE640136;
	Sat, 24 Sep 2022 21:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07FE640136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E73331BF28D
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2DD983F25
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 21:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2DD983F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxhGif5n2LTW for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 21:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8133483F1E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8133483F1E
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 21:00:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 487E7E0007;
 Sat, 24 Sep 2022 21:00:22 +0000 (UTC)
Date: Sat, 24 Sep 2022 23:00:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220924230021.23e6a310@windsurf>
In-Reply-To: <20220924153729.GF1127102@scaer>
References: <20220924150726.1402747-1-thomas.petazzoni@bootlin.com>
 <20220924153729.GF1127102@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664053223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w9o1eHxUcLgkQXXcTOUALIrOWQg9C7zUqjYRaPNU4cA=;
 b=DQ0cG3ChLBl+45U0KvRIIznFNoyq0sdL5rvGwq6vJNQPNqrCu8vkN3Hrwr2TMvTwAMjzlk
 HkKhchQUzFSN6HmHYMtkICiZErIUFc+lOBJDPcgODBO1XoSLI9OBlgXqYTz4npFo0bdvek
 jqIqQfW4ARrL+2oYx0/dk/lDpop6OhT085K8XxR3+5ItvT2iU6dSqg5L2PuDy85x/3DWJP
 8UC0K+1p6cbzW6dbXME24iIRxBgk6jnLXPglMrqYksUzpm6w5ebhsEp+VIDmsvT0J6OCo3
 jPrSmMdEz9wZB5ET/8szo5zGZb4XtNvae3VDSNZqHVF4UAZWnXkdbw7qShzMvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQ0cG3Ch
Subject: Re: [Buildroot] [PATCH] package/opengl/libegl: remove
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Buildroot List <buildroot@buildroot.org>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

Thanks for the review!

On Sat, 24 Sep 2022 17:37:29 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, what I understood from upstream commit log, was that NVIdia driver
> does have a libwayland-egl, but our nvidia-driver does not install one.
> 
> So, there seems to be no conflict. Still, this is strange that our
> nvidia-driver did select BR2_PACKAGE_HAS_LIBEGL_WAYLAND without
> installing libwayland-egl.so...

It just works because libwayland-egl.so is now provided by the wayland
package.

> > -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
> > +	depends on BR2_PACKAGE_HAS_LIBEGL || \  
> 
> I am not sure this is equivalent in this case: indeed, it is possivble
> to have EGL without having wayland enabled, and there currently is
> nothing that enforces wayland to be enabled for vte, even conditionally.

In the context of package/vte, the depends on
BR2_PACKAGE_LIBEGL_WAYLAND was useless. Look:

        depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
                BR2_PACKAGE_HAS_LIBGL
        depends on BR2_PACKAGE_XORG7

See the "depends on BR2_PACKAGE_XORG7" ? So we certainly cannot be in a
wayland situation with the vte package. So you might wonder why there
is a depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND. Simply because it is a
dependency inherited from libgtk3.

So my patch is simply propagating again the dependency from libgtk3 to
vte.

> > diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> > index 5e71473640..1c7c8a98df 100644
> > --- a/package/weston/weston.mk
> > +++ b/package/weston/weston.mk
> > @@ -71,7 +71,7 @@ else
> >  WESTON_CONF_OPTS += -Ddeprecated-weston-launch=false
> >  endif
> >  
> > -ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
> > +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)  
> 
> Why can we drop the BR2_PACKAGE_HAS_LIBEGL entirely here?
> 
> As far as I can see and remember, the two are orthogonal (even if GLES
> is in practice most often used in conjunction with EGL rather than full
> GL).

That's a very good point, I'll fix that and send a v2. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
