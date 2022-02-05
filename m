Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67A5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266EB81489;
	Sat,  5 Feb 2022 23:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6oqCIbhQ5FD; Sat,  5 Feb 2022 23:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0BFA81491;
	Sat,  5 Feb 2022 23:28:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 647141BF863
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F5381491
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRlt_SCNuDSl for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:28:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A0681489
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:28:03 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id GUTKnh6GuDzPJGUTKnGXOC; Sun, 06 Feb 2022 00:28:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644103682; bh=nyfqaGL8dqIrG1o0CM70Y3d7yMLdNkfFz5fnWW9SeUU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=DqurcprmYP35LLoLH+tE1oMQly19qATVZBeL0yLhY/UwI3A7equFFkmybt/UyqNh+
 +tU6t76TxRzfd93jhcfNWtRNMREjAXiAJjMMK9DjpMZOj+ROuviJlrj2aft/VRZWEa
 4hsNcUqgt77irMB12O3WUtANz+ZksYRYvQJuIsUTu+4VqBBJdIMhg+ubTnr5TyR7l7
 +CYakkj4Wl0mK8PjEUQj4TSPbaYGpozbYFNZLyE22YUZVLmLzZEB6PsF+INtqyetty
 A2icHmgqR6kXbt03EsE9Ze8Buvs3ekr2hrxvTx3KQw+RrtDrFpN0GCGybKXxM7WJeI
 JyLlRdXT6uViw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 6 Feb 2022 00:28:01 +0100
Message-Id: <D33D946E-418C-49C0-B1F1-31F60F175490@benettiengineering.com>
References: <54d39db2-d11d-ffc6-1966-c721b26d1a5c@gmail.com>
In-Reply-To: <54d39db2-d11d-ffc6-1966-c721b26d1a5c@gmail.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfBlnRdyAHCZ4IuGXMKWcMWuja4YAMr9oaaizbL7wSAak/8Mj/5yiHbgcgij8PEcwwG/I3fvDmgUxJ757IKd8C9MejPudvfgyfoqlJ6qhz47LVcE28XV8
 lSbJRFsqTkpnQJ4GBjMOZSL4+dn7l0HH8KNZVz+ozx8vOblWd9+a//qD7vZelytgL+vmMF+LBf1SMBw1Rr7t6ROvdf5n1SkujD3UTtsl+yC56Lhj9GqLJSjJ
 OQd7O4PbBDBl8kC7AO68gw==
Subject: Re: [Buildroot] [PATCH v2] configs/orangepi_zero_defconfig: switch
 to extlinux
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
Content-Type: multipart/mixed; boundary="===============0578567281946342245=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0578567281946342245==
Content-Type: multipart/alternative; boundary=Apple-Mail-292BC296-AC25-4F57-AD2B-7798E99F4821
Content-Transfer-Encoding: 7bit


--Apple-Mail-292BC296-AC25-4F57-AD2B-7798E99F4821
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

> Il giorno 6 feb 2022, alle ore 00:17, Sergey Kuzminov <kuzminov.sergey81@g=
mail.com> ha scritto:
>=20
> =EF=BB=BF06.02.2022 02:13, Giulio Benetti =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi Sergey,
>>> On 06/02/22 00:04, Sergey Kuzminov wrote:
>>> Hi Giulio,
>>>=20
>>> 06.02.2022 01:18, Giulio Benetti:
>>>> Hi Sergey,
>>>>=20
>>>> below I give you a better example of commit log,
>>>> and the dealing with V1->V2 series.
>>>>=20
>>>>> Il giorno 5 feb 2022, alle ore 22:56, Sergey Kuzminov <kuzminov.sergey=
81@gmail.com> ha scritto:
>>>>>=20
>>>>> =EF=BB=BFChanges:
>>>>> v1:
>>>>=20
>>>> Please Remove this line ^^^
>>>>=20
>>>>> - Exclude FAT partition, it is no longer needed for U-Boot.
>>>>> - Switch the rootfs partition from MBR to GPT for partition-uuid to wo=
rk.
>>>>> - Switch to extlinux, this is convenient for debugging.
>>>>> - Create common scenarios for multiple boards to create an SD image: b=
oard/orangepi/common.
>>>>>=20
>>>>> v2:
>>>> Remove this ^^^ line
>>>>> - Fix typo in first line of changes (s/he/it).
>>>> This too ^^^
>>>>> - Add BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=3Dy.
>>>> Here we need an explanation of the reason why, what this implies.
>>>>> - Exclude one boot option from extlinux.conf.
>>>> This ^^^ too
>>>>>=20
>>>>> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
>>>> =E2=80=94-
>>>> V1->V2:
>>>> * improved commit log
>>>> * removed commented line in extlinux.conf
>>>> * removed one boot option from extlinux.conf
>>>>> ---
>>>>=20
>>>> So as you can see, commit log doesn=E2=80=99t mention the patch version=
, while after the 3 dashes you
>>>> can write in general whatever you want because it won=E2=80=99t be part=
 of commit log and it=E2=80=99s usually used
>>>> to report V1->V2 version etc.
>>>=20
>>> Changes:
>>> * Exclude FAT partition, it is no longer needed for U-Boot.
>>> * Switch the rootfs partition from MBR to GPT for partition-uuid to work=
.
>>> * Switch to extlinux, this is convenient for debugging.
>>> * Create common scenarios for multiple boards to create an SD image:
>>> board/orangepi/common.
>>> * Add BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=3Dy, remount root filesystem
>>> read-write during boot.
>>>=20
>>> ---
>>> V1->V2:
>>> * improved commit log
>>> * removed commented line in extlinux.conf
>>> * removed one boot option from extlinux.conf
>>>=20
>>> V2->V3:
>>> * improved commit log
>>>=20
>>> That's right?
>> Yes, this works for me now
>>>=20
>>>>> +++ b/board/orangepi/common/genimage.cfg
>>>>> @@ -0,0 +1,23 @@
>>>>> +image sdcard.img {
>>>>> +    partition u-boot {
>>>>> +        in-partition-table =3D false
>>>>> +        image =3D "u-boot-sunxi-with-spl.bin"
>>>>> +        offset =3D 8K
>>>>> +        size =3D 1000K # 1MB - 8KB(offset) - 16KB(GPT)
>>>>> +    }
>>>>> +
>>>>> +    hdimage {
>>>>> +        partition-table-type =3D gpt
>>>>> +        gpt-location =3D 1008K # 1MB - 16KB(GPT)
>>>>> +        gpt-no-backup =3D true
>>>>> +        # After writing the image to the SD card,
>>>>> +        # backup GPT data structures at the end of the disk:
>>>>> +        # gdisk /dev/mmcblk0 then press the buttons: x, e, w, y
>>>>=20
>>>> Why don=E2=80=99t you make this part ^^^ automatic with a script or you=
 simply use genimage itself?
>>>>=20
>>>> What it=E2=80=99s expected as board defconfig is something that you bur=
n a sdcard with the sdcard.img file and that=E2=80=99s it. So here you need t=
o make it automatic.
>>>>=20
>>>> So we wait for V3 with the commit log form you read above and requested=
 changes.
>>>=20
>>> The problem is that it is not possible to create an sdcard.img image
>>> with the correct GPT structure. The second copy of the GPT must be at
>>> the end of the disk, and the size of sdcard.img will not match the SD
>>> card. Will work and so, with one copy of GPT. But the disk utilities may=

>>> issue a warning about the absence of a second copy of the GPT. You can
>>> correct the situation only after writing sdcard.img to the SD card, or
>>> during the first loading of the board in a separate script. This is out
>>> of scope for this patch.
>> Ok, so please remove those 3 commented lines since I think the board actu=
ally works without those additional commands, correct?
>=20
> Yes.

Perfect, so you can send the V3 patch.
Please remember to keep my Reviewed-by and Tested-by after your SoB that I=E2=
=80=99ve given you on V1 patch.

You can follow patchwork here:
https://patchwork.ozlabs.org/project/buildroot/list/

You should also subscribe to patchwork and mark your V1 and V2 patches as su=
perseded.

Thank you
Giulio

>=20
>> Otherwise, it this doesn't work on target without gdisk commands, you nee=
d to add a post-image.sh script to launch those commands.
>> Thank you!
>> Best regards
>=20

--Apple-Mail-292BC296-AC25-4F57-AD2B-7798E99F4821
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Sergey,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 6 feb 2022, alle ore 00:17, Sergey Kuzminov &lt;=
kuzminov.sergey81@gmail.com&gt; ha scritto:<br><br></blockquote></div><block=
quote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>06.02.2022 02:13, Giulio=
 Benetti =D0=BF=D0=B8=D1=88=D0=B5=D1=82:</span><br><blockquote type=3D"cite"=
><span>Hi Sergey,</span><br></blockquote><blockquote type=3D"cite"><span>On 0=
6/02/22 00:04, Sergey Kuzminov wrote:</span><br></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>Hi Giulio,</span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>06.02.2022 01:18, Giulio Benetti:</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>Hi Sergey,</span><br></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>below I give y=
ou a better example of commit log,</span><br></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>and the dealing with V1-&gt;V2 series.</span><br></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>Il giorno 5 feb 2022, alle ore 2=
2:56, Sergey Kuzminov &lt;kuzminov.sergey81@gmail.com&gt; ha scritto:</span>=
<br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>=EF=BB=BFChanges:</span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>v1:</=
span><br></blockquote></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span>=
<br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>Please Remove this line ^=
^^</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- Exclud=
e FAT partition, it is no longer needed for U-Boot.</span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>- Swi=
tch the rootfs partition from MBR to GPT for partition-uuid to work.</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>- Switch to extlinux, this is convenient for debugging.</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>- Create common scenarios for multiple boards to create an SD i=
mage: board/orangepi/common.</span><br></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>v2:</s=
pan><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Remove t=
his ^^^ line</span><br></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>- Fix typo in first line of changes (s/he/it).</span><br>=
</blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>This too ^^^</sp=
an><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>- Add BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=3Dy.</span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>Here we need an explanation of t=
he reason why, what this implies.</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>- Exclude one boot option from extlin=
ux.conf.</span><br></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>This ^^^ too</span><br></blockquote></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>Signed-off-by: Sergey Kuzminov &=
lt;kuzminov.sergey81@gmail.com&gt;</span><br></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>=E2=80=94-</span><br></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>V1-&gt;V2:</span><br></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>* improved commit log</span><br></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>* removed commented line in extlinux.conf</span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>* removed one boot option from extlin=
ux.conf</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>---</span><br></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><span></span><br></blockquote></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>So as y=
ou can see, commit log doesn=E2=80=99t mention the patch version, while afte=
r the 3 dashes you</span><br></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
can write in general whatever you want because it won=E2=80=99t be part of c=
ommit log and it=E2=80=99s usually used</span><br></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>to report V1-&gt;V2 version etc.</span><br></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>Changes:</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>* Exclude FAT partiti=
on, it is no longer needed for U-Boot.</span><br></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>* Switch the rootfs=
 partition from MBR to GPT for partition-uuid to work.</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* S=
witch to extlinux, this is convenient for debugging.</span><br></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* Cre=
ate common scenarios for multiple boards to create an SD image:</span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>board/orangepi/common.</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>* Add BR2_TARGET_GENERIC_REMO=
UNT_ROOTFS_RW=3Dy, remount root filesystem</span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span>read-write duri=
ng boot.</span><br></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>---</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>V1-&gt;V2=
:</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>* improved commit log</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>* removed comment=
ed line in extlinux.conf</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>* removed one boot option from ex=
tlinux.conf</span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>V2-&gt;V3:</span><br></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>* improved commit log</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><span>That's right?</=
span><br></blockquote></blockquote><blockquote type=3D"cite"><span>Yes, this=
 works for me now</span><br></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>+++ b/board/orangepi/common/genimage.cfg</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>@@ -0,0 +1,23 @@</span><br></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+image sdcard.img {</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>+&nbsp;&nbsp;&nbsp; partition u-boot {</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in-partition-table =3D false</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image =3D "u-boot-sunxi-with-=
spl.bin"</span><br></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; off=
set =3D 8K</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
ize =3D 1000K # 1MB - 8KB(offset) - 16KB(GPT)</span><br></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbs=
p;&nbsp; }</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>+</span><br></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp; hdi=
mage {</span><br></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parti=
tion-table-type =3D gpt</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gpt-location =3D 1008K # 1MB - 16KB(GPT)</span><br></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpt-no-backup =3D true</span><br></=
blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # After writing the imag=
e to the SD card,</span><br></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; # backup GPT data structures at the end of the disk:</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # gdisk /dev/mmcblk0 then pre=
ss the buttons: x, e, w, y</span><br></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span></span><br></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>Why don=E2=80=99t you make this part ^^^ automatic with a script or you s=
imply use genimage itself?</span><br></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span></span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>What it=E2=80=
=99s expected as board defconfig is something that you burn a sdcard with th=
e sdcard.img file and that=E2=80=99s it. So here you need to make it automat=
ic.</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>So we wait for V3 with the commit=
 log form you read above and requested changes.</span><br></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>The problem is that it is not possible to create an sd=
card.img image</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>with the correct GPT structure. The second c=
opy of the GPT must be at</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>the end of the disk, and the siz=
e of sdcard.img will not match the SD</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>card. Will work and s=
o, with one copy of GPT. But the disk utilities may</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>issue a=
 warning about the absence of a second copy of the GPT. You can</span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>correct the situation only after writing sdcard.img to the SD card, or=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>during the first loading of the board in a separate scrip=
t. This is out</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>of scope for this patch.</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><span>Ok, so please remove those=
 3 commented lines since I think the board actually works without those addi=
tional commands, correct?</span><br></blockquote><span></span><br><span>Yes.=
</span><br></div></blockquote><div><br></div><div>Perfect, so you can send t=
he V3 patch.</div><div>Please remember to keep my Reviewed-by and Tested-by a=
fter your SoB that I=E2=80=99ve given you on V1 patch.</div><div><br></div><=
div>You can follow patchwork here:</div><div><a href=3D"https://patchwork.oz=
labs.org/project/buildroot/list/">https://patchwork.ozlabs.org/project/build=
root/list/</a></div><div><br></div><div>You should also subscribe to patchwo=
rk and mark your V1 and V2 patches as superseded.</div><div><br></div><div>T=
hank you</div><div>Giulio</div><br><blockquote type=3D"cite"><div dir=3D"ltr=
"><span></span><br><blockquote type=3D"cite"><span>Otherwise, it this doesn'=
t work on target without gdisk commands, you need to add a post-image.sh scr=
ipt to launch those commands.</span><br></blockquote><blockquote type=3D"cit=
e"><span>Thank you!</span><br></blockquote><blockquote type=3D"cite"><span>B=
est regards</span><br></blockquote><span></span><br></div></blockquote></bod=
y></html>=

--Apple-Mail-292BC296-AC25-4F57-AD2B-7798E99F4821--

--===============0578567281946342245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0578567281946342245==--
