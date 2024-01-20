Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869F4C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3836D4216A;
	Sat, 20 Jan 2024 21:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3836D4216A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghhYvrj7WnbM; Sat, 20 Jan 2024 21:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2794342175;
	Sat, 20 Jan 2024 21:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2794342175
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D78D1BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75CF340936
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CF340936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_lO0IFVxcY5 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:43:56 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89A2C41749
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A2C41749
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E423913F88E;
 Sat, 20 Jan 2024 22:43:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 22:43:50 +0100
Date: Sat, 20 Jan 2024 22:43:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <Zaw-lqbBKdMnbOMF@landeda>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705787033;
 bh=4Ikdkrr3mUOynA8Jb/mxh0w2W108wXK9dBu3nOjxhVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLss6eJKwbWcF2fXqg/hiZilBlh3lEXtu0w/qSoBavYr1da4qC8siRufslvDs2EwE
 7ce6Dm5xglvlP3bzhhKI7umrKzOw5wMXyl+G8tNgQc/527uFnLWsDbcMO47Gd+xnl/
 hMj8GQB9ddGto3oq7GYAJxIFPy9I3cGZxiLIGQPsR2++niY7rLSHubnO6yjZHjLTSy
 7l6VAHTu2yv5VzRjWt2TcIVTRU5DN0FHd6x1qbsF69Ug6DbCAsTKkUkpMSp+TX2wyE
 rWizAHnGG7gDtuKzmilMMx+KON8FYLgB4f3ym3oiOm+QtQ7WsUaQtun+Mz/SqzFRcQ
 L4mInqfTNU+vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cLss6eJK
Subject: Re: [Buildroot] [PATCH v3 00/10] more flutter package improvements
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2024-01-17 15:50 -0700, Adam Duskett spake thusly:
> Change v2 -> v3:
>   - Bump flutter-sdk-bin to 3.16.8
>   - Bump flutter-engine to 3.16.8
>   - Bump flutter-pi to 75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
> 
> Changes v1 -> v2:
>   - Bump flutter-sdk-bin to 3.16.7
>   - Bump flutter-engine to 3.16.7
> 
> Most of these are self-explanitory and simple, however the depot-tools version
> bump should be explained:
> 
> The current depot-tools version is from Jul 13 2023, and there is a bug where
> when building with PPD enabled, building a Flutter application on my laptop
> running Fedora 39 or even in the Debian 11 container fails due to permission
> issues when running rsync such as:
> 
> /usr/bin/sed: couldn't open temporary file [...]/output/per-package/flutter-gallery/host/share/flutter/sdk/.vpython-root/0e1e32/lib/python3.8/sed763MrF: Permission denied
> make: *** [package/pkg-generic.mk:267: [...]/output/build/flutter-gallery-2.10.2/.stamp_configured] Error 123
> 
> After several hours of attempting to find the exact cause of the issue by
> parsing git logs of the depot_tools repository and cross-referencing bugs on
> https://bugs.chromium.org/p/chromium/issues I am unable to determine the exact
> reason why the problem occurs or the exact commit that fixes the issue.
> 
> However, updating depot-tools does indeed fix the issue, and looking at the
> source code between 4e87f5bf and 8d14454b shows improvements to several bash
> scripts, such as gclient, vpython3, and spid. All of which could be culprits
> of this bug. As flutter-engine is the only package that uses host-depot-tools,
> it is safe to update.
> 
> This permission bug is present on PPD and normal builds, but causes a build
> to crash only on PPD because of rsyncing. On non-ppd builds, the bug only
> causes some minor annoyance when trying to run `make clean` because permission
> denials crop up when trying to remove the .vpython-root directory.

The explanation for the depot-tools bump was very good, so I copied that
as the commit log for the corresponding patch.

> I can't remember, but I * think * the autobuilders don't select PPD yet, which
> is probably why this bug hasn't caused any autobuild failures yet.

Yes, PPD is enabled randomly on the autobuilders. That we have no such
failure for now is probably due to the low probability we end up having
a selection of packages enough to build a flutter app.

I'll reply to individual patches where I have some comments.

Regards,
Yann E. MORIN.

> As for everything else:
>   - Tested on Fedora 39 and Debian 11.
>   - PPD and Non-PPD.
>   - Docker and host.
> 
> Everything passes and works as expected.
> 
> Thanks!
> 
> Adam Duskett (10):
>   package/ivi-homescreen: add standard_method_codec.h to keyboard
>     manager plugin
>   package/depot-tools: bump version to
>     8d14454ba4a35fd9d2483842b08815a2357ec86f
>   package/flutter-engine/Config.in: Drop nptl dependency
>   package/flutter-sdk-bin: bump version to 3.16.8
>   package/flutter-engine: bump version to 3.16.8
>   package/flutter-pi: bump version to
>     75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
>   package/flutter-pi/Config.in: propagate flutter-engine dependencies
>   package/flutter-gallery: add a configure step
>   package/flutter-gallery: fix build options
>   package/flutter-gallery: clean up install_target_cmds
> 
>  package/depot-tools/depot-tools.hash          |  2 +-
>  package/depot-tools/depot-tools.mk            |  2 +-
>  package/flutter-engine/Config.in              | 10 +++---
>  package/flutter-engine/flutter-engine.mk      |  2 +-
>  package/flutter-gallery/flutter-gallery.mk    | 24 ++++++++++----
>  package/flutter-pi/Config.in                  | 31 +++++++++++++++++--
>  package/flutter-pi/flutter-pi.hash            |  2 +-
>  package/flutter-pi/flutter-pi.mk              |  2 +-
>  package/flutter-sdk-bin/flutter-sdk-bin.hash  |  2 +-
>  package/flutter-sdk-bin/flutter-sdk-bin.mk    |  2 +-
>  ...rs-to-the-audio-players-and-keyboar.patch} | 26 ++++++++++++++--
>  11 files changed, 81 insertions(+), 24 deletions(-)
>  rename package/ivi-homescreen/{0001-add-missing-headers-to-the-audio-players-plugin.patch => 0001-add-missing-headers-to-the-audio-players-and-keyboar.patch} (77%)
> 
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
