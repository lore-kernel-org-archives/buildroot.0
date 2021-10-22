Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2571C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 14:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3AC61269
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 14:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB3AC61269
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cfl.rr.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5532C60852;
	Fri, 22 Oct 2021 14:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAPMdBON8Xw6; Fri, 22 Oct 2021 14:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A0CB60858;
	Fri, 22 Oct 2021 14:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 747D71BF325
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 14:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 608A383A8F
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 14:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXT5gbmxdsua for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 14:13:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from p-impout008.msg.pkvw.co.charter.net
 (p-impout008aa.msg.pkvw.co.charter.net [47.43.26.139])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6647880E22
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 14:13:10 +0000 (UTC)
Received: from JohnDesktop ([68.204.142.231]) by cmsmtp with ESMTP
 id dvICmEQAroI3UdvICmoPnC; Fri, 22 Oct 2021 14:13:09 +0000
X-Authority-Analysis: v=2.4 cv=d4kwdTvE c=1 sm=1 tr=0 ts=6172c6f5
 a=2gSu1OBQ6d18tulzamKkMg==:117 a=2gSu1OBQ6d18tulzamKkMg==:17
 a=DAwyPP_o2Byb1YXLmDAA:9 a=-FCqDYKNWoCsx0WMmb8A:9 a=CjuIK1q_8ugA:10
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=Dlr1rRJeB7P8vZWVunwA:9
 a=2RMtv4NDw1CV0Opl:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
From: "John" <joblacker@cfl.rr.com>
To: <buildroot@buildroot.org>
Date: Fri, 22 Oct 2021 10:13:12 -0400
Message-ID: <000201d7c74e$f2d6aa10$d883fe30$@cfl.rr.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdfHTdcKzeGnzcAFSRGmpsZ7wccOxg==
Content-Language: en-us
X-CMAE-Envelope: MS4xfAe5ZtfsDzAciZyxdVinlXCL0u2vxuDOkglx89dxzv/mre78lCQ1Dr/ZQPB8gf4OHwm3dPwODoZnUqrWPhnOnhKJOMOxdSc90jKXpeqSgV/j0kNdEX/y
 jL6UyfmWVGlI4nShg4IWND6l7FFKATc6vBEAi1YmenlbNAbvENC74KW3EKu49JLaDm8caBMUvL5kIQ==
Subject: [Buildroot] make failure trying to buildroot for raspberry pi 3
 using external toolchain
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
Reply-To: joblacker@cfl.rr.com
Content-Type: multipart/mixed; boundary="===============4194673468478925479=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multipart message in MIME format.

--===============4194673468478925479==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01D7C72D.6BC57F40"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_0003_01D7C72D.6BC57F40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I'm trying to perform a make using the latest buildroot version (2021.08.1)
but it fails at the point of trying to build libgpg-error.  I'm running on a
Ubuntu 20.04 VM under 

Windows 10 VBox.  Here's what I believe is the pertinent output info:

 

configure: WARNING: unrecognized options: --disable-gtk-doc,
--disable-gtk-doc-html, --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
--disable-nls

 

        GPGME v1.15.1 has been configured as follows:

 

        Revision:          bb988077  (48024)

        Platform:          arm-buildroot-linux-gnueabihf

 

        UI Server:         yes

        FD Passing:        yes

 

        Language bindings: cl cpp

 

        Mismatches between the target platform and the to

        be used libraries have been been detected for:

          libgpg-error

        Please check above for warning messages.

End of output log:

 

libtool: compile:
/home/jb/GitHub/buildroot/output/host/bin/armv8-rpi3-linux-gnueabihf-gcc
-DHAVE_CONFIG_H -I. -I../conf -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroo
t/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -Wall -Wcast-align
-Wshadow -Wstrict-prototypes -Wno-format-y2k -Wno-missing-field-initializers
-Wno-sign-compare -Wno-format-zero-length -Wno-format-truncation
-Wno-sizeof-pointer-div -c debug.c  -fPIC -DPIC -o .libs/debug.o

libtool: compile:
/home/jb/GitHub/buildroot/output/host/bin/armv8-rpi3-linux-gnueabihf-gcc
-DHAVE_CONFIG_H -I. -I../conf -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
-I/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroo
t/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -Wall -Wcast-align
-Wshadow -Wstrict-prototypes -Wno-format-y2k -Wno-missing-field-initializers
-Wno-sign-compare -Wno-format-zero-length -Wno-format-truncation
-Wno-sizeof-pointer-div -c version.c  -fPIC -DPIC -o .libs/version.o

make[2]: *** [Makefile:534: all-recursive] Error 1

make[1]: *** [package/pkg-generic.mk:270:
/home/jb/GitHub/buildroot/output/build/libgpgme-1.15.1/.stamp_built] Error 2

make: *** [Makefile:84: _all] Error 2

 

Perhaps I have a configuration error but I don't know what it is.

Please help.

 

John Blacker


------=_NextPart_000_0003_01D7C72D.6BC57F40
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>I&#8217;m trying to perform a =
make using the latest buildroot version (2021.08.1) but it fails at the =
point of trying to build libgpg-error. &nbsp;I&#8217;m running on a =
Ubuntu 20.04 VM under <o:p></o:p></p><p class=3DMsoNormal>Windows 10 =
VBox.&nbsp; Here&#8217;s what I believe is the pertinent output =
info:<o:p></o:p></p><div =
style=3D'mso-element:para-border-div;border:none;border-bottom:solid =
windowtext 1.0pt;padding:0in 0in 1.0pt 0in'><p class=3DMsoNormal =
style=3D'border:none;padding:0in'><o:p>&nbsp;</o:p></p></div><p =
class=3DMsoNormal>configure: WARNING: unrecognized options: =
--disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, =
--disable-docs, --disable-documentation, --with-xmlto, --with-fop, =
--enable-ipv6, --disable-nls<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GPGME =
v1.15.1 has been configured as follows:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Revision:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
bb988077&nbsp; (48024)<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Platform:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
arm-buildroot-linux-gnueabihf<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UI =
Server:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
yes<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FD =
Passing:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Language =
bindings: cl cpp<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mismatches =
between the target platform and the to<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; be used =
libraries have been been detected for:<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
libgpg-error<o:p></o:p></p><div =
style=3D'mso-element:para-border-div;border:none;border-bottom:solid =
windowtext 1.0pt;padding:0in 0in 1.0pt 0in'><p class=3DMsoNormal =
style=3D'border:none;padding:0in'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Please check above for warning messages.<o:p></o:p></p></div><p =
class=3DMsoNormal>End of output log:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>libtool: =
compile:&nbsp; =
/home/jb/GitHub/buildroot/output/host/bin/armv8-rpi3-linux-gnueabihf-gcc =
-DHAVE_CONFIG_H -I. -I../conf -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 =
-I/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sys=
root/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 -Os -g0 -D_FORTIFY_SOURCE=3D1 -Wall =
-Wcast-align -Wshadow -Wstrict-prototypes -Wno-format-y2k =
-Wno-missing-field-initializers -Wno-sign-compare =
-Wno-format-zero-length -Wno-format-truncation -Wno-sizeof-pointer-div =
-c debug.c&nbsp; -fPIC -DPIC -o .libs/debug.o<o:p></o:p></p><p =
class=3DMsoNormal>libtool: compile:&nbsp; =
/home/jb/GitHub/buildroot/output/host/bin/armv8-rpi3-linux-gnueabihf-gcc =
-DHAVE_CONFIG_H -I. -I../conf -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 =
-I/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sys=
root/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 -Os -g0 -D_FORTIFY_SOURCE=3D1 -Wall =
-Wcast-align -Wshadow -Wstrict-prototypes -Wno-format-y2k =
-Wno-missing-field-initializers -Wno-sign-compare =
-Wno-format-zero-length -Wno-format-truncation -Wno-sizeof-pointer-div =
-c version.c&nbsp; -fPIC -DPIC -o .libs/version.o<o:p></o:p></p><p =
class=3DMsoNormal>make[2]: *** [Makefile:534: all-recursive] Error =
1<o:p></o:p></p><p class=3DMsoNormal>make[1]: *** =
[package/pkg-generic.mk:270: =
/home/jb/GitHub/buildroot/output/build/libgpgme-1.15.1/.stamp_built] =
Error 2<o:p></o:p></p><p class=3DMsoNormal>make: *** [Makefile:84: _all] =
Error 2<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Perhaps I have a configuration error but I don&#8217;t =
know what it is&#8230;<o:p></o:p></p><p class=3DMsoNormal>Please =
help.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>John Blacker<o:p></o:p></p></div></body></html>
------=_NextPart_000_0003_01D7C72D.6BC57F40--


--===============4194673468478925479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4194673468478925479==--

