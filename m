Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6390FC43334
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 15:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE5008405A;
	Thu, 21 Jul 2022 15:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE5008405A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6q1RN7KHoSh; Thu, 21 Jul 2022 15:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1EA08404F;
	Thu, 21 Jul 2022 15:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1EA08404F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2D41BF338
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7871F419B4
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7871F419B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpljP0oamPf2 for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 15:00:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6565540876
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6565540876
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:00:01 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id b81so842759vkf.1
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 08:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzyTjsXlP+yCgUvQc8vjI8VY6FrV7C/GKCHn+XwhCIU=;
 b=6HI5dogebjy7ll3BItv0+AyAXkq3/TGyfLHjWpjR6FTj6FiO6jlEwvWH8zs92iMnqr
 B9EjT0Su4cgx69kMV62SFJ65wtEw9uwWbANq/V3KZ869NI2SfLOptgyZN23xRIlrmWR8
 G6SM3NHGoXxO0wkM4s/OR+O+VHS+2Pd1+VFn88LXNY2gXiuAdd757+vNGHylbNGjBsv8
 YSAgmsLQ+Rl9X4vopSQwDjd/S0NfdPnLZteHPsIsfX277Nod0R6cXvL7jsKKMSbGDmb9
 6tIyfeuEbfzL051QSk7uTxb4uprjkK6q82ZAiToLgeTH0dt49eCcg3tejQ8VKZ/uRl4V
 4rqQ==
X-Gm-Message-State: AJIora88iYdUh6HCKdkgsv10I4tGCOJcOuU9rqg8OR3W7SY/MyeK0Xo9
 722ST6euJ97Ka6uWrI3Vb0ehkweWuATwGC95b6Mvhhp+
X-Google-Smtp-Source: AGRyM1tW9sp/SHLunpPaYrQ7wvbAZ0YVdALzTZYS2Z7yaYaGoYp/3qKdioIPJX2z1QYeEsShVXOI5ZsBaxfdVWiSUK4=
X-Received: by 2002:a1f:164a:0:b0:376:20d:e8c8 with SMTP id
 71-20020a1f164a000000b00376020de8c8mr967583vkw.21.1658415600221; Thu, 21 Jul
 2022 08:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220719131605.337057-1-nolange79@gmail.com>
 <20220719131605.337057-2-nolange79@gmail.com>
 <20220719154504.GJ2249625@scaer>
In-Reply-To: <20220719154504.GJ2249625@scaer>
From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 21 Jul 2022 16:59:49 +0200
Message-ID: <CADYdroMqpgyCR0jyWdXR+UqiOSoNdKNN3OsGSSXDrBvR_RSyNw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PzyTjsXlP+yCgUvQc8vjI8VY6FrV7C/GKCHn+XwhCIU=;
 b=eWoeIHnQgwig6banfN9Thb2p8caY9+bmBQiLccWOqYmAl5cxOgChS3ASW1Nf9Vetcz
 yFGkau617Z0KrqKR1jyuECvi01JgQaYUXlSn9qBIGAc7VtWgish4MZiHgy5A1hU6EEoJ
 y8saJuxaPmx59vllVy3gUmlGXtVkWcCumsvnN23XQST40R0+SZ05BQCIfd3k6X9BexGn
 ycPnM63b7Fj2tSH/VFeAcJ/uFCWaGqAJXN/X2Mr3Ei6JhlbSSAZFIHSdeufQmEZqVcoS
 +k8ajBZJ4xUu84Q9/AMxa4bn1nFs0O9CKYGxKwhtRDDEq+kp+Sri37R9uJ1CCy1tXyrk
 Mnkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eWoeIHnQ
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: allow package to be
 used without init system
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

Am Di., 19. Juli 2022 um 17:45 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Norbert, All,
>
> On 2022-07-19 15:16 +0200, Norbert Lange spake thusly:
> > Allow systemd to be built as normal package, this for example
> > allows building systemd-boot without any init system.
>
> How has the situation with upstream evolved since last time the topic
> was raised here:
>     https://lore.kernel.org/buildroot/cover.1545814334.git.yann.morin.1998@free.fr/#t
> and especially the sub-thread:
>     https://lore.kernel.org/buildroot/d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr/
>
> As far as I know (and understand), upstream has decided to tie the build
> of systemd-boot (formerly the standalone gummiboot) to the build of the
> rest of the systemd suite; they did not accept to make it possible to
> only build systemd-boot to use it outside the systemd ecosystem.
>
> From Buildroot's perspective, allowing to build systemd without it being
> an init system, and without the possibility to just build systemd-boot,
> is asking for troubles down the line.
>
> The triviality of your patch does not make it possible to only just
> build systemd-boot; instead, it still builds the whole systemd suite,
> which hints that upstream did not make it possible to do separate
> builds.

This was an example, and I do just that, even you built more than just
systemd-boot, picking "no init" speeds things up a bit.

> So, unless things have evolved substantially, I am not very fond of
> alowing this, and stand by the decision that was made back then (i.e.
> abide by upstream decision and tie systemd-boot to the systemd
> ecosystem).

I want to build systemd without using it as init system. Is there any
reason to artificially prohibit that?
It's just a regular package for me.

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
