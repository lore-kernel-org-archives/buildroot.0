Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 12:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A7B3404F5;
	Tue,  8 Feb 2022 12:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVLwmpXKjitT; Tue,  8 Feb 2022 12:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292AA40435;
	Tue,  8 Feb 2022 12:02:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2725A1BF31D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 12:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 137A740435
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 12:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92WWmD4trWSh for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 12:02:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2142B4010C
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 12:02:42 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id HPCin0zoqX0z7HPCjnf34h; Tue, 08 Feb 2022 13:02:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644321761; bh=TXJTfsxk0TEkkOuf2E8XgtfZ9AcabxQqNO7mexv7Gus=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=icnS1LA4YqZdTzfvS5QCiJNGpk5GAEjygek+SDM9ZXrcRsplfU1SjhQzd1aVtykWM
 cuB4y7R2afn3luttI7S5ObKjfi+VbPGt0dY8royLUGNThZSGQy2LDnF+s1L7fym6OX
 Ihg8VJ3mmT35iv/XuN5907PYWk8gnRxi2UTg54aeJexppxViym2J5VM56t8gZahtGd
 +sly5au21CQiqO8AJgaqOkAMXOQiR6zgQjt80MWimB/5UhZqUqQKEj3ERUMSWuPIvL
 kluSlmUiz4u4kisoUWEasM5Zv5SXuGt4ojODuFsRipptDceZW0xYVDfyMl1upomIo1
 P4VVNpW6y4fRQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 8 Feb 2022 13:02:40 +0100
Message-Id: <0B93B49F-FD97-4CFE-9B13-DC866D12C7E1@benettiengineering.com>
References: <ec93ac94-a7ae-3448-800b-88de7615e675@benettiengineering.com>
In-Reply-To: <ec93ac94-a7ae-3448-800b-88de7615e675@benettiengineering.com>
To: Pedro Aguilar <paguilar@paguilar.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfCSfM+VVdoWgRnuxZe4tpdGnFH9a6IDjcUxQtE6jTobaOwXlOMHgZplqhGunmEis5Uc+fqMi1rrtIOTCORfyJPnxpNMmyB9z/uXkkJheGM0m5bhHC8tZ
 LwkJOVgiWsDAaavVcYH3QvwWWB2x1dSBK5o9v0EuX23o5HMtyDSVmydNm38ZQsp9tf72/MZTI+mPFLLgtefOF5Tu7H8ly8Ga8JYmIkLBFTK/dCh7HxiEwY8z
 BszKCqPVU2f6kADlRttRMu0dHx033QKcEPmFBIZpZmsi7gI7h6N/xZ7XZbf1CnZN
Subject: Re: [Buildroot] [PATCH v1 1/1] package/guile: Guile 3.0.7 requires
 libiconv.
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
Content-Type: multipart/mixed; boundary="===============2540889028920958323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2540889028920958323==
Content-Type: multipart/alternative; boundary=Apple-Mail-3AA294D6-D41F-47A1-B34F-5D68E4605214
Content-Transfer-Encoding: 7bit


--Apple-Mail-3AA294D6-D41F-47A1-B34F-5D68E4605214
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Il giorno 8 feb 2022, alle ore 12:47, Giulio Benetti <giulio.benetti@benet=
tiengineering.com> ha scritto:
>=20
> =EF=BB=BFHi Pedro, Thomas,
>=20
> please don't top-post, answer in-line.
>=20
>> On 08/02/22 10:19, Pedro Aguilar wrote:
>> Hi Thomas,
>> I added libiconv based on the error I got while building. The attchmnt ha=
s the output error and the config file I used.
>=20
> Please send your changes as patches, or otherwise paste here the last line=
s of logs or in the case log is very long use pastebin and point the URL her=
e. So please don't attach anything.
>=20
>> However, I was not aware of BR2_ENABLE_LOCALE, so I selected it and remov=
ed libiconv and it also built correctly. The other config file shows this co=
nfiguration.
>> May be a correct solution could be to add the dependency on BR2_ENABLE_LO=
CALE. But if it's not present, enable libiconv.
>=20
> I think this is a good example of what you're trying to do:
> https://git.buildroot.net/buildroot/tree/package/libcdio/Config.in#n4

And you also need this:
https://git.buildroot.net/buildroot/tree/package/libcdio/libcdio.mk#n16

Best regards
Giulio

>=20
> Best regards
> --=20
> Giulio Benetti
> Benetti Engineering sas
>=20
>> Thanks.
>> Regards,
>>>> On 06/02/2022 10:30 Thomas Petazzoni <thomas.petazzoni@bootlin.com> wro=
te:
>>>=20
>>>  On Sun,  6 Feb 2022 09:43:34 +0100
>>> Pedro Aguilar <paguilar@paguilar.org> wrote:
>>>=20
>>>> This fixes the error reported in the daily results.
>>>>=20
>>>> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
>>>=20
>>> libiconv is normally needed only on toolchains that don't have
>>> BR2_ENABLE_LOCALE. But the build failure of guile happens with glibc
>>> toolchains, so it doesn't make much sense.
>>>=20
>>> Are you sure that your analysis of the problem is correct? Could you
>>> provide some more details?
>>>=20
>>> Thanks a lot!
>>>=20
>>> Thomas
>>> --=20
>>> Thomas Petazzoni, co-owner and CEO, Bootlin
>>> Embedded Linux and Kernel engineering and training
>>> https://bootlin.com
>> Pedro Aguilar
>> https://paguilar.org
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-3AA294D6-D41F-47A1-B34F-5D68E4605214
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">Il giorno 8 feb 2022, alle ore 12:47, Giulio Benetti &lt;giulio.benetti@=
benettiengineering.com&gt; ha scritto:<br><br></blockquote></div><blockquote=
 type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi Pedro, Thomas,</span><br><=
span></span><br><span>please don't top-post, answer in-line.</span><br><span=
></span><br><span>On 08/02/22 10:19, Pedro Aguilar wrote:</span><br><blockqu=
ote type=3D"cite"><span>Hi Thomas,</span><br></blockquote><blockquote type=3D=
"cite"><span>I added libiconv based on the error I got while building. The a=
ttchmnt has the output error and the config file I used.</span><br></blockqu=
ote><span></span><br><span>Please send your changes as patches, or otherwise=
 paste here the last lines of logs or in the case log is very long use paste=
bin and point the URL here. So please don't attach anything.</span><br><span=
></span><br><blockquote type=3D"cite"><span>However, I was not aware of BR2_=
ENABLE_LOCALE, so I selected it and removed libiconv and it also built corre=
ctly. The other config file shows this configuration.</span><br></blockquote=
><blockquote type=3D"cite"><span>May be a correct solution could be to add t=
he dependency on BR2_ENABLE_LOCALE. But if it's not present, enable libiconv=
.</span><br></blockquote><span></span><br><span>I think this is a good examp=
le of what you're trying to do:</span><br><span>https://git.buildroot.net/bu=
ildroot/tree/package/libcdio/Config.in#n4</span><br></div></blockquote><div>=
<br></div><div>And you also need this:</div><div><a href=3D"https://git.buil=
droot.net/buildroot/tree/package/libcdio/libcdio.mk#n16">https://git.buildro=
ot.net/buildroot/tree/package/libcdio/libcdio.mk#n16</a></div><div><br></div=
><div>Best regards</div><div>Giulio</div><br><blockquote type=3D"cite"><div d=
ir=3D"ltr"><span></span><br><span>Best regards</span><br><span>-- </span><br=
><span>Giulio Benetti</span><br><span>Benetti Engineering sas</span><br><spa=
n></span><br><blockquote type=3D"cite"><span>Thanks.</span><br></blockquote>=
<blockquote type=3D"cite"><span>Regards,</span><br></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>On 06/02/2022 10:30 Thomas Peta=
zzoni &lt;thomas.petazzoni@bootlin.com&gt; wrote:</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><=
br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span> &nbsp;On Sun, &nbsp;6 Feb 2022 09:43:34 +0100</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
Pedro Aguilar &lt;paguilar@paguilar.org&gt; wrote:</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>This fixes the error reported in the d=
aily results.</span><br></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>Signed-off-by: Pedro Ag=
uilar &lt;paguilar@paguilar.org&gt;</span><br></blockquote></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>libiconv is normally needed only on toolchains that don't have</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>BR2_ENABLE_LOCALE. But the build failure of guile happens with g=
libc</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>toolchains, so it doesn't make much sense.</span><br>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>Are you sure that your analysis of the problem is=
 correct? Could you</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>provide some more details?</span><br><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>Thanks a lot!</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span=
>Thomas</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>-- </span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><span>Thomas Petazzoni, co-owner a=
nd CEO, Bootlin</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>Embedded Linux and Kernel engineering and t=
raining</span><br></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>https://bootlin.com</span><br></blockquote></block=
quote><blockquote type=3D"cite"><span>Pedro Aguilar</span><br></blockquote><=
blockquote type=3D"cite"><span>https://paguilar.org</span><br></blockquote><=
blockquote type=3D"cite"><span>_____________________________________________=
__</span><br></blockquote><blockquote type=3D"cite"><span>buildroot mailing l=
ist</span><br></blockquote><blockquote type=3D"cite"><span>buildroot@buildro=
ot.org</span><br></blockquote><blockquote type=3D"cite"><span>https://lists.=
buildroot.org/mailman/listinfo/buildroot</span><br></blockquote><span></span=
><br><span>_______________________________________________</span><br><span>b=
uildroot mailing list</span><br><span>buildroot@buildroot.org</span><br><spa=
n>https://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></b=
lockquote></body></html>=

--Apple-Mail-3AA294D6-D41F-47A1-B34F-5D68E4605214--

--===============2540889028920958323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2540889028920958323==--
