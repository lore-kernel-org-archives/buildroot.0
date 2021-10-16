Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0680C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 15:18:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD0C611C3
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 15:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDD0C611C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cfl.rr.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB0583518;
	Sat, 16 Oct 2021 15:18:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Boh1vtSpD5zT; Sat, 16 Oct 2021 15:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1FD834EF;
	Sat, 16 Oct 2021 15:18:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D37551BF3D2
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 15:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3459834EF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 15:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmpPk8-r30OB for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 15:18:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from p-impout007.msg.pkvw.co.charter.net
 (p-impout007aa.msg.pkvw.co.charter.net [47.43.26.138])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCEC3834B9
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 15:18:17 +0000 (UTC)
Received: from JohnDesktop ([68.204.142.231]) by cmsmtp with ESMTP
 id blRwmjacAx0SOblRwml0mv; Sat, 16 Oct 2021 15:18:16 +0000
X-Authority-Analysis: v=2.4 cv=O6T8ADxW c=1 sm=1 tr=0 ts=616aed39
 a=2gSu1OBQ6d18tulzamKkMg==:117 a=2gSu1OBQ6d18tulzamKkMg==:17
 a=DAwyPP_o2Byb1YXLmDAA:9 a=dWvhHfqE0GC_yHGo_iwA:9 a=CjuIK1q_8ugA:10
 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=eAYQlikSwPgIX5rFEZMA:9 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
From: "John" <joblacker@cfl.rr.com>
To: <buildroot@buildroot.org>
Date: Sat, 16 Oct 2021 11:18:19 -0400
Message-ID: <00bc01d7c2a1$0da32d80$28e98880$@cfl.rr.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdfCoQSx9PPUVI3GRo+HcUooneQehQ==
Content-Language: en-us
X-CMAE-Envelope: MS4xfLJZ0HvEmYWMeiu2Wl7jx5U56ZBLVVvWPfFwaXMMnncbJGjZpz8Cn3PHkZrESGIO0x0BTVc/ni/Vfu8+5P5SovexDaz3/3ORQ9a4Ya64l0L/qmNWbrNJ
 IQmKHfp7u/58j2imepk5iVvtVSKPqIay0io93/wDmSFlXKNksp08lslNza0ujzfufPPqZPi8H5vOog==
Subject: [Buildroot] Error performing Make with External Toolchain
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
Content-Type: multipart/mixed; boundary="===============0639865065664595392=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multipart message in MIME format.

--===============0639865065664595392==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00BD_01D7C27F.869202B0"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_00BD_01D7C27F.869202B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

TWIMC:

I've been trying to get BUILDROOT to successfully "make" for several days to
no avail.  I'm trying to use the latest crosstool-NG toolchain,  so I've
specified 

an external toolchain.  I've selected the latest version of BUILDROOT and
the latest kernel headers.  I've selected glibc/eglibc and support for SSP,
strong SSP

and C++ support.  The first attempt I had the option for ulibc selected
along with RPC and ran into an error, so I unselected RPC and changed to
glibc/eglibc and

here's my "make" output:

 

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

jb@jb-VirtualBox-dev:~/GitHub/buildroot$ make

/usr/bin/make -j1 O=/home/jb/GitHub/buildroot/output HOSTCC="/usr/bin/gcc"
HOSTCXX="/usr/bin/g++" syncconfig

>>> toolchain-external-custom  Configuring

>>> toolchain-external-custom  Building

/usr/bin/gcc -O2 -I/home/jb/GitHub/buildroot/output/host/include
-DBR_CPU='"cortex-a53"' -DBR_ABI='"aapcs-linux"' -DBR_FPU='"neon-vfpv4"'
-DBR_FLOAT_ABI='"hard"' -DBR_MODE='"arm"' -DBR_CROSS_PATH_SUFFIX='""'
-DBR_CROSS_PATH_ABS='"/home/jb/workspace/toolchains/armv8-rpi3-linux-gnueabi
hf/bin"' -DBR_SYSROOT='"arm-buildroot-linux-gnueabihf/sysroot"'
-DBR_ADDITIONAL_CFLAGS='"-fstack-protector-strong",' -DBR2_PIC_PIE
-DBR2_RELRO_FULL -s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o
/home/jb/GitHub/buildroot/output/build/toolchain-external-custom/toolchain-w
rapper

>>> toolchain-external-custom  Installing to staging directory

/usr/bin/install -D -m 0755
/home/jb/GitHub/buildroot/output/build/toolchain-external-custom/toolchain-w
rapper /home/jb/GitHub/buildroot/output/host/bin/toolchain-wrapper

ln: failed to create symbolic link
'/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot
/usr/lib': No such file or directory

make[1]: *** [package/pkg-generic.mk:309:
/home/jb/GitHub/buildroot/output/build/toolchain-external-custom/.stamp_stag
ing_installed] Error 1

make: *** [Makefile:84: _all] Error 2

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 

 

I checked for the presence of the .sysroot/usr/lib directory noted in the
error and it does not exist, all I have is a "lib" directory.  If I try to
issue a ls lib I get an error:

"ls: cannot access 'lib': Too many levels of symbolic links"

 

Not being familiar with the BUILDROOT process, I'm at a loss regarding what
to do and need help.

 

Thank you.

John Blacker

 


------=_NextPart_000_00BD_01D7C27F.869202B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
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
class=3DWordSection1><p class=3DMsoNormal><u>TWIMC:<o:p></o:p></u></p><p =
class=3DMsoNormal>I&#8217;ve been trying to get BUILDROOT to =
successfully &#8220;make&#8221; for several days to no avail.&nbsp; =
I&#8217;m trying to use the latest crosstool-NG toolchain,&nbsp; so =
I&#8217;ve specified <o:p></o:p></p><p class=3DMsoNormal>an external =
toolchain.&nbsp; I&#8217;ve selected the latest version of BUILDROOT and =
the latest kernel headers.&nbsp; I&#8217;ve selected glibc/eglibc and =
support for SSP, strong SSP<o:p></o:p></p><p class=3DMsoNormal>and C++ =
support.&nbsp; The first attempt I had the option for ulibc selected =
along with RPC and ran into an error, so I unselected RPC and changed to =
glibc/eglibc and<o:p></o:p></p><p class=3DMsoNormal>here&#8217;s my =
&#8220;make&#8221; output:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt=
;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&=
gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<o:p>&nbsp;</o:p></p><=
p class=3DMsoNormal>jb@jb-VirtualBox-dev:~/GitHub/buildroot$ =
make<o:p></o:p></p><p class=3DMsoNormal>/usr/bin/make -j1 =
O=3D/home/jb/GitHub/buildroot/output HOSTCC=3D&quot;/usr/bin/gcc&quot; =
HOSTCXX=3D&quot;/usr/bin/g++&quot; syncconfig<o:p></o:p></p><p =
class=3DMsoNormal>&gt;&gt;&gt; toolchain-external-custom&nbsp; =
Configuring<o:p></o:p></p><p class=3DMsoNormal>&gt;&gt;&gt; =
toolchain-external-custom&nbsp; Building<o:p></o:p></p><p =
class=3DMsoNormal>/usr/bin/gcc -O2 =
-I/home/jb/GitHub/buildroot/output/host/include =
-DBR_CPU=3D'&quot;cortex-a53&quot;' -DBR_ABI=3D'&quot;aapcs-linux&quot;' =
-DBR_FPU=3D'&quot;neon-vfpv4&quot;' -DBR_FLOAT_ABI=3D'&quot;hard&quot;' =
-DBR_MODE=3D'&quot;arm&quot;' -DBR_CROSS_PATH_SUFFIX=3D'&quot;&quot;' =
-DBR_CROSS_PATH_ABS=3D'&quot;/home/jb/workspace/toolchains/armv8-rpi3-lin=
ux-gnueabihf/bin&quot;' =
-DBR_SYSROOT=3D'&quot;arm-buildroot-linux-gnueabihf/sysroot&quot;' =
-DBR_ADDITIONAL_CFLAGS=3D'&quot;-fstack-protector-strong&quot;,' =
-DBR2_PIC_PIE -DBR2_RELRO_FULL -s -Wl,--hash-style=3Dboth =
toolchain/toolchain-wrapper.c -o =
/home/jb/GitHub/buildroot/output/build/toolchain-external-custom/toolchai=
n-wrapper<o:p></o:p></p><p class=3DMsoNormal>&gt;&gt;&gt; =
toolchain-external-custom&nbsp; Installing to staging =
directory<o:p></o:p></p><p class=3DMsoNormal>/usr/bin/install -D -m 0755 =
/home/jb/GitHub/buildroot/output/build/toolchain-external-custom/toolchai=
n-wrapper =
/home/jb/GitHub/buildroot/output/host/bin/toolchain-wrapper<o:p></o:p></p=
><p class=3DMsoNormal>ln: failed to create symbolic link =
'/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysr=
oot/usr/lib': No such file or directory<o:p></o:p></p><p =
class=3DMsoNormal>make[1]: *** [package/pkg-generic.mk:309: =
/home/jb/GitHub/buildroot/output/build/toolchain-external-custom/.stamp_s=
taging_installed] Error 1<o:p></o:p></p><p class=3DMsoNormal>make: *** =
[Makefile:84: _all] Error 2<o:p></o:p></p><p =
class=3DMsoNormal>&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt=
;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;=
&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&=
lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;&lt;<o:p>&nbsp;</o:p></p><=
p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I checked =
for the presence of the &#8230;sysroot/usr/lib directory noted in the =
error and it does not exist, all I have is a &#8220;lib&#8221; =
directory.&nbsp; If I try to issue a ls lib I get an =
error:<o:p></o:p></p><p class=3DMsoNormal>&#8220;ls: cannot access =
&#8216;lib&#8217;: Too many levels of symbolic =
links&#8221;<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Not being familiar with the BUILDROOT process, =
I&#8217;m at a loss regarding what to do and need help.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Thank =
you.<o:p></o:p></p><p class=3DMsoNormal>John Blacker<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_00BD_01D7C27F.869202B0--


--===============0639865065664595392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0639865065664595392==--

