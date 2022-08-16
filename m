Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA6FC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 12:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2132940B1D;
	Tue, 16 Aug 2022 12:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2132940B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kz2IVhAr-tYe; Tue, 16 Aug 2022 12:53:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E371A40B8C;
	Tue, 16 Aug 2022 12:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E371A40B8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F03C1BF82D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 12:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09C30812BD
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 12:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09C30812BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSh6i8aE1PRU for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 12:53:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76C8E81356
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76C8E81356
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 12:53:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z20so13310176edb.9
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 05:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GjlEm7uXIoV4z4Cw9W2AvWTEhtzxCnPvZA/nCAUQVEI=;
 b=qQcf1kBdivMQHd5LGXpbatgNc5D6KMm3oBkCOfYI4GqiHUI4hEUfNkvzdr9C04QKN8
 6NG7n4WR96msj5Pwf+bQ9v3mGlxCYf4AHRuKsdq+LTvVQtfzBXkr3S8Zo/EuCPdw/lqo
 iMNjOedbJbVzlUtjYv3FgIJMk5HJDEW2ZqyLacLHomHU7BKEnpfDUCIOI1vzVpkc2JoJ
 f4vRcef4rKZ2HJtnyW40xakd0YaEUNkSEirD3Id8cgfcvmJq6qqnN/mSLf7y90wca3GF
 Lpoql1pn1xD2eH1uE1n77/oSIlkhGva5nEiafi+S98xw1mL5c0RzZUGWQjziwxdwyslu
 6njA==
X-Gm-Message-State: ACgBeo3ZlAPVHBRJgKZLOoBC6rCO3akqNFCZtz4sqfwxaZpavmzjIpQb
 6v2E4XbGlc0OcSooj3IJ4ZHlB/ApzuWrP1a/cyFl47s6AjA=
X-Google-Smtp-Source: AA6agR5BiIhSMvbSsR/g20VFs6ar6u78FdBa3syaBljD6nYoX2fAxGUJrFhh9o7uL19dNvJyxM+zYgjW2hOcGIZ6tBg=
X-Received: by 2002:aa7:c946:0:b0:43d:3038:1381 with SMTP id
 h6-20020aa7c946000000b0043d30381381mr19072107edt.354.1660654420715; Tue, 16
 Aug 2022 05:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220816094829.377-1-guillaume.bressaix@gmail.com>
 <20220816120109.1a348d39@windsurf>
 <14985_1660644771_62FB6DA3_14985_149_1_20220816101249.GA2027648@tl-lnx-nyma7486>
 <20220816135325.169146bf@windsurf>
 <30735_1660651483_62FB87DB_30735_129_1_20220816120440.GA2939@tl-lnx-nyma7486>
In-Reply-To: <30735_1660651483_62FB87DB_30735_129_1_20220816120440.GA2939@tl-lnx-nyma7486>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Tue, 16 Aug 2022 14:53:14 +0200
Message-ID: <CAJe0E3cLyPiuh3v6Z6FOAegGJp=4N1MNC9iKG0pEKkxMpJf4gg@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GjlEm7uXIoV4z4Cw9W2AvWTEhtzxCnPvZA/nCAUQVEI=;
 b=cTdK+a7UPVkR4w5ouoNAizEZEu4ylP0drhVLQkDzsLYhPSa9IBhx2Qw+HpuCaw4t2Y
 R+5MBpVWZ5Vf+/qdh8xVZ7WCX6OvKJ1cZ0AraewFx5QqCEMgEwv4xjCze2AhZa5OzuBm
 Op01RWiQ+TpHn1zRG/+vvnrf8OLVbRpO7pdNvSPUgDR2haUm/bNHUHGO50Pjsp2NTPH9
 QAEK8/xVfJFDADnNJNLh12Tw31vW+svpgoUvIcjMjBVf/x0Db/J8gzMHFQ+AczbdYne1
 el0rQ5HIfD9eEOvlAKc2mX8vNYXRjZRW/uwo3sq8YIWwkfe1dwpciaEAxKeSH2mDV9le
 O4RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cTdK+a7U
Subject: Re: [Buildroot] [RFC 1/1] package/pkg-meson.mk: handle possibly non
 existing compilers
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
Cc: buildroot@busybox.net, Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============0536265845893017378=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0536265845893017378==
Content-Type: multipart/alternative; boundary="000000000000d76ac205e65b3cb7"

--000000000000d76ac205e65b3cb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

>> So, yes, we tried for CXX, and no, we do not want to do it again. For
>> consistency, we should not try for other languages either, I believe.
>So, the Meson-specific solution proposed by Guillaume is relevant

that was my understanding from Yann's clarifications this morning. I
submitted a V1 (non RFC) with your corrections, please disregard the RFC
from now on

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mar. 16 ao=C3=BBt 2022 =C3=A0 14:04, <yann.morin@orange.com> a =C3=A9cri=
t :

> Thomas, All,
>
> On 2022-08-16 13:53 +0200, Thomas Petazzoni spake thusly:
> > On Tue, 16 Aug 2022 12:12:49 +0200
> > <yann.morin@orange.com> wrote:
> [--SNIP--]
> > > So, yes, we tried for CXX, and no, we do not want to do it again. For
> > > consistency, we should not try for other languages either, I believe.
> > So, the Meson-specific solution proposed by Guillaume is relevant?
>
> Yes, I believe so. Disabling use/detection of tools should be a
> per-infra solution: the meson solution (use /bin/false) is incompatible
> with the autotools (which break with /bin/false).
>
> As for why using /bin/false in meson, see:
>     https://lore.kernel.org/buildroot/20220809162534.GE3168@scaer/
>
> Regards,
> Yann E. MORIN.
>
> --
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> | +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> |      yann.morin (at) orange.com      |_=3D"    ,--' | / \ HTML MAIL    =
|
> '--------------------------------------:______/_____:------------------'
>
>
>
> _________________________________________________________________________=
________________________________________________
>
> Ce message et ses pieces jointes peuvent contenir des informations
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages
> electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme o=
u
> falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have bee=
n
> modified, changed or falsified.
> Thank you.
>
>

--000000000000d76ac205e65b3cb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>&gt;&gt;<span class=3D"gmail-im" style=3D"co=
lor:rgb(80,0,80)">=C2=A0So, yes, we tried for CXX, and no, we do not want t=
o do it again. For<br>&gt;&gt; consistency, we should not try for other lan=
guages either, I believe.<br></span>&gt;So, the Meson-specific solution pro=
posed by Guillaume is relevant<div><br></div><div>that was my understanding=
 from Yann&#39;s clarifications this morning. I submitted a V1 (non RFC) wi=
th your corrections, please disregard the RFC from now on<br><br clear=3D"a=
ll"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div><div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. =
Bres<br></font></div><font face=3D"arial,helvetica,sans-serif">Software eng=
ineer</font><br></div><font face=3D"arial,helvetica,sans-serif"></font></di=
v><font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume=
.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;=
<br></font></div></div></div></div></div></div><br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 16 ao=
=C3=BBt 2022 =C3=A0=C2=A014:04, &lt;<a href=3D"mailto:yann.morin@orange.com=
">yann.morin@orange.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Thomas, All,<br>
<br>
On 2022-08-16 13:53 +0200, Thomas Petazzoni spake thusly:<br>
&gt; On Tue, 16 Aug 2022 12:12:49 +0200<br>
&gt; &lt;<a href=3D"mailto:yann.morin@orange.com" target=3D"_blank">yann.mo=
rin@orange.com</a>&gt; wrote:<br>
[--SNIP--]<br>
&gt; &gt; So, yes, we tried for CXX, and no, we do not want to do it again.=
 For<br>
&gt; &gt; consistency, we should not try for other languages either, I beli=
eve.<br>
&gt; So, the Meson-specific solution proposed by Guillaume is relevant?<br>
<br>
Yes, I believe so. Disabling use/detection of tools should be a<br>
per-infra solution: the meson solution (use /bin/false) is incompatible<br>
with the autotools (which break with /bin/false).<br>
<br>
As for why using /bin/false in meson, see:<br>
=C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/buildroot/20220809162534.G=
E3168@scaer/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
buildroot/20220809162534.GE3168@scaer/</a><br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ________=
____<br>
.-----------------.--------------------:=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =
=C2=A0 :------------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded |=C2=A0 =C2=A0 __/ )=C2=A0=
 =C2=A0| /&quot;\ ASCII RIBBON |<br>
| +33 534.541.179 | Software=C2=A0 Designer |=C2=A0 _/ - /&#39;=C2=A0 =C2=
=A0| \ / CAMPAIGN=C2=A0 =C2=A0 =C2=A0|<br>
| +33 638.411.245 &#39;--------------------: (_=C2=A0 =C2=A0 `--, |=C2=A0 X=
=C2=A0 AGAINST=C2=A0 =C2=A0 =C2=A0 |<br>
|=C2=A0 =C2=A0 =C2=A0 yann.morin (at) <a href=3D"http://orange.com" rel=3D"=
noreferrer" target=3D"_blank">orange.com</a>=C2=A0 =C2=A0 =C2=A0 |_=3D&quot=
;=C2=A0 =C2=A0 ,--&#39; | / \ HTML MAIL=C2=A0 =C2=A0 |<br>
&#39;--------------------------------------:______/_____:------------------=
&#39;<br>
<br>
<br>
___________________________________________________________________________=
______________________________________________<br>
<br>
Ce message et ses pieces jointes peuvent contenir des informations confiden=
tielles ou privilegiees et ne doivent donc<br>
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu=
 ce message par erreur, veuillez le signaler<br>
a l&#39;expediteur et le detruire ainsi que les pieces jointes. Les message=
s electroniques etant susceptibles d&#39;alteration,<br>
Orange decline toute responsabilite si ce message a ete altere, deforme ou =
falsifie. Merci.<br>
<br>
This message and its attachments may contain confidential or privileged inf=
ormation that may be protected by law;<br>
they should not be distributed, used or copied without authorisation.<br>
If you have received this email in error, please notify the sender and dele=
te this message and its attachments.<br>
As emails may be altered, Orange is not liable for messages that have been =
modified, changed or falsified.<br>
Thank you.<br>
<br>
</blockquote></div>

--000000000000d76ac205e65b3cb7--

--===============0536265845893017378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0536265845893017378==--
