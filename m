Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F46DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 20:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9380D82741;
	Tue, 18 Jan 2022 20:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWa2W_A6S2nU; Tue, 18 Jan 2022 20:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6369F8274E;
	Tue, 18 Jan 2022 20:40:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BD6C1BF4E4
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 20:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5861A8274E
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 20:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v2EamzppiO4C for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 20:40:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp1.osuosl.org (Postfix) with ESMTP id F413082741
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 20:40:15 +0000 (UTC)
Received: from smtpclient.apple ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPA
 id 9vH0nNEr4DzPJ9vH3nia2X; Tue, 18 Jan 2022 21:40:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642538414; bh=jdkMgJ2oVeXQ5HYHP6YPu2rjgZHfN5OAV6OVlqdAA8M=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Fjd3YTUjtrdAffCHlFTsRhlOhn162LgLIIlwVSS61ubcrpA64Eve+59OfejR+Obfo
 jj+uw0mWDBQgEN610/uW8GnFoTz1AchLIsOwGw+H8uSCc86xXfYAYt2zO8pdSr/IWD
 Shyv0pgkmUrdiZFgBwsymNwWmFp3FmAwiFCL+VwMHlJkHJoPC0oIjL74iCpXX8R34G
 ajsdSgZ7QMrjFVXLmTALgyvsHbLwY642NgUoKp+sB7ysyvd2IiodcQBWhQGMRBXQYZ
 7P89Q0MYdyW7Lv7iGFkqfbDjJMd9Y6LZ2aCiClO5Tg5tVs9TY5wov1XdUxvsx91ROF
 KexXVgtMrMT7Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 18 Jan 2022 21:40:09 +0100
Message-Id: <966BF669-674E-4A71-82E3-FF7A2B520659@benettiengineering.com>
References: <CAEyMn7aOFtdpXrmU3bLe03jgkmiVLrYCQvePkbLLv_+5ZOiN4Q@mail.gmail.com>
In-Reply-To: <CAEyMn7aOFtdpXrmU3bLe03jgkmiVLrYCQvePkbLLv_+5ZOiN4Q@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfAYkk70osJlsPenOXn3/G8HuTJINI5stb9GE+qYLfXGer4V1lOey13uBv37+Ot+1plI6yKZAYc5JYZWVSy6QmaFgU+ED8K8OR71QieF6jndiLdyIRceU
 6geav2Ccn48Gk33TMrjMusn2+Xn3TdkoTpQUucDPhbNVhjS/Q+TXgQkP+dP+grXx30v2PjGioS3s9OEmbFoNdnC+/bjwlJ/nEJI99tG4IH2RQa8hX4Orr3FD
 iZ3fUY3dadLUkQzkuCcu6EdOHdvCIeOT22kSuy4UXiCfxBiibwBaJCKuD28o/EesIaIfvfhAWq+YbC7k18MAIgekCdhDaFRgN1q3RlmICEnqMxRgAUBP0A2+
 ax6K/E7KeLFOiRQu4bGsnphMGg277n0cBOmENka9gAwCOIZdENg8k5tutjqfoamdMnsqTrDV
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============3309391083709978796=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3309391083709978796==
Content-Type: multipart/alternative; boundary=Apple-Mail-92B01536-ABF1-4A8C-9FE7-D906CEC91B93
Content-Transfer-Encoding: 7bit


--Apple-Mail-92B01536-ABF1-4A8C-9FE7-D906CEC91B93
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Heiko, Thomas,

> Il giorno 18 gen 2022, alle ore 20:58, Heiko Thiery <heiko.thiery@gmail.co=
m> ha scritto:
>=20
> =EF=BB=BFHi Giulio, Hi Thomas,
>=20
>=20
>> Am Di., 18. Jan. 2022 um 07:58 Uhr schrieb Giulio Benetti
>> <giulio.benetti@benettiengineering.com>:
>>=20
>> Hi Thomas,
>>=20
>>> On 18/01/22 00:04, Thomas Petazzoni wrote:
>>> On Mon, 17 Jan 2022 20:58:52 +0100
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>=20
>>>>> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_=
imx8mm_defconfig
>>>>> new file mode 100644
>>>>> index 0000000000..5b5648cc14
>>>>> --- /dev/null
>>>>> +++ b/configs/kontron_bl_imx8mm_defconfig
>>>>> @@ -0,0 +1,59 @@
>>>>> +# Architecture
>>>>> +BR2_aarch64=3Dy
>>>>> +BR2_ARM_FPU_VFPV3=3Dy
>>>>=20
>>>> i.MX8MM supports VFPv4-D16, so I would substitute this ^^^ with:
>>>> BR2_ARM_FPU_VFPV4D16
>>>>=20
>>>> This is to achieve the maximum performance.
>>>=20
>>> Nope, that's not really how it works. VFPv3 is better than VFPv3-D16.
>>> Indeed VFPv3 means that the the FPU has 32 double precision registers,
>>> while VFPv3-D16 means that it has "only" 16 double precision registers.
>>=20
>> I'm a bit confused. The datasheet[1] states at 1.4.1:
>> ```
>> =E2=80=A2 Media Processing Engine (MPE) with NEON technology supporting t=
he
>> Advanced Single Instruction Multiple Data architecture
>> =E2=80=A2 Floating Point Unit (FPU) with support of the VFPv4-D16 archite=
cture
>> ```
>> [1]: https://www.nxp.com/docs/en/data-sheet/IMX8MMCEC.pdf
>>=20
>> So I expect it to only have VFPv4-D16. And also NEON, but we can't mix
>> them up in Aarch64 as I know.
>>=20
>>> So, if the i.MX8MM has only the VFPv3-D16, then indeed it should be
>>> chosen, because code compiled with VFPv3 may not work, as it might use
>>> too many double precision registers.
>>>=20
>>> On the other hand, if the i.MX8MM has the full VFPv3, then
>>> BR2_ARM_FPU_VFPV3=3Dy should be used.
>>=20
>> It only has VFPv4-D16. I think I've explained myself bad. This is not to
>> achieve maximum performance, simply datasheet states it only supports
>> VFPv4-D16[1] and judging from this:
>> https://developer.arm.com/documentation/dui0472/h/CJADDCIF#:~:text=3DVFPv=
3%20has%2032%20double%2Dprecision,VFPv3%20with%20half%2Dprecision%20extensio=
ns.&text=3DVFPv4%20has%2032%20double%2Dprecision,to%20the%20features%20of%20=
VFPv3.
>>=20
>> VFPv4 is retro-compatible with VFPv3, and I'd expect VFP4v4-D16 to be
>> like that too. Is it possible that at the moment, by mistake, it worked
>> without using more than 16 registers as VFPv3 that is retro-compatible
>> with VFPv4-D16(maybe?).
>>=20
>>> That being said, the gcc man page only documents vfpv3, vfpv3-d16-fp16,
>>> vfpv3-fp16 as extension for armv7-a. Interesting, would need to look
>>> into this.
>>=20
>> Yes, but i.MX8MM is a cortex-A53, so armv8-a:
>> https://developer.arm.com/ip-products/processors/cortex-a/cortex-a53
>>=20
>> that then is retro-compatible to armv7-a if in Aarch32.
>> But here we use it as BR2_aarch64, so armv8-a:
>> https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
>>=20
>> and it lists:
>> ```
>> -mfpu=3Dname
>> This specifies what floating-point hardware (or hardware emulation) is
>> available on the target. Permissible names are: =E2=80=98auto=E2=80=99, =E2=
=80=98vfpv2=E2=80=99,
>> =E2=80=98vfpv3=E2=80=99, =E2=80=98vfpv3-fp16=E2=80=99, =E2=80=98vfpv3-d16=
=E2=80=99, =E2=80=98vfpv3-d16-fp16=E2=80=99, =E2=80=98vfpv3xd=E2=80=99,
>> =E2=80=98vfpv3xd-fp16=E2=80=99, =E2=80=98neon-vfpv3=E2=80=99, =E2=80=98ne=
on-fp16=E2=80=99, =E2=80=98vfpv4=E2=80=99, =E2=80=98vfpv4-d16=E2=80=99,
>> =E2=80=98fpv4-sp-d16=E2=80=99, =E2=80=98neon-vfpv4=E2=80=99, =E2=80=98fpv=
5-d16=E2=80=99, =E2=80=98fpv5-sp-d16=E2=80=99, =E2=80=98fp-armv8=E2=80=99,
>> =E2=80=98neon-fp-armv8=E2=80=99 and =E2=80=98crypto-neon-fp-armv8=E2=80=99=
. Note that =E2=80=98neon=E2=80=99 is an alias
>> for =E2=80=98neon-vfpv3=E2=80=99 and =E2=80=98vfp=E2=80=99 is an alias fo=
r =E2=80=98vfpv2=E2=80=99.
>> ```
>>=20
>> So "vfpv4-d16" is possible.
>>=20
>> Here I think we need vfpv4-d16 and not vfpv3 because of both DS and RM
>> of i.MX8MM.
>>=20
>> Does it sound good to you?
>=20
> After following the discussion in IRC between Yann and Michael I am
> sure that this setting cannot be used for the aarch64/cortex-A53 CPU.
> The settings BR2_ARM_CPU_HAS_FPU, BR2_ARM_CPU_HAS_VFPV2,
> BR2_ARM_CPU_HAS_VFPV3, BR2_ARM_CPU_HAS_VFPV4 and
> BR2_ARM_CPU_HAS_FP_ARMV8 are set implicitly.

Yes, I was wrong and you point that fpu strategy falls back to BR2_ARM_FPU_FP=
_ARMV8 and it=E2=80=99s ok.=20
But i.MX8MM supports NEON too, so I would go for setting BR2_ARM_FPU_NEON_FP=
_ARMV8,
because as pointed here[1] the armv8 neon now supports IEEE 754 floating poi=
nt standard.

BUT I=E2=80=99ve found that gcc[2] points that:
=E2=80=98=E2=80=99=E2=80=99

If the selected floating-point hardware includes the NEON extension (e.g. -m=
fpu=3Dneon), note that floating-point operations are not generated by GCC=E2=
=80=99s auto-vectorization pass unless -funsafe-math-optimizations is also s=
pecified. This is because NEON hardware does not fully implement the IEEE 75=
4 standard for floating-point arithmetic (in particular denormal values are t=
reated as zero), so the use of NEON instructions may lead to a loss of preci=
sion.
=E2=80=98=E2=80=99=E2=80=99

So I still can=E2=80=99t understand if it=E2=80=99s something core related o=
r something gcc related. Does anyone have any more in-depth explanation?

Anyway I agree with Heiko to remove the fpu strategy in this defconfig.

Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

[1]: https://developer.arm.com/architectures/instruction-sets/floating-point=

[2]: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html

>=20
> I probably took the setting from the freescale_imx8mmevk_defconfig,
> which is then also not correct.
>=20
> I then looked further at the other aarch64 defconfigs and saw that
> there are more that set the FPU settings.
>=20
>  #  grep aarch64 -A50 configs/* | grep FPU | wc -l
>  28
>=20
> I will remove this setting from the defconfig in this patch and also
> for the other kontron defconfig.
>=20
> --=20
> Heiko

--Apple-Mail-92B01536-ABF1-4A8C-9FE7-D906CEC91B93
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Heiko, Thomas,<br><div dir=3D"ltr"><br><=
blockquote type=3D"cite">Il giorno 18 gen 2022, alle ore 20:58, Heiko Thiery=
 &lt;heiko.thiery@gmail.com&gt; ha scritto:<br><br></blockquote></div><block=
quote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi Giulio, Hi Thomas,</s=
pan><br><span></span><br><span></span><br><span>Am Di., 18. Jan. 2022 um 07:=
58 Uhr schrieb Giulio Benetti</span><br><span>&lt;giulio.benetti@benettiengi=
neering.com&gt;:</span><br><blockquote type=3D"cite"><span></span><br></bloc=
kquote><blockquote type=3D"cite"><span>Hi Thomas,</span><br></blockquote><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>On 18/01/22 00:04, Thomas Petazzoni wrote:</span><br></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>On Mon, 17 Jan 2022=
 20:58:52 +0100</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>Giulio Benetti &lt;giulio.benetti@benettie=
ngineering.com&gt; wrote:</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>diff --git a/configs/kontron_bl_imx8m=
m_defconfig b/configs/kontron_bl_imx8mm_defconfig</span><br></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>new fi=
le mode 100644</span><br></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>index 0000000000..5b5648cc14</span><br></=
blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>--- /dev/null</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>+++ b/configs/kontron_bl_imx8mm_de=
fconfig</span><br></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>@@ -0,0 +1,59 @@</span><br></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+# Architec=
ture</span><br></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>+BR2_aarch64=3Dy</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+BR2_ARM_FPU_V=
FPV3=3Dy</span><br></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an></span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>i.MX8MM support=
s VFPv4-D16, so I would substitute this ^^^ with:</span><br></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>BR2_ARM_FPU_VFPV4D16</span><br></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>This is to achieve the maximum performance.</span><br></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>Nope, that's not really how it works. VFPv3 i=
s better than VFPv3-D16.</span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>Indeed VFPv3 means that the the FP=
U has 32 double precision registers,</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>while VFPv3-D16 means=
 that it has "only" 16 double precision registers.</span><br></blockquote></=
blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquo=
te type=3D"cite"><span>I'm a bit confused. The datasheet[1] states at 1.4.1:=
</span><br></blockquote><blockquote type=3D"cite"><span>```</span><br></bloc=
kquote><blockquote type=3D"cite"><span>=E2=80=A2 Media Processing Engine (MP=
E) with NEON technology supporting the</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>Advanced Single Instruction Multiple Data architecture</sp=
an><br></blockquote><blockquote type=3D"cite"><span>=E2=80=A2 Floating Point=
 Unit (FPU) with support of the VFPv4-D16 architecture</span><br></blockquot=
e><blockquote type=3D"cite"><span>```</span><br></blockquote><blockquote typ=
e=3D"cite"><span>[1]: https://www.nxp.com/docs/en/data-sheet/IMX8MMCEC.pdf</=
span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquot=
e><blockquote type=3D"cite"><span>So I expect it to only have VFPv4-D16. And=
 also NEON, but we can't mix</span><br></blockquote><blockquote type=3D"cite=
"><span>them up in Aarch64 as I know.</span><br></blockquote><blockquote typ=
e=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>So, if the i.MX8MM has only the VFPv3-D16, then indee=
d it should be</span><br></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>chosen, because code compiled with VFPv3 ma=
y not work, as it might use</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>too many double precision regis=
ters.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span></span><br></blockquote></blockquote><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>On the other hand, if the i.MX8MM=
 has the full VFPv3, then</span><br></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><span>BR2_ARM_FPU_VFPV3=3Dy should be u=
sed.</span><br></blockquote></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>It only has VFPv4-D16. I=
 think I've explained myself bad. This is not to</span><br></blockquote><blo=
ckquote type=3D"cite"><span>achieve maximum performance, simply datasheet st=
ates it only supports</span><br></blockquote><blockquote type=3D"cite"><span=
>VFPv4-D16[1] and judging from this:</span><br></blockquote><blockquote type=
=3D"cite"><span>https://developer.arm.com/documentation/dui0472/h/CJADDCIF#:=
~:text=3DVFPv3%20has%2032%20double%2Dprecision,VFPv3%20with%20half%2Dprecisi=
on%20extensions.&amp;text=3DVFPv4%20has%2032%20double%2Dprecision,to%20the%2=
0features%20of%20VFPv3.</span><br></blockquote><blockquote type=3D"cite"><sp=
an></span><br></blockquote><blockquote type=3D"cite"><span>VFPv4 is retro-co=
mpatible with VFPv3, and I'd expect VFP4v4-D16 to be</span><br></blockquote>=
<blockquote type=3D"cite"><span>like that too. Is it possible that at the mo=
ment, by mistake, it worked</span><br></blockquote><blockquote type=3D"cite"=
><span>without using more than 16 registers as VFPv3 that is retro-compatibl=
e</span><br></blockquote><blockquote type=3D"cite"><span>with VFPv4-D16(mayb=
e?).</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>That being=
 said, the gcc man page only documents vfpv3, vfpv3-d16-fp16,</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>vfpv3-fp16 as extension for armv7-a. Interesting, would need to look</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>into this.</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Yes,=
 but i.MX8MM is a cortex-A53, so armv8-a:</span><br></blockquote><blockquote=
 type=3D"cite"><span>https://developer.arm.com/ip-products/processors/cortex=
-a/cortex-a53</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>that then is retro-compatib=
le to armv7-a if in Aarch32.</span><br></blockquote><blockquote type=3D"cite=
"><span>But here we use it as BR2_aarch64, so armv8-a:</span><br></blockquot=
e><blockquote type=3D"cite"><span>https://gcc.gnu.org/onlinedocs/gcc/ARM-Opt=
ions.html</span><br></blockquote><blockquote type=3D"cite"><span></span><br>=
</blockquote><blockquote type=3D"cite"><span>and it lists:</span><br></block=
quote><blockquote type=3D"cite"><span>```</span><br></blockquote><blockquote=
 type=3D"cite"><span>-mfpu=3Dname</span><br></blockquote><blockquote type=3D=
"cite"><span>This specifies what floating-point hardware (or hardware emulat=
ion) is</span><br></blockquote><blockquote type=3D"cite"><span>available on t=
he target. Permissible names are: =E2=80=98auto=E2=80=99, =E2=80=98vfpv2=E2=80=
=99,</span><br></blockquote><blockquote type=3D"cite"><span>=E2=80=98vfpv3=E2=
=80=99, =E2=80=98vfpv3-fp16=E2=80=99, =E2=80=98vfpv3-d16=E2=80=99, =E2=80=98=
vfpv3-d16-fp16=E2=80=99, =E2=80=98vfpv3xd=E2=80=99,</span><br></blockquote><=
blockquote type=3D"cite"><span>=E2=80=98vfpv3xd-fp16=E2=80=99, =E2=80=98neon=
-vfpv3=E2=80=99, =E2=80=98neon-fp16=E2=80=99, =E2=80=98vfpv4=E2=80=99, =E2=80=
=98vfpv4-d16=E2=80=99,</span><br></blockquote><blockquote type=3D"cite"><spa=
n>=E2=80=98fpv4-sp-d16=E2=80=99, =E2=80=98neon-vfpv4=E2=80=99, =E2=80=98fpv5=
-d16=E2=80=99, =E2=80=98fpv5-sp-d16=E2=80=99, =E2=80=98fp-armv8=E2=80=99,</s=
pan><br></blockquote><blockquote type=3D"cite"><span>=E2=80=98neon-fp-armv8=E2=
=80=99 and =E2=80=98crypto-neon-fp-armv8=E2=80=99. Note that =E2=80=98neon=E2=
=80=99 is an alias</span><br></blockquote><blockquote type=3D"cite"><span>fo=
r =E2=80=98neon-vfpv3=E2=80=99 and =E2=80=98vfp=E2=80=99 is an alias for =E2=
=80=98vfpv2=E2=80=99.</span><br></blockquote><blockquote type=3D"cite"><span=
>```</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blo=
ckquote><blockquote type=3D"cite"><span>So "vfpv4-d16" is possible.</span><b=
r></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>Here I think we need vfpv4-d16 and not vfpv3 beca=
use of both DS and RM</span><br></blockquote><blockquote type=3D"cite"><span=
>of i.MX8MM.</span><br></blockquote><blockquote type=3D"cite"><span></span><=
br></blockquote><blockquote type=3D"cite"><span>Does it sound good to you?</=
span><br></blockquote><span></span><br><span>After following the discussion i=
n IRC between Yann and Michael I am</span><br><span>sure that this setting c=
annot be used for the aarch64/cortex-A53 CPU.</span><br><span>The settings B=
R2_ARM_CPU_HAS_FPU, BR2_ARM_CPU_HAS_VFPV2,</span><br><span>BR2_ARM_CPU_HAS_V=
FPV3, BR2_ARM_CPU_HAS_VFPV4 and</span><br><span>BR2_ARM_CPU_HAS_FP_ARMV8 are=
 set implicitly.</span><br></div></blockquote><div><br></div><div>Yes, I was=
 wrong and you point that fpu strategy falls back to BR2_ARM_FPU_FP_ARMV8 an=
d it=E2=80=99s ok.&nbsp;</div><div>But i.MX8MM supports NEON too, so I would=
 go for setting BR2_ARM_FPU_NEON_FP_ARMV8,</div><div>because as pointed here=
[1] the armv8 neon now supports IEEE 754 floating point standard.</div><div>=
<br></div><div>BUT I=E2=80=99ve found that gcc[2] points that:</div><div>=E2=
=80=98=E2=80=99=E2=80=99</div><div><span style=3D"-webkit-text-size-adjust: a=
uto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-size: medium; back=
ground-color: rgb(255, 255, 255);"><br></span></div><div><span style=3D"-web=
kit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); f=
ont-size: medium; background-color: rgb(255, 255, 255);">If the selected flo=
ating-point hardware includes the NEON extension (e.g.&nbsp;</span><samp sty=
le=3D"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(=
0, 0, 0);">-mfpu=3Dneon</samp><span style=3D"-webkit-text-size-adjust: auto;=
 caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-size: medium; backgrou=
nd-color: rgb(255, 255, 255);">), note that floating-point operations are no=
t generated by GCC=E2=80=99s auto-vectorization pass unless&nbsp;</span><sam=
p style=3D"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color:=
 rgb(0, 0, 0);">-funsafe-math-optimizations</samp><span style=3D"-webkit-tex=
t-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-si=
ze: medium; background-color: rgb(255, 255, 255);">&nbsp;is also specified. T=
his is because NEON hardware does not fully implement the IEEE 754 standard f=
or floating-point arithmetic (in particular denormal values are treated as z=
ero), so the use of NEON instructions may lead to a loss of precision.</span=
></div><div><span style=3D"-webkit-text-size-adjust: auto; caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0); font-size: medium; background-color: rgb(255,=
 255, 255);">=E2=80=98=E2=80=99=E2=80=99</span></div><div><span style=3D"-we=
bkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
 font-size: medium; background-color: rgb(255, 255, 255);"><br></span></div>=
<div><span style=3D"-webkit-text-size-adjust: auto; caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); font-size: medium; background-color: rgb(255, 255, 2=
55);">So I still can=E2=80=99t understand if it=E2=80=99s something core rel=
ated or something gcc related. Does anyone have any more in-depth explanatio=
n?</span></div><div><span style=3D"-webkit-text-size-adjust: auto; caret-col=
or: rgb(0, 0, 0); color: rgb(0, 0, 0); font-size: medium; background-color: r=
gb(255, 255, 255);"><br></span></div><div><span style=3D"-webkit-text-size-a=
djust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-size: medi=
um; background-color: rgb(255, 255, 255);">Anyway I agree with Heiko to remo=
ve the fpu strategy in this defconfig.</span></div><div><br></div><div>Best r=
egards</div><div>=E2=80=94-</div><div>Giulio Benetti</div><div>Benetti Engin=
eering sas</div><div><br></div><div>[1]:&nbsp;<a href=3D"https://developer.a=
rm.com/architectures/instruction-sets/floating-point">https://developer.arm.=
com/architectures/instruction-sets/floating-point</a></div><div>[2]:&nbsp;<a=
 href=3D"https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html">https://gcc.gn=
u.org/onlinedocs/gcc/ARM-Options.html</a></div><br><blockquote type=3D"cite"=
><div dir=3D"ltr"><span></span><br><span>I probably took the setting from th=
e freescale_imx8mmevk_defconfig,</span><br><span>which is then also not corr=
ect.</span><br><span></span><br><span>I then looked further at the other aar=
ch64 defconfigs and saw that</span><br><span>there are more that set the FPU=
 settings.</span><br><span></span><br><span> &nbsp;# &nbsp;grep aarch64 -A50=
 configs/* | grep FPU | wc -l</span><br><span> &nbsp;28</span><br><span></sp=
an><br><span>I will remove this setting from the defconfig in this patch and=
 also</span><br><span>for the other kontron defconfig.</span><br><span></spa=
n><br><span>-- </span><br><span>Heiko</span><br></div></blockquote></body></=
html>=

--Apple-Mail-92B01536-ABF1-4A8C-9FE7-D906CEC91B93--

--===============3309391083709978796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3309391083709978796==--
