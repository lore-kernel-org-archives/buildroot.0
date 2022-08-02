Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5D7C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 10:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82CF0405A7;
	Tue,  2 Aug 2022 10:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82CF0405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2ykN96yL9Jo; Tue,  2 Aug 2022 10:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A495C40136;
	Tue,  2 Aug 2022 10:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A495C40136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC331BF5DB
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2841381396
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 10:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2841381396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIevJWytgSw5 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 10:45:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E1B81393
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75E1B81393
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 10:45:13 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id 129so14074966vsq.8
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 03:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJ5a92lMOkWmfCS5AWVCWtAY0iAx6wjpprBAwa0CMbU=;
 b=Fznm2DnnTtYe+LyuJkQIIQ9EpYynjVi61Hr3mn01RbA8Z31QbxisFvU2rNYUwH8t9X
 WswRcUbnD2NIw0UOfrArCYPVfg6BS505XD2yFbLRnHP40Qn8oYUIAZcejXcche94wZxl
 wsgzu3Gj3OdU2pr55a4PXZeg2TDVC87NBC6UyL6oBvdFHa2EQwqyVpgZ+nuBRtcsmgo+
 7wn+yUMyKQt7w7Fv+vGgj1iG0Mv54rmT9mrCM0wpHNB5QJ7iT2xzwMFDBy6vrqnsq48S
 MntQnR/kGYNbjniDEedfZyydF5ryYG0u6zJEQYVpXJ8W4/OPk/rFpygWz9HztZ0OTLj6
 c3Fg==
X-Gm-Message-State: ACgBeo2MWT1TfVQ9JktRAFj30ufxoihSRyzJliFfOUnixxrVY4i40pLh
 Ofxmqv9Cii8Tkm9vd3nqnsHBvUXMwNcjRehpOlY=
X-Google-Smtp-Source: AA6agR42MkCDO1KQXy7s6Fv20qTyhuyS87dESMOJzuxjsto+SvBufPzF3HLxuXO5DE9kCqSWSZ7vHtw2AOX0ypJ/sKc=
X-Received: by 2002:a67:e9c2:0:b0:385:8f3:23c1 with SMTP id
 q2-20020a67e9c2000000b0038508f323c1mr3501033vso.63.1659437112282; Tue, 02 Aug
 2022 03:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
 <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
 <20220802104049.560f9001@windsurf>
 <CADYdroPfP0DZeHr3zEm052phSmi+iJFUomumySKgcU7JwWXJ4Q@mail.gmail.com>
 <20220802113926.11f5814a@windsurf>
In-Reply-To: <20220802113926.11f5814a@windsurf>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 2 Aug 2022 12:45:01 +0200
Message-ID: <CADYdroNPVcCoHyPj7zsufP0JQiaXnYTsPNvze3CsSpW0fPT46w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=MJ5a92lMOkWmfCS5AWVCWtAY0iAx6wjpprBAwa0CMbU=;
 b=fxRM+tmKJKr79RlAmpeq9/j9m89smb00B/fSIYgZhhRAdCCZy0Jj94bwSnyOOf47Vp
 AH4WTKi4nC/z7fcCL7K0UGAAKmvzfiFo+3/dEtt/NkCMFgIKwgQT9cifcCjGAsn+hlnT
 G16p7VTqhxZezO+cqaBKpdWQbxQ1o64cR5jl9x67POMctghjqX2SZPyN+McyBovewYoe
 /SVdRtz4Xv4fM/Xd/OjsQnyNsHUeOaWZHo2/MM4s7thu5woTVDpO+XPs/2KFHgB2LAgF
 /4dtZv8cc4Xjzfl0KOCMx1Ya5vrRox1D8pN8pUlblQ1czw4sNDMJ7rJpLdGfXb4nao5a
 pv5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fxRM+tmK
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Di., 2. Aug. 2022 um 11:39 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Tue, 2 Aug 2022 10:49:31 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > wipe doesn't have a configure.ac and autoconf'ed with a really old
> > version.
> > WIPE_AUTORECONF = YES should fix it.
>
> Could you try if it does? If so, I think this is OK. We will see how
> many other packages are affected. If only wipe is affected, fixing wipe
> is fine. If too many packages are affected, we will have to think of a
> different solution.

Gives alot warnings, but yes, fixes the issue.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Norbert
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
