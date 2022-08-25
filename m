Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1776C28D13
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 12:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179B540C5A;
	Thu, 25 Aug 2022 12:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179B540C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lELbO_PaelRs; Thu, 25 Aug 2022 12:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED7B340201;
	Thu, 25 Aug 2022 12:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7B340201
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 057361BF3EB
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4F0E40201
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 12:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4F0E40201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdG4wxkoxbYJ for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 12:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3A4040146
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3A4040146
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 12:15:43 +0000 (UTC)
Received: from smtpclient.apple ([151.68.103.48])
 by Aruba Outgoing Smtp  with ESMTPA
 id RBlso97mssT4eRBlsotgx8; Thu, 25 Aug 2022 14:15:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 25 Aug 2022 14:15:39 +0200
Message-Id: <CAF64DF9-F5C0-4A37-9318-B50DB1CE8A0C@benettiengineering.com>
References: <CAMdwsN8p3nfWzyodhD_k6HWJRA_V4MopKUJ1_uJD4+hYqiYfxw@mail.gmail.com>
In-Reply-To: <CAMdwsN8p3nfWzyodhD_k6HWJRA_V4MopKUJ1_uJD4+hYqiYfxw@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfPV9JtVF9oJbahS8N8SVTwmRus0L1z7+Hxv0UVVAQ3Wva5tdL4PIZTqRnx+7cxTaa+2GKj8Me75l+kLv/ZGBUUtBZ7hkFtVQRTkG4B9mNK/n93vUfD9h
 svQ8ezkGgwbyyhEu42u3/JhdtBUlfamxLmQwl6nCTqVhVZSWQ8WO05mvkRplxTt6QopSsKIosIyFboHYCCaf3SXk2PskIzV0BhSSaAoVMDjFRE2yqxuHs+yq
 DAt5NNeNO3Gq8pVRA1ZxifXuDOU3KWl8YlEAX+hi1kytzx1qvPSofRpe68gLMd/3wJ+fH8NFH9qMZGLQd6xVgxmqAw54Ujckfq0xaTFQFKM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1661429741; bh=8saYwvk6jnUrwrKQTawSq1xhvoavO1/kw21muL03eN8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=bB1WnPm104sUcL/IAMs6sxrm8mjlR+kaXsuEA4TX6hnVyCqkZs+xMcZXahKBiV+m1
 /Me8QjHfhpSQBSk7YUlAx1tBGX78Ndpamdq8q86uxxlchEu6yEqTk604iHtC57coyX
 2zxe0cD/y0K7/LReFSOEjkbdlxI9+HCsFrEjRnMVwWqS0ejzD5HHYOt8CY447SJ6kU
 oDOVXYZHYZb7G76QfckAPj+IUH1aGnf1OHcjrVPvX3qQtRe/qka/RYC03LR8ijAyFH
 wVO8mx1uzEKt4O2hfGcz+4Jv2ROYFT6LWKqYcxkiL6Z7yF2fEJ63jyJdYCQSDsxs7Q
 mv3j4u5OQ9pfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bB1WnPm1
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: extend qt6
 configuration
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
Cc: yann.morin.1998@free.fr, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6383218468697456024=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6383218468697456024==
Content-Type: multipart/alternative; boundary=Apple-Mail-C460BE54-569B-4354-8675-70D60519F37C
Content-Transfer-Encoding: 7bit


--Apple-Mail-C460BE54-569B-4354-8675-70D60519F37C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jesse,

> Il giorno 25 ago 2022, alle ore 10:52, Jesse Van Gavere <jesseevg@gmail.co=
m> ha scritto:
>=20
> =EF=BB=BF
> Hello Thomas,
>=20
> Yann e. made a similar remark, I'll take both your comments into account t=
o try do a full patch series that splits it up nicely, along with the change=
s you suggested, as for the dependencies, a review/test of such a patch seri=
es would be greatly appreciated because I'm sure like you say there might be=
 redundancies/improvements to be made that I didn't catch with my own testin=
g.
> This might take some time as I'm everything but a git expert so please bea=
r with me as I try to get this into a nice patch series :)
> Thank you both for the feedback.

Please don=E2=80=99t top post and answer inline.

Thank you!
Best regards
=E2=80=94
Giulio Benetti
CEO/CTO@Benetti Engineering sas

>=20
> Best regards,
> Jesse
>=20
>=20
> Op do 25 aug. 2022 om 10:43 schreef Thomas Petazzoni <thomas.petazzoni@boo=
tlin.com>:
>> Hello Jesse,
>>=20
>> On Thu, 25 Aug 2022 09:39:51 +0200
>> Jesse Van Gavere <jesseevg@gmail.com> wrote:
>>=20
>> > This will bring the qt6base functionality mostly on par with the qt5bas=
e
>> > package, building the package has been tested to the best of my ability=

>> > and went without error as far as I can test.
>> > One bug to be noted is that for the GUI with fontconfig without harfbuz=
z
>> > support, this will produce incorrectly rendered text for version 6.3.1,=

>> > see https://bugreports.qt.io/browse/QTBUG-101430
>> > I have however already verified that 6.3.2 and 6.4.0 will fix this issu=
e
>> > so I've decided not to add harfbuzz as a fontconfig dependency as a
>> > version bump (which should be soon) will fix it.
>>=20
>> Yes, let's bump to 6.4.0 then.
>>=20
>> > Also add the version hashes for qt6base.
>> >=20
>> > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
>>=20
>> Overall, this needs to be split into a number of patches:
>>=20
>>  - One adding the hash file, with just the hash of the tarball
>>=20
>>  - One adding the license information (which is totally missing today,
>>    and I noticed due to your addition of the hash file) together with
>>    the hashes of the license files
>>=20
>>  - Several patches adding the different options. I'm not too keen on
>>    copy/pasting directly the qt5 logic, as I'm not sure all the
>>    dependencies are exactly the same, so let's do this one feature at a
>>    time.
>>=20
>>=20
>> > +ifeq ($(BR2_ENABLE_DEBUG),y)
>> > +QT6BASE_CONF_OPTS +=3D -DCMAKE_BUILD_TYPE=3DDebug
>> > +else
>> > +QT6BASE_CONF_OPTS +=3D -DCMAKE_BUILD_TYPE=3DRelease
>> > +endif
>>=20
>> This is already handled by the cmake-package infrastructure, do no need
>> to handle CMAKE_BUILD_TYPE.
>>=20
>> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>> > +# Qt 5.8 needs atomics, which on various architectures are in -latomic=

>> > +QT6BASE_CONF_OPTS +=3D -DCMAKE_SHARED_LINKER_FLAGS=3D"-latomic"
>>=20
>> Is this also needed with Qt6 ? (Most likely yes, but the comment is
>> weird, another reason why I don't like the copy/pasting from Qt5).
>>=20
>> Thomas
>> --=20
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-C460BE54-569B-4354-8675-70D60519F37C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Jesse,<br><div dir=3D"ltr"><br></div><di=
v dir=3D"ltr"><blockquote type=3D"cite">Il giorno 25 ago 2022, alle ore 10:5=
2, Jesse Van Gavere &lt;jesseevg@gmail.com&gt; ha scritto:<br><br></blockquo=
te></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr=
"><div>Hello Thomas,</div><div><br></div><div>Yann e. made a similar remark,=
 I'll take both your comments into account to try do a full patch series tha=
t splits it up nicely, along with the changes you suggested, as for the depe=
ndencies,  a review/test of such a patch series would be greatly appreciated=
 because I'm sure like you say there might be redundancies/improvements to b=
e made that I didn't catch with my own testing.<br></div><div>This might tak=
e some time as I'm everything but a git expert so please bear with me as I t=
ry to get this into a nice patch series :)<br></div><div>Thank you both for t=
he feedback.<br></div></div></div></blockquote><div><br></div><div>Please do=
n=E2=80=99t top post and answer inline.</div><div><br></div><div>Thank you!<=
/div><div>Best regards</div><div>=E2=80=94</div><div>Giulio Benetti</div><di=
v>CEO/CTO@Benetti Engineering sas</div><br><blockquote type=3D"cite"><div di=
r=3D"ltr"><div dir=3D"ltr"><div><br></div><div>Best regards,</div><div>Jesse=
<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Op do 25 aug. 2022 om 10:43 schreef Thomas Petazzoni=
 &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootli=
n.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hel=
lo Jesse,<br>
<br>
On Thu, 25 Aug 2022 09:39:51 +0200<br>
Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" target=3D"_blank"=
>jesseevg@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This will bring the qt6base functionality mostly on par with the qt5bas=
e<br>
&gt; package, building the package has been tested to the best of my ability=
<br>
&gt; and went without error as far as I can test.<br>
&gt; One bug to be noted is that for the GUI with fontconfig without harfbuz=
z<br>
&gt; support, this will produce incorrectly rendered text for version 6.3.1,=
<br>
&gt; see <a href=3D"https://bugreports.qt.io/browse/QTBUG-101430" rel=3D"nor=
eferrer" target=3D"_blank">https://bugreports.qt.io/browse/QTBUG-101430</a><=
br>
&gt; I have however already verified that 6.3.2 and 6.4.0 will fix this issu=
e<br>
&gt; so I've decided not to add harfbuzz as a fontconfig dependency as a<br>=

&gt; version bump (which should be soon) will fix it.<br>
<br>
Yes, let's bump to 6.4.0 then.<br>
<br>
&gt; Also add the version hashes for qt6base.<br>
&gt; <br>
&gt; Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.co=
m" target=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
<br>
Overall, this needs to be split into a number of patches:<br>
<br>
&nbsp;- One adding the hash file, with just the hash of the tarball<br>
<br>
&nbsp;- One adding the license information (which is totally missing today,<=
br>
&nbsp; &nbsp;and I noticed due to your addition of the hash file) together w=
ith<br>
&nbsp; &nbsp;the hashes of the license files<br>
<br>
&nbsp;- Several patches adding the different options. I'm not too keen on<br=
>
&nbsp; &nbsp;copy/pasting directly the qt5 logic, as I'm not sure all the<br=
>
&nbsp; &nbsp;dependencies are exactly the same, so let's do this one feature=
 at a<br>
&nbsp; &nbsp;time.<br>
<br>
<br>
&gt; +ifeq ($(BR2_ENABLE_DEBUG),y)<br>
&gt; +QT6BASE_CONF_OPTS +=3D -DCMAKE_BUILD_TYPE=3DDebug<br>
&gt; +else<br>
&gt; +QT6BASE_CONF_OPTS +=3D -DCMAKE_BUILD_TYPE=3DRelease<br>
&gt; +endif<br>
<br>
This is already handled by the cmake-package infrastructure, do no need<br>
to handle CMAKE_BUILD_TYPE.<br>
<br>
&gt; +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)<br>
&gt; +# Qt 5.8 needs atomics, which on various architectures are in -latomic=
<br>
&gt; +QT6BASE_CONF_OPTS +=3D -DCMAKE_SHARED_LINKER_FLAGS=3D"-latomic"<br>
<br>
Is this also needed with Qt6 ? (Most likely yes, but the comment is<br>
weird, another reason why I don't like the copy/pasting from Qt5).<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:/=
/bootlin.com</a><br>
</blockquote></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></body></html>=

--Apple-Mail-C460BE54-569B-4354-8675-70D60519F37C--

--===============6383218468697456024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6383218468697456024==--
