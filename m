Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8225C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E54D408CB;
	Wed,  9 Feb 2022 20:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_E0FyZ90DoK; Wed,  9 Feb 2022 20:39:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74557408C2;
	Wed,  9 Feb 2022 20:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EFB11BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA728258A
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlpobEhDTwbT for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:38:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E35281C21
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:38:55 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id Htjpn3VXjXfntHtjpnnoOg; Wed, 09 Feb 2022 21:38:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644439134; bh=1rF6sVVkRVLWS3PRY+vXZw1OLA+cT6XmIxAfNB7kgao=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=WpkEjBGb/qyIBufyaqLoVUUtOYZJ343Ktoe+ShN7GWOPzrya1zOUVOKegMLaln/zM
 SRdRz2d+9o4J7q9YXYhEH2UwsyqobCQkKRBHih+CyG/N/fQKMOBILbvQNSG+YGkd5X
 fS2LnwpZCY0cxtNYO789lFFq8BGbBLt3UvoKhY9lklUq/gdGE1OCfUVV+tAWMPCt1n
 sfaiwWFiowG3tw2SGGwR94rJUQHsVJ4m4cPHSjNfKSSyLeZ00K1P+2AUB3Iizn31hM
 bOA+iLD6ubxALsquRJ+R3W59O/iod7lwdgpj5XCuEbhmyPBN/UqBfdmZzQl2AVKaYT
 JZ11Ji4LhtnmQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 9 Feb 2022 21:38:53 +0100
Message-Id: <3147FE8A-CB1B-4CB0-A92B-48767C06ED92@benettiengineering.com>
References: <f8202766-058e-25d3-2761-4568ba6c89a1@benettiengineering.com>
In-Reply-To: <f8202766-058e-25d3-2761-4568ba6c89a1@benettiengineering.com>
To: Pedro Aguilar <paguilar@paguilar.org>, buildroot@buildroot.org
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4xfLXOJjv6y2+dvq1uAt80c/LSZhqvhCaciZmMPdouWanZ8AYrn745ZPXWOxZA+j5dBHK3USnfdeBfKTS52H+sOHOBw2Td8QMp3ajLollW5zNwnRfgcJ7E
 Japdb5FCbHhAEf2uTr93UCnsKCtga+03SbAE1X+SiwZyEDHBKHvJ2HqTjhN0Z1D8j/YCqQJCYC2a4FHPilxaSv32MPswgcPeSIKkZMSHtm3huW49WRa52jbM
 kKsYcWacTjra81kI4xmzSgl9Y4Gr9+jpeAV7RZlAppY22b9GKwKva88CSPxG4mpatHxnKrUeOz9muKGxjh2RAQ==
Subject: Re: [Buildroot] [PATCH v2 1/1] package/guile: Add BR2_ENABLE_LOCALE
 as dependency.
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: multipart/mixed; boundary="===============3994310864662017125=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3994310864662017125==
Content-Type: multipart/alternative; boundary=Apple-Mail-38D7117F-D6BB-49DF-A034-02443D1C55C4
Content-Transfer-Encoding: 7bit


--Apple-Mail-38D7117F-D6BB-49DF-A034-02443D1C55C4
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ah last thing,

please register on patchwork and mark your V1 and v2 patches as superseded:

https://patchwork.ozlabs.org/project/buildroot/list/?submitter=3D64998

Best regards
Giulio

Inviato da iPhone

> Il giorno 8 feb 2022, alle ore 23:54, Giulio Benetti <giulio.benetti@benet=
tiengineering.com> ha scritto:
>=20
> =EF=BB=BFHi again Pedro,
>=20
> I've reproduced the build failure with your previous attached .config file=
 and this patch fixes it. So below...
>=20
>> On 08/02/22 23:06, Giulio Benetti wrote:
>> Hi Pedro,
>>> On 08/02/22 22:37, Pedro Aguilar wrote:
>>> If it's not present, enable libiconv.
>> Here it's missing:
>> Fixes:
>> URL to autobuilder failure
>=20
> ...please provide the autobuilder failure URL and if it doesn't exist than=
 we don't need it.
>=20
> So once done this I can give you my Review.
>=20
> Waiting for V2 with improved commit log then.
>=20
> Thank you!
> Best regards
> --=20
> Giulio Benetti
> Benetti Engineering sas
>=20
>> And also I can't find guile failing due to LIBICONV.
>> At least, I only find:
>> http://autobuild.buildroot.net/?reason=3Dguile-3.0.7
>> But it seems to be about another problem(to be solved too).
>> Can you please point the autobuilder failure?
>> Otherwise I can't test/review your patch.
>> Thank you!
>> Best regards
>> -- Giulio Benetti Benetti Engineering sas
>>> Signed-off-by: Pedro Aguilar<paguilar@paguilar.org>
>>>=20
>>> ---
>>> Changes v1 -> v2:
>>>    - Use BR2_ENABLE_LOCALE if selected, otherwise use libiconv
>>>      as before (pointed out by Thomas and Giulio)
>>> ---
>>>   package/guile/Config.in | 1 +
>>>   package/guile/guile.mk  | 4 ++++
>>>   2 files changed, 5 insertions(+)
>>>=20
>>> diff --git a/package/guile/Config.in b/package/guile/Config.in
>>> index b1182a4cee..f70e674018 100644
>>> --- a/package/guile/Config.in
>>> +++ b/package/guile/Config.in
>>> @@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE
>>>       select BR2_PACKAGE_LIBFFI
>>>       select BR2_PACKAGE_GMP
>>>       select BR2_PACKAGE_BDWGC
>>> +    select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>>>       help
>>>         Guile is an interpreter and compiler for the Scheme
>>>         programming language, a clean and elegant dialect of Lisp.
>>> diff --git a/package/guile/guile.mk b/package/guile/guile.mk
>>> index 0f245fca76..03420407f8 100644
>>> --- a/package/guile/guile.mk
>>> +++ b/package/guile/guile.mk
>>> @@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR =3D gnu
>>>   GUILE_DEPENDENCIES =3D host-guile libunistring libffi gmp bdwgc host-p=
kgconf
>>>   HOST_GUILE_DEPENDENCIES =3D host-libunistring host-libffi host-gmp hos=
t-bdwgc host-flex host-pkgconf host-gettext
>>>   +ifeq ($(BR2_ENABLE_LOCALE),)
>>> +GUILE_DEPENDENCIES +=3D libiconv
>>> +endif
>>> +
>>>   # The HAVE_GC* CFLAGS specify that we will use internal callbacks
>>>   # instead of the ones provided by
>>>   # bdwgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>=20

--Apple-Mail-38D7117F-D6BB-49DF-A034-02443D1C55C4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Ah last thing,<div><br></div><div>please re=
gister on patchwork and mark your V1 and v2 patches as superseded:</div><div=
><br></div><div><a href=3D"https://patchwork.ozlabs.org/project/buildroot/li=
st/?submitter=3D64998">https://patchwork.ozlabs.org/project/buildroot/list/?=
submitter=3D64998</a></div><div><br></div><div>Best regards</div><div>Giulio=
<br><br><div dir=3D"ltr">Inviato da iPhone</div><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 8 feb 2022, alle ore 23:54, Giulio Benetti &lt;=
giulio.benetti@benettiengineering.com&gt; ha scritto:<br><br></blockquote></=
div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi again Pedro=
,</span><br><span></span><br><span>I've reproduced the build failure with yo=
ur previous attached .config file and this patch fixes it. So below...</span=
><br><span></span><br><span>On 08/02/22 23:06, Giulio Benetti wrote:</span><=
br><blockquote type=3D"cite"><span>Hi Pedro,</span><br></blockquote><blockqu=
ote type=3D"cite"><span>On 08/02/22 22:37, Pedro Aguilar wrote:</span><br></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>If it's=
 not present, enable libiconv.</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><span>Here it's missing:</span><br></blockquote><blockquote=
 type=3D"cite"><span>Fixes:</span><br></blockquote><blockquote type=3D"cite"=
><span>URL to autobuilder failure</span><br></blockquote><span></span><br><s=
pan>...please provide the autobuilder failure URL and if it doesn't exist th=
an we don't need it.</span><br><span></span><br><span>So once done this I ca=
n give you my Review.</span><br><span></span><br><span>Waiting for V2 with i=
mproved commit log then.</span><br><span></span><br><span>Thank you!</span><=
br><span>Best regards</span><br><span>-- </span><br><span>Giulio Benetti</sp=
an><br><span>Benetti Engineering sas</span><br><span></span><br><blockquote t=
ype=3D"cite"><span>And also I can't find guile failing due to LIBICONV.</spa=
n><br></blockquote><blockquote type=3D"cite"><span>At least, I only find:</s=
pan><br></blockquote><blockquote type=3D"cite"><span>http://autobuild.buildr=
oot.net/?reason=3Dguile-3.0.7</span><br></blockquote><blockquote type=3D"cit=
e"><span>But it seems to be about another problem(to be solved too).</span><=
br></blockquote><blockquote type=3D"cite"><span>Can you please point the aut=
obuilder failure?</span><br></blockquote><blockquote type=3D"cite"><span>Oth=
erwise I can't test/review your patch.</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>Thank you!</span><br></blockquote><blockquote type=3D"cite=
"><span>Best regards</span><br></blockquote><blockquote type=3D"cite"><span>=
-- Giulio Benetti Benetti Engineering sas</span><br></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>Signed-off-by: Pedro Aguilar&=
lt;paguilar@paguilar.org&gt;</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>---</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>Changes v1 -&gt; v2:</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;- Use B=
R2_ENABLE_LOCALE if selected, otherwise use libiconv</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;as before (pointed out by Thomas and Giulio)</span=
><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>---</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span> &nbsp;&nbsp;package/guile/Config.in | 1 +=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span> &nbsp;&nbsp;package/guile/guile.mk &nbsp;| 4 ++++</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span> &nbsp;&nbsp;2 files changed, 5 insertions(+)</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>diff --git a/package/guile/Config.in b/package/guile/Conf=
ig.in</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>index b1182a4cee..f70e674018 100644</span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>--- a/package/guile/Config.in</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>+++ b/package/guile/Config=
.in</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>@@ -9,6 +9,7 @@ config BR2_PACKAGE_GUILE</span><br></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span> &nbsp;&nbsp; &nbsp; &nbsp;select BR2_PACKAGE_LIBFFI</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
 &nbsp;&nbsp; &nbsp; &nbsp;select BR2_PACKAGE_GMP</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&=
nbsp; &nbsp; &nbsp;select BR2_PACKAGE_BDWGC</span><br></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp; &nbsp=
;select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;=
&nbsp; &nbsp; &nbsp;help</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp=
;Guile is an interpreter and compiler for the Scheme</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbs=
p;&nbsp; &nbsp; &nbsp; &nbsp;programming language, a clean and elegant diale=
ct of Lisp.</span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>diff --git a/package/guile/guile.mk b/package/=
guile/guile.mk</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>index 0f245fca76..03420407f8 100644</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span>--- a/package/guile/guile.mk</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>+++ b/package/guil=
e/guile.mk</span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>@@ -18,6 +18,10 @@ GUILE_CPE_ID_VENDOR =3D gnu<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span> &nbsp;&nbsp;GUILE_DEPENDENCIES =3D host-guile libunistrin=
g libffi gmp bdwgc host-pkgconf</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;HOST_GUILE_DE=
PENDENCIES =3D host-libunistring host-libffi host-gmp host-bdwgc host-flex h=
ost-pkgconf host-gettext</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;+ifeq ($(BR2_ENABLE_=
LOCALE),)</span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>+GUILE_DEPENDENCIES +=3D libiconv</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>+endif</span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>+</span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;# The HAVE_GC*=
 CFLAGS specify that we will use internal callbacks</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp=
;&nbsp;# instead of the ones provided by</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span> &nbsp;&nbsp;# bd=
wgc. Eg. HAVE_GC_SET_FINALIZER_NOTIFIER specifies that we won't</span><br></=
blockquote></blockquote><blockquote type=3D"cite"><span>____________________=
___________________________</span><br></blockquote><blockquote type=3D"cite"=
><span>buildroot mailing list</span><br></blockquote><blockquote type=3D"cit=
e"><span>buildroot@buildroot.org</span><br></blockquote><blockquote type=3D"=
cite"><span>https://lists.buildroot.org/mailman/listinfo/buildroot</span><br=
></blockquote><span></span><br></div></blockquote></div></body></html>=

--Apple-Mail-38D7117F-D6BB-49DF-A034-02443D1C55C4--

--===============3994310864662017125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3994310864662017125==--
