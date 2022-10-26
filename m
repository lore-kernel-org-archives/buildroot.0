Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED348C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 17:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55BBE408A9;
	Wed, 26 Oct 2022 17:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55BBE408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aVxtHJxVCrW; Wed, 26 Oct 2022 17:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C0A40142;
	Wed, 26 Oct 2022 17:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62C0A40142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F02F41BF36F
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB38180FB2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 17:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB38180FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myv2UKtNi67f for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 17:53:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3487880FB0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3487880FB0
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:53:47 +0000 (UTC)
Received: from smtpclient.apple ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPA
 id nkb1oXa8DKdvdnkb2ou9Zq; Wed, 26 Oct 2022 19:53:44 +0200
Mime-Version: 1.0 (1.0)
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <1666805548.3174.1.camel@embeddedTS.com>
Date: Wed, 26 Oct 2022 19:53:33 +0200
Message-Id: <67DEC0A4-EAEE-42F7-A07E-9265B1897153@benettiengineering.com>
References: <1666805548.3174.1.camel@embeddedTS.com>
To: kris@embeddedts.com
X-Mailer: iPhone Mail (20A392)
X-CMAE-Envelope: MS4xfGWVxC2Qc2g3Jw0PnFKznCAFGEkzdHNN6pi0jeNs4LFkwPkJszh1Lf4nxM2TB3Kmq8JUcMiQsIuKsKKOn87ceOTHpEopGcusWvXK1Z3Xjkaa/14ISta5
 SSVy7euAVXGjOHklfhi0JcY0D2fCERPDryjDKynIq7WO2w40kh/giRyUZ03CblX6hI5Dj/UbUH8aTZ6xP+X8ROnoyvkcDJ5jP39Q/Sm+W1nVkThDN+k3dYVs
 D1N5Z/A4QjhzxKOBImZseqLu+PDCHSewhWwSceQzndB8CUrY+a4AQWOM/9i4hlmpLYHidGltgICVz5xgxz+yNr9k+Kb1G13KO2sypL0aileAUixUVWYzE//r
 diIu77xU29ekhQeuh2rWOQY6NmSJ09/8P3O5/DZapi/n3TqcYhk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666806825; bh=pE3qPhanGFSvmAzGO11SBVQi6m3dnsya1omNpLhDZXk=;
 h=Content-Type:Mime-Version:Subject:From:Date:To;
 b=GgutzRVVUBOKheA1u4g6hlO+8VMGugNfRTYamIXwM3VYBTWUjmM0MhwCqUYloOXWV
 xbHCY5prz6AUIr2drghHps0qus5Zs3DwV+Pl14iFGeTQw4OhBUW+Pbay7L45YzdUpX
 eIuBhzkic94p7aASPAqIWH2P0duVFj5qj9rAUsbFcLnvygWwYi32ezmfmGcUGrHc9/
 jQevutGFAJaDK8bRRnb1zyjMU31XP4k3MC/wYB5bWZ0vwTygmkuPoi7Aa/+UnyBgQc
 C+Yt1cayrEY27Gwvr13aPE51medgqnzcabb/pIf9bac8Ctj3a1CboMAFQ6nmxKZSxZ
 ocWQZU/7mCB+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=GgutzRVV
Subject: Re: [Buildroot] [PATCH 7/7] package/wilc-driver: disable package
 for s390x architecture
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5092671194343919581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5092671194343919581==
Content-Type: multipart/alternative; boundary=Apple-Mail-ADF857D5-1AF9-4300-8ED2-DEE77ACD7F64
Content-Transfer-Encoding: 7bit


--Apple-Mail-ADF857D5-1AF9-4300-8ED2-DEE77ACD7F64
Content-Type: multipart/related;
	type="text/html";
	boundary=Apple-Mail-9848FBE4-2A6C-4BB5-A935-7A41873557F2
Content-Transfer-Encoding: 7bit


--Apple-Mail-9848FBE4-2A6C-4BB5-A935-7A41873557F2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8">Hi Kris,<br><div dir=3D"ltr">=
<br><blockquote type=3D"cite">Il giorno 26 ott 2022, alle ore 19:32, Kris Ba=
hnsen &lt;kris@embeddedts.com&gt; ha scritto:<br><br></blockquote></div><blo=
ckquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Wed, 2022-10-26 at 1=
5:26 +0200, Giulio Benetti wrote:</span><br><blockquote type=3D"cite"><span>=
s390x doesn't support CONFIG_WIRELESS in Linux so let's disable this</span><=
br></blockquote><blockquote type=3D"cite"><span>package for this architectur=
e.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></block=
quote><blockquote type=3D"cite"><span>Signed-off-by: Giulio Benetti &lt;giul=
io.benetti@benettiengineering.com&gt;</span><br></blockquote><blockquote typ=
e=3D"cite"><span>---</span><br></blockquote><blockquote type=3D"cite"><span>=
 package/wilc-driver/Config.in | 2 ++</span><br></blockquote><blockquote typ=
e=3D"cite"><span> 1 file changed, 2 insertions(+)</span><br></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>diff --git a/package/wilc-driver/Config.in b/package/wilc-driver/Co=
nfig.in</span><br></blockquote><blockquote type=3D"cite"><span>index 7ed062b=
b66..7f970bd38b 100644</span><br></blockquote><blockquote type=3D"cite"><spa=
n>--- a/package/wilc-driver/Config.in</span><br></blockquote><blockquote typ=
e=3D"cite"><span>+++ b/package/wilc-driver/Config.in</span><br></blockquote>=
<blockquote type=3D"cite"><span>@@ -1,5 +1,6 @@</span><br></blockquote><bloc=
kquote type=3D"cite"><span> config BR2_PACKAGE_WILC_DRIVER</span><br></block=
quote><blockquote type=3D"cite"><span>  &nbsp; &nbsp;bool "wilc kernel modul=
e"</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp; &nbsp;dep=
ends on !BR2_s390x</span><br></blockquote><blockquote type=3D"cite"><span>  &=
nbsp; &nbsp;depends on BR2_LINUX_KERNEL</span><br></blockquote><blockquote t=
ype=3D"cite"><span>  &nbsp; &nbsp;help</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>  &nbsp; &nbsp; &nbsp;External kernel module for WILC1000/=
3000 devices.</span><br></blockquote><blockquote type=3D"cite"><span>@@ -59,=
4 +60,5 @@ endif</span><br></blockquote><blockquote type=3D"cite"><span> end=
if</span><br></blockquote><blockquote type=3D"cite"><span></span><br></block=
quote><blockquote type=3D"cite"><span> comment "wilc kernel module needs a L=
inux kernel to be built"</span><br></blockquote><blockquote type=3D"cite"><s=
pan>+ &nbsp; &nbsp;depends on !BR2_s390x</span><br></blockquote><blockquote t=
ype=3D"cite"><span>  &nbsp; &nbsp;depends on !BR2_LINUX_KERNEL</span><br></b=
lockquote><span></span><br><span>I don't know much on the s390x arch, nor Bu=
ildroot paradigms for disabling packages</span><br><span>per-architecture, h=
owever the change itself looks good to me.</span><br></div></blockquote><div=
><br></div><div>If you check here:</div><div><div style=3D"display: block;" c=
lass=3D""><div style=3D"-webkit-user-select: all; -webkit-user-drag: element=
; display: inline-block;" class=3D"apple-rich-link" draggable=3D"true" role=3D=
"link" data-url=3D"https://elixir.bootlin.com/linux/latest/source/net/Kconfi=
g#L371"><a style=3D"border-radius:10px;font-family:-apple-system, Helvetica,=
 Arial, sans-serif;display:block;-webkit-user-select:none;width:300px;user-s=
elect:none;-webkit-user-modify:read-only;user-modify:read-only;overflow:hidd=
en;text-decoration:none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"ht=
tps://elixir.bootlin.com/linux/latest/source/net/Kconfig#L371" dir=3D"ltr" r=
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
=3D"nofollow" href=3D"https://elixir.bootlin.com/linux/latest/source/net/Kco=
nfig#L371" style=3D"text-decoration: none" draggable=3D"false"><font color=3D=
"#000000" style=3D"color: rgba(0, 0, 0, 1);">Kconfig - net/Kconfig - Linux s=
ource code (v6.0.4) - Bootlin</font></a></div><div style=3D"word-wrap:break-=
word;font-weight:400;font-size:11px;overflow:hidden;text-overflow:ellipsis;t=
ext-align:left;" class=3D"lp-rich-link-captionBar-textStack-bottomCaption-le=
ading"><a rel=3D"nofollow" href=3D"https://elixir.bootlin.com/linux/latest/s=
ource/net/Kconfig#L371" style=3D"text-decoration: none" draggable=3D"false">=
<font color=3D"#A2A2A9" style=3D"color: rgba(60, 60, 67, 0.6);">elixir.bootl=
in.com</font></a></div></div></td><td style=3D"padding:6px 12px 6px 0px;" cl=
ass=3D"lp-rich-link-captionBar-rightIconItem" width=3D"36"><a rel=3D"nofollo=
w" href=3D"https://elixir.bootlin.com/linux/latest/source/net/Kconfig#L371" d=
raggable=3D"false"><img style=3D"pointer-events:none !important;display:inli=
ne-block;width:36px;height:36px;border-radius:3px;" width=3D"36" height=3D"3=
6" draggable=3D"false" class=3D"lp-rich-link-captionBar-rightIcon" alt=3D"fa=
vicon.ico" src=3D"cid:F7497B12-0A80-4ED3-8E1F-046542D8DDB2"></a></td></tr></=
tbody></table></td></tr></tbody></table></a></div></div><br></div><div>You w=
ill see that Linux Wireless subsystem is activated only when s390x is not en=
abled.</div><div><br></div><div>This also created a build failure with anoth=
er rtlxxxx driver due to that:</div><div><div style=3D"display: block;" clas=
s=3D""><div style=3D"-webkit-user-select: all; -webkit-user-drag: element; d=
isplay: inline-block;" class=3D"apple-rich-link" draggable=3D"true" role=3D"=
link" data-url=3D"http://autobuild.buildroot.net/results/693053491ba61edcff0=
f75a4f30c13958e7e12ce/"><a style=3D"border-radius:10px;font-family:-apple-sy=
stem, Helvetica, Arial, sans-serif;display:block;-webkit-user-select:none;wi=
dth:300px;user-select:none;-webkit-user-modify:read-only;user-modify:read-on=
ly;overflow:hidden;text-decoration:none;" class=3D"lp-rich-link" rel=3D"nofo=
llow" href=3D"http://autobuild.buildroot.net/results/693053491ba61edcff0f75a=
4f30c13958e7e12ce/" dir=3D"ltr" role=3D"button" draggable=3D"false" width=3D=
"300"><table style=3D"table-layout:fixed;border-collapse:collapse;width:300p=
x;background-color:#E9E9EB;font-family:-apple-system, Helvetica, Arial, sans=
-serif;" class=3D"lp-rich-link-emailBaseTable" cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" width=3D"300"><tbody><tr><td vertical-align=3D"center"><=
table bgcolor=3D"#E9E9EB" cellpadding=3D"0" cellspacing=3D"0" width=3D"300" s=
tyle=3D"font-family:-apple-system, Helvetica, Arial, sans-serif;table-layout=
:fixed;background-color:rgba(233, 233, 235, 1);" class=3D"lp-rich-link-capti=
onBar"><tbody><tr><td style=3D"padding:8px 0px 8px 0px;" class=3D"lp-rich-li=
nk-captionBar-textStackItem"><div style=3D"max-width:100%;margin:0px 16px 0p=
x 16px;overflow:hidden;" class=3D"lp-rich-link-captionBar-textStack"><div st=
yle=3D"word-wrap:break-word;font-weight:500;font-size:12px;overflow:hidden;t=
ext-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-captionBar-tex=
tStack-topCaption-leading"><a rel=3D"nofollow" href=3D"http://autobuild.buil=
droot.net/results/693053491ba61edcff0f75a4f30c13958e7e12ce/" style=3D"text-d=
ecoration: none" draggable=3D"false"><font color=3D"#000000" style=3D"color:=
 rgba(0, 0, 0, 1);">Index of /results/693/693053491ba61edcff0f75a4f30c13958e=
7e12ce/</font></a></div><div style=3D"word-wrap:break-word;font-weight:400;f=
ont-size:11px;overflow:hidden;text-overflow:ellipsis;text-align:left;" class=
=3D"lp-rich-link-captionBar-textStack-bottomCaption-leading"><a rel=3D"nofol=
low" href=3D"http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4=
f30c13958e7e12ce/" style=3D"text-decoration: none" draggable=3D"false"><font=
 color=3D"#A2A2A9" style=3D"color: rgba(60, 60, 67, 0.6);">autobuild.buildro=
ot.net</font></a></div></div></td><td style=3D"padding:0px 12px 0px 0px;" cl=
ass=3D"lp-rich-link-captionBar-rightIconItem" width=3D"36"><a rel=3D"nofollo=
w" href=3D"http://autobuild.buildroot.net/results/693053491ba61edcff0f75a4f3=
0c13958e7e12ce/" draggable=3D"false"><img src=3D"data:image/png;base64,iVBOR=
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
AAABJRU5ErkJggg=3D=3D" draggable=3D"false" style=3D"pointer-events:none !imp=
ortant;display:inline-block;width:36px;height:36px;" class=3D"lp-rich-link-c=
aptionBar-rightIcon" width=3D"36" height=3D"36" data-unique-identifier=3D"">=
</a></td></tr></tbody></table></td></tr></tbody></table></a></div></div><br>=
</div><div>This is why I came in with this patchset that prevents that kind o=
f build failure.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span><=
/span><br><span>Reviewed-by: Kris Bahnsen &lt;kris@embeddedTS.com&gt;</span>=
<br></div></blockquote><div dir=3D"ltr"><br></div>Thank you</div><div dir=3D=
"ltr">Best regards</div><div dir=3D"ltr">Giulio</div><div dir=3D"ltr"><br><b=
lockquote type=3D"cite"><div dir=3D"ltr"><span>_____________________________=
__________________</span><br><span>buildroot mailing list</span><br><span>bu=
ildroot@buildroot.org</span><br><span>https://lists.buildroot.org/mailman/li=
stinfo/buildroot</span><br></div></blockquote></div></body></html>=

--Apple-Mail-9848FBE4-2A6C-4BB5-A935-7A41873557F2
Content-Type: image/vnd.microsoft.icon;
	name=favicon.ico;
	x-apple-part-url=F7497B12-0A80-4ED3-8E1F-046542D8DDB2
Content-Disposition: inline;
	filename=favicon.ico
Content-Transfer-Encoding: base64
Content-Id: <F7497B12-0A80-4ED3-8E1F-046542D8DDB2>

AAABAAEAICAQAAEABADoAgAAFgAAACgAAAAgAAAAQAAAAAEABAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAACBwQAKh8bADQrMAAjLkEAVUZJAEFKWAAWSocAgmhlAKx+fgAOe/AAlpidAM6ZlQDCxcMA
09bUAPv//AAAAAAAAREREREREREREREREREREBu7u7u7u7u7tyMzi7u7u7Ibu7u7QzM3uyaZmTu7
u7uyG7u7uGmZlkdpmZk7u7u7shu7u7hpmZY6JpmZO7u7u7Ibu7u7OZmV7uWZk4u7u7uyG7u7u4OZ
Pu7uNjS7u7u7shu7u7t1Vd7u7uraS7u7u7Ibu7u7Tu7u7u7u7qi7u7uyG7u7t67u7u7u7u7ku7u7
shu7u7Tu7u7u7u7u6nu7u7IbuLt67u7u7u7u7u5Lu7uyG7dLLu7u7u7u7u7uS7iLshu4Ai7u7u7u
7u7u7qeAe7IbuAAu7u7s7u7u7u6gAIuyG7sQTu7u417u7u7u0AC7shu7QH7u7uNl7u7u7uAEu7Ib
u4B+7u7Gls7u7u7gC7uyG7uyTu7u1ple7u7u0Hu7shu7uC7u7tOWPO7u7sK7u7Ibu7tO7u7qWt7u
7u6ou7uyG7u7Tu7u7u7u7u7uS7u7shu7u3ruw+7u7uDe7ku7u7Ibu7u07sPu7u7j3uqLu7uyG7u7
t67u7u7u7u7ku7u7shu7u7tO7u7u7u7uqLu7u7Ibu7u7hO7u7u7u6ku7u7uyG7u7u7hN7u7u7ne7
u7u7shu7u7u7gs7u7tR7u7u7u7Ibu7u7u7t0SnRIu7u7u7uyG7u7u7u7u7iLu7u7u7u7sgERERER
ERERERERERERERAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==

--Apple-Mail-9848FBE4-2A6C-4BB5-A935-7A41873557F2--

--Apple-Mail-ADF857D5-1AF9-4300-8ED2-DEE77ACD7F64--

--===============5092671194343919581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5092671194343919581==--
