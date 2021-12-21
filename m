Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 19:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186D14159A;
	Tue, 21 Dec 2021 19:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGPTT8jZO6yd; Tue, 21 Dec 2021 19:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1394158B;
	Tue, 21 Dec 2021 19:08:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2341BF3C9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 19:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 973F94158B
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 19:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rt3smkTbRrlA for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 19:08:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 627A740907
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 19:08:11 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v22-20020a9d4e96000000b005799790cf0bso5353579otk.5
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 11:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9L0IlCGpvMndgXq8hwmOE7xCASPo7/+PgN9modWckQ=;
 b=jGdPDLHw+WJsJfJrv//kcSlFCqRIiRjj574RXgRXAMkay91neCmgvTBXQUnzhCXQ78
 lSW623F2DYUyYhFChNq7NQw+4s6mVljhvO7X+WS2EB6WPwdo9tmTrgPFbpvxic6tWiAv
 ONWjp2k1x/9ItLbt0JhM8VGGi6Iz7lo8WUN4f9UDET1ko7nqmV1Der3wRh2p0/YW4Hq3
 eAS7sl3dqGbRS6eJLLT0ErqX1C5tOsEra5avQRtdYRbcUPUv2kL5VqDWxnFa4/vmbkRU
 Q6woTt6nH55OtrovDqa9dhmO3wOoADqhTKE1QpdW+rNx2toKd40xWVFC9kapIU+s0M/D
 Cauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9L0IlCGpvMndgXq8hwmOE7xCASPo7/+PgN9modWckQ=;
 b=GckPte/RvPdINnfATliEyTUCqPZWpTqQ/7GBv6ATFtvbEQ39Qb5McByU78vxmbGE/g
 LScEIiUZkQp+ezbNTgOEScQVFd2hS8FwPU9+ljgQe7yOZifwoHnhQcCcFDroieuKWlSJ
 Wbvn/yNv3+4f7lXnYrqW3W4si0Et5m3V2cifmxgz5i/1YuHrLKpo8qTX8taelWw1V2uo
 QCP5dd2lc5iycQ7SGK3eJd1Va27W815EinXerGCF+/OqZvOHWTr5LT04vUMwHQEsNTX/
 4inRDjmOx7zAyQX6qXx2vmXKiVERl5mh8HJWK8GYnsS/WmgFHJLu9P5cVKRHoY8Q/no9
 OtYw==
X-Gm-Message-State: AOAM533U7xlSmDRxCdB2slo0zkAtpkxJNjDy7J4fx2+uMvW3QLeBJqrj
 FI1su8LT9VUYdxvyHMcMaN171tR6gEOFF8BVxV4=
X-Google-Smtp-Source: ABdhPJx6uUxaNVW83jazcciNZZG/9fbNPZilS7QinfU57BSLufsxC61m+c6Zl/c4oZzBifBt8TPPA2vyxpCAKBMqJAo=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr3297453otm.167.1640113690281; 
 Tue, 21 Dec 2021 11:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20211220084645.28659-1-james.hilliard1@gmail.com>
 <7f99f3a3-cc60-a874-afbf-8f89259f63ff@mind.be>
In-Reply-To: <7f99f3a3-cc60-a874-afbf-8f89259f63ff@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 21 Dec 2021 12:07:59 -0700
Message-ID: <CADvTj4rb=3jCU6+bBOM7GEt2Cym5pSTJELWcAiwN-Uup+LxwQA@mail.gmail.com>
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

On Mon, Dec 20, 2021 at 3:34 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 20/12/2021 09:46, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/connman/connman.mk | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> > index e5e596c973..d3ebb40a1c 100644
> > --- a/package/connman/connman.mk
> > +++ b/package/connman/connman.mk
> > @@ -85,6 +85,13 @@ else
> >   CONNMAN_CONF_OPTS += --disable-wispr
> >   endif
> >
> > +ifeq ($(BR2_PACKAGE_IWD),y)
> > +CONNMAN_CONF_OPTS += --enable-iwd
>
>   No need to add iwd to CONNMAN_DEPENDENCIES?

From what I can tell iwd is only needed at runtime.

>
>   Regards,
>   Arnout
>
> > +else
> > +CONNMAN_CONF_OPTS += --disable-iwd
> > +endif
> > +
> > +
> >   define CONNMAN_INSTALL_INIT_SYSV
> >       $(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
> >   endef
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
