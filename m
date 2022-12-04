Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B621EC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 18:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B93160806;
	Sun,  4 Dec 2022 18:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B93160806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLEKLRi8ezOw; Sun,  4 Dec 2022 18:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84D386079B;
	Sun,  4 Dec 2022 18:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84D386079B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3C21BF2BF
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D30D4092A
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 18:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D30D4092A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2IknkMRdI7L for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 18:51:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A3BB40981
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A3BB40981
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 18:51:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id fc4so16067973ejc.12
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 10:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Q3ZCUsIpaFrp5f3YifT5mEKmKEzeQrGm35c1T0vcmk=;
 b=3AjwxTtqBd7AMR8FesNPVgrefnfTwbiwUm2iCE/6PRecvWYO5hPsjcoihvHtYW0E39
 kvbanTitaq4isDz/E7CTmORtVVQHpK/4wUpIAtA5RumP1c6HAgtIKOnSTopwFnJb9v8+
 akOs5fgjwEhq2ZjNIec7g8OUZFaMsayXt0fdIovJ/8xRLH+gM40TfkswZvtIDRGBX2oP
 /lolWPa2OquUBVJrfHI8FEtR+0d8tQQzWD5vBv1hibppxePaZ8dB7Wa/ufZcswpPU0zq
 eiScvCpkbmua4C7B3xJJciPM6sndXgfU5fiRzT3U+Y7LhHEr4137hvAs74hv0Tr+3Icy
 83IQ==
X-Gm-Message-State: ANoB5pnm61+3e/rNny/C8pmthW8a7Ii3Fx1dp2UXXwXd55/gIKzpKwiC
 eoU0gRqtQpy3sJlbQHTK1aJbBvz6wiZoheGp4qM=
X-Google-Smtp-Source: AA0mqf56uf9SWUvHXLBZtXLAdIkUFNv9NzP5UA7/v8PutkR1NXuq7eXdx8blYbADw6EeDtticQCTBDXOErsSWcrQJlI=
X-Received: by 2002:a17:907:11de:b0:7c0:e4b6:47a5 with SMTP id
 va30-20020a17090711de00b007c0e4b647a5mr3627425ejb.480.1670179912303; Sun, 04
 Dec 2022 10:51:52 -0800 (PST)
MIME-Version: 1.0
References: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
 <CADvTj4obUchFLqXjWxQydTHc1FJLNA3y90RZ=FOQsceFOSuhdw@mail.gmail.com>
 <CA+fTLhgzznFVkSGXGhR5S_ik2K0RA_wRve1PF0FaogexfmH3tg@mail.gmail.com>
 <874jub85sf.fsf@dell.be.48ers.dk>
 <CA+fTLhjEPcDr=bh3aFWBm4j4a3Th-=bLY99UYnbQVVnsRvm1uw@mail.gmail.com>
In-Reply-To: <CA+fTLhjEPcDr=bh3aFWBm4j4a3Th-=bLY99UYnbQVVnsRvm1uw@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 4 Dec 2022 20:51:40 +0200
Message-ID: <CA+fTLhiZG9RnOQ9kQ5J76cQ1bmLUoyBSKOk4WMxqNrMB5guoBg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3Q3ZCUsIpaFrp5f3YifT5mEKmKEzeQrGm35c1T0vcmk=;
 b=XRGp0sImxNRW4Uy4/Bo4Y/JH3O9LSifQm3GkK3C3bDkG8QtWmaZ18i5B98wDQa/rPp
 rxj+ffu5pCM4qyW6oMdKmtpxR9q8x7/RD//qGMl4AVCNsFHPXek7+ThnMn6eaCk6Zb6C
 Q+SUB7cTTQxhXPJv9xpiAfrBg4LqkCjFpmVTLugjF4S632OqVIE5VmeOfl7RUIf+7vlo
 YdBW1sRw0fw27lUgkzpjIjIKl8oIt/GoxkoXDizhbBmfoTg/98J78qLWtVjnVcMU6gWD
 BcuIxuPZzO+Nvnao4GbZJPRN4mzEPzZn3OoKZl6vdGgMooHfB++EIlJTpBDeevFhayOK
 DIFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XRGp0sIm
Subject: Re: [Buildroot] python 3.10.8 pip module seems to be broken in rc3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3454368156980939055=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3454368156980939055==
Content-Type: multipart/alternative; boundary="00000000000062476005ef051040"

--00000000000062476005ef051040
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Indrek Kruusa (<indrek.kruusa@gmail.com>) kirjutas kuup=C3=A4eval P=
, 4.
detsember 2022 kell 20:28:

>
>
> Kontakt Peter Korsgaard (<peter@korsgaard.com>) kirjutas kuup=C3=A4eval P=
, 4.
> detsember 2022 kell 18:58:
>
>> >>>>> "Indrek" =3D=3D Indrek Kruusa <indrek.kruusa@gmail.com> writes:
>>
>> Hi,
>>
>>  >> Maybe needs to select:
>>  >> BR2_PACKAGE_PYTHON3_PYEXPAT
>>  >>
>>
>>  > Somehow I missed that option. Yes, it fixes the problem.
>>
>> How did you end up with pip without python3-pyexpat?
>>
>> python-pip selects python3-setuptools (and ssl), and python3-setuptools
>> selects pyexpat (and zlib).
>>
>
> I think I configured the build for python3, built the whole package and
> later added python-pip from menuconfig. I can re-test.
>
>
I'm unable to repeat this. The only explanation is that I did something
with my .config manually. Sorry for the noise.


>
>
>>
>> --
>> Bye, Peter Korsgaard
>>
>

--00000000000062476005ef051040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Indrek Kruusa (&lt;<a href=3D"mai=
lto:indrek.kruusa@gmail.com">indrek.kruusa@gmail.com</a>&gt;) kirjutas kuup=
=C3=A4eval P, 4. detsember 2022 kell 20:28:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Kontakt Peter Korsgaard (&lt;<a href=3D"mailto:peter@kors=
gaard.com" target=3D"_blank">peter@korsgaard.com</a>&gt;) kirjutas kuup=C3=
=A4eval P, 4. detsember 2022 kell 18:58:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Indrek&quot; =3D=3D Ind=
rek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank"=
>indrek.kruusa@gmail.com</a>&gt; writes:<br>
<br>
Hi,<br>
<br>
=C2=A0&gt;&gt; Maybe needs to select:<br>
=C2=A0&gt;&gt; BR2_PACKAGE_PYTHON3_PYEXPAT<br>
=C2=A0&gt;&gt; <br>
<br>
=C2=A0&gt; Somehow I missed that option. Yes, it fixes the problem.<br>
<br>
How did you end up with pip without python3-pyexpat?<br>
<br>
python-pip selects python3-setuptools (and ssl), and python3-setuptools<br>
selects pyexpat (and zlib).<br></blockquote><div><br></div><div>I think I c=
onfigured the build for python3, built the whole package and later added py=
thon-pip from menuconfig. I can re-test.</div><div><br></div></div></div></=
blockquote><div><br></div><div>I&#39;m unable to repeat this. The only expl=
anation is that I did something with my .config manually. Sorry for the noi=
se.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000062476005ef051040--

--===============3454368156980939055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3454368156980939055==--
