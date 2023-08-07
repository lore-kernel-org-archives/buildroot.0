Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221A2C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 18:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A02F940A07;
	Mon,  7 Aug 2023 18:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A02F940A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xxq44jKQPHdC; Mon,  7 Aug 2023 18:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D193840297;
	Mon,  7 Aug 2023 18:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D193840297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16BAD1BF852
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 18:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E07E081E0B
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 18:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E07E081E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id et2o5y-ro3v7 for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 18:44:22 +0000 (UTC)
Received: from smtpcmd02113.aruba.it (smtpcmd02113.aruba.it [62.149.158.113])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91D2381E03
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 18:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D2381E03
Received: from smtpclient.apple ([95.47.160.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id T5DFqLgNhNTqiT5DGqRwTT; Mon, 07 Aug 2023 20:44:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 7 Aug 2023 20:44:16 +0200
Message-Id: <1DFAA6F5-56A7-4684-AB76-CCD03D93C3C8@benettiengineering.com>
References: <ZND2kP8kQgFsEzMZ@waldemar-brodkorb.de>
In-Reply-To: <ZND2kP8kQgFsEzMZ@waldemar-brodkorb.de>
To: Waldemar Brodkorb <wbx@openadk.org>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfGnn9I64tg2HNM2GNVl/TLqhPqmDuA8+6V+LvtnZNSrT06SUNO4lqJJCz3esKVte2cNdO70sYB8H45T9BzPfM+ZckOtkWS3xiHaA6gGMsdlSGLEO9y7N
 rFqfd4rIdhuf0TmZ6Gt3rku0wr96eiv0+CFHpVn2TSu2MSVmFSKL2PZ9wDzdg0/3cT5U8DD7nR+WUGIq3Q+2pOpv6HAEskdz9b/POyfSoTh22E1PzwEFoIo8
 ZCkl08HIaLSbJdhtat/rfg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691433858; bh=5rttk8NOQNbijqC2Q7f0U9aFOQrueJaqoSVa+vO34FM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ceHhzry8sInP36fo/OKE0Q8+r1h/vbZHQd1nGYd/vf5Q2BcQLpxSkt2hiRzhqKxNc
 uWaWgbZYwrHroAQj+W+KDJiROOsKldFxn9TFsjdSV8856on7CRzy5zWduCcFe1cyxq
 HlENOO7ZipTUY4Z14GLMkMZDC2GXiXs7i0pR+7qoIeBJ19gNXvH35i1ypFJYautN4n
 pFXfthzH1KeOo7bjt5Osc2cia72s80IbsN/pNB8zpbZptNO1/GLADfj0Cd/x8DMtNk
 Mo/YoAJZwZsUCBtB/DYViOyJAQ0hjPJuAYYe54iCjhlHNYreOnpwfZn2Ix41ZSsn6w
 D9mDlNe7gCVwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ceHhzry8
Subject: Re: [Buildroot] [PATCH 2/2] package/openssh: fix build failure due
 to gcc bug 110934
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
Content-Type: multipart/mixed; boundary="===============8837824924220854811=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8837824924220854811==
Content-Type: multipart/alternative; boundary=Apple-Mail-4DBD422C-7625-42C5-8BFD-7B2A5AB683EC
Content-Transfer-Encoding: 7bit


--Apple-Mail-4DBD422C-7625-42C5-8BFD-7B2A5AB683EC
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Waldemar,<br><div dir=3D"ltr"><br><block=
quote type=3D"cite">Il giorno 7 ago 2023, alle ore 15:51, Waldemar Brodkorb &=
lt;wbx@openadk.org&gt; ha scritto:<br><br></blockquote></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Following ICE occurs for m68k bui=
lds:</span><br><span>(cd openbsd-compat &amp;&amp; /home/autobuild/make/make=
)</span><br><span>/home/autobuild/autobuild/instance-10/output-1/host/bin/m6=
8k-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FI=
LE_OFFSET_BITS=3D64 &nbsp;-O3 -g0 &nbsp;-pipe -Wno-error=3Dformat-truncation=
 -Wall</span><br><span>+-Wpointer-arith -Wuninitialized -Wsign-compare -Wfor=
mat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-result=
 -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing</span>=
<br><span>+-D_FORTIFY_SOURCE=3D2 -ftrapv -fzero-call-used-regs=3Dall -fno-bu=
iltin-memset &nbsp;&nbsp;-fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LA=
RGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_XOPEN_SOURCE=3D600 -D_BSD_SOURC=
E</span><br><span>+-D_DEFAULT_SOURCE -D_GNU_SOURCE -DHAVE_CONFIG_H -c bsd-cl=
osefrom.c</span><br><span>during RTL pass: zero_call_used_regs</span><br><sp=
an>bsd-closefrom.c: In function 'closefrom':</span><br><span>bsd-closefrom.c=
:151:1: internal compiler error: in change_address_1, at emit-rtl.c:2275</sp=
an><br><span> &nbsp;151 | }</span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|=
 ^</span><br><span>0x7fa76f4bad09 __libc_start_main</span><br><span> &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;../csu/libc-start.c:308</span><br><span>P=
lease submit a full bug report,</span><br><span>with preprocessed source if a=
ppropriate.</span><br><span>Please include the complete backtrace with any b=
ug report.</span><br><span>See &lt;http://bugs.buildroot.net/&gt; for instru=
ctions.</span><br><span>make[2]: *** [Makefile:106: bsd-closefrom.o] Error 1=
</span><br></div></blockquote><div><br></div><div>Please use commit log of t=
he commit below as a template. All of gcc/binutils bugs follow it more or le=
ss.</div><div><div style=3D"display: block;" class=3D""><div style=3D"-webki=
t-user-select: all; -webkit-user-drag: element; display: inline-block;" clas=
s=3D"apple-rich-link" draggable=3D"true" role=3D"link" data-url=3D"https://p=
atchwork.ozlabs.org/project/buildroot/patch/20210831173800.22088-3-giulio.be=
netti@benettiengineering.com/"><a style=3D"border-radius:10px;font-family:-a=
pple-system, Helvetica, Arial, sans-serif;display:block;-webkit-user-select:=
none;width:300px;user-select:none;-webkit-user-modify:read-only;user-modify:=
read-only;overflow:hidden;text-decoration:none;" class=3D"lp-rich-link" rel=3D=
"nofollow" href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2021=
0831173800.22088-3-giulio.benetti@benettiengineering.com/" dir=3D"ltr" role=3D=
"button" draggable=3D"false" width=3D"300"><table style=3D"table-layout:fixe=
d;border-collapse:collapse;width:300px;background-color:#E9E9EB;font-family:=
-apple-system, Helvetica, Arial, sans-serif;" class=3D"lp-rich-link-emailBas=
eTable" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"300"><tbod=
y><tr><td vertical-align=3D"center"><table bgcolor=3D"#E9E9EB" cellpadding=3D=
"0" cellspacing=3D"0" width=3D"300" style=3D"font-family:-apple-system, Helv=
etica, Arial, sans-serif;table-layout:fixed;background-color:rgba(233, 233, 2=
35, 1);" class=3D"lp-rich-link-captionBar"><tbody><tr><td style=3D"padding:8=
px 0px 8px 0px;" class=3D"lp-rich-link-captionBar-textStackItem"><div style=3D=
"max-width:100%;margin:0px 16px 0px 16px;overflow:hidden;" class=3D"lp-rich-=
link-captionBar-textStack"><div style=3D"word-wrap:break-word;font-weight:50=
0;font-size:12px;overflow:hidden;text-overflow:ellipsis;text-align:left;" cl=
ass=3D"lp-rich-link-captionBar-textStack-topCaption-leading"><a rel=3D"nofol=
low" href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2021083117=
3800.22088-3-giulio.benetti@benettiengineering.com/" style=3D"text-decoratio=
n: none" draggable=3D"false"><font color=3D"#000000" style=3D"color: rgba(0,=
 0, 0, 1);">[v2,2/2] package/ruby: fix build failure due to gcc bug 83143 - P=
atchwork</font></a></div><div style=3D"word-wrap:break-word;font-weight:400;=
font-size:11px;overflow:hidden;text-overflow:ellipsis;text-align:left;" clas=
s=3D"lp-rich-link-captionBar-textStack-bottomCaption-leading"><a rel=3D"nofo=
llow" href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/202108311=
73800.22088-3-giulio.benetti@benettiengineering.com/" style=3D"text-decorati=
on: none" draggable=3D"false"><font color=3D"#A2A2A9" style=3D"color: rgba(6=
0, 60, 67, 0.6);">patchwork.ozlabs.org</font></a></div></div></td><td style=3D=
"padding:0px 12px 0px 0px;" class=3D"lp-rich-link-captionBar-rightIconItem" w=
idth=3D"36"><a rel=3D"nofollow" href=3D"https://patchwork.ozlabs.org/project=
/buildroot/patch/20210831173800.22088-3-giulio.benetti@benettiengineering.co=
m/" draggable=3D"false"><img src=3D"data:image/png;base64,iVBORw0KGgoAAAANSU=
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
ggg=3D=3D" draggable=3D"false" style=3D"pointer-events:none !important;displ=
ay:inline-block;width:36px;height:36px;" class=3D"lp-rich-link-captionBar-ri=
ghtIcon" width=3D"36" height=3D"36" data-unique-identifier=3D""></a></td></t=
r></tbody></table></td></tr></tbody></table></a></div></div></div><div>Of co=
urse you need to point that you don=E2=80=99t use the usual -O0 workaround b=
ut the zero reg one explaining it a bit.</div><div><br></div><div>They are e=
asy to read and to filter.</div><br><blockquote type=3D"cite"><div dir=3D"lt=
r"><span></span><br><span>Fixes following autobuild failure:</span><br></div=
></blockquote><div><br></div><div>Here ^^^ please use only tag:</div><div>Fi=
xes:</div><div>so patchwork catches it.</div><div><br></div><div>As you can s=
ee at the moment this patch is not recognized as Fixes:</div><div><div style=
=3D"display: block;" class=3D""><div style=3D"display: block;" class=3D""><d=
iv style=3D"-webkit-user-select: all; -webkit-user-drag: element; display: i=
nline-block;" class=3D"apple-rich-link" draggable=3D"true" role=3D"link" dat=
a-url=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D36765=
3"><a style=3D"border-radius:10px;font-family:-apple-system, Helvetica, Aria=
l, sans-serif;display:block;-webkit-user-select:none;width:300px;user-select=
:none;-webkit-user-modify:read-only;user-modify:read-only;overflow:hidden;te=
xt-decoration:none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"https:/=
/patchwork.ozlabs.org/project/buildroot/list/?series=3D367653" dir=3D"ltr" r=
ole=3D"button" draggable=3D"false" width=3D"300"><table style=3D"table-layou=
t:fixed;border-collapse:collapse;width:300px;background-color:#E9E9EB;font-f=
amily:-apple-system, Helvetica, Arial, sans-serif;" class=3D"lp-rich-link-em=
ailBaseTable" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"300"=
><tbody><tr><td vertical-align=3D"center"><table bgcolor=3D"#E9E9EB" cellpad=
ding=3D"0" cellspacing=3D"0" width=3D"300" style=3D"font-family:-apple-syste=
m, Helvetica, Arial, sans-serif;table-layout:fixed;background-color:rgba(233=
, 233, 235, 1);" class=3D"lp-rich-link-captionBar"><tbody><tr><td style=3D"p=
adding:8px 0px 8px 0px;" class=3D"lp-rich-link-captionBar-textStackItem"><di=
v style=3D"max-width:100%;margin:0px 16px 0px 16px;overflow:hidden;" class=3D=
"lp-rich-link-captionBar-textStack"><div style=3D"word-wrap:break-word;font-=
weight:500;font-size:12px;overflow:hidden;text-overflow:ellipsis;text-align:=
left;" class=3D"lp-rich-link-captionBar-textStack-topCaption-leading"><a rel=
=3D"nofollow" href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?s=
eries=3D367653" style=3D"text-decoration: none" draggable=3D"false"><font co=
lor=3D"#000000" style=3D"color: rgba(0, 0, 0, 1);">Buildroot development - P=
atchwork</font></a></div><div style=3D"word-wrap:break-word;font-weight:400;=
font-size:11px;overflow:hidden;text-overflow:ellipsis;text-align:left;" clas=
s=3D"lp-rich-link-captionBar-textStack-bottomCaption-leading"><a rel=3D"nofo=
llow" href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D=
367653" style=3D"text-decoration: none" draggable=3D"false"><font color=3D"#=
A2A2A9" style=3D"color: rgba(60, 60, 67, 0.6);">patchwork.ozlabs.org</font><=
/a></div></div></td><td style=3D"padding:0px 12px 0px 0px;" class=3D"lp-rich=
-link-captionBar-rightIconItem" width=3D"36"><a rel=3D"nofollow" href=3D"htt=
ps://patchwork.ozlabs.org/project/buildroot/list/?series=3D367653" draggable=
=3D"false"><img src=3D"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAAB=
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
zZ3dUmJdsqCkcw5rzta5yNwZc1vm2c4rm9c1P2L+rgWaC3IX/FjKKF1Z+sfCtIXNZRZl88sefhHx=
xZ5yWrm0/OYi/0VbvsS/FH55cfHYxesXv6vgVfxQyaisqny7hLvkh688vlr31fulWUsvLvNetnk5=
cbl4+Y0VQSt2rdRdWbzy4aqJqxpW01dXrP5jzfQ156vGVW1Zq7lWsbZjXcy6xvV265evf7tBsKG9=
ekL1vo3mGxdvfLmJt+nq5uDN9VsstlRuefO18OtbWyO2NtQ41FRtI24r2PbL9tTtrTuYO+pqzWor=
a//cKd7ZsStx15k6n7q63ea7l+1B9yj29OydsvfyN6HfNNa71W/dZ7Svcj/Yr9j/+EDmgRsHow+2=
HGIeqv/W/tuNh/UPVzQgDUUNfUcERzoa0xuvNEU1tTT7Nx/+zv27nUetj1YfMzy27Ljm8bLj708U=
n+g/KTnZeyr71MOW6S13T086ff1MwpmLZ6PPnvs+/PvTrazWE+cCzh0973e+6QfmD0cueF9oaPNq=
O/yj14+HL3pfbLjkc6nxsu/l5ivjrxy/GnT11LXQa99fZ1+/0B7bfuVGyo1bN6fc7LjFu9V9W3T7=
2Z2COwN358OLfcV9nftVD8wf1Pxr9L/2dXh3HOsM7Wz7Kemnuw+5D5/8LPv5bVfZL9Rfqh5ZParr=
9uw+2hPec/nx5MddTyRPBnrLf9X9deNTp6ff/hb8W1vfpL6uZ9Jn739f8tz0+c4/xv3R0h/f/+BF3=
ouBlxWvTF/tes183fom7c2jgVlvSW/X/Tn6z+Z30e/uvc97//7fCQ/4Yk7kYoUAAABsZVhJZk1NA=
CoAAAAIAAQBGgAFAAAAAQAAAD4BGwAFAAAAAQAAAEYBKAADAAAAAQACAACHaQAEAAAAAQAAAE4AA=
AAAAAAAkAAAAAEAAACQAAAAAQACoAIABAAAAAEAAABIoAMABAAAAAEAAABIAAAAAPobr+kAAAAJc=
EhZcwAAFiUAABYlAUlSJPAAAAAcaURPVAAAAAIAAAAAAAAAJAAAACgAAAAkAAAAJAAAAyJzt+psA=
AAC7klEQVRoBexWPWgTYRh+ImmSxrRJW0o1LYIuSnWIuDpYcEnEJh1cjINQEFEQU9Q1KA5COwhiB=
8XVQRCKKIYK0joVpSGiqCGVLv7hT6lTrcaez32Xpt93vbsmphaHuxvyve/7PM89eb+79w5wD7cDb=
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3D=3D" drag=
gable=3D"false" style=3D"pointer-events:none !important;display:inline-block=
;width:36px;height:36px;" class=3D"lp-rich-link-captionBar-rightIcon" width=3D=
"36" height=3D"36" data-unique-identifier=3D""></a></td></tr></tbody></table=
></td></tr></tbody></table></a></div><br></div></div><div style=3D"display: b=
lock;" class=3D""><br></div></div><blockquote type=3D"cite"><div dir=3D"ltr"=
><span>http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870=
e728bcc7050563/</span><br><span></span><br><span>Signed-off-by: Waldemar Bro=
dkorb &lt;wbx@openadk.org&gt;</span><br><span>---</span><br><span> package/o=
penssh/openssh.mk | 4 ++++</span><br><span> 1 file changed, 4 insertions(+)<=
/span><br><span></span><br><span>diff --git a/package/openssh/openssh.mk b/p=
ackage/openssh/openssh.mk</span><br><span>index e14d752290..a2c3f16129 10064=
4</span><br><span>--- a/package/openssh/openssh.mk</span><br><span>+++ b/pac=
kage/openssh/openssh.mk</span><br><span>@@ -35,6 +35,10 @@ define OPENSSH_PE=
RMISSIONS</span><br><span>  &nbsp; &nbsp;/var/empty d 755 root root - - - - -=
</span><br><span> endef</span><br><span></span><br><span>+ifeq ($(BR2_TOOLCH=
AIN_HAS_GCC_BUG_110934),y)</span><br><span>+OPENSSH_CONF_OPTS +=3D --without=
-hardening</span><br></div></blockquote><div><br></div><div>Does the =E2=80=94=
without-hardening only set zero reg flag?</div><div><div style=3D"caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></div><div style=3D"caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0);">Best regards</div><div style=3D"caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0);">Giulio</div></div><br><blockquote ty=
pe=3D"cite"><div dir=3D"ltr"><span>+endif</span><br><span>+</span><br><span>=
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)</span><br><span> OPENSSH_CONF_OPTS +=3D=
 --without-pie</span><br><span> endif</span><br><span>-- </span><br><span>2.=
39.2</span><br><span></span><br><span>______________________________________=
_________</span><br><span>buildroot mailing list</span><br><span>buildroot@b=
uildroot.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/bu=
ildroot</span><br></div></blockquote></body></html>=

--Apple-Mail-4DBD422C-7625-42C5-8BFD-7B2A5AB683EC--

--===============8837824924220854811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8837824924220854811==--
