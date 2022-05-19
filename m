Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846E1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 13:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E84C7408B0;
	Thu, 19 May 2022 13:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXeiOhoOK5KP; Thu, 19 May 2022 13:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0296E405C2;
	Thu, 19 May 2022 13:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 222171BF388
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 13:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EFBB81279
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 13:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uG8LI0HEHwRV for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 13:41:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C7C8801D5
 for <buildroot@buildroot.org>; Thu, 19 May 2022 13:41:25 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id fd25so7049612edb.3
 for <buildroot@buildroot.org>; Thu, 19 May 2022 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PC4YBhoXYVvqvhAZTME3D4TOmDTRPDUnKicqZx2EaqE=;
 b=PxPyXWLwi6FIWsHXCsrSJGfjwIQtaFZK9dWBR9NtpumCkJICnUul/muqVzYbgNBs6y
 jv2gH2WmKJA1ik2CDTEcGYTGwWAQhEDkSBqwZesLyi0zb9FAOjLfdwMj6YC0YyW6D29V
 0bI/D0/BnDyLx2W8a02cv1QZfyguJmSw7RYfiCEmuZ46AlD5QewTVrG+fPg/UOXDfFXk
 CMzUx8pI7ZL022NE/dIKdvddsaMw80pIDLgnObs/kZ+nyIkpojyMgDDYTQUwQjOqKEnr
 W/6qwTLgeWqOQt7P3xveJTgNG0TZ4XE8n+XN6EOQGhjj0GzgSnKU5CuK/b7WadlvbqLu
 vo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PC4YBhoXYVvqvhAZTME3D4TOmDTRPDUnKicqZx2EaqE=;
 b=Whihzr6tGHt8cbqMBEd1lLxe2Fz4YlFsa6I/Vh1sF9T7idza5y3DV7n34Era58j18C
 ZtYpknis920iJtgjjaTzGJeCWxvITRLNLUaIN2Yh0tHGm8znbVM/iPyCfsYwibxQIEjl
 90e3hdExlKYiepudTzjn22+tvHTxSHR5sqqzEUl2gmBAw9QxbCy4BUCPxSbRHACkp/Bw
 PtWOTUcE0Uvw6eIc2ugkKJ9Mp7dHpsw/Qak7vDDxImpIXcUWbZohFbPt9iEnGvi70fGu
 qHvEAt7OV7UydtQIeD1wSUVGrjxIMYePMegzQh0hGDRVx02bi85TergQdFzMGkJgMao6
 wSLg==
X-Gm-Message-State: AOAM531BMiSu5rhCknurVBw7i5P8u1SajrKv70hUcG39H0bHA4KkEkjE
 8yrDQU+0kaidX7Qo8bB9XCakRVvEsl3u/+UMFGg=
X-Google-Smtp-Source: ABdhPJy84NNE0JZRlCFyhNjGW8buMCBfoFapg7Tm2NEG6CM76GDcVK8NVFxhAqFY9OhdLRZwZ2Jf2Q91CSIYIEBG4gc=
X-Received: by 2002:a05:6402:75a:b0:42a:bbb9:504c with SMTP id
 p26-20020a056402075a00b0042abbb9504cmr5519758edy.348.1652967683426; Thu, 19
 May 2022 06:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
 <20220516131334.1910858-2-johan.oudinet@gmail.com>
 <20220516213202.GJ1597494@scaer>
In-Reply-To: <20220516213202.GJ1597494@scaer>
From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 19 May 2022 15:41:11 +0200
Message-ID: <CAJtjsKbMYmXGi86Ugo=QNk3edQPnsLMPNg6P6kkSBbRKBPvm=w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 01/20] package/erlang-idna: remove
 unicode_util_compat library
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

Hi Yann, All,

On Mon, May 16, 2022 at 11:32 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> We're still on elran-idna 6.0.0.
>
> But as there's been no new release sine 2020-12-05, and no new commit
> since about the same day, and since the patch you are adding is the only
> commit since 6.1.1., maybe we should just bump to the latest commit in
> the repository?

Initially, I haven't bumped the version to 6.1.1 for two reasons:
- ejabberd still depends on 6.0.0 and I was not sure if it would be
compatible with a more recent version of this library.
- The changelog says version 6.1.0 dropped support for rebar2. I was
afraid it would be difficult to integrate such a version in Buildroot,
because the rebar infrastructure is based on rebar2. I have no idea
how long it would take to add support for rebar3 in buildroot.

Since my goal was to upgrade ejabberd, I took the simple path to
backport the only needed patch to drop the dependency on
unicode_util_compat library.
However, you're right it would be cleaner to bump the version of this
erlang package to master. I've just done that and it was easier than
expected and ejabberd still works with this version. I'm sending a new
version of the whole series. Thanks.
-- 
Johan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
