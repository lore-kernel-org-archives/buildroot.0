Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9540BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 13:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A61681778;
	Sun, 20 Feb 2022 13:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCavsi3XELY0; Sun, 20 Feb 2022 13:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6997C81776;
	Sun, 20 Feb 2022 13:08:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 981AE1BF361
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 13:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AFE1404A1
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 13:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WWklItR-OrKw for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 13:08:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 282C04049B
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 13:08:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so7215466wmb.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 05:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z9tzmA2KRdAncObTQh/e2HlRcB1tC1cJF3/bCalNDeo=;
 b=e12oRNTh0XdgQg7PqzK5SfdKCxnaukc3TYxICqdtxubiTMVhs98EC7czMpwaGyryzh
 ZRIwT5eW5LgAfM41ptiNxFi7aO/vFKScKf61hprD8Ry+NkWjN/udO39Ohv8vC7sDfsWf
 xcRqHb54+L5GoJDwFfySvn3oGzzuS5SnWKGpHBMTGUP2z2xdfgxDx/1gR0ZwTLNTXMOw
 N220FT1i3PmYCgqxYDLMkA4eI1jl3m82+YU2iGdKZUb2pnt0lVi0ITtyydt5BhyUEXaI
 yqgI2HXB5h8fOK4w+VT9XEOcjc3HI3tLy0lrO/c40bHv4IpW4bthHkMwWhYg7ryUc2xr
 ov+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9tzmA2KRdAncObTQh/e2HlRcB1tC1cJF3/bCalNDeo=;
 b=xfnbOCVdiAqpl/Yo1ymb9VqnTw0N9YOb5Ug1JtH1Q8iMVnZedFykuJPjbrkfiBH87r
 dODx7t+sxrcXKrsQAm+pjhPKKshxQfcSh0nZNmFWh2K2SC3sMMqrdm5ORcOkKdcs+/JI
 aQHLeLkyrMKfCYvHibdXbq4wZMkATCJfcbZi9/mZfdD2V2gXNnJZ3FUv6T1fIZCu33Za
 lAs5XEMxYROYHpf8v8u6jIqRh6wtBX4yT8tzVuzk2V+wT3ywpSlfVkGk+7xiXRuX+u03
 EH9w9PqPhogJeLte8f1KndT2TB3CFrEcxV+bEpDDqSPx+VQBTJc5cq8cg5PwcocvF9r4
 4ajw==
X-Gm-Message-State: AOAM532wV+vC5jigeIJAvVksz653u/3DcKzlhFa7nygOq6ssEGepjHqG
 rF/zX9dY+SWtnk1g+gQXlail9NPnF0NkWyKo7/daeRry7QY=
X-Google-Smtp-Source: ABdhPJw9sMJ3gbvuMaRw9rXW9WMR7Pl5NZ81Of+KlNuAFdeQEwgPvRhQ1jRnLENetvav7zTiy4urFDOkdAvn97d7SMs=
X-Received: by 2002:a1c:7704:0:b0:354:4d2b:9d5 with SMTP id
 t4-20020a1c7704000000b003544d2b09d5mr17670697wmi.155.1645362491989; Sun, 20
 Feb 2022 05:08:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5jOqW2fg--vVGjygya_QMo76DqDsYyEYiqpOmWHW3EHQg@mail.gmail.com>
 <DBE98BBE-E4A0-49B8-A2E8-AB951A2CA0F8@benettiengineering.com>
In-Reply-To: <DBE98BBE-E4A0-49B8-A2E8-AB951A2CA0F8@benettiengineering.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Sun, 20 Feb 2022 21:08:03 +0800
Message-ID: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Issue with login
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
Content-Type: multipart/mixed; boundary="===============6525961995435508006=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6525961995435508006==
Content-Type: multipart/alternative; boundary="000000000000dca72d05d872cef7"

--000000000000dca72d05d872cef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes I have tried putting root as the login, but still not working.  I have
tried both conditions, with password set as well as no password set in the
Buildroot menuconfig and recompile. But the results are the same. I even
disabled the login prompt options, but when I running the board login
prompt keep coming. Fyi  i have used the gcc-linaro-7.5.0-2019 toolchain in
ubuntu 20.04.


On Sun, Feb 20, 2022, 8:55 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Mohd,
>
> Il giorno 20 feb 2022, alle ore 13:46, Mohd Faiz Rohani <
> mohd.faiz.rohani@gmail.com> ha scritto:
>
> =EF=BB=BF
> Hi Giulio,
>
> Yes I have used root as a user. unfortunately i didn't set the path to th=
e
> users tables. Could this be a problem? If so, where to set them? I
> understand that the users list are kept in paswd file correct?
>
>
> Before getting to users table let=E2=80=99s check why root doesn=E2=80=99=
t work.
>
> Have you tried issuing:
> root
> And no password at all and press =E2=80=9Center=E2=80=9D key?
>
> It=E2=80=99s pretty strange it doesn=E2=80=99t work
>
> Giulio
>
>
> Thanks
>
> On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti <
> giulio.benetti@benettiengineering.com> wrote:
>
>> Hi Mohd,
>>
>> have you used root as user? Or did you provide a user table?
>>
>> Giulio
>>
>> Inviato da iPhone
>>
>> > Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani <
>> mohd.faiz.rohani@gmail.com> ha scritto:
>> >
>> > =EF=BB=BF
>> > Hi guys,
>> >
>> > I managed to compile with success the Uboot(U-Boot 2019.04), Linux
>> kernel(4.4.155)and root file system(systemd 249) using the
>> Buildroot-2021.11.1. It was able to boot successfully until the login
>> prompt. However, it seems like there is an error with the login prompt i=
t
>> does not want to enter, just looping around the login prompt after I hav=
e
>> entered the login name (not showing the password prompt). Did anyone kno=
w
>> about this?
>> >
>> > Thanks.
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>>

--000000000000dca72d05d872cef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br>Yes I have tried putting root as the login, but =
still not working.=C2=A0 I have tried both conditions, with password set as=
 well as no password set in the Buildroot menuconfig and recompile. But the=
 results are the same. I even disabled the login prompt options, but when I=
 running the board login prompt keep coming. Fyi=C2=A0 i have used the gcc-=
linaro-7.5.0-2019 toolchain in ubuntu 20.04.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Feb 20, 2022, 8:55 PM Giulio Benetti =
&lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti=
@benettiengineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"auto">Hi Mohd,<br><div dir=3D"ltr"><br><blockquote type=3D"=
cite">Il giorno 20 feb 2022, alle ore 13:46, Mohd Faiz Rohani &lt;<a href=
=3D"mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank" rel=3D"noreferrer"=
>mohd.faiz.rohani@gmail.com</a>&gt; ha scritto:<br><br></blockquote></div><=
blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi=C2=
=A0Giulio,<div><br></div><div>Yes I have used root as a user. unfortunately=
 i didn&#39;t=C2=A0set the path to the users tables. Could this be a proble=
m? If so, where to set them? I understand that the users list are kept in p=
aswd=C2=A0file correct?</div></div></div></blockquote><div><br></div><div>B=
efore getting to users table let=E2=80=99s check why root doesn=E2=80=99t w=
ork.</div><div><br></div><div>Have you tried issuing:</div><div>root</div><=
div>And no password at all and press =E2=80=9Center=E2=80=9D key?</div><div=
><br></div><div>It=E2=80=99s pretty strange it doesn=E2=80=99t work</div><d=
iv><br></div><div>Giulio</div><br><blockquote type=3D"cite"><div dir=3D"ltr=
"><div dir=3D"ltr"><div><br></div><div>Thanks</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 20, 2022 at =
7:43 PM Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineer=
ing.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettienginee=
ring.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi Mohd,<br>
<br>
have you used root as user? Or did you provide a user table?<br>
<br>
Giulio<br>
<br>
Inviato da iPhone<br>
<br>
&gt; Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani &lt;<a href=3D=
"mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank" rel=3D"noreferrer">mo=
hd.faiz.rohani@gmail.com</a>&gt; ha scritto:<br>
&gt; <br>
&gt; =EF=BB=BF<br>
&gt; Hi guys,<br>
&gt; <br>
&gt; I managed to compile with success the Uboot(U-Boot 2019.04), Linux ker=
nel(4.4.155)and root file system(systemd 249) using the Buildroot-2021.11.1=
. It was able to boot successfully until the login prompt. However, it seem=
s like there is an error with the login prompt it does not want to enter, j=
ust looping around the login prompt after I have entered the login name (no=
t showing the password prompt). Did anyone know about this?<br>
&gt; <br>
&gt; Thanks.<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
<br>
</blockquote></div>
</div></blockquote></div></blockquote></div></div></div>

--000000000000dca72d05d872cef7--

--===============6525961995435508006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6525961995435508006==--
