Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3EFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CDC74074E;
	Mon,  4 Jul 2022 16:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDC74074E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-HvlD-hRabo; Mon,  4 Jul 2022 16:40:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6041940499;
	Mon,  4 Jul 2022 16:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6041940499
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 353931BF373
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08C29408E4
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 16:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C29408E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gt9bIchhCPg8 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 16:40:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7876408E0
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7876408E0
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 16:40:13 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31c8a1e9e33so34587387b3.5
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 09:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DW+JIv7xGwNMy37HpiKOsR1XRC+kMaf7UiekCOovcYk=;
 b=QDFGWoOQR2k6sc4f3A0BQ5bHSpurZMsPYzFCtmOowWh7y2e5BqS/GwJ4oqHind9gdQ
 zYtakN2yr2sPDB4JIuiLWRKugsI2hs3ys+jipLY6feMyTDpeMO012O3qtjiEIS1L5+Id
 X8RKMl/kWQfP6BhI7taxbekmofzVhgqRspxIT48lSe3KHPvoOeUEYlsjNvZsX6pfNKme
 G3zzqYJET0HwTrZZkE0Y1319zudOOBBG1WFLqoIOfInWEc5YfVEJwtU5DlGd5ZzXMb1N
 Q4pOHJEtjFuCAaLbOeXwNzxXIZoQPGkU+vWCat0U4zUg0WJJUZmhCEy9GODKXTPD51Ph
 dxNQ==
X-Gm-Message-State: AJIora9MUO0DwQ/wfS9+JZd6k2NboPwK7zyrensy85t1MTU2EyqPPIx7
 hLy1DcRGcC/69EpkdNsEvrS6LHBBBmUB20LtUbEM4zV6
X-Google-Smtp-Source: AGRyM1sLKwae6sZTnxxl1VBKlEnMxKkmP5SlJZ09+GkdwFiFtf3oSffQQGMToXqxyT+d0UTsA+pBtx2a4oebuzxBdq0=
X-Received: by 2002:a81:9b02:0:b0:31c:9ae4:99ec with SMTP id
 s2-20020a819b02000000b0031c9ae499ecmr6288878ywg.495.1656952812576; Mon, 04
 Jul 2022 09:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220704094613.5636-1-yegorslists@googlemail.com>
 <20220704154536.GD2521@scaer> <20220704155126.GE2521@scaer>
In-Reply-To: <20220704155126.GE2521@scaer>
Date: Mon, 4 Jul 2022 18:40:01 +0200
Message-ID: <CAGm1_kuUq-eWEZiCOpgc0wb3Fb0_G8DRzLB2tQE9E_jKVanpbw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DW+JIv7xGwNMy37HpiKOsR1XRC+kMaf7UiekCOovcYk=;
 b=XDszhb4s6HFlNoB4e6hfASlZMt3C4syPjEhl4k1eEPX/aYeFlmRFPa897hA/jZ7IWo
 MOqWmEK7dFPPeF3+z4uBigsALNmTHxvMJ9iS/sUDxfIrdDWoeo0YnUomSv0Zv9Xq8OY1
 EfjpUDFrwf6IyoYtNojgWtYnrBFyodfKMMLJz7dJBxt53vtqBqpxQnrPK5hynUGLWpI1
 tfLPdcxuPm1EagP5v8lPZEP182izRBmszXb9foHtuYIsA3aIb/X56rLKryLpey5dkXPP
 rqRIS+UNxVRilXGs6Qn3C4wRt7790qRUrLG9NX92wDyDKoFbwU1QtyHxA3aRBjOcuiTS
 FYPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XDszhb4s
Subject: Re: [Buildroot] [PATCH v2] package/python-automat: add missing
 build-time dependency
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Mon, Jul 4, 2022 at 5:51 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Yegor, All,
>
> On 2022-07-04 17:45 +0200, Yann E. MORIN spake thusly:
> > On 2022-07-04 11:46 +0200, yegorslists--- via buildroot spake thusly:
> > > From: Yegor Yefremov <yegorslists@googlemail.com>
> > > python-automat needs host-python-typing-extensions.
> > Isn't that similar to the patch about python-argon2-cffi-bindings?
>
> Ah, somehow I did not receive your followup that mentions to ignore this
> patch, so I guess it is fixed by the patch about python-setuptools-scm:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220704104820.5332-1-yegorslists@googlemail.com/

Yes, it is fixed by the setuptools-scm patch.

Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
