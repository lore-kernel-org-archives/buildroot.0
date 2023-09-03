Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217B1C83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 11:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1F7B405AA;
	Sun,  3 Sep 2023 11:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1F7B405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WyOxc-axRsUe; Sun,  3 Sep 2023 11:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19DCE40480;
	Sun,  3 Sep 2023 11:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19DCE40480
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4FCE1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 11:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E13460B38
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 11:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E13460B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r9H7JKidBsae for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 11:19:34 +0000 (UTC)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AFDA60AC4
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 11:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AFDA60AC4
Received: from smtpclient.apple ([146.241.105.17])
 by Aruba Outgoing Smtp  with ESMTPA
 id cl8dqTznJOrskcl8eqx82s; Sun, 03 Sep 2023 13:19:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 3 Sep 2023 13:19:31 +0200
Message-Id: <0E2D7C40-E9AC-4CF1-BAE2-870BF9F6D34C@benettiengineering.com>
References: <CAPmASeuMe9vstCO+_xjEW1co0Hm-hA6b2+kr4Phjo6myAGtscQ@mail.gmail.com>
In-Reply-To: <CAPmASeuMe9vstCO+_xjEW1co0Hm-hA6b2+kr4Phjo6myAGtscQ@mail.gmail.com>
To: Andrea Simeoni <andreasimeoni73@gmail.com>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfL3GPUpUlHXNennTFOziw8+VK5q1C6v+q4Tr/9UTHvRbG2nsV2PKzsjVsZVXZVSHxCydaRwpA+INSxHPfJmu098ZjdB6Lcmahb5kPmC1uEIuQZwg3jJo
 TSBxcfoKjbG1d9d0p8zLTKfv/my0tZhmyOkpFvU4iOqa3AEx/9I3AyA9OacWhBwYQ+6V+QxRYRkOW+rNQ4U0EUOGKtwtfILsZGdkiJcNV4hwXdKttEQDeHwp
 ZvIXp8/T6nVEYf+cq9gfc8L/ss1wjzQUcK8+xMj7AAg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1693739972; bh=bAk5YvQ0eBseP4eimH4qwmr07z4gz6Ji5QPjgdUtFyg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=V+VB6wC9RKl9Uk6zSqewHeqZq7V+Hn2Lnno7RqcTobrCn1HCiBXV/FUsPUFqx885w
 l+mPEYgL2/igLi2nIxBHp/pYu53TLMRByoOnooui2LwyGZPcma4EI/vQpzOBYcMgX9
 fJfzT4gZCCfx4Llvus84PGKtu4WswxByey1HVw064CHznrrU2qs0T4thMVLPs7l1xm
 SGmz3iokvxNOq2uVmN0Ynf6YARGglnTNsdMwzcwPp56BpKQid8Bc25bvRo0++jjaNl
 LVTEphWZKh234ZRylF0OaFMaurabv+BnINqWY37MBnG29fW7M4qADLcdjKpQSNcbuH
 Q6tyFD7POPolg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=V+VB6wC9
Subject: Re: [Buildroot] stat command missing
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6131246271378676987=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6131246271378676987==
Content-Type: multipart/alternative; boundary=Apple-Mail-EE2DD792-5836-4130-B13A-B9C3EB9E4447
Content-Transfer-Encoding: 7bit


--Apple-Mail-EE2DD792-5836-4130-B13A-B9C3EB9E4447
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

readding Buildroot ML in Cc,

> Il giorno 3 set 2023, alle ore 12:26, Andrea Simeoni <andreasimeoni73@gmai=
l.com> ha scritto:
>=20
> =EF=BB=BF
>> Here ^^^ you have to point to a file(or more) containing CONFIG_STAT=3Dy
>> That=E2=80=99s why it doesn=E2=80=99t work.
>> Give a try with that so you create something reproducible.
> =20
>=20
> Ah, I didn't get it.
> Just tried and it worked!

Perfect

Best regards
Giulio=

--Apple-Mail-EE2DD792-5836-4130-B13A-B9C3EB9E4447
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Andrea,<br><div dir=3D"ltr"><br></div><d=
iv dir=3D"ltr">readding Buildroot ML in Cc,</div><div dir=3D"ltr"><br><block=
quote type=3D"cite">Il giorno 3 set 2023, alle ore 12:26, Andrea Simeoni &lt=
;andreasimeoni73@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockq=
uote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"au=
to"><div>Here ^^^ you have to point to a file(or more) containing CONFIG_STA=
T=3Dy</div><div>That=E2=80=99s why it doesn=E2=80=99t work.</div><div>Give a=
 try with that so you create something reproducible.</div></div></blockquote=
><div>&nbsp;</div><div><br></div><div>Ah, I didn't get it.</div><div>Just tr=
ied and it worked!</div></div></div>
</div></blockquote><div><br></div><div>Perfect</div><div><br></div>Best rega=
rds<br><div>Giulio</div></body></html>=

--Apple-Mail-EE2DD792-5836-4130-B13A-B9C3EB9E4447--

--===============6131246271378676987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6131246271378676987==--
