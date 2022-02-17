Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80181C433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00FAE4017B;
	Thu, 17 Feb 2022 13:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUoim_VdAR1f; Thu, 17 Feb 2022 13:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D3641E52;
	Thu, 17 Feb 2022 13:29:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B35C1BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 752624017B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmpMLRApcfF8 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:29:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FF4E41E52
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:29:15 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id KgqOnFkXkiF0aKgqOnqNKl; Thu, 17 Feb 2022 14:29:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645104553; bh=pjGK5O35ud1okU4lMXG1N6txNFogoVnasaOJfVkm1cM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=CPxao13p004tJtV/EdxUbd519WnLK07dVBtgOQgND3/ckXzxmN6AA/e7ZJ5LPa3iF
 iltrFHxKOi5MgnYralCY8MSv7qFmQ+pH+eBsCYUl56A/bvRz4/z/ugAhHTfCGFx2lz
 n3lnxtG4FWUG6wLso+dXlogVezJsiVD2ms59mxtwzMI+yrCElIZKUe2baK4ymWl9Ow
 BUPkeim5NvffklA5iQ6KVeGNG/wlBe1D2uqM5dnkHLyClAk9wiY9bXDr5GqP7xXF7s
 Il2k2jKgILtTv5Jc2LcyS3eQbj9kkP41ehxF94kB680UAHLcAZl9syoz6YHGNeogeG
 pUPDJ/HLPY3Ng==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 17 Feb 2022 14:29:11 +0100
Message-Id: <1544B961-F072-436D-9887-4EC3CFDC4CD3@benettiengineering.com>
References: <20220217074338.147889-1-moritz@h6t.eu>
In-Reply-To: <20220217074338.147889-1-moritz@h6t.eu>
To: moritz@h6t.eu
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfIU7vUPG93w7dWMkrZrohLEjrdMb4xhjIrarDw0QE5QUpYaXustsHB4MJZX1IgcKuTiGQHssuS9rDvesI1nyTvdZzSCWvjBnRBxxpC9TtzQG5Tx1xcle
 8tEzMdHCf+YXZY4ktTs0eZZkt4N3ZpC+ADFPWr7/yBgAULi5qiE5VhBlCXg9kh8/GTjUHRv1rRgeSxMYce5JJnKk1uQ81M85KlispCqtXoecXMnfQkse2PyJ
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build failure
 with libgcrypt
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
Content-Type: multipart/mixed; boundary="===============1979199021056632317=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1979199021056632317==
Content-Type: multipart/alternative; boundary=Apple-Mail-7CE55EE1-9B6C-44E9-8ECB-0312730DF73C
Content-Transfer-Encoding: 7bit


--Apple-Mail-7CE55EE1-9B6C-44E9-8ECB-0312730DF73C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Moritz,

> Il giorno 17 feb 2022, alle ore 08:55, Moritz Bitsch via buildroot <buildr=
oot@buildroot.org> ha scritto:
>=20
> =EF=BB=BFFrom: Moritz Bitsch <moritz@h6t.eu>
>=20
> The patch 0001-Add-check-program-for-symver-attribute.patch touches
> a autoconf relevant file which causes a configure --recheck in the
> make step without proper CONF_ENV. Running autoreconf prevents this.

Thank you for the contribution, but Fabrice already sent a patch for that:
https://patchwork.ozlabs.org/project/buildroot/patch/20220213210504.1416861-=
1-fontaine.fabrice@gmail.com/

I suggest you to always check patchwork before working on a patch. (Yes, it h=
appened to me too some time :-)).

Best regards
Giulio

>=20
> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
> package/cryptsetup/cryptsetup.mk | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptse=
tup.mk
> index 2e06047c56..8373f0ab74 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR =3D cryptsetup_project
> CRYPTSETUP_INSTALL_STAGING =3D YES
> CRYPTSETUP_CONF_ENV +=3D LDFLAGS=3D"$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
> CRYPTSETUP_CONF_OPTS +=3D --enable-blkid --enable-libargon2
> +CRYPTSETUP_AUTORECONF =3D YES
>=20
> # cryptsetup uses libgcrypt by default, but can be configured to use OpenS=
SL
> # or kernel crypto modules instead
> --=20
> 2.35.1
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-7CE55EE1-9B6C-44E9-8ECB-0312730DF73C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Moritz,<div><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 17 feb 2022, alle ore 08:55, Moritz Bitsch via b=
uildroot &lt;buildroot@buildroot.org&gt; ha scritto:<br><br></blockquote></d=
iv><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>From: Moritz Bi=
tsch &lt;moritz@h6t.eu&gt;</span><br><span></span><br><span>The patch 0001-A=
dd-check-program-for-symver-attribute.patch touches</span><br><span>a autoco=
nf relevant file which causes a configure --recheck in the</span><br><span>m=
ake step without proper CONF_ENV. Running autoreconf prevents this.</span><b=
r></div></blockquote><div><br></div><div>Thank you for the contribution, but=
 Fabrice already sent a patch for that:</div><div><a href=3D"https://patchwo=
rk.ozlabs.org/project/buildroot/patch/20220213210504.1416861-1-fontaine.fabr=
ice@gmail.com/">https://patchwork.ozlabs.org/project/buildroot/patch/2022021=
3210504.1416861-1-fontaine.fabrice@gmail.com/</a></div><div><br></div><div>I=
 suggest you to always check patchwork before working on a patch. (Yes, it h=
appened to me too some time :-)).</div><div><br></div><div>Best regards</div=
><div>Giulio</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></spa=
n><br><span>Signed-off-by: Moritz Bitsch &lt;moritz@h6t.eu&gt;</span><br><sp=
an>---</span><br><span> package/cryptsetup/cryptsetup.mk | 1 +</span><br><sp=
an> 1 file changed, 1 insertion(+)</span><br><span></span><br><span>diff --g=
it a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk</sp=
an><br><span>index 2e06047c56..8373f0ab74 100644</span><br><span>--- a/packa=
ge/cryptsetup/cryptsetup.mk</span><br><span>+++ b/package/cryptsetup/cryptse=
tup.mk</span><br><span>@@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR =3D crypts=
etup_project</span><br><span> CRYPTSETUP_INSTALL_STAGING =3D YES</span><br><=
span> CRYPTSETUP_CONF_ENV +=3D LDFLAGS=3D"$(TARGET_LDFLAGS) $(TARGET_NLS_LIB=
S)"</span><br><span> CRYPTSETUP_CONF_OPTS +=3D --enable-blkid --enable-libar=
gon2</span><br><span>+CRYPTSETUP_AUTORECONF =3D YES</span><br><span></span><=
br><span> # cryptsetup uses libgcrypt by default, but can be configured to u=
se OpenSSL</span><br><span> # or kernel crypto modules instead</span><br><sp=
an>-- </span><br><span>2.35.1</span><br><span></span><br><span>_____________=
__________________________________</span><br><span>buildroot mailing list</s=
pan><br><span>buildroot@buildroot.org</span><br><span>https://lists.buildroo=
t.org/mailman/listinfo/buildroot</span><br></div></blockquote></div></body><=
/html>=

--Apple-Mail-7CE55EE1-9B6C-44E9-8ECB-0312730DF73C--

--===============1979199021056632317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1979199021056632317==--
