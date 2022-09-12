Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F345ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 16:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E80361183;
	Mon, 12 Sep 2022 16:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E80361183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1y691Afgt37C; Mon, 12 Sep 2022 16:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E55760D96;
	Mon, 12 Sep 2022 16:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E55760D96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FBBA1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 16:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78A094058E
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 16:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A094058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NubVaNkiD-i0 for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 16:26:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E928E405D0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E928E405D0
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 16:26:11 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id y29so11209598ljq.7
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=CivyUM+GNvWA1WSXthjLFGacoPnkN9O4tfTRy2ZqHQI=;
 b=drJHbOY58q4j3Ac0zM98svksFMGDHqzO/afSUXQuLM/OCRHjzB8htPhTzhCA8jYWdF
 BxQiXa4mJCG3Kpttf3hzt3oOTAtqM6hHh4+OsdXtEiXYIoBtHxUk7MA2NL8QE6FvCjKn
 Rg83ymldCK1gXIUZH5RP1ifTWDIKGYrL+1PQnnM0myoIVfVzEAICBtzRhXKPbhysH1f3
 vu09ydmzu/8EwIia/bjeOFg2BlLYcGfhQhOwJ5yYd17XNrFw5q2xl6CX48iwXFn3e4EM
 v3LhF63r9GOC1EzRe6gAz1wIjxPdYBX3HYhsVxF7oKdZg0suJJEDN08Flbk0iHtf0dcN
 9vfQ==
X-Gm-Message-State: ACgBeo348f4ouJ75i/aKYa0kW1avSWT1YzRRA9rE8BSwwA6NYJBg8LfR
 Us5o7JGDVxQIDVh8iJ61hzBBX4GkPvg37RNA97cDrUoqBVo=
X-Google-Smtp-Source: AA6agR47PH88Jdi2eoYMv89UI9/5GqE4OpbHzCtSpsisbqEnzAkbYnNv6xLM+oFOoFz1L3aQbIG2jJMD+Ox/2MfKPa4=
X-Received: by 2002:a2e:a547:0:b0:25f:eb8f:99dc with SMTP id
 e7-20020a2ea547000000b0025feb8f99dcmr8188727ljn.245.1662999967823; Mon, 12
 Sep 2022 09:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHfxMJ69P8NVSqJr2tkNajMbFG-FD=Wz2DUfdstRQSqi86_3qw@mail.gmail.com>
 <5554ec40-062b-2e1e-e395-66509b97832e@othermo.de>
In-Reply-To: <5554ec40-062b-2e1e-e395-66509b97832e@othermo.de>
From: erichiggins@gmail.com
Date: Mon, 12 Sep 2022 09:25:56 -0700
Message-ID: <CAHfxMJ4KYXkeyX3yxH7yNQCR3zq6qShdzJch+bR0qqfvcr-gEw@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=CivyUM+GNvWA1WSXthjLFGacoPnkN9O4tfTRy2ZqHQI=;
 b=JLBlQn1zbyBYeWeVcYXF3zZC9QCeDUuLN7LEw/GmUGH2xI0ipoUI+E5KvIat/QMBV5
 W3qjDTgzFAYQDJLlwy7zai8m8SC7/5mpzhzjx5lstxPaifVtSGZGkUBOn8DmVp5b9dDo
 4N/Bz31lG/FicK97IrnijijEYic4/LnrjrCj9Sbo4UBOyjdA+9fjTXrx2DHFg7QMUat3
 SnMkoEF6nCS3i5TG4e0RH+KDVCnPeBqvI5M/w3R2S62vVtBcpN3zlv6PzQ8pPR2RvvyR
 wKG7RgJQS+eRNJ0JGoLykm8ax9LjO36CJvEH9msGWXP55EFBfHHkU/65wqC2Spp0F2TH
 YcXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JLBlQn1z
Subject: Re: [Buildroot] Patch for buildroot script utils/scanpypi
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
Content-Type: multipart/mixed; boundary="===============3041892811845747698=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3041892811845747698==
Content-Type: multipart/alternative; boundary="0000000000005800ad05e87d5abe"

--0000000000005800ad05e87d5abe
Content-Type: text/plain; charset="UTF-8"

I can, but I have to say that I agree with the note from the accepted
answer on stackoverflow:
https://stackoverflow.com/questions/68238912/how-to-configure-and-use-git-send-email-to-work-with-gmail-to-email-patches-to

The Buildroot project is creating too many barriers to contribute by not
adopting modern standards (e.g. self-hosted vs GitHub/GitLab, mailing list
patches vs Pull Requests, IRC vs Slack/Discord, etc).
There are many contributions that I would love to make, but the project
makes it much harder than it needs to be and it's not a good use of my time.

Thanks,
-Eric

On Mon, Sep 12, 2022 at 2:05 AM Marcus Hoffmann <marcus.hoffmann@othermo.de>
wrote:

> Hi Eric,
>
> can you submit this as a proper patch via this mailing list so it can be
> properly reviewed here?
>
> See https://nightly.buildroot.org/manual.html#submitting-patches from
> the manual.
>
> Best,
> Marcus
>
> On 08.09.22 17:53, erichiggins@gmail.com wrote:
> > Hello all,
> >
> > I've created a minor patch to resolve a bug in the utils/scanpypi
> > script. I've written up the justification, examples, and technical
> > details in the following GitHub gist which also contains the patch
> contents.
> >
> > https://gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed
> > <https://gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed>
> >
> > Happy to discuss further either over email or IRC.
> >
> > Thanks!
> > -Eric
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000005800ad05e87d5abe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can, but I have to say that I agree with the note from t=
he accepted answer on stackoverflow:<div><a href=3D"https://stackoverflow.c=
om/questions/68238912/how-to-configure-and-use-git-send-email-to-work-with-=
gmail-to-email-patches-to">https://stackoverflow.com/questions/68238912/how=
-to-configure-and-use-git-send-email-to-work-with-gmail-to-email-patches-to=
</a><br></div><div><br></div><div>The Buildroot project is creating too man=
y barriers to contribute by not adopting modern standards (e.g. self-hosted=
 vs GitHub/GitLab, mailing list patches vs Pull Requests, IRC vs Slack/Disc=
ord, etc).</div><div>There are many contributions that I would love to make=
, but the project makes it much harder than it needs to be and it&#39;s not=
 a good use of my time.</div><div><br></div><div>Thanks,</div><div>-Eric</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Sep 12, 2022 at 2:05 AM Marcus Hoffmann &lt;<a href=3D"mailto:ma=
rcus.hoffmann@othermo.de">marcus.hoffmann@othermo.de</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Eric,<br>
<br>
can you submit this as a proper patch via this mailing list so it can be <b=
r>
properly reviewed here?<br>
<br>
See <a href=3D"https://nightly.buildroot.org/manual.html#submitting-patches=
" rel=3D"noreferrer" target=3D"_blank">https://nightly.buildroot.org/manual=
.html#submitting-patches</a> from <br>
the manual.<br>
<br>
Best,<br>
Marcus<br>
<br>
On 08.09.22 17:53, <a href=3D"mailto:erichiggins@gmail.com" target=3D"_blan=
k">erichiggins@gmail.com</a> wrote:<br>
&gt; Hello all,<br>
&gt; <br>
&gt; I&#39;ve created a minor patch to resolve a bug in the utils/scanpypi =
<br>
&gt; script. I&#39;ve written=C2=A0up the justification, examples, and tech=
nical <br>
&gt; details in the following GitHub gist which also contains the patch con=
tents.<br>
&gt; <br>
&gt; <a href=3D"https://gist.github.com/erichiggins/223b2495ada64001c44deed=
d3a3df6ed" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/eri=
chiggins/223b2495ada64001c44deedd3a3df6ed</a> <br>
&gt; &lt;<a href=3D"https://gist.github.com/erichiggins/223b2495ada64001c44=
deedd3a3df6ed" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com=
/erichiggins/223b2495ada64001c44deedd3a3df6ed</a>&gt;<br>
&gt; <br>
&gt; Happy to discuss further either over email or IRC.<br>
&gt; <br>
&gt; Thanks!<br>
&gt; -Eric<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--0000000000005800ad05e87d5abe--

--===============3041892811845747698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3041892811845747698==--
