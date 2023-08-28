Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C37C71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 11:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B32340201;
	Mon, 28 Aug 2023 11:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B32340201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0CIhvjmDgCb; Mon, 28 Aug 2023 11:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222C340235;
	Mon, 28 Aug 2023 11:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 222C340235
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 346D61BF410
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 11:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AAF360E7A
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 11:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAF360E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5SN927ou2Ai for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 11:48:12 +0000 (UTC)
X-Greylist: delayed 561 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 28 Aug 2023 11:48:11 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9B8760AB9
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9B8760AB9
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 11:48:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 100A01814B9; Mon, 28 Aug 2023 13:38:46 +0200 (CEST)
Message-Id: <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Date: Mon, 28 Aug 2023 13:38:36 +0200
In-Reply-To: <877cpf7lln.fsf@48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>,
 Robert Smigielski <ptdropper@gmail.com>
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk>
X-Last-TLS-Session-Version: TLSv1.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1693222727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=106wEKDDeClVTXy5IVjs5vHjCB03LhTT/yhcd9Adxq4=;
 b=qIHewb2LONCDmSXHv1I0JtTAxdBrxGF2SZqNaHOTdubpVdcf9ts9DxLITSyFAg/l2gyzAy
 2jmgQHU5IPla0WUzT11jG740JHq43H0LrZ4jZnXyYWoKtQ18KsweqExhZS6lCtCh0pqIUY
 peEIVVd4W7Ew1TkewaUIH/oH11CCW7k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=qIHewb2L
Subject: Re: [Buildroot] CycloneDX SBOM support
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8327167146527274484=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8327167146527274484==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_683C7558-7FB4-4667-B3C9-9E321135BBB1"


--Apple-Mail=_683C7558-7FB4-4667-B3C9-9E321135BBB1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

> On 28. Aug 2023, at 08:00, Peter Korsgaard <peter@korsgaard.com> =
wrote:
>=20
>>>>>> "Robert" =3D=3D Robert Smigielski <ptdropper@gmail.com> writes:
>=20
> Hi,
>=20
>> Announcing CycloneDX support for the embedded / IOT / MIOT world. =
Using
>> your Buildroot output, my project produces CycloneDX SBOM files for =
supply
>> chain management and vulnerability management. I am a long time =
Buildroot
>> user now in the device security space. Glad to provide CycloneDX SBOM
>> support for Buildroot users.
>=20
>> https://github.com/CycloneDX/cyclonedx-buildroot
>=20
>> https://pypi.org/project/CycloneDX-Buildroot/

I=E2=80=99m just returning from vacation so it will take some days but I =
will happily try this out.
I recently built my own show-info to cyclone-dx python script but from =
skimming through
your package this looks way better than mine.

So without further checking already: thanks for taking on this task!

>=20
> Thanks! I think I have seen it earlier, where I noticed that it only
> worked on the legal-info manifest - But we have quite a bit more
> SBOM-related info in Buildroot nowadays visible in show-info. I see =
that
> you are now also using this info for the CPE data, so that is good.
>=20
> So what is the status of this project? Anything missing? Anything you
> are missing from Buildroot? What (open source) tools can consume the
> generated SBOMs and do something interesting with it?

There are multiple tools which can work with the cyclone-dx format and =
from what
I=E2=80=99m reading this might become the =E2=80=9Cde-facto SBOM =
standard=E2=80=9D.

What we are currently evaluating is Dependency Track =
(https://dependencytrack.org/).
It=E2=80=99s not perfect but it checks your SBOM frequently for new =
Issues and generates
management friendly Dashboard Views. In the end this is pretty new for =
most of us I guess.

Regards,
Michael



--Apple-Mail=_683C7558-7FB4-4667-B3C9-9E321135BBB1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;">Hi,<br><div><br><blockquote type=3D"cite"><div>On =
28. Aug 2023, at 08:00, Peter Korsgaard &lt;peter@korsgaard.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><div><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">"Robert"=
 =3D=3D Robert Smigielski &lt;ptdropper@gmail.com&gt; =
writes:<br></blockquote></blockquote></blockquote></blockquote></blockquot=
e><br>Hi,<br><br><blockquote type=3D"cite">Announcing CycloneDX support =
for the embedded / IOT / MIOT world. Using<br>your Buildroot output, my =
project produces CycloneDX SBOM files for supply<br>chain management and =
vulnerability management. I am a long time Buildroot<br>user now in the =
device security space. Glad to provide CycloneDX SBOM<br>support for =
Buildroot users.<br></blockquote><br><blockquote =
type=3D"cite">https://github.com/CycloneDX/cyclonedx-buildroot<br></blockq=
uote><br><blockquote =
type=3D"cite">https://pypi.org/project/CycloneDX-Buildroot/<br></blockquot=
e></div></div></blockquote><div><br></div>I=E2=80=99m just returning =
from vacation so it will take some days but I will happily try this =
out.</div><div>I recently built my own show-info to cyclone-dx python =
script but from skimming through</div><div>your package this looks way =
better than mine.</div><div><br></div><div>So without further checking =
already: thanks for taking on this task!</div><div><br><blockquote =
type=3D"cite"><div><div><br>Thanks! I think I have seen it earlier, =
where I noticed that it only<br>worked on the legal-info manifest - But =
we have quite a bit more<br>SBOM-related info in Buildroot nowadays =
visible in show-info. I see that<br>you are now also using this info for =
the CPE data, so that is good.<br><br>So what is the status of this =
project? Anything missing? Anything you<br>are missing from Buildroot? =
What (open source) tools can consume the<br>generated SBOMs and do =
something interesting with =
it?<br></div></div></blockquote><div><br></div><div>There are multiple =
tools which can work with the cyclone-dx format and from =
what</div><div>I=E2=80=99m reading this might become the =E2=80=9Cde-facto=
 SBOM standard=E2=80=9D.</div><div><br></div><div>What we are currently =
evaluating is Dependency Track (<a =
href=3D"https://dependencytrack.org/">https://dependencytrack.org/</a>).</=
div><div>It=E2=80=99s not perfect but it checks your SBOM frequently for =
new Issues and generates</div><div>management friendly Dashboard Views. =
In the end this is pretty new for most of us I =
guess.</div><div><br></div><div>Regards,</div><div>Michael</div><br></div>=
<br></body></html>=

--Apple-Mail=_683C7558-7FB4-4667-B3C9-9E321135BBB1--

--===============8327167146527274484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8327167146527274484==--
