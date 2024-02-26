Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C729EC54E49
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3057840462;
	Mon, 26 Feb 2024 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8O6FXFbsbK8; Mon, 26 Feb 2024 11:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE5840A55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE5840A55;
	Mon, 26 Feb 2024 11:38:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DAFA1BF681
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 11:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0703140A55
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 11:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AA40qkWYkkjx for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 11:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B36040462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B36040462
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B36040462
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 11:38:04 +0000 (UTC)
Received: from smtpclient.apple ([151.18.124.200])
 by Aruba Outgoing Smtp  with ESMTPSA
 id eZJ3rZmcCx2mheZJ3rPmGc; Mon, 26 Feb 2024 12:38:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 26 Feb 2024 12:38:01 +0100
Message-Id: <CD67D713-D016-4725-B9AA-9292BDC7BAD7@benettiengineering.com>
References: <CAPi7W81x1vZrKe-kzZn77NAySHLjMbNN51hNrz6pL2j=x40Wag@mail.gmail.com>
In-Reply-To: <CAPi7W81x1vZrKe-kzZn77NAySHLjMbNN51hNrz6pL2j=x40Wag@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: iPhone Mail (21D61)
X-CMAE-Envelope: MS4xfCutmRHw5nlgVcQJx72PJnc/mnORZJvUfTxkstuIoMYbPFBmShID3aDAez/z+DQ2XE52sq8CnYzewFPrAMFTcbGu7JR4tF1sZQfcBZ10kd0QIJkZ+u7e
 dNVU0Z2UzcCy0ozp69pgDaJZExS/vUEgQNllUIpWIjT6ndimgQCdSl1CkS5zNIMdJUjby3rxjTt4SKR1P0FhTh04N+xfQvKBYKSvIEleNaSTGacQDa7NRLtO
 MisuCZrqnBHdTyw7EeVgsLcIReH+IiABmT53R8MKVh0hwI88J8Q1jum0DwJPhZVSc4/Y1zLm1GRNQz9SWe9nAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708947482; bh=uv5ZGAtIAgyUWlgj9UXtUBlQ7vYAJ7spQ/Nl0enbk24=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=JyFnn0OpqkecJG/FE19hyr7EPbfGuWlXf/ZDG9LzB0cCbmjM2WxJ55JVBxlRYYJ0+
 OUE4D0fzp/kFDsmU4EpieFw9uZxcmS6oc8dDUrpqOdXnbuGgPge+EhW5uxc3QFdQfn
 b6i3nI4B/t3gpPvbegIixXX03jQ/fMHrtBUlflzGlLFRATQwlTLzqApyYE2A0byWBD
 ZXhLZd7No5nCyNLYQXatBKQOItX7Hdt5rY7gCn+KSbGcg27EeErsYKQgn3fts9l7Oj
 49+dzGP40EDnJAbfOQQsxwofTDd7WdWHyZ8IPFqQbpRQL/J/xvigOqF8IHrpdJ5Ook
 u8tSbVDrqWxUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=JyFnn0Op
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: disable utest
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5534048298328049022=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5534048298328049022==
Content-Type: multipart/alternative; boundary=Apple-Mail-20BED7A4-02FE-4302-A811-79D04E16065A
Content-Transfer-Encoding: 7bit


--Apple-Mail-20BED7A4-02FE-4302-A811-79D04E16065A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello Fabrice,<div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 26 feb 2024, alle ore 07:52, Fabrice Fontaine &l=
t;fontaine.fabrice@gmail.com&gt; ha scritto:<br><br></blockquote></div><bloc=
kquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hello Giulio,</span><br=
><span></span><br><span>Le dim. 25 f=C3=A9vr. 2024 =C3=A0 20:23, Giulio Bene=
tti</span><br><span>&lt;giulio.benetti@benettiengineering.com&gt; a =C3=A9cr=
it :</span><br><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>Hi Fabrice,</span><br></blockquote><blockquote ty=
pe=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>th=
anks a lot for the patch,</span><br></blockquote><blockquote type=3D"cite"><=
span></span><br></blockquote><blockquote type=3D"cite"><span>On 25/02/24 18:=
11, Fabrice Fontaine wrote:</span><br></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>Disable utest to avoid the following build f=
ailure raised since the</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>addition of the package in commit<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is found=
:</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>../utest/tracefs-utest.c: In function '=
test_uprobes_instance':</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>../utest/tracefs-utest.c:2492:19: e=
rror: 'PATH_MAX' undeclared (first use in this function)</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &=
nbsp;2492 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;char self[PATH_M=
AX] =3D { 0 };</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Fi=
xes: b1dbd3f679e6660325472e3fdca72127d74e6929</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;- htt=
p://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>Signed-off-by: Fabrice Fontaine &lt;fo=
ntaine.fabrice@gmail.com&gt;</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>---</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;=
.../0002-meson-add-utest-option.patch &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| 40 +++++++++++++++++++</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;package/libtrace=
fs/libtracefs.mk &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;| &nbsp;3 +-</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;2 files changed, 42=
 insertions(+), 1 deletion(-)</span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;create mode 100644 pa=
ckage/libtracefs/0002-meson-add-utest-option.patch</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>diff --git a/package/libtracefs/0002-meson-add-utest-option.patc=
h b/package/libtracefs/0002-meson-add-utest-option.patch</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>n=
ew file mode 100644</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>index 0000000000..90f73a7ea0</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>--- /dev/null</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+++ b/package/libtracefs/0002-meson-a=
dd-utest-option.patch</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>@@ -0,0 +1,40 @@</span><br></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+=46rom=
 7a09e2d414959075e2177c50ef1d4bf606b9ccdc Mon Sep 17 00:00:00 2001</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+From: Fabrice Fontaine &lt;fontaine.fabrice@gmail.com&gt;</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>+Date: Thu, 15 Feb 2024 21:20:29 +0100</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+Subject:=
 [PATCH] meson: add utest option</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+Add u=
test option to allow the user to disable utest</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+Signed-off-by: Fabrice Fontaine &lt;fontaine.fabrice@gmail.com&gt;=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+Upstream: https://github.com/rostedt/libtracefs/pull/2</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><span></span><b=
r></blockquote><blockquote type=3D"cite"><span>For this project you have to g=
it send-email the patch to:</span><br></blockquote><blockquote type=3D"cite"=
><span>linux-trace-devel@vger.kernel.org</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>a=
s documented in:</span><br></blockquote><blockquote type=3D"cite"><span>http=
s://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tree/README#n45</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>Can you do that? Otherwise I can send the pat=
ch.</span><br></blockquote><span></span><br><span>Done: https://lore.kernel.=
org/linux-trace-devel/20240225204759.3263-1-fontaine.fabrice@gmail.com/T/#u<=
/span><br></div></blockquote><div><br></div><div>Thank you. Only they need y=
ou to prepend on subject =E2=80=9Clibtracefs meson:=E2=80=A6=E2=80=9D</div><=
div>That=E2=80=99s because the mailing list is the same for libtracefs, libt=
raceevent, trace-cmd etc.</div><div>Take a look here:</div><div><div style=3D=
"display: block;" class=3D""><div style=3D"-webkit-user-select: all; -webkit=
-user-drag: element; display: inline-block;" class=3D"apple-rich-link" dragg=
able=3D"true" role=3D"link" data-url=3D"https://lore.kernel.org/linux-trace-=
devel/?t=3D20240225204805"><a style=3D"border-radius:10px;font-family:-apple=
-system, Helvetica, Arial, sans-serif;display:block;-webkit-user-select:none=
;width:300px;user-select:none;-webkit-user-modify:read-only;user-modify:read=
-only;overflow:hidden;text-decoration:none;" class=3D"lp-rich-link" rel=3D"n=
ofollow" href=3D"https://lore.kernel.org/linux-trace-devel/?t=3D202402252048=
05" dir=3D"ltr" role=3D"button" draggable=3D"false" width=3D"300"><table sty=
le=3D"table-layout:fixed;border-collapse:collapse;width:300px;background-col=
or:#E9E9EB;font-family:-apple-system, Helvetica, Arial, sans-serif;" class=3D=
"lp-rich-link-emailBaseTable" cellpadding=3D"0" cellspacing=3D"0" border=3D"=
0" width=3D"300"><tbody><tr><td vertical-align=3D"center"><table bgcolor=3D"=
#E9E9EB" cellpadding=3D"0" cellspacing=3D"0" width=3D"300" style=3D"font-fam=
ily:-apple-system, Helvetica, Arial, sans-serif;table-layout:fixed;backgroun=
d-color:rgba(233, 233, 235, 1);" class=3D"lp-rich-link-captionBar"><tbody><t=
r><td style=3D"padding:8px 0px 8px 0px;" class=3D"lp-rich-link-captionBar-te=
xtStackItem"><div style=3D"max-width:100%;margin:0px 16px 0px 16px;overflow:=
hidden;" class=3D"lp-rich-link-captionBar-textStack"><div style=3D"word-wrap=
:break-word;font-weight:500;font-size:12px;overflow:hidden;text-overflow:ell=
ipsis;text-align:left;" class=3D"lp-rich-link-captionBar-textStack-topCaptio=
n-leading"><a rel=3D"nofollow" href=3D"https://lore.kernel.org/linux-trace-d=
evel/?t=3D20240225204805" style=3D"text-decoration: none" draggable=3D"false=
"><font color=3D"#000000" style=3D"color: rgba(0, 0, 0, 1);">linux-trace-dev=
el.vger.kernel.org archive mirror</font></a></div><div style=3D"word-wrap:br=
eak-word;font-weight:400;font-size:11px;overflow:hidden;text-overflow:ellips=
is;text-align:left;" class=3D"lp-rich-link-captionBar-textStack-bottomCaptio=
n-leading"><a rel=3D"nofollow" href=3D"https://lore.kernel.org/linux-trace-d=
evel/?t=3D20240225204805" style=3D"text-decoration: none" draggable=3D"false=
"><font color=3D"#A2A2A9" style=3D"color: rgba(60, 60, 67, 0.6);">lore.kerne=
l.org</font></a></div></div></td><td style=3D"padding:0px 12px 0px 0px;" cla=
ss=3D"lp-rich-link-captionBar-rightIconItem" width=3D"36"><a rel=3D"nofollow=
" href=3D"https://lore.kernel.org/linux-trace-devel/?t=3D20240225204805" dra=
ggable=3D"false"><img src=3D"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA=
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
/eMRufzZ3dUmJdsqCkcw5rzta5yNwZc1vm2c4rm9c1P2L+rgWaC3IX/FjKKF1Z+sfCtIXNZRZl88=
sefhHxxZ5yWrm0/OYi/0VbvsS/FH55cfHYxesXv6vgVfxQyaisqny7hLvkh688vlr31fulWUsvLv=
Netnk5cbl4+Y0VQSt2rdRdWbzy4aqJqxpW01dXrP5jzfQ156vGVW1Zq7lWsbZjXcy6xvV265evf7=
tBsKG9ekL1vo3mGxdvfLmJt+nq5uDN9VsstlRuefO18OtbWyO2NtQ41FRtI24r2PbL9tTtrTuYO+=
pqzWora//cKd7ZsStx15k6n7q63ea7l+1B9yj29OydsvfyN6HfNNa71W/dZ7Svcj/Yr9j/+EDmgR=
sHow+2HGIeqv/W/tuNh/UPVzQgDUUNfUcERzoa0xuvNEU1tTT7Nx/+zv27nUetj1YfMzy27Ljm8b=
Lj708Un+g/KTnZeyr71MOW6S13T086ff1MwpmLZ6PPnvs+/PvTrazWE+cCzh0973e+6QfmD0cueF9=
oaPNqO/yj14+HL3pfbLjkc6nxsu/l5ivjrxy/GnT11LXQa99fZ1+/0B7bfuVGyo1bN6fc7LjFu9V=
9W3T72Z2COwN358OLfcV9nftVD8wf1Pxr9L/2dXh3HOsM7Wz7Kemnuw+5D5/8LPv5bVfZL9Rfqh5=
ZParr9uw+2hPec/nx5MddTyRPBnrLf9X9deNTp6ff/hb8W1vfpL6uZ9Jn739f8tz0+c4/xv3R0h/=
f/+BF3ouBlxWvTF/tes183fom7c2jgVlvSW/X/Tn6z+Z30e/uvc97//7fCQ/4Yk7kYoUAAAB4ZVh=
JZk1NACoAAAAIAAUBEgADAAAAAQABAAABGgAFAAAAAQAAAEoBGwAFAAAAAQAAAFIBKAADAAAAAQA=
CAACHaQAEAAAAAQAAAFoAAAAAAAAA2AAAAAEAAADYAAAAAQACoAIABAAAAAEAAABsoAMABAAAAAE=
AAABsAAAAAOIX6z4AAAAJcEhZcwAAITgAACE4AUWWMWAAAAAcaURPVAAAAAIAAAAAAAAANgAAACg=
AAAA2AAAANgAABRSxLH/cAAAE4ElEQVR4AexZTWgVVxT+3suPbTXE1KSQ5vmz0o0krbTWgtpuEmk=
20kb8W1hNWim66FoaKWiNG6VFpVUpSLJo04okC0VdiAoGxIVoREgoBGqjEmhjjNG0Ic30zJk7983=
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
YRB4imoAAAAASUVORK5CYII=3D" draggable=3D"false" style=3D"pointer-events:none=
 !important;display:inline-block;width:36px;height:36px;" class=3D"lp-rich-l=
ink-captionBar-rightIcon" width=3D"36" height=3D"36" data-unique-identifier=3D=
""></a></td></tr></tbody></table></td></tr></tbody></table></a></div></div><=
br></div><div><br></div><div>So it would be great if you resend it.</div><di=
v><br></div><div>Best regards</div><div>Giulio</div><div><br></div><br><bloc=
kquote type=3D"cite"><div dir=3D"ltr"><span></span><br><blockquote type=3D"c=
ite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Thank you=
!</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockq=
uote><blockquote type=3D"cite"><span>Best regards</span><br></blockquote><bl=
ockquote type=3D"cite"><span>--</span><br></blockquote><blockquote type=3D"c=
ite"><span>Giulio Benetti</span><br></blockquote><blockquote type=3D"cite"><=
span>CEO&amp;CTO@Benetti Engineering sas</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>+---</span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>+ meson.build &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| 2 +-</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>+ meson_options.txt | 2 ++</s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+ 2 files changed, 3 insertions(+), 1 deletion(-)</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>+</span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>+diff --git a/meson.build b/meson.build</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>+index 3156f1c..d4cfd53 100644</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+--- a/meson.buil=
d</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>++++ b/meson.build</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>+@@ -35,7 +35,7 @@ i=
ncdir =3D include_directories(['include'])</span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>+ subdir('src')</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+ subdir('include')</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>+-if cunit_dep.found()</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>++if get_option('utest') and cunit=
_dep.found()</span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;subdir('utest')</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+ endif</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+ if get_option('samples')</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>+diff --git a/meson_options.txt b/meson_options.txt</span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>+index 8450992..a48efea 100644</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+--- a/meson_options.txt<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>++++ b/meson_options.txt</span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+@@ -18,3 +18,5=
 @@ option('doc', type : 'boolean', value: true,</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;description : 'produce documentation')</s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+ option('samples', type : 'boolean', value: true,</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;description : 'build sa=
mples')</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>++option('utest', type : 'boolean', value: true,</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span>++ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;description : 'build=
 utest')</span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>+--</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>+2.43.0</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>diff --git a/package/libtracefs/libtracefs.mk b/package/l=
ibtracefs/libtracefs.mk</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>index ed45fcbc50..21cb8e84e3 10064=
4</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>--- a/package/libtracefs/libtracefs.mk</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
+++ b/package/libtracefs/libtracefs.mk</span><br></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>@@ -14,6 +14,7 @@ L=
IBTRACEFS_DEPENDENCIES =3D host-bison host-flex host-pkgconf libtraceevent</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span> &nbsp;LIBTRACEFS_CONF_OPTS =3D \</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Ddoc=3Dfalse \</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>- &nbsp;&nbsp;&nbsp;&nbsp;-Dsamples=3Dfalse</span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp=
;&nbsp;&nbsp;-Dsamples=3Dfalse \</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp=
;-Dutest=3Dfalse</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;$(eval $(meson-=
package))</span><br></blockquote></blockquote><blockquote type=3D"cite"><spa=
n></span><br></blockquote><span></span><br><span>Best Regards,</span><br><sp=
an></span><br><span>Fabrice</span><br></div></blockquote></body></html>=

--Apple-Mail-20BED7A4-02FE-4302-A811-79D04E16065A--

--===============5534048298328049022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5534048298328049022==--
