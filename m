Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993C6C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 18:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50A5408AA;
	Sun,  7 Aug 2022 18:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50A5408AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLJDsmeEPq85; Sun,  7 Aug 2022 18:19:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDA4640893;
	Sun,  7 Aug 2022 18:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDA4640893
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9115A1BF404
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 18:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6929682893
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 18:19:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6929682893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eutizk6qJ7DJ for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 18:19:49 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D03F582883
Received: from smtpcmd15186.aruba.it (smtpcmd15186.aruba.it [62.149.156.186])
 by smtp1.osuosl.org (Postfix) with ESMTP id D03F582883
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 18:19:48 +0000 (UTC)
Received: from smtpclient.apple ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPA
 id KklWoyQREXOlAKklXougIC; Sun, 07 Aug 2022 20:12:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Message-Id: <B7F5A0A8-F2BF-4DCB-85BA-16B75FA9E4DA@benettiengineering.com>
Date: Sun, 7 Aug 2022 20:12:42 +0200
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
X-Mailer: iPhone Mail (19G71)
X-CMAE-Envelope: MS4xfHg39yrhsXnTuKrl4AzIoRQzYyj4VG6IUdxOSbwbiCTN19HFAYnO31feETHSH6QC0NOLh1Ee+MozDbi2KGwKnPEFhdaH7H3/EjOjC4/mnD+nSTv+3M0Q
 PQM0ovvuAM5rsYxjOLuD6th74ssmj7Xkpu121Fn6i2w+DDga3P3HcEYSNUDA3PNOo9pwIvVm5/XiFuVbRb29FMgwkB9ZPxcPJlGlFsxxDJ6HazKyPH7dDC5d
 GLiw6QPEdKBU0GOGZBx1WsHsDvVNpqdUYFJNdk5WrR4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659895964; bh=VVmfJX02AE6m3wGls2+Ld6kqAtc7ggMbsIKD65rJsyg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=UsydjxiIZJTCyop6S/W9Kcu71lNMQlz7xrCFj7CwUfIIOTB9czZTp3x7A1ZOFFOBO
 k+L+2oj7jzM7UQm/sb6b/fo8q9/0NEg3dnWv3aljFtzZoHjlmjdIYRBlNJJoCVxBc9
 AkxUpAXhrpP5GcwjXvAN83N/aL3faV7IWYT0CJI6kTQWPvrxjBP5i2uxQnDPy1V9lp
 I6JKCLQPlz2VmqnltHt+4n/sB7HuWsa/8ibYI09jmRD3U3Wtmrbn2f+mgeCeABuWcy
 MO1Pxfk03Y/kSHrzMzlUhy06203KeC+SRKQkohBIoW0XvdvaijzKmT76BGWEtcn2yI
 ZuvcojvLfv8QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UsydjxiI
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
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
Content-Type: multipart/mixed; boundary="===============5833651381179824031=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5833651381179824031==
Content-Type: multipart/alternative; boundary=Apple-Mail-2A1F8B52-8732-4754-9016-B1F26A293980
Content-Transfer-Encoding: 7bit


--Apple-Mail-2A1F8B52-8732-4754-9016-B1F26A293980
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHi Stefano,

I give a try tonight and let you know.

Giulio

Inviato da iPhone

> Il giorno 7 ago 2022, alle ore 11:13, Stefano Cottafavi <stefano.cottafavi=
@gmail.com> ha scritto:
> =EF=BB=BF
> Hi Giulio,
> thanks for trying that out. Your assumptions are correct, I export the SDK=
 with "make sdk" and use that in QtCreator to build my application.
>=20
> Looking at the location you pointed out I can indeed find some of the head=
ers, but not all of the opencv modules that have been enabled in the defconf=
ig.
> As per my original message I believe the problem is somewhat related to (s=
ome of?) the modules.=20
> Sticking to the case of objdetect module and following the breadcrumbs:
> - the module is enabled in defconfig with BR2_PACKAGE_OPENCV4_LIB_OBJDETEC=
T=3Dy
> - the module src are available to buildroot in output/build/opencv4-4.5.5/=
modules/objdetect/
>=20
> yet the module is not flagged for compilation in output/build/opencv4-4.5.=
5/buildroot-build/opencv2/
>=20
> #define HAVE_OPENCV_CALIB3D
> #define HAVE_OPENCV_CORE
> #define HAVE_OPENCV_FEATURES2D
> #define HAVE_OPENCV_FLANN
> #define HAVE_OPENCV_GAPI
> #define HAVE_OPENCV_IMGCODECS
> #define HAVE_OPENCV_IMGPROC
> #define HAVE_OPENCV_ML
> #define HAVE_OPENCV_VIDEO
> #define HAVE_OPENCV_VIDEOIO
>=20
> and never makes it to the sysroot of the sdk, on my end.
> can you reproduce the issue?
>=20
> Stef
>=20
>=20
> On Sun, Aug 7, 2022 at 12:46 AM Giulio Benetti <giulio.benetti@benettiengi=
neering.com> wrote:
>> Hi Stefano,
>>=20
>> On 06/08/22 23:54, Giulio Benetti wrote:
>> > Subject:
>> > Re: [Buildroot] OpenCV modules headers not in the SDK
>> > From:
>> > Giulio Benetti <giulio.benetti@benettiengineering.com>
>> > Date:
>> > 06/08/22, 23:54
>> >=20
>> > To:
>> > Stefano Cottafavi <stefano.cottafavi@gmail.com>
>> > CC:
>> > buildroot@buildroot.org
>> >=20
>> >=20
>> > Hi Stefano,
>> >=20
>> > On 06/08/22 20:15, Stefano Cottafavi wrote:
>> >> Hi Giulio,
>> >> thanks for the quick reply. Here's the defconfig=20
>> >> https://pastebin.com/Xsh5d4HG <https://pastebin.com/Xsh5d4HG>
>> >> For the sake of completeness I didn't remove any of the lines, but=20
>> >> some are specific to my out-of-tree folder and overlays, so you might=20=

>> >> want to get rid of those.
>> >>
>> >> I'm currently building the 2022.05.1 tag with SHA=20
>> >> 2e399893b4f60f1e103228df6e4439d4e4ac3dd5
>> >=20
>> > Thank you. I'm building it right now. The package opencv4.mk looks
>> > correct because it does have OPENCV4_INSTALL_STAGING =3D YES, and that
>> > should install the header files. If there is a bug it could be inside
>> > opencv4 cmake itself.
>> >=20
>> > By the way, I guess the problem you're experience is that you after
>> > building the Buildroot's defconfig you try to build another application=

>> > (i.e. a qt5 application) that requires opencv4 and it can't find the
>> > headers, right?
>>=20
>> I've built and I can find the headers(.hpp) files under:
>> output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4/ope=
ncv2
>> according to:
>> https://docs.opencv.org/4.x/examples.html
>> where all examples include directly:
>> #include "opencv2/shape.hpp"
>> ...
>>=20
>> Can you double check if files are there?
>>=20
>> If you can find them then it could be a problem with your application
>> include path where you should explictly add=20
>> "output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4"=20=

>> to -I search path. In Qt5,
>> that I suspect you're using, add INCLUDEPATH to .pro file and re-run
>> qmake and then rebuild.
>>=20
>> Let me know if this fixes the problems.
>>=20
>> Best regards
>> --=20
>> Giulio Benetti
>> Benetti Engineering sas
>>=20
>> > Best regards
>> > --=20
>> > Giulio Benetti
>> > Benetti Engineering sas
>> >=20
>> >> Looking forward to your insights.
>> >>
>> >> Best
>> >> Stefano
>> >>
>> >> On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti=20
>> >> <giulio.benetti@benettiengineering.com=20
>> >> <mailto:giulio.benetti@benettiengineering.com>> wrote:
>> >>
>> >>     Hi Stefano,
>> >>
>> >>>     Il giorno 6 ago 2022, alle ore 19:29, Stefano Cottafavi
>> >>>     <stefano.cottafavi@gmail.com <mailto:stefano.cottafavi@gmail.com>=
>
>> >>>     ha scritto:
>> >>>
>> >>>     =EF=BB=BF
>> >>>     Hi all,
>> >>>     I've successfully built Buildroot 2022.05 for the Raspberry Pi4
>> >>>     adding support for Qt5 and OpenCV (including objdetect module
>> >>>     amongst few other).
>> >>>     I've also managed to generate the SDK for such a build however I
>> >>>     can't find the header files of those OpenCV modules anywhere in
>> >>>     the SDK.
>> >>>
>> >>>     Is this expected or a bug?
>> >>
>> >>     It looks like a bug. Can you please pastebin your specific defconf=
ig?
>> >>
>> >>     You can obtain it moving to your output folder and  issuing:
>> >>     $ make savedeconfig
>> >>     then you obtain a file called defconfig so copy and paste it on
>> >>     pastebin and provide here
>> >>     the link to the pastebin and also the SHA1 commit of your Buildroo=
t
>> >>     git or the specific version.
>> >>
>> >>     This way we can help you.
>> >>
>> >>     Best regards
>> >>     =E2=80=94
>> >>     Giulio Benetti
>> >>     CEO/CTO@Benetti Engineering sas
>> >>
>> >>>
>> >>>     Cheers,
>> >>>     Stefano
>> >>>     _______________________________________________
>> >>>     buildroot mailing list
>> >>> buildroot@buildroot.org <mailto:buildroot@buildroot.org>
>> >>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> >>> <https://lists.buildroot.org/mailman/listinfo/buildroot>
>> >>
>> >>
>> >> _______________________________________________
>> >> buildroot mailing list
>> >> buildroot@buildroot.org
>> >> https://lists.buildroot.org/mailman/listinfo/buildroot
>> >=20
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-2A1F8B52-8732-4754-9016-B1F26A293980
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8">Hi Stefano,<div><br></=
div><div>I give a try tonight and let you know.</div><div><br></div><div>Giu=
lio<br><br><div dir=3D"ltr">Inviato da iPhone</div><div dir=3D"ltr"><br><blo=
ckquote type=3D"cite">Il giorno 7 ago 2022, alle ore 11:13, Stefano Cottafav=
i &lt;stefano.cottafavi@gmail.com&gt; ha scritto:<br><br></blockquote></div>=
<blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sma=
ll">Hi Giulio,</div><div class=3D"gmail_default" style=3D"font-family:monosp=
ace,monospace;font-size:small">thanks for trying that out. Your assumptions a=
re correct, I export the SDK with "make sdk" and use that in QtCreator to bu=
ild my application.</div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace;font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace,monospace;font-size:small">Looking at the loca=
tion you pointed out I can indeed find some of the headers, but not all of t=
he opencv modules that have been enabled in the defconfig.</div><div class=3D=
"gmail_default" style=3D"font-family:monospace,monospace;font-size:small">As=
 per my original message I believe the problem is somewhat related to (some o=
f?) the modules.&nbsp;</div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace,monospace;font-size:small">Sticking to the case of objdetect mod=
ule and following the breadcrumbs:</div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small">- the module is enabled in=
 defconfig with&nbsp;<span style=3D"color:rgb(0,0,0);white-space:pre-wrap;fo=
nt-family:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation M=
ono&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,=
monospace,serif;font-size:12px">BR2_PACKAGE_OPENCV4_LIB_OBJDETECT=3Dy</span>=
</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;=
font-size:small"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap;font-f=
amily:Consolas,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono=
&quot;,&quot;DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,mon=
ospace,serif;font-size:12px">- the module src are available to buildroot in <=
/span><span style=3D"font-family:Arial,Helvetica,sans-serif">output/build/op=
encv4-4.5.5/modules/objdetect/</span></div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace;font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">yet the module is not flagged for c=
ompilation in output/build/opencv4-4.5.5/buildroot-build/opencv2/<br><br>#de=
fine HAVE_OPENCV_CALIB3D<br>#define HAVE_OPENCV_CORE<br>#define HAVE_OPENCV_=
FEATURES2D<br>#define HAVE_OPENCV_FLANN<br>#define HAVE_OPENCV_GAPI<br>#defi=
ne HAVE_OPENCV_IMGCODECS<br>#define HAVE_OPENCV_IMGPROC<br>#define HAVE_OPEN=
CV_ML<br>#define HAVE_OPENCV_VIDEO<br>#define HAVE_OPENCV_VIDEOIO<br></div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">and never makes it to the sysroot o=
f the sdk, on my end.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">can you reproduce the issue?</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Stef</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sun, Aug 7, 2022 at 12:46 AM Giulio Benetti &lt;<a href=3D"mailto:gi=
ulio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@benett=
iengineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Stefano,<br>
<br>
On 06/08/22 23:54, Giulio Benetti wrote:<br>
&gt; Subject:<br>
&gt; Re: [Buildroot] OpenCV modules headers not in the SDK<br>
&gt; From:<br>
&gt; Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.=
com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;<br>
&gt; Date:<br>
&gt; 06/08/22, 23:54<br>
&gt; <br>
&gt; To:<br>
&gt; Stefano Cottafavi &lt;<a href=3D"mailto:stefano.cottafavi@gmail.com" ta=
rget=3D"_blank">stefano.cottafavi@gmail.com</a>&gt;<br>
&gt; CC:<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
&gt; <br>
&gt; <br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 06/08/22 20:15, Stefano Cottafavi wrote:<br>
&gt;&gt; Hi Giulio,<br>
&gt;&gt; thanks for the quick reply. Here's the defconfig <br>
&gt;&gt; <a href=3D"https://pastebin.com/Xsh5d4HG" rel=3D"noreferrer" target=
=3D"_blank">https://pastebin.com/Xsh5d4HG</a> &lt;<a href=3D"https://pastebi=
n.com/Xsh5d4HG" rel=3D"noreferrer" target=3D"_blank">https://pastebin.com/Xs=
h5d4HG</a>&gt;<br>
&gt;&gt; For the sake of completeness I didn't remove any of the lines, but <=
br>
&gt;&gt; some are specific to my out-of-tree folder and overlays, so you mig=
ht <br>
&gt;&gt; want to get rid of those.<br>
&gt;&gt;<br>
&gt;&gt; I'm currently building the 2022.05.1 tag with SHA <br>
&gt;&gt; 2e399893b4f60f1e103228df6e4439d4e4ac3dd5<br>
&gt; <br>
&gt; Thank you. I'm building it right now. The package <a href=3D"http://ope=
ncv4.mk" rel=3D"noreferrer" target=3D"_blank">opencv4.mk</a> looks<br>
&gt; correct because it does have OPENCV4_INSTALL_STAGING =3D YES, and that<=
br>
&gt; should install the header files. If there is a bug it could be inside<b=
r>
&gt; opencv4 cmake itself.<br>
&gt; <br>
&gt; By the way, I guess the problem you're experience is that you after<br>=

&gt; building the Buildroot's defconfig you try to build another application=
<br>
&gt; (i.e. a qt5 application) that requires opencv4 and it can't find the<br=
>
&gt; headers, right?<br>
<br>
I've built and I can find the headers(.hpp) files under:<br>
output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4/opencv=
2<br>
according to:<br>
<a href=3D"https://docs.opencv.org/4.x/examples.html" rel=3D"noreferrer" tar=
get=3D"_blank">https://docs.opencv.org/4.x/examples.html</a><br>
where all examples include directly:<br>
#include "opencv2/shape.hpp"<br>
...<br>
<br>
Can you double check if files are there?<br>
<br>
If you can find them then it could be a problem with your application<br>
include path where you should explictly add <br>
"output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4" <br>=

to -I search path. In Qt5,<br>
that I suspect you're using, add INCLUDEPATH to .pro file and re-run<br>
qmake and then rebuild.<br>
<br>
Let me know if this fixes the problems.<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
<br>
&gt; Best regards<br>
&gt; -- <br>
&gt; Giulio Benetti<br>
&gt; Benetti Engineering sas<br>
&gt; <br>
&gt;&gt; Looking forward to your insights.<br>
&gt;&gt;<br>
&gt;&gt; Best<br>
&gt;&gt; Stefano<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti <br>
&gt;&gt; &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com" target=
=3D"_blank">giulio.benetti@benettiengineering.com</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:giulio.benetti@benettiengineering.com"=
 target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; Hi Stefano,<br>
&gt;&gt;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; Il giorno 6 ago 2022, alle ore 19:29, Stefan=
o Cottafavi<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; &lt;<a href=3D"mailto:stefano.cottafavi@gmai=
l.com" target=3D"_blank">stefano.cottafavi@gmail.com</a> &lt;mailto:<a href=3D=
"mailto:stefano.cottafavi@gmail.com" target=3D"_blank">stefano.cottafavi@gma=
il.com</a>&gt;&gt;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; ha scritto:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; =EF=BB=BF<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; Hi all,<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; I've successfully built Buildroot 2022.05 fo=
r the Raspberry Pi4<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; adding support for Qt5 and OpenCV (including=
 objdetect module<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; amongst few other).<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; I've also managed to generate&nbsp;the SDK f=
or such a build however I<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; can't find the header files of those OpenCV m=
odules anywhere in<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; the SDK.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; Is this expected or a bug?<br>
&gt;&gt;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; It looks like a bug. Can you please pastebin you=
r specific defconfig?<br>
&gt;&gt;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; You can obtain it moving to your output folder a=
nd &nbsp;issuing:<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; $ make savedeconfig<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; then you obtain a file called defconfig so copy a=
nd paste it on<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; pastebin and provide here<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; the link to the pastebin and also the SHA1 commi=
t of your Buildroot<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; git or the specific version.<br>
&gt;&gt;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; This way we can help you.<br>
&gt;&gt;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; Best regards<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; =E2=80=94<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; Giulio Benetti<br>
&gt;&gt; &nbsp;&nbsp;&nbsp; CEO/CTO@Benetti Engineering sas<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; Cheers,<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; Stefano<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; ____________________________________________=
___<br>
&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; buildroot mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">bu=
ildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:buildroot@buildroot.o=
rg" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
&gt;&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildro=
ot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
&gt;&gt;&gt; &lt;<a href=3D"https://lists.buildroot.org/mailman/listinfo/bui=
ldroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mai=
lman/listinfo/buildroot</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildr=
oot@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" r=
el=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/list=
info/buildroot</a><br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D=
"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/=
buildroot</a><br>
<br>
</blockquote></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></div></div></body></html>=

--Apple-Mail-2A1F8B52-8732-4754-9016-B1F26A293980--

--===============5833651381179824031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5833651381179824031==--
