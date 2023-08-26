Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F31C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 22:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 001EC820FB;
	Sat, 26 Aug 2023 22:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 001EC820FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mU43XmTnVqfg; Sat, 26 Aug 2023 22:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463A3820F4;
	Sat, 26 Aug 2023 22:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463A3820F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3323E1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 22:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00F33400FB
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 22:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F33400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp7dUVqpV7Vy for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 22:27:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C43B400EF
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 22:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C43B400EF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5617040002;
 Sat, 26 Aug 2023 22:27:28 +0000 (UTC)
Date: Sun, 27 Aug 2023 00:27:27 +0200
To: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <20230827002727.24097d99@windsurf>
In-Reply-To: <SN4P221MB068213B5F9C9C24C43CBB99AA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
References: <SN4P221MB068213B5F9C9C24C43CBB99AA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693088849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ICgT1Ch7v0o411C2D0pjaPv09kgBOUzz4GQcEHv54A=;
 b=pDkiNngvDMGBFHAr1HLyIn74gRFLwQ1qT0dw5+l6k1ToKZMxoOOdAxe2Xv6yCu6lqiPbuL
 Cjgxqj9RewFV7e0UHZUpZsjg3VznsfpyKyrMJxecf6OD0/dYe+l/QcA1grj6HxWqjCFdEw
 O2oXqcNJLqGFXWGp3xBzLmjNSIZk+D9Ag2Xg5+IZ/snCkRnVQoC8nbJWurJBBIoDQM7mm5
 ehgrIW4BFyYEwi5OXK5oBhdQgw/dDaZ3bgZDefm7nT5seQxunsQgSU+UidxKzoiTkdMM59
 wd/Pq5kpKkN1zKr8Nec54yUDkgAjfzVDEFz567mjdb7Hb9VQhO+9Ye2tFYNyNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pDkiNngv
Subject: Re: [Buildroot] [PATCH 0/4] support ignore-indent for check-package
 configs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ricardo,

Since you're the main maintainer of the check-package logic, I really
would like to have your opinion about the approach taken in this patch
series. I think the feature makes sense, but I don't know if the
implementation is really in line with the philosophy of the existing
code. If you could give your opinion, it would be very useful.

Thanks!

Thomas

On Sat, 29 Apr 2023 14:12:01 -0400
James Knight <james.d.knight@live.com> wrote:

> The following series brings support for having a linter hint in
> configuration files to avoid having `check-package` warn about bad
> indentations for container-like configurations.
> 
> Buildroot ignores indentations for the root package configurations as
> well as kodi/x11r7 packages. These configurations reference other
> configurations, which makes it somewhat preferred to indent packages
> under a menu option. For example:
> 
>     menu "<category>"
>         source "package/<ref>/Config.in"
>         ...
>     endmenu
> 
> To prevent `check-package` from triggering a warning, an internal list
> inside `lib_config.py` is maintained. This is less than ideal since (1)
> it requires adjusting the library script if future "category"
> configurations are added/removed, and (2) does not provide a way for
> br2-external trees to utilize the same exceptions. For example, if a
> br2-external tree manages a `Config.in` with pending upstream packages:
> 
>     menu "Target packages (Queued upstream)"
>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg1/Config.in"
>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg2/Config.in"
>     endmenu
> 
> Utilizing Buildroot's `check-package` call on this file will generate an
> indentation warning.
> 
> What this series brings is the ability to add a `ignore-indent` flag
> into configuration scripts to avoid `check-package` from generating
> errors for select files. Continuing with the above example, adding the
> flag as follows will no longer generate an indentation error:
> 
>     # noqa: ignore-indent
>     menu "Target packages (Queued upstream)"
>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg1/Config.in"
>         source "$BR2_EXTERNAL_BAR_42_PATH/newpkg2/Config.in"
>     endmenu
> 
> This change allows dropping the internal list of configuration
> exceptions (for package/Config.in, package/Config.in.host, kodi and
> x11r7), to instead use the `ignore-indent` flag in the respective files.
> 
> James Knight (4):
>   utils/check-package: cleanup line reading
>   utils/check-package: support a file-state instance for library types
>   utils/check-package: support ignore-indent flag for configurations
>   utils/check-package: utilize ignore-indent flag for special configs
> 
>  package/Config.in                   |  2 ++
>  package/Config.in.host              |  2 ++
>  package/kodi/Config.in              |  2 ++
>  package/x11r7/Config.in             |  2 ++
>  utils/check-package                 | 30 ++++++++++++++++++---------
>  utils/checkpackagelib/base.py       |  2 +-
>  utils/checkpackagelib/lib.py        | 10 ++++-----
>  utils/checkpackagelib/lib_config.py | 32 ++++++++++++++++++++---------
>  utils/checkpackagelib/lib_hash.py   |  6 +++---
>  utils/checkpackagelib/lib_mk.py     | 22 ++++++++++----------
>  utils/checkpackagelib/lib_patch.py  |  6 +++---
>  utils/checkpackagelib/lib_sysv.py   |  4 ++--
>  utils/checkpackagelib/test_util.py  |  4 ++--
>  13 files changed, 77 insertions(+), 47 deletions(-)
> 
> --
> 2.40.1.windows.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
