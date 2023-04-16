Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F086C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 15:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71194417A7;
	Sun, 16 Apr 2023 15:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71194417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0oRGecSw67t; Sun, 16 Apr 2023 15:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58E304174C;
	Sun, 16 Apr 2023 15:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E304174C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18CFB1BF5EA
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 15:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E42604174C
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 15:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42604174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hD-BCfiMYoTq for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 15:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84ADD41718
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84ADD41718
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 15:09:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id xd13so23902686ejb.4
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681657742; x=1684249742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3/bQqqV9pKYadWC6L0Mt44e5WQvYTtmlu8OC7/yLTE=;
 b=io4XzpJ03PnPU0C4E9WNjZK2ZzdT2a97auWF8itaDh05PQtCNZIYDItvSp2yjldcle
 Ik3+ociO8uxXhlSj+RjDxIOuVu/kzDSyah/+tB4QZTa4tI9zEllTcgHazFmWHtQ/DmRV
 5DSilq+FQ1sztUtHqsluQLX546XYwhdr2UCRvsFs+Co1ghaItYyYo2jjga7pXyg4zsOZ
 Rl361DVQ5ke1/8Zm3xmp96IWF7tP9AyVAbaMRBD9RH6GpMDE7UulDGQlqV9g9AIQfCIj
 +4oQFfqF+t/C8bSO0s2S8gokT9HxhCPD7VDIitm5LDlCFscup0Ne3+0f+EZ68OHF0EKw
 n7rA==
X-Gm-Message-State: AAQBX9ehpfsJv1Z9aNSpCbjZiEzwoSP4W/x/rnZFJBoI/PwoguGR8AUu
 Mh6iOiFhLusFE6jh8txrsd18jC33UN9cCn2yg3I=
X-Google-Smtp-Source: AKy350bYSV3c8bM8OBYuNpWcJeHlWZyCU1Wn9eoiTj1JhdE0Mi+LvK7vGNzvUgelkw3QZ9TihC3cB17+E4c2KYnQAeE=
X-Received: by 2002:a17:906:edd2:b0:94f:6ca2:e34 with SMTP id
 sb18-20020a170906edd200b0094f6ca20e34mr838811ejb.66.1681657742211; Sun, 16
 Apr 2023 08:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230405201403.1410075-1-pevik@seznam.cz>
 <20230410172429.GE2819@scaer>
 <CAB1t1Cyz6=SM2MWOeqMtj9U8KKsarvFEcJaPeJ_nDXtaQ_bK1w@mail.gmail.com>
 <20230414190117.GY2819@scaer>
 <CAB1t1CwsMzTgYyAY_AFftyUh+OdXADpKBXTw0Ot1reibt=fWgg@mail.gmail.com>
 <20230415080547.GC2819@scaer> <20230415084056.GD2819@scaer>
 <CAB1t1CwZS7vreP7z4k5g3Np8JLO-_HEEQczin45pS9RtMS1H+A@mail.gmail.com>
 <20230416074527.GV2819@scaer>
In-Reply-To: <20230416074527.GV2819@scaer>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 16 Apr 2023 17:08:54 +0200
Message-ID: <CAB1t1CxOcwoKJaYh6-XKhrAann=hWsRf4ozynqz=JCVpNzbX+A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681657742; x=1684249742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R3/bQqqV9pKYadWC6L0Mt44e5WQvYTtmlu8OC7/yLTE=;
 b=N4Z7L1zoLDdes3Ft4aRqp9gAJ4/swoVyrlGI2A3M9rDuekzYVu9Sk6hDFeljJsX7bd
 41ABhZDSvdkQJkU/iEyNXpNjMuko2btiaLh9ftlIAILNwawHVYzvXCOelW+f0G5qgu0u
 YMGyxD02R24qWo2lFi9lcJkjs7D6iKvk+TDGrL96g054zSJ+W5LZ1qucrc6/MFHU3MaO
 hxbfl0it9UcFBzmBeo/BNf46D7D+puufNibee6wD1ncOkGMXFdqJd7rgspFUh+1VoOUs
 X9QuscBgpVzQd+vIOZRrMoUnUpqzdvUICGqZlonUTcOCvl3htcGguackTMr2s/YIyYKi
 FUpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=N4Z7L1zo
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

On Sun, 16 Apr 2023 at 09:45, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Petr, All,
>
> On 2023-04-16 01:21 +0200, Petr Vorel spake thusly:
> > On Sat, 15 Apr 2023 at 10:41, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2023-04-15 10:05 +0200, Yann E. MORIN spake thusly:
> [--SNIP--]
> > > Now, we could also very well decide that ltp-testsuite depends on kernel
> > > headers >= 5.11 for musl toolchains, which would probably be the actual
> > > solution, if upstream really does not want to fix that situation.
> > Thanks for a suggestion, I'd really try to add the dependency for musl:
> > depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
> > I'll put the change in a separate commit, with removal of the patch
> > and explaining
> > the reason (leaving the actual upgrade in a separate commit), so that
> > it's easier
> > for people to find the reason. If people complain, we can ask upstream
> > to reconsider
> > or reintroduce the patch. But I'd like to avoid extra work in case
> > nobody bothers.
>
> That sounds like a good plan, indeed.
>
> Also, as I understand it, patch 2, which fixes mount_attr detection,
> should come first, because it already applies to the current version,
> no? If not, then it should be squashed into the version bump.

It's from upcoming LTP (not yet released) => I'll squashed it into version bump.
Thanks!

Petr

>
> So, probably, the series should go like:
>
>     package/ltp-testsuite: backport mount_attr fix on older glibc
>     package/ltp-testsuite: disable for musl with kernel headers < 5.11
>     package/ltp-testsuite: bump to 20230127
>
> Thanks!
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
