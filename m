Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05ABC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 708CD60888;
	Sat,  8 Jan 2022 21:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pLZF60wXt0k; Sat,  8 Jan 2022 21:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59CC607F2;
	Sat,  8 Jan 2022 21:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66B661BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 553D0607F2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aI1EYVbfyCbY for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:31:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ABBC607A1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 21:31:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h2so29395189lfv.9
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 13:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGhYyM2VlgKc/m9mKB6FnvJIvfy+6SfoDLAqTA7HiOA=;
 b=mJN1EBdRidiCBqsNxVOdJTapiYoPJts3sXVYQg++4qhpJn1URnXJ5pL0Ze9Y6N0NPx
 qMpbmfYWE4f2Ub2V8Gi4vh2h7M6g64tO4Ccif21azBCyEITZors4wRdBZvpxznd/Y58H
 oY0ZkGmtTyAjbWH5B1yYHY/7rOBPVhXMNCR1sVUyRQCe+Spr80ZuIi89RFknBvNMyylb
 W8bT0L0GXKppmQa05rZrCiAT7b95WjrQN+IVkPwA/CYAeDvuLjgiU57x38hHXdCdxChz
 1VwwCA87ZMmsaH2rBdZlNKe2/OaJlMrkqi0dWuqTiuY8ov1ucsungfMG/icurcUk1Uav
 VlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGhYyM2VlgKc/m9mKB6FnvJIvfy+6SfoDLAqTA7HiOA=;
 b=oE1lr/Qy4Bw90G6f/Z63qsqfkSmJkKp9bVZDSKSk5c0zk930e90DnUfcxhtXUKYJMG
 rZ5gPh2Cx7+Sfm5TNMGxU7hSwSb5IhTLENE/pBZQy5VkuT+1fBypKkF1s5eRAmoueHfS
 v5zWLg5cznYdTEE9rSuI9ye24ln3UYfi2gjFWMv4u1YuZGbge+KHRABQVftCioOak/G3
 QUU8KVv0Ybht30QB5mnGKxWfFhwsPHfogdyS9PfWFJV8ArjyGEjJKv2t+L+gBTkmCsY6
 dUU9+zdZfxO9pDHP9Bak/ELzkNRecO6zA0aWoyWLnNhExRElFKmm/Gjks53J4brbj/ue
 tp4g==
X-Gm-Message-State: AOAM5314qNa1Rggpy3KmspCLC38pPQ5oBDohKzlK4XjrYL0JJmTxPln7
 OCZ9smXlAD4LRpgIubd7orGpRtuPaLFv/glTa8XR59QZxQc=
X-Google-Smtp-Source: ABdhPJxc4pYXbOoSG6AgPDmF/HhzTX5swWIM2RvU4RUxyL37T3BYglEMkUhHOzXpQJNp5F2M4WsowHS6MpUKJU0f+AE=
X-Received: by 2002:ac2:520d:: with SMTP id a13mr92166lfl.501.1641677503591;
 Sat, 08 Jan 2022 13:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126152832.1115350-1-nolange79@gmail.com>
 <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
In-Reply-To: <CADvTj4p=60BwS0f6+UZABNYRw6BYph+qkTU7L9Gv+=LOJewsMQ@mail.gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 8 Jan 2022 22:31:32 +0100
Message-ID: <CADYdroOofT_jFTyAFuTd+iZGbmYwFwofJ8aHYnuz4TAbk4C80A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: Allow extra config
 options
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
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sa., 8. Jan. 2022 um 20:04 Uhr schrieb James Hilliard
<james.hilliard1@gmail.com>:
>
> On Thu, Nov 26, 2020 at 8:28 AM Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Systemd has very many options, adding a way for the user
> > to set custom options can help customizations
> > without changing buildroot files.
>
> I'm not sure this is a good idea, if a configuration option needs
> customizability it
> probably needs a specific kconfig option. Systemd config options tend to require
> dependency selection and special handling so this seems likely to cause
> spurious errors due to improper usage. Seems to be a pretty big footgun IMO.

Sure, you are aware that many of my buildroot patches are stuck in limbo
since early 2020?
Just doesnt seem feasible to timely fix everything and version bumps often leave
more untapped options. Some part of the necessity would be just being pragmatic.

One example would be using the unified cgroups hierarchy
(-Ddefault-hierarchy=unified), hybrid is pretty much deprecated,
and some systemd features that buildroot allows to enable (OOMD for example)
wont work without it.

>
> What systemd configure option would you want to be using that isn't
> currently able to be enabled?

FYI those are the ones I currently use:

-Ddefault-hierarchy=unified \
-Dutmp=false \
-Ddefault-dnssec=no \
-Didn=false \
-Denvironment-d=false \
-Dxdg-autostart=false \
-Ddns-over-tls=false \
-Ddefault-llmnr=no \
-Ddns-over-tls=false \
-Ddefault-mdns=no \
-Dlz4=false

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
