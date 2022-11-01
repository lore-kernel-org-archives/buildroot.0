Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1988C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 18:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E1A040462;
	Tue,  1 Nov 2022 18:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E1A040462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZenLgeGuUo4D; Tue,  1 Nov 2022 18:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6822C4017C;
	Tue,  1 Nov 2022 18:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6822C4017C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70CD11BF5F8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ABFB60C21
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 18:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABFB60C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4biYMkAng1yF for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 18:17:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E3A60595
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96E3A60595
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 18:17:17 +0000 (UTC)
Received: from smtpclient.apple ([151.36.0.209])
 by Aruba Outgoing Smtp  with ESMTPA
 id pvp4oNKw71jfKpvp5oHPlu; Tue, 01 Nov 2022 19:17:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 1 Nov 2022 19:17:04 +0100
Message-Id: <BB333DC5-7EE1-4639-9C40-32AAA778DA2C@benettiengineering.com>
References: <CA+_SqVZMnZvF2-n4HvrUUg1=k-VT4QBZGNAHZpoGM86y37fyuw@mail.gmail.com>
In-Reply-To: <CA+_SqVZMnZvF2-n4HvrUUg1=k-VT4QBZGNAHZpoGM86y37fyuw@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailer: iPhone Mail (20A392)
X-CMAE-Envelope: MS4xfOBL311iz76a3rc2JkI6YIVlTm3DhyiTjVxw2sFJ8e6rYHTCj7ctbdm0PeVNk3f0+XOzz92jpZ1YbITY2qZV+iMWrUgbJLmr2ppEr73k9XaIcFKmuvzb
 BqotrMuZCq67QMutX0ONdxxDFRqEo+mVI3jGeBsZd8Cnnfv6ejP7xEUN0o8SWKHho14IeTEdyFcHLOA0wx7nHrM1REnL6NT4P3yNJEjfVTUrG0TDAUXHiuXp
 Lt25pw6+vpDTNf+zVVqk79KNIuGlJEIUZsHF4+EO/Ons+oNKZWkmRc78IonWsnU/ZdQ3FQFviK85YBbcLaHNEENmqj8Z2MBj/KiVUY+z4mzdw+9L8VlxkTJO
 jvdr2+2DCaSqssMSBmkx8oe11gIegA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1667326636; bh=Ag/zVsHGzRtqcaiN3P+h3wrL6gOhlB5mnc2JxWR24HA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=aRiXlWoIDOU4UDWh2MNjBEjMPSE4vK7T+D2aYDtBDb/PrHKEc+VoRPmTOWTXONioj
 Ik+B746T4KCOILlUDh2GUU22nI48clElWPwjfytXksT2jQtWKICo4o1QMc6PAGnmVo
 zYCCnQVGZMED1OqVevv8SKv5WKNBBh+YvNxNHOAHocHVQ9LS8qKk8YTSaoNMKY18zJ
 sEavqZyxMNBHXbIfFvuYXgnaFYOuamT2nUspChHV48ecjjqJYY+bZjPHi7UaiJVmBG
 aWaofeSDoULIs+kKHWzVJ5SKZ3i8K7ELrVoM3GHmBTznz2I0Gdd4Jkc0xDQ9HW7f23
 FL1E+WhMoyMBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aRiXlWoI
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7633690982959031854=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7633690982959031854==
Content-Type: multipart/alternative; boundary=Apple-Mail-D15D8A7D-1D58-44F6-B7A1-531C198D8328
Content-Transfer-Encoding: 7bit


--Apple-Mail-D15D8A7D-1D58-44F6-B7A1-531C198D8328
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Angelo,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 1 nov 2022, alle ore 10:20, Angelo Compagnucci &=
lt;angelo@amarulasolutions.com&gt; ha scritto:<br><br></blockquote></div><bl=
ockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"auto"><div><br>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 1=
 nov 2022, 09:32 Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr=
">yann.morin.1998@free.fr</a>&gt; ha scritto:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Giulio, All,<br>
<br>
On 2022-11-01 03:27 +0100, Giulio Benetti spake thusly:<br>
&gt; On 31/10/22 13:54, Yann E. MORIN wrote:<br>
&gt; &gt;On 2022-10-31 13:25 +0100, Thomas Petazzoni via buildroot spake thu=
sly:<br>
&gt; &gt;&gt;On Wed, 19 Oct 2022 01:46:17 +0200<br>
&gt; &gt;&gt;Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengi=
neering.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettiengi=
neering.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;At the moment all APIs folders are copied to target increas=
ing the size of<br>
&gt; &gt;&gt;&gt;rootfs of ~190MB. Allow to select which API folders we want=
 to copy to<br>
&gt; &gt;&gt;&gt;target to shrink rootfs down.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.=
benetti@benettiengineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.=
benetti@benettiengineering.com</a>&gt;<br>
&gt; &gt;&gt;Practically speaking, could you describe which folders are need=
ed in a<br>
&gt; &gt;&gt;typical scenario you've had?<br>
&gt; &gt;Yes, can you provide a rationale for when only a subset of APIs is<=
br>
&gt; &gt;needed?<br>
&gt; I've answered on previous e-mail. I've realized only now that I could<b=
r>
&gt; answer to your e-mail for both.<br>
<br>
Hey, what you answered Thomas is not a rationale, it is an example. ;-)<br>
A rationale is "an explanation of controlling principles of opinion,<br>
belief, practice, or phenomena", or "an underlying reason". [0]<br>
<br>
As a rationale, I would have expected something that explains the reason<br>=

why there are so many directories, and so why, under some circumstances,<br>=

we can get rid of them (or not). It needs not be too long, but just<br>
provide an overview. For example, here is a totally made up blurb:<br>
<br>
&nbsp; &nbsp; mono provides support for a lot of legacy APIs for backward<br=
>
&nbsp; &nbsp; compatibility for existing applications, way back from the fir=
st<br>
&nbsp; &nbsp; stable API, 2.0 and up to the current version. The set of APIs=
 are<br>
&nbsp; &nbsp; split in two categories: version-based APIs, and the rest (gac=
, the<br>
&nbsp; &nbsp; FooBar set of common Baz; monodoc, which renders documentation=
 while<br>
&nbsp; &nbsp; riding a unicycle...).<br>
<br>
&nbsp; &nbsp; For a custom application, the set of required versioned APIs i=
s<br>
&nbsp; &nbsp; limited; most often only the latest or the very few latest are=
<br>
&nbsp; &nbsp; needed. Only gac is always required, and monodoc is never used=
 on<br>
&nbsp; &nbsp; the target as we never render the documentation there.<br>
<br>
[0] <a href=3D"https://www.merriam-webster.com/dictionary/rationale" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://www.merriam-webster.com/dic=
tionary/rationale</a><br>
<br>
[--SNIP--]<br>
&gt; &gt;&gt;Should we instead have a single string option<br>
&gt; &gt;&gt;BR2_PACKAGE_MONO_INSTALL_LIB_DIRS, which is empty by default. W=
hen<br>
&gt; &gt;&gt;empty, it means all folders are installed. Otherwise, only the<=
br>
&gt; &gt;&gt;specified folders are installed.<br>
&gt; &gt;Agreed. I expect that having no API level installed would yield a<b=
r>
&gt; &gt;non-working system, so:<br>
&gt; &gt;&nbsp; &nbsp; &nbsp;config BR2_PACKAGE_MONO_API_VERSIONS<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;string "API versions to install"<=
br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;help<br>
&gt; &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Keep empty to install all.=
<br>
&gt; Ok, I go with that then!<br>
<br>
ACK.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">My two cents. Historically, the mono configure was offering some options t=
o enable only some versions of the API which was lately removed&nbsp;</div><=
div dir=3D"auto">So, removing older compatibility API folders should be perf=
ectly fine. We cannot remove the Global Assembly Cache (GAC).</div></div></d=
iv></blockquote><div><br></div><div>Thanks for pointing.</div><br><blockquot=
e type=3D"cite"><div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">For the rest, it would be nice if Giulio could do some t=
esting (I can try it too) to understand at what extent we can remove any oth=
er folder.</div></div></div></blockquote><div><br></div><div>Can you please d=
o that and in case integrate this patch later with another patch?</div><div>=
At the moment IMHO this patch is enough for its purpose.</div><div><br></div=
><div>Thank you!</div><div><br></div><div>Best regards</div><div>Giulio</div=
><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"auto"><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.-----------------=
---.<br>
|&nbsp; Yann E. MORIN&nbsp; | Real-Time Embedded | /"\ ASCII RIBBON | Erics'=
 conspiracy: |<br>
| +33 662 376 056 | Software&nbsp; Designer | \ / CAMPAIGN&nbsp; &nbsp; &nbs=
p;|&nbsp; ___&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|<br>
| +33 561 099 427 `------------.-------:&nbsp; X&nbsp; AGAINST&nbsp; &nbsp; &=
nbsp; |&nbsp; \e/&nbsp; There is no&nbsp; |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL&nbsp=
; &nbsp; |&nbsp; &nbsp;v&nbsp; &nbsp;conspiracy.&nbsp; |<br>
'------------------------------^-------^------------------^-----------------=
---'<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"noreferr=
er">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/l=
istinfo/buildroot</a><br>
</blockquote></div></div></div>
</div></blockquote></body></html>=

--Apple-Mail-D15D8A7D-1D58-44F6-B7A1-531C198D8328--

--===============7633690982959031854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7633690982959031854==--
