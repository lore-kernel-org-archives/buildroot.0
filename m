Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAADCC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 07:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEBC81437;
	Mon,  8 Aug 2022 07:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FEBC81437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBeHjvyT7G9h; Mon,  8 Aug 2022 07:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BAF381425;
	Mon,  8 Aug 2022 07:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAF381425
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C6DF1BF3EB
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 07:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2556D400FB
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 07:15:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2556D400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C_NM2XhY25P3 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 07:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E00400C5
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0E00400C5
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 07:15:35 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id m2so7780783pls.4
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 00:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Kxu/BCE49DZ033nPQa4DSkndy6Sw0LjM35KH5g0fXPc=;
 b=Gf50zeQ6btBjMsobaHsAP5QhvgIowaoWhNi/sp2D2AiYzYZoY+TmT2uqxnjMxm9UCe
 N0BHYMbvJZcdesesqA0UQ+IiR5n9Xbw2tXub0uJRuwkFraGZ4ShoothRbdVrSBX9Q8Au
 Rd0xQfIELPI53z3WAN5LbQs90mRagfrZ86UKHxqEJAQFgLlr6lCH6jMabNIrXkNv5a3+
 fFX+nVI0z5vQAe+pSzP2/8MDdrHWxFo5djR1bxcfrdTyPM/cr6VwQE8CIBn+2sAsvlap
 OSXZFaik3dG1yjyaYavJcEBJyOHc+iN/mmG2co6ejJdihR+0KxlcZNT6uJqxWmDX41kP
 Ln4w==
X-Gm-Message-State: ACgBeo2eDapM1K5NJQXVLL77s0T5dd9HhtfJ1Y2q89VDqRYnt9Zk03bn
 UIScdPxh518WVy89vZpRV3JUVIhCbkH7PQUQvvM=
X-Google-Smtp-Source: AA6agR4xfUhXX/pNoealUn1HB+IMQyvAhVW4+6XtN9l0pThxXi2yR4bhXllnPXIy3NISVQG56l+L0FBoOLlT9DDAPHU=
X-Received: by 2002:a17:902:eb86:b0:16f:d78:74d7 with SMTP id
 q6-20020a170902eb8600b0016f0d7874d7mr17165120plg.149.1659942934918; Mon, 08
 Aug 2022 00:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220727071557.3434892-1-james.hilliard1@gmail.com>
 <20220807155456.0be10777@windsurf>
In-Reply-To: <20220807155456.0be10777@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 8 Aug 2022 01:15:22 -0600
Message-ID: <CADvTj4ovUOQJ23nT-ZXgBEur10y9-QWRUuUXzu7EbikQLnYEaA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Kxu/BCE49DZ033nPQa4DSkndy6Sw0LjM35KH5g0fXPc=;
 b=OtKlav8gYa5C5D3lcqPt3TY9daY9QQOPKGFkNwjEpakSN0Wsb5PnyxIipqB/VeKFgf
 XPZ2CTPfeRTiRHOLw7NgI7JfEDgOQvnYBf/TQxt6jLSGR2h1xdZXogzqy6u9v6FrktGB
 JP8htZxhQVF4Zs6mXtqIQGaTwq7T3396MrOWWjEqZLq3kFotw+dq5YBnSd5qYaqLUh3X
 DOnwklu0z1YAeoYgxt9clK97pf4arMgqM8rAZnLF5be5AbBSX0JTRNAGxCAQnPZCe9kG
 SKEY0/Fpoennj8nAgZAUMMu544Od7i+8KiqdIAzXBpRV+i9PgjXatk1elDjhBQBTMzWW
 ONdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OtKlav8g
Subject: Re: [Buildroot] [PATCH v5 1/2] support/misc/toolchainfile.cmake.in:
 don't set PKG_CONFIG_SYSROOT_DIR
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 7, 2022 at 7:54 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Wed, 27 Jul 2022 01:15:56 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > This doesn't appear to be required and seems to break for packages
> > using meson's pkgconfig.relocatable format.
>
> Thanks for your contribution. However, if you want us to merge this can
> of contribution needs much, much, much better commit logs and
> explanations.
>
> An explanation that starts with "this doesn't appear to be required"
> and continues with "seems to break" is the opposite of a convincing
> explanation.
>
> Here is the sort of commit log that we need:
>
> """
> Defining PKG_CONFIG_SYSROOT_DIR in the CMake toolchain file is not
> needed because it is already passed...
>
> In addition, passing this in the CMake toolchain file causes breakage
> of the following defconfig, once meson's pkgconfig.relocatable is
> enabled, with the following failure:
>
> [...]
>
> This failure occurs because ...
> """
>
> Note: I agree that passing PKG_CONFIG_SYSROOT_DIR in the CMake
> toolchain file is probably not needed because our pkg-config wrapper
> already passes the right value. However, I fail to see how that can
> make a difference. How something in the CMake toolchain file can affect
> the build of Meson based packages?

I think it's an issue with how it interacts with meson's pkg-config prefix in
relocatable mode AFAIU, seems cmake wasn't setting the prefix correctly,
which generally only seemed to cause issues with PKG_CONFIG_SYSROOT_DIR
from what I could tell.

I recall someone mentioned PKG_CONFIG_SYSROOT_DIR was needed for
external toolchains or something along those lines so I came up with
an alternative
approach to avoid removing PKG_CONFIG_SYSROOT_DIR.

>
> We very much appreciate all the improvements you are submitting, many
> of them are very relevant and very useful. However, to have them
> merged, we need detailed and convincing argumentation, no vague commit
> logs that seem to indicate the change is actually papering over a
> problem rather than addressing it for real.

This was superseded by:
https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20220728014402.142320-2-james.hilliard1@gmail.com/

I separated the pkg-config and relocatable format change out from the ninja
to meson build/install migration.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
