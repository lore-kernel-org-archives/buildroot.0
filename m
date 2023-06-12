Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817A4C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 18:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDD0E40A16;
	Mon, 12 Jun 2023 18:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD0E40A16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lpux8VI0M4Cp; Mon, 12 Jun 2023 18:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25EB6403B8;
	Mon, 12 Jun 2023 18:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25EB6403B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A98971BF304
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 18:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D2D1418E6
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 18:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2D1418E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNbl7-KUj2xG for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 18:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1556E416F5
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1556E416F5
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 18:41:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51492ae66a4so6654793a12.1
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 11:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686595306; x=1689187306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIYZF/Jz6z8oQIf+jHLJ7itu9e6jBHLJVKgL3//s6Tw=;
 b=Yco9FrosMKMjfRBzA4TAPFNbt67xPAX2V9ijEFSCYZdV/5jfgaFwd7EODLofV+xbNv
 iWLkmpq0hJTmYxsGR6Zy7/BVxo04+neV+IIWZ0/44it4ytkzSOHis2axB4PTsIBe8GWF
 6f1CDZj/+wASYvJzkWR6LpO/VGvk2TVqAr8m6smHBDdGrVdU7Wm3Z+bCRWhFL+e7eA33
 ss9KOlKFD2tSBE4Jze1q96ntvQxGpDZepWaVGm5UMxTLEKXhSlUYbMWe0ZMZAXkH6FZY
 IXi8zmzX1B9ZF+5iPyoTMag6jc1Ij4h1SZ0uvCcI/cSp5cd/GDkJl67D9PxsTXQwBa2s
 Bdew==
X-Gm-Message-State: AC+VfDxbIO3vkyg50e22vvpc0u+11LBY2I9AU7rdnQSw/bte132Exv39
 hOWFKRhEgqgG84MVRe4lPxzMeh/Xdbzf7UjtIGOqSPka
X-Google-Smtp-Source: ACHHUZ7Ht9JI/WzM1lW6p4YMm4GkSvHQ33Y8/KszrbnNZfO1h8GqLT6boCawkDtI3KQiOZbddJ9gdQFHBbAkUGca5V0=
X-Received: by 2002:a05:6402:31f3:b0:514:9eae:b0a7 with SMTP id
 dy19-20020a05640231f300b005149eaeb0a7mr4751625edb.17.1686595305951; Mon, 12
 Jun 2023 11:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+fTLhgfd1TXsc106CVJWzMPKiFE2BtPW6wieF8MxhoUik=Zcg@mail.gmail.com>
 <ff7312fd-f85f-373e-2b0e-3e3d003b84ad@benettiengineering.com>
In-Reply-To: <ff7312fd-f85f-373e-2b0e-3e3d003b84ad@benettiengineering.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 12 Jun 2023 21:41:35 +0300
Message-ID: <CA+fTLhixvdP2-A111eJQ-cne41VGnmQ5zn0jmUyEE9ZkS=931A@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686595306; x=1689187306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qIYZF/Jz6z8oQIf+jHLJ7itu9e6jBHLJVKgL3//s6Tw=;
 b=Mcr+sGxJ46ZTzM8KP5ia3HZBfmkysmlk4Y2T1JsaBVKSCsooYZtHX6DEWC0hCsh+fx
 rzEWQ4zP8eVNvtyuVU523w4ESSL1ULJUrwKH4x+EeG4HxdPvAdHTL5k75mF5jqUJzQ4U
 kHJcelL6zz2N7i1kPAm4175NN63XOTtiMhrE/AE/vorgez4QBxy7b18OSofbsGL5kPNr
 cTAxnOW0rNWDM0jPIRkkNYg0ITQBEzwSDcOhlpaZ8DK1CBUPXwJwlZY14y187jeT7cDv
 lZX+dQ5VbMKKnI+XtaxuauQe30TsbiNu7iXosfIQF9WJRtYHlF2v79eUdoaZfy54sTj0
 UINg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Mcr+sGxJ
Subject: Re: [Buildroot] package/rtl8189fs: question about the debug mode
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1269397267304042654=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1269397267304042654==
Content-Type: multipart/alternative; boundary="00000000000017553005fdf312b6"

--00000000000017553005fdf312b6
Content-Type: text/plain; charset="UTF-8"

Hi Giulio!
Thanks for the fast response! Sure, I will test this patch as soon as I can
and will let you know! Thanks again!

Indrek


E, 12. juuni 2023 19:54 Giulio Benetti <
giulio.benetti@benettiengineering.com> kirjutas:

> Hi Indrek,
>
> On 12/06/23 17:24, Indrek Kruusa wrote:
> > Hi!
> > When building rtl8189fs driver in buildroot currently then it runs in
> > debug mode (original Makefile line 91: CONFIG_RTW_DEBUG = y). It's
> > really verbose (at least 5 rows per second) and basically it renders the
> > serial console useless.
> > I would like to turn off the debug mode in a new board config (still
> > preparing a patch for this). But then I wonder how other users are
> > living with it. Maybe it should be patched on package level and not on
> > board level?
>
> I think that I can send a patch for this that en/disable
> CONFIG_RTW_DEBUG depending on BR2_ENABLE_RUNTIME_DEBUG.
>
> I see it like a consistent solution and I've just sent a patch for this:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20230612165344.3829304-1-giulio.benetti@benettiengineering.com/
>
> But there is also another solution to this by passing to kernel options
> the log level or even at runtime, take a look here:
>
> https://github.com/ulli-kroll/rtl8814au/blob/master/Document/How_to_set_driver_debug_log_level.pdf
>
> I haven't tested it but it should work.
>
> Let me know.
>
> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas
>

--00000000000017553005fdf312b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Giulio!<div dir=3D"auto">Thanks for the fast response!=
 Sure, I will test this patch as soon as I can and will let you know! Thank=
s again!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Indrek</div><di=
v dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">E, 12. juuni 2023 19:54 Giulio Benetti &lt;<a href=
=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti@benettieng=
ineering.com</a>&gt; kirjutas:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi I=
ndrek,<br>
<br>
On 12/06/23 17:24, Indrek Kruusa wrote:<br>
&gt; Hi!<br>
&gt; When building rtl8189fs driver in buildroot currently then it runs in =
<br>
&gt; debug mode (original Makefile line 91:=C2=A0CONFIG_RTW_DEBUG =3D y). I=
t&#39;s <br>
&gt; really verbose (at least 5 rows per second) and basically=C2=A0it rend=
ers the <br>
&gt; serial console useless.<br>
&gt; I would like to turn off the debug mode in a new board config (still <=
br>
&gt; preparing a patch for this). But then I wonder how other users are <br=
>
&gt; living with it. Maybe it should be patched on package level and not on=
 <br>
&gt; board level?<br>
<br>
I think that I can send a patch for this that en/disable<br>
CONFIG_RTW_DEBUG depending on BR2_ENABLE_RUNTIME_DEBUG.<br>
<br>
I see it like a consistent solution and I&#39;ve just sent a patch for this=
:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20230612165=
344.3829304-1-giulio.benetti@benettiengineering.com/" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/p=
atch/20230612165344.3829304-1-giulio.benetti@benettiengineering.com/</a><br=
>
<br>
But there is also another solution to this by passing to kernel options<br>
the log level or even at runtime, take a look here:<br>
<a href=3D"https://github.com/ulli-kroll/rtl8814au/blob/master/Document/How=
_to_set_driver_debug_log_level.pdf" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://github.com/ulli-kroll/rtl8814au/blob/master/Document/How_t=
o_set_driver_debug_log_level.pdf</a><br>
<br>
I haven&#39;t tested it but it should work.<br>
<br>
Let me know.<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas<br>
</blockquote></div>

--00000000000017553005fdf312b6--

--===============1269397267304042654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1269397267304042654==--
