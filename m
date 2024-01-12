Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA79C4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 22:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42FA1402C3;
	Fri, 12 Jan 2024 22:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42FA1402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhBWKPA5vAQq; Fri, 12 Jan 2024 22:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1B3C40453;
	Fri, 12 Jan 2024 22:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B3C40453
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBCCF1BF228
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 22:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCFC584D25
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 22:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCFC584D25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omrAzKSP5FQJ for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 22:40:00 +0000 (UTC)
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B5DE84D19
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 22:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B5DE84D19
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPA
 id OQBvrumwsY3MaOQBwrVtVF; Fri, 12 Jan 2024 23:39:56 +0100
Mime-Version: 1.0 (1.0)
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPi7W83eWKi4o5P8gGnYVUxDU1+u_+aXycSNHNRtkF_medg46g@mail.gmail.com>
Date: Fri, 12 Jan 2024 23:39:55 +0100
Message-Id: <23F59953-57A8-48F0-9809-4841CC10CA0F@benettiengineering.com>
References: <CAPi7W83eWKi4o5P8gGnYVUxDU1+u_+aXycSNHNRtkF_medg46g@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailer: iPhone Mail (21C66)
X-CMAE-Envelope: MS4xfD19zMCHDjurRV6Wd1lAd/hlO9b1sXpjQiRsUYMbXrQ8CT1Jvlu+kgNYFXU6cGQNI6KmHiXG5DvsMQJ1d4PFtHNI1CPdzhqxdDLfvqPqmJjPCIr+HGqT
 +VCBqI8h1a04qEselheV4KslQvw+f6mFBLi71Lc/qK58GRVV9JloYcra9b1Fz1OWzucVCQx7VTXALbZnjPOKgBfG0RINdC7OMVBg3U21HK4O8TOp62j/0AgB
 O8G+dqBWiC8/XsBnkOA8OrqXf8OqPDHGvC0U1UxV/hN6vxkrOqfhL5SVb8p+DHJz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705099196; bh=gsPhf9Dt+sGhcoNMrgSZnbWSAr4Uxu18fHX2S73D1cI=;
 h=Content-Type:Mime-Version:Subject:From:Date:To;
 b=bgYaAXZyKRbRdNZOevcL2Tl9BuIHokGKSgOuWQ3+uwW7jv0RjzD+x3CX5Fwf8vkYX
 eAPeMpvTd+qFCBfuSFNe/ZqztSbdC1d+HzTQ5+5tsxlZpOmbz1M5tHh4RNdjLjQyyQ
 FK+eijRBfUdDyL4qrs4JyKJTUMxFF0Lf7xxulqIYOzOReLmMVJHFGh5n1YvK9aRaLi
 +j7LSbUF2Nj+sCqpfPnsTDZbk7Q2KNY+61kSho9+NxTN/rRjwLntwuPsX9FUKmccif
 H7eCC7gB7jqD/d6snIBofNfXmIKyov9+1hr/Sp1XFqnkbOIeSiGVs/YmnE2gTL7vom
 ONZ7qf2Gw4dTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bgYaAXZy
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix musl build
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7959325397560419294=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7959325397560419294==
Content-Type: multipart/alternative; boundary=Apple-Mail-26BC7C4F-10F9-4EEB-9E1E-807C5BFBC2A1
Content-Transfer-Encoding: 7bit


--Apple-Mail-26BC7C4F-10F9-4EEB-9E1E-807C5BFBC2A1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span><br><blockquo=
te type=3D"cite"><span>Il giorno 12 gen 2024, alle ore 23:11, Fabrice Fontai=
ne &lt;fontaine.fabrice@gmail.com&gt; ha scritto:</span><br></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>=EF=BB=BFHi Giulio,</span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Le ven. 12 janv. 2024 =C3=A0 22:15, Giulio Benetti</span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>&lt;giulio.benetti@benettiengineering.com&gt; a =C3=A9crit :</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>Hi Fabrice,</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>On 12/01/24 20:20, Fabrice Fontaine wrote:</span>=
<br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>Fix following musl build f=
ailure raised at least since bump to version</span><br></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>3.84 in commit bcdf2fc0e41832147d3fc398070074be29c=
159d4:</span><br></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>/home/buildroot/autobuild/insta=
nce-3/output-1/host/bin/microblazeel-linux-gcc -shared &nbsp;&nbsp;-Wl,-z,de=
fs -Wl,-soname -Wl,libfreebl3.so &nbsp;-Wl,--version-script,Linux2.6_microbl=
azeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/fr=
eebl.def -Wl,-Bsymbolic -o Linux2.6_microblazeel_microblazeel-linux-gcc.br_r=
eal_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreebl3.so Linux2.6_microblazeel=
_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash=
_vector.o &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-ldl -lc</span><br></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>/home/buildroot/autobuild/instance-3/output-1/=
host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-musl/11.2=
.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: Linux2.6_microblaze=
el_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowha=
sh_vector.o: in function `loader_GetOriginalPathname':</span><br></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>(.text.loader_GetOriginalPathname+0x1c4)=
: undefined reference to `PR_SetError'</span><br></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>Fixes:</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span> - http://a=
utobuild.buildroot.org/results/9a51138bb8a65f7f76a01d0e73c451273e6eb49e</spa=
n><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span> - http://autobuild.bui=
ldroot.org/results/d00d22f1bfee5c175f3266ff16124632906463c3</span><br></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>Signed-off-by: Fabrice Fontaine &lt;fontaine.fabrice@gm=
ail.com&gt;</span><br></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Thank you for t=
he patch. This is not a fix but a work-around. I've tried</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
several times to fix the problem from the root, but I haven't made it</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>and given up in the end.</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>Why do you think this is a work-around?</span><br></blockquote><blo=
ckquote type=3D"cite"><span>Here is an extract of [1]:</span><br></blockquot=
e><blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D=
"cite"><span># On Linux 2.6 or later, build libfreebl3.so with no NSPR and l=
ibnssutil3.so</span><br></blockquote><blockquote type=3D"cite"><span># depen=
dencies by default. &nbsp;Set FREEBL_NO_DEPEND to 0 in the environment to</s=
pan><br></blockquote><blockquote type=3D"cite"><span># override this.</span>=
<br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bl=
ockquote type=3D"cite"><span>So basically, when FREEBL_NO_DEPEND is set to 1=
, freebl shall not</span><br></blockquote><blockquote type=3D"cite"><span>de=
pend on PR_SetError as this function is defined by nspr.</span><br></blockqu=
ote><div dir=3D"ltr"><br></div><div dir=3D"ltr">Yes but your patch only comm=
ent out PR_SetError() while it should depend on FREEBL_NO_DEPEND at this poi=
nt even if I didn=E2=80=99t go in depth again after 1/2 years.</div><div dir=
=3D"ltr">But the point is why this only happens on musl and specific archite=
ctures.</div><div dir=3D"ltr">NSS has a spaghetti Makefile set and the other=
 option is gyp but only NSS would use that so I think it doesn=E2=80=99t mak=
e sense to add an infra for it.</div><div dir=3D"ltr">So this looks to me li=
ke a particular combination of NSS Makefile recipes and rules that lead to t=
he build failure. And IMHO Makefile should be fixed possibly instead of the .=
c code.</div><div dir=3D"ltr">I think there=E2=80=99s already a handling for=
 this for no musl libc on archs that are not microblaze of other funky ones.=
 So we should reuse that Makefile handling, but it=E2=80=99s not easy at all=
.</div><br><blockquote type=3D"cite"><span>If upstream is against this patch=
, another solution is to set</span><br></blockquote><blockquote type=3D"cite=
"><span>FREEBL_NO_DEPEND to 0 in libnss.mk.</span><br></blockquote><blockquo=
te type=3D"cite"><span>However this could have some side effects on packages=
 using freebl.</span><br></blockquote><div dir=3D"ltr"><br></div><div dir=3D=
"ltr">This is the reason why my previous patch setting FREEBL_NO_DEPEND to 0=
 has not been accepted:</div><div dir=3D"ltr"><div style=3D"display: block;"=
 class=3D""><div style=3D"-webkit-user-select: all; -webkit-user-drag: eleme=
nt; display: inline-block;" class=3D"apple-rich-link" draggable=3D"true" rol=
e=3D"link" data-url=3D"https://patchwork.ozlabs.org/project/buildroot/patch/=
20220806153651.4013424-1-giulio.benetti@benettiengineering.com/"><a style=3D=
"border-radius:10px;font-family:-apple-system, Helvetica, Arial, sans-serif;=
display:block;-webkit-user-select:none;width:300px;user-select:none;-webkit-=
user-modify:read-only;user-modify:read-only;overflow:hidden;text-decoration:=
none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"https://patchwork.ozl=
abs.org/project/buildroot/patch/20220806153651.4013424-1-giulio.benetti@bene=
ttiengineering.com/" dir=3D"ltr" role=3D"button" draggable=3D"false" width=3D=
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
yle=3D"word-wrap:break-word;font-weight:400;font-size:11px;overflow:hidden;t=
ext-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-captionBar-tex=
tStack-bottomCaption-leading"><a rel=3D"nofollow" href=3D"https://patchwork.=
ozlabs.org/project/buildroot/patch/20220806153651.4013424-1-giulio.benetti@b=
enettiengineering.com/" style=3D"text-decoration: none" draggable=3D"false">=
<font color=3D"#000000" style=3D"color: rgba(0, 0, 0, 1);">patchwork.ozlabs.=
org</font></a></div></div></td><td style=3D"padding:0px 12px 0px 0px;" class=
=3D"lp-rich-link-captionBar-rightIconItem" width=3D"32"><a rel=3D"nofollow" h=
ref=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20220806153651.4=
013424-1-giulio.benetti@benettiengineering.com/" draggable=3D"false"><img sr=
c=3D"data:image/png;base64,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
2VNcoN4J/SNoWT4gtFZ0FgQXXBq1mpsw4V6haKC9uKnIsWFz0qDi/eMRufzZ3dUmJdsqCkcw5rzt=
a5yNwZc1vm2c4rm9c1P2L+rgWaC3IX/FjKKF1Z+sfCtIXNZRZl88sefhHxxZ5yWrm0/OYi/0Vbvs=
S/FH55cfHYxesXv6vgVfxQyaisqny7hLvkh688vlr31fulWUsvLvNetnk5cbl4+Y0VQSt2rdRdWb=
zy4aqJqxpW01dXrP5jzfQ156vGVW1Zq7lWsbZjXcy6xvV265evf7tBsKG9ekL1vo3mGxdvfLmJt+=
nq5uDN9VsstlRuefO18OtbWyO2NtQ41FRtI24r2PbL9tTtrTuYO+pqzWora//cKd7ZsStx15k6n7=
q63ea7l+1B9yj29OydsvfyN6HfNNa71W/dZ7Svcj/Yr9j/+EDmgRsHow+2HGIeqv/W/tuNh/UPVz=
QgDUUNfUcERzoa0xuvNEU1tTT7Nx/+zv27nUetj1YfMzy27Ljm8bLj708Un+g/KTnZeyr71MOW6S=
13T086ff1MwpmLZ6PPnvs+/PvTrazWE+cCzh0973e+6QfmD0cueF9oaPNqO/yj14+HL3pfbLjkc6=
nxsu/l5ivjrxy/GnT11LXQa99fZ1+/0B7bfuVGyo1bN6fc7LjFu9V9W3T72Z2COwN358OLfcV9nf=
tVD8wf1Pxr9L/2dXh3HOsM7Wz7Kemnuw+5D5/8LPv5bVfZL9Rfqh5ZParr9uw+2hPec/nx5MddTy=
RPBnrLf9X9deNTp6ff/hb8W1vfpL6uZ9Jn739f8tz0+c4/xv3R0h/f/+BF3ouBlxWvTF/tes183f=
om7c2jgVlvSW/X/Tn6z+Z30e/uvc97//7fCQ/4Yk7kYoUAAAB4ZVhJZk1NACoAAAAIAAUBEgADAA=
AAAQABAAABGgAFAAAAAQAAAEoBGwAFAAAAAQAAAFIBKAADAAAAAQACAACHaQAEAAAAAQAAAFoAAA=
AAAAAA2AAAAAEAAADYAAAAAQACoAIABAAAAAEAAABsoAMABAAAAAEAAABsAAAAAOIX6z4AAAAJcE=
hZcwAAITgAACE4AUWWMWAAAAAcaURPVAAAAAIAAAAAAAAANgAAACgAAAA2AAAANgAABRSxLH/cAA=
AE4ElEQVR4AexZTWgVVxT+3suPbTXE1KSQ5vmz0o0krbTWgtpuEmk20kb8W1hNWim66FoaKWiNG6=
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
I=3D" draggable=3D"false" style=3D"pointer-events:none !important;display:in=
line-block;width:32px;height:32px;" class=3D"lp-rich-link-captionBar-rightIc=
on" width=3D"32" height=3D"32" data-unique-identifier=3D""></a></td></tr></t=
body></table></td></tr></tbody></table></a></div></div><br></div><div dir=3D=
"ltr">So we can=E2=80=99t go that way.</div><div dir=3D"ltr"><br></div><div d=
ir=3D"ltr">So to work around build failure in Buildroot we can get rid of PR=
_SetError().</div><div dir=3D"ltr">At this point I ask you if you can send a=
 V2 that removes the&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);">&nbsp;</span><span style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);">PR_SetError() line instead of commenting it out.</span></div><=
div dir=3D"ltr"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
);"><br></span></div><div dir=3D"ltr"><span style=3D"caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0);">Thank you!</span></div><div dir=3D"ltr"><span style=
=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Best regards</span></di=
v><div dir=3D"ltr"><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0=
, 0);">Giulio</span></div><br><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>[1] https://github.com/nss-dev/nss=
/blob/ecab6a135bda33b8ea3aa887dd9944a8dcb27129/coreconf/Linux.mk#L178</span>=
<br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>So=
 to me this looks ok, at least better than the actual situation, so:</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>Reviewed-by: Giulio Benetti &lt;giulio.benetti@benettiengineering=
.com&gt;</span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>---</=
span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span> ...l-genload.c-drop=
-call-to-PR_SetError.patch | 39 +++++++++++++++++++</span><br></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span> 1 file changed, 39 insertions(+)</span><br=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span> create mode 100644 package/=
libnss/0002-lib-freebl-genload.c-drop-call-to-PR_SetError.patch</span><br></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>diff --git a/package/libnss/0002-lib-freebl-genlo=
ad.c-drop-call-to-PR_SetError.patch b/package/libnss/0002-lib-freebl-genload=
.c-drop-call-to-PR_SetError.patch</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>new file mode 100644</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>index 0000000000..fcbb434727</span><br></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>--- /dev/null</span><br></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>+++ b/package/libnss/0002-lib-freebl-genload.c-drop-call-t=
o-PR_SetError.patch</span><br></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>@@ -0,0 +1,39 @@</span><br></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+=
=46rom ac93583db67145467c0698f6adba5ee907d9216b Mon Sep 17 00:00:00 2001</sp=
an><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>+From: Fabrice Fontain=
e &lt;fontaine.fabrice@gmail.com&gt;</span><br></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>+Date: Fri, 12 Jan 2024 20:13:30 +0100</span><br></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>+Subject: [PATCH] lib/freebl/genload.c=
: drop call to PR_SetError</span><br></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>+</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+Drop call t=
o PR_SetError in genload.c as already done in</span><br></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>+lowhash_vector.c to avoid adding a dependency on=
 a function defined in</span><br></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>+nspr and raising the following build failure when FREEBL_NO_DEPEND is</=
span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>+set to 1 (default o=
n Linux):</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>+/home/buildroot/autobuild/i=
nstance-3/output-1/host/bin/microblazeel-linux-gcc -shared &nbsp;&nbsp;-Wl,-=
z,defs -Wl,-soname -Wl,libfreebl3.so &nbsp;-Wl,--version-script,Linux2.6_mic=
roblazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLI=
B/freebl.def -Wl,-Bsymbolic -o Linux2.6_microblazeel_microblazeel-linux-gcc.=
br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/libfreebl3.so Linux2.6_microbla=
zeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/low=
hash_vector.o &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-ldl -lc</span><br></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>+/home/buildroot/autobuild/instance-3/outp=
ut-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-musl=
/11.2.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: Linux2.6_micro=
blazeel_microblazeel-linux-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/=
lowhash_vector.o: in function `loader_GetOriginalPathname':</span><br></bloc=
kquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+(.text.loader_GetOriginalPathname+0x=
1c4): undefined reference to `PR_SetError'</span><br></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>+</span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>+Fixes:</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ - h=
ttp://autobuild.buildroot.org/results/d00d22f1bfee5c175f3266ff16124632906463=
c3</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>+Signed-off-by: Fabrice Fontaine &=
lt;fontaine.fabrice@gmail.com&gt;</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+Upstream: https://github.com/nss-dev/nss/pull/28</span><br></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>This ^^^ is not Mozilla upstream and I t=
hink they would never accept it,</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>so I would set Upstream: t=
o "N/A"</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Best regards</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
--</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>Giulio Benetti</span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>CEO&amp;CTO@Benetti En=
gineering sas</span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span></span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>+---</span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ lib/freebl/=
genload.c | 2 +-</span><br></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ 1=
 file changed, 1 insertion(+), 1 deletion(-)</span><br></blockquote></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>+</span><br></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+diff --git a/nss/lib/freebl/genload.c b/nss/lib/freebl/genload.c</=
span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>+index 832deb58c..1f=
145048b 100644</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+--- a=
/nss/lib/freebl/genload.c</span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>++++ b/nss/lib/freebl/genload.c</span><br></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+@@ -43,7 +43,7 @@ loader_GetOriginalPathname(const char*=
 link)</span><br></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbs=
p;&nbsp;&nbsp;PRUint32 iterations =3D 0;</span><br></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;PRInt32 len =3D 0, retlen =3D=
 0;</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&=
nbsp;&nbsp;if (!link) {</span><br></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>+- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PR_SetError(PR_INVALID_ARG=
UMENT_ERROR, 0);</span><br></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>++=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*PR_SetError(PR_INVALID_ARGUMENT=
_ERROR, 0); */</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return NULL;</span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;}</span><br=
></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;le=
n =3D PR_MAX(1024, strlen(link) + 1);</span><br></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+--</span><br></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>+2.43.0</span><br></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span=
><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>B=
est Regards,</span><br></blockquote><blockquote type=3D"cite"><span></span><=
br></blockquote><blockquote type=3D"cite"><span>Fabrice</span><br></blockquo=
te><blockquote type=3D"cite"><span>_________________________________________=
______</span><br></blockquote><blockquote type=3D"cite"><span>buildroot mail=
ing list</span><br></blockquote><blockquote type=3D"cite"><span>buildroot@bu=
ildroot.org</span><br></blockquote><blockquote type=3D"cite"><span>https://l=
ists.buildroot.org/mailman/listinfo/buildroot</span><br></blockquote></div><=
/body></html>=

--Apple-Mail-26BC7C4F-10F9-4EEB-9E1E-807C5BFBC2A1--

--===============7959325397560419294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7959325397560419294==--
