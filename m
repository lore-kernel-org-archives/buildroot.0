Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD31C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 07:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AA7460A7F;
	Mon, 31 Jul 2023 07:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AA7460A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7moprtlBz1Ke; Mon, 31 Jul 2023 07:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F11860AA6;
	Mon, 31 Jul 2023 07:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F11860AA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7110A1BF3A6
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 07:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A15181D73
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 07:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A15181D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgSHzGU3Z-HP for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 07:46:02 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2863581A34
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 07:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2863581A34
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so5616125a12.1
 for <buildroot@busybox.net>; Mon, 31 Jul 2023 00:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690789560; x=1691394360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WQ11xi64pLi67Bw55khWJwl8+SH2j5XYEZCGAV1HP5E=;
 b=kJpVeFIWU6Qu0LA6Vq9TqA62tyxhoC2cTasa/DyVCBDIacHYAJg6fnu2UNs1IVLrfO
 /g08BbYTWxMHZrRyvhsqS0ChnxGKgwbbWRRQQ+g07vAgE85J25n8lU5Cb7DQyV9oNDLy
 z9DLRqzAAehVZnS6aDZTX8GSzKAauTEXAPH1/GxILYNJlVB3AtH0meEOh2gjan0Bz2Yu
 XfnamvKBFmKFmbaYFdaqYn0XsxBwWM+VSgagGTTNCPX107Sh8UhPivQ2G2d/MrXtwM7+
 K/Oo35we609PE4BkEv0gh7nY8JLHxmJojxi7LL1RzHJRlZJfOnyiOL5r30B8KcdRG8RV
 cOiQ==
X-Gm-Message-State: ABy/qLbjQq2lAyOnMRCUdl6wzAmjgcutaXj3142hsmVeDbUo9zMD/+L/
 R6N4PtGSwujE2NIfFiFaneEJyRt7xyHrrN4HEqg=
X-Google-Smtp-Source: APBJJlGshYoPVkNfBQrs3HRZPr/7XuwA76jcevTPGRf1k1STeeZ2b6fhdf2hAPCuMgj43HCAesxI224Vl0RBibeo7Rg=
X-Received: by 2002:aa7:c407:0:b0:51e:4439:f476 with SMTP id
 j7-20020aa7c407000000b0051e4439f476mr6514746edq.25.1690789559847; Mon, 31 Jul
 2023 00:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230521082858.500-1-guillaume.bressaix@gmail.com>
 <20230730233302.1a8b9d2b@windsurf>
In-Reply-To: <20230730233302.1a8b9d2b@windsurf>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Mon, 31 Jul 2023 09:45:31 +0200
Message-ID: <CAJe0E3cmEiniVQ8U1Ld6NjnzM8Gn5dkCXzvwaq=cQ=Ett_MNbg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690789560; x=1691394360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WQ11xi64pLi67Bw55khWJwl8+SH2j5XYEZCGAV1HP5E=;
 b=TgogrrnfFESuzbxczHDF53Vvu/9AZiem9erPU1rtRw+PgZDjyQEmRg25GnJIgk+2Q2
 ZFUwQ6UZ0vPNKXx+sh7hUS3j7A9QtshdnDm/m72k8+gKdxk/TZ3VCzyhvUVI5z4ogxCV
 eyK2JdhKDlC0VxXvGNNzjMycdS0THIjBctmXO0VhaJmZkF5coMjIkFjw3tQQLtatIBam
 c4PjMYharJUhFsvcPvdwkoocnqZ5o+/mOTWF1VJWhuXT+23kZrhM0Khs+aDqaXyq9CV1
 7OKhu6nMsgMFNsfc3ZtzBhOv7wuhW9AH7NLMKRKf1yk7NKnreFnDJVO6lxJapk+E6BJK
 WFAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Tgogrrnf
Subject: Re: [Buildroot] [PATCH 1/1] package/pixiewps: bump to version 1.4.2
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============7858521164852770035=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7858521164852770035==
Content-Type: multipart/alternative; boundary="0000000000001ace9c0601c39f62"

--0000000000001ace9c0601c39f62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

> So in fact, you're proposing to go one commit back in time. Maybe it's
> OK but you should explain why. And a "fix logical bug which broke big
> endian" seems useful to have in Buildroot.
> Could you clarify?

Yes you are correct, thank you for not merging.
I thought tags were just released but that is not the case, we're using a
newer commit hash and can't do otherwise until a newer tag is released

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le dim. 30 juil. 2023 =C3=A0 23:33, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Guillaume,
>
> On Sun, 21 May 2023 10:28:58 +0200
> "Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:
>
> > -PIXIEWPS_VERSION =3D 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59
> > -PIXIEWPS_SITE =3D $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))
> > +PIXIEWPS_VERSION =3D 1.4.2
> > +PIXIEWPS_SITE =3D $(call github,wiire-a,pixiewps,v$(PIXIEWPS_VERSION))
>
> Hum, I'm sorry but this doesn't look like a bump. If we look at the
> commit history of pixiewps (most recent commits first, older commits
> last):
>
> 464326fbcc499ac92d4f04c3990a9cc9c5124e86 (HEAD -> master, origin/master,
> origin/HEAD) Update gitignore: add pixiewrapper binary
> 85af251806ab24454372134e7055823adebd5afa remove gmtime()-related code
> duplication
> c1dd3a9ff6618b5f2e3535855cee9ffb10788b81 use gmtime_r() to mute code
> analysis tools (gmtime() is non-mt-safe)
> a6b3fa514c0c9a6ad5dc931040218451c64ce150 add pixiewrapper
> 8964527b85f558465341d9daa8da8d8a94eb0967 add --cstart/cend switches for
> time_t range
> 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59 endianeness.h: fix logical bug
> which broke big endian   <--- we are currently here
> 28f68e694bdf5774300a1451c970578de0e19ce0 (tag: v1.4.2) Bumped version to
> 1.4.2                   <--- you propose to get back here
>
> So in fact, you're proposing to go one commit back in time. Maybe it's
> OK but you should explain why. And a "fix logical bug which broke big
> endian" seems useful to have in Buildroot.
>
> Could you clarify?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000001ace9c0601c39f62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Thomas,</div><div><br></div><d=
iv>&gt; So in fact, you&#39;re proposing to go one commit back in time. May=
be it&#39;s<br>&gt; OK but you should explain why. And a &quot;fix logical =
bug which broke big<br>&gt; endian&quot; seems useful to have in Buildroot.=
<br>&gt; Could you clarify?<font color=3D"#888888"><br></font></div><div><b=
r></div><div>Yes you are correct, thank you for not merging.<br>I thought t=
ags were just released but that is not the case, we&#39;re using a newer co=
mmit hash and can&#39;t do otherwise until a newer tag is released<br><br><=
/div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"=
arial,helvetica,sans-serif">Guillaume W. Bres<br></font></div><font face=3D=
"arial,helvetica,sans-serif">Software engineer</font><br></div><font face=
=3D"arial,helvetica,sans-serif"></font></div><font face=3D"arial,helvetica,=
sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_=
blank">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></div></div></d=
iv></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Le=C2=A0dim. 30 juil. 2023 =C3=A0=C2=A023:33, Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Guillaume,<br>
<br>
On Sun, 21 May 2023 10:28:58 +0200<br>
&quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.bressaix@gmai=
l.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt; wrote:<br>
<br>
&gt; -PIXIEWPS_VERSION =3D 9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59<br>
&gt; -PIXIEWPS_SITE =3D $(call github,wiire-a,pixiewps,$(PIXIEWPS_VERSION))=
<br>
&gt; +PIXIEWPS_VERSION =3D 1.4.2<br>
&gt; +PIXIEWPS_SITE =3D $(call github,wiire-a,pixiewps,v$(PIXIEWPS_VERSION)=
)<br>
<br>
Hum, I&#39;m sorry but this doesn&#39;t look like a bump. If we look at the=
<br>
commit history of pixiewps (most recent commits first, older commits<br>
last):<br>
<br>
464326fbcc499ac92d4f04c3990a9cc9c5124e86 (HEAD -&gt; master, origin/master,=
 origin/HEAD) Update gitignore: add pixiewrapper binary<br>
85af251806ab24454372134e7055823adebd5afa remove gmtime()-related code dupli=
cation<br>
c1dd3a9ff6618b5f2e3535855cee9ffb10788b81 use gmtime_r() to mute code analys=
is tools (gmtime() is non-mt-safe)<br>
a6b3fa514c0c9a6ad5dc931040218451c64ce150 add pixiewrapper<br>
8964527b85f558465341d9daa8da8d8a94eb0967 add --cstart/cend switches for tim=
e_t range<br>
9e5bdc6c86c8487b2a6107d5ab3559ed5c738c59 endianeness.h: fix logical bug whi=
ch broke big endian=C2=A0 =C2=A0&lt;--- we are currently here<br>
28f68e694bdf5774300a1451c970578de0e19ce0 (tag: v1.4.2) Bumped version to 1.=
4.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt=
;--- you propose to get back here<br>
<br>
So in fact, you&#39;re proposing to go one commit back in time. Maybe it&#3=
9;s<br>
OK but you should explain why. And a &quot;fix logical bug which broke big<=
br>
endian&quot; seems useful to have in Buildroot.<br>
<br>
Could you clarify?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000001ace9c0601c39f62--

--===============7858521164852770035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7858521164852770035==--
