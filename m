Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D8CC77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 23:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C72A40132;
	Sat, 15 Apr 2023 23:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C72A40132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLXFoWIt52_S; Sat, 15 Apr 2023 23:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9407140948;
	Sat, 15 Apr 2023 23:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9407140948
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1B51C40C3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 23:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B10083F4A
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 23:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B10083F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7DKrX2xKrcN for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 23:21:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD96B83C1E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD96B83C1E
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 23:21:16 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id dm2so54997415ejc.8
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 16:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681600875; x=1684192875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIclq8YwuGFx8H9pi7V65Aj6/kHN1wsjXknsFG+mjyU=;
 b=SjKuk9WnwKn2cYLTewRTvACRM+z2s6b89K86v6f+OtK6c4EEyxnC2wIMEpAtxj0hGv
 DZZXCr6+EtrQjeEVQTDAgZC+TIdIL1hCGxVbBjgQ0lucUi5ZENt/ye6OoVoO7LKC3MXl
 clW76V38JPQVskK3d/N8WORFJLno9TRq9qkRV+lfBZF+uNysm3P2EXCqRavowOsuEUqv
 TrTmhCs/kUnR4WyC+Iv8dNYUlH/5r42nwFl9i+z/4g7X6d3JehSkcaMDYlteQRk5+VH+
 rpsVcD7VdnDEi0SB5kQSYBTdI3SZ9NuVGrQHcwXhJV5/rOF+XPtb4Cas1F5d90DSDkOn
 XjUA==
X-Gm-Message-State: AAQBX9ejZO7hG21uWH/zar6C+gX3cg2oC54RyUiVPEsVlRMugYPe1FWh
 GLGN4eyeU/F8XaYwg5vhihJTZZ/G8paSk3t9rJM=
X-Google-Smtp-Source: AKy350Z6mVjypJbMaAHeR63JJb6DSMMcLiPu81XsIeVE36oWvj57Mr8pifa13ZejIpixGDo6KwgIFpJwKgUcmrBJBZs=
X-Received: by 2002:a17:906:2345:b0:94a:9abf:c4a with SMTP id
 m5-20020a170906234500b0094a9abf0c4amr3434499eja.47.1681600874814; Sat, 15 Apr
 2023 16:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230405201403.1410075-1-pevik@seznam.cz>
 <20230410172429.GE2819@scaer>
 <CAB1t1Cyz6=SM2MWOeqMtj9U8KKsarvFEcJaPeJ_nDXtaQ_bK1w@mail.gmail.com>
 <20230414190117.GY2819@scaer>
 <CAB1t1CwsMzTgYyAY_AFftyUh+OdXADpKBXTw0Ot1reibt=fWgg@mail.gmail.com>
 <20230415080547.GC2819@scaer> <20230415084056.GD2819@scaer>
In-Reply-To: <20230415084056.GD2819@scaer>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 16 Apr 2023 01:21:06 +0200
Message-ID: <CAB1t1CwZS7vreP7z4k5g3Np8JLO-_HEEQczin45pS9RtMS1H+A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681600875; x=1684192875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SIclq8YwuGFx8H9pi7V65Aj6/kHN1wsjXknsFG+mjyU=;
 b=DKO/q5O6ENSrPY515WO7ow4538IpEAov/GJC0R/8NXBQ6/vlw+WpdiHJN7tYnIunLA
 ede3Hkfb+qcryGt2Aj+RnirSSmBug5uOfLrU0gwfbeIkZQKd3xpnQEMOKzv6khtfotVy
 ovOClqAOI/bvwct/FeALwnfvjjZxkB3Z3wxpA4q0ytlidLuSbm9L+lzme4OzKqWoXX0X
 fXWBZuk0+dnEnxldqiHLDUljTLeMh9wmMqGAf1jo08mVCmrNen2DEr1X2FG+2yV9x7LY
 p6+Hs5MH8o4lJeD4MiY8oiKqKnC4AW6PpbvAS+MFZbsWdU/L0UsfDOUj1FqOsMSERg0S
 vXmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DKO/q5O6
Subject: Re: [Buildroot] [PATCH 1/2] package/ltp-testsuite: bump version to
 20230127
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Petr Vorel <pevik@seznam.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Sat, 15 Apr 2023 at 10:41, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Petr, All,
>
> On 2023-04-15 10:05 +0200, Yann E. MORIN spake thusly:
> > On 2023-04-14 22:54 +0200, Petr Vorel spake thusly:
> > > On Fri, 14 Apr 2023 at 21:01, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> > > > Unless the upstream ltp has provision for supporting both kind of
> > > > headers, with or without the fix, then yes, I think this should be
> > > > rebased and kept. And re-submit upstream to explain it will support
> > > > older, existing toolchains.
> > > I'll verify again support/config-fragments/autobuild/toolchain-configs.csv, if
> > > there are tests which will fail.  Or are these toolchains elsewhere? I'm asking
> > > to give some proof to upstream that there are toolchains with older kernel
> > > headers. Because upstream expects that old distros are being tested with old
> > > version and if people want new software they are able to update their
> > > toolchain. They will see a real example than just claiming "it's needed".
> > > Also have a way to check in the future that workaround can be removed.
> >
> > I looked at toolchain/toolchain-external/toolchain-external-arm-aarch64/
> > which is the first external toolchain in the list of toolchain Buildroot
> > knows of.
>
> So, that's a glibc toolchain, right, so it is not impacted by the bug.
>
> Still, the reasonging stands: in the wilde, there are toolchains that
> have been built before that fix existed, and people are not updating
> their toolchains for various reasons, the most prominent one being "it
> is suplied by the chipco, so we use it".
>
> It is not just about the toolchains we know of in Buildroot. by the way.
>
> Now, we could also very well decide that ltp-testsuite depends on kernel
> headers >= 5.11 for musl toolchains, which would probably be the actual
> solution, if upstream really does not want to fix that situation.

Thanks for a suggestion, I'd really try to add the dependency for musl:
depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
I'll put the change in a separate commit, with removal of the patch
and explaining
the reason (leaving the actual upgrade in a separate commit), so that
it's easier
for people to find the reason. If people complain, we can ask upstream
to reconsider
or reintroduce the patch. But I'd like to avoid extra work in case
nobody bothers.

Kind regards,
Petr
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
