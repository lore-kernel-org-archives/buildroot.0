Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0002C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 21:33:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD826137F
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBD826137F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A79540250;
	Sun,  7 Nov 2021 21:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhPj6a5T1j08; Sun,  7 Nov 2021 21:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9965F4024A;
	Sun,  7 Nov 2021 21:33:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CADE81BF335
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B964D80CCF
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=senzilla.io
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMmch_LzrKGu for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 21:33:32 +0000 (UTC)
X-Greylist: delayed 00:07:59 by SQLgrey-1.8.0
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BC6380CA9
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=senzilla.io; s=key1;
 t=1636320329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COsF8s8ABUW/OoZrYTZOM+rJnDXmtmpz/JoiICiBmZo=;
 b=P6Ip+d/0QwqnUZoWcPpJX/Thgrfb4Or2RljrSrRFen5BjXqrLA+PKGB+Tpf4BUsEJkK7g1
 Qbw7suw6V7x0H8hU8mKcmnqKUbvhAZ8tn9tTgKyxMVH2s4Ay0k0Ow6OKImk70ig1C+pTmx
 Q9GRLrvYHGsIFVX7RNgQSav1LoEHtCY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
MIME-Version: 1.0
Date: Sun, 7 Nov 2021 22:25:27 +0100
Message-Id: <53DE106D-44F1-40F5-B364-DA9708EFC032@senzilla.io>
References: <20211107192930.370979-1-romain.naour@gmail.com>
In-Reply-To: <20211107192930.370979-1-romain.naour@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: hi@senzilla.io
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_aarch64_sbsa_defconfig:
 use ARM cortex a57
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
From: "D. Olsson via buildroot" <buildroot@buildroot.org>
Reply-To: "D. Olsson" <hi@senzilla.io>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5585827871407623430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5585827871407623430==
Content-Type: multipart/alternative; boundary=Apple-Mail-5717B023-E047-4A88-81F8-A2DA35C0C66C
Content-Transfer-Encoding: 7bit


--Apple-Mail-5717B023-E047-4A88-81F8-A2DA35C0C66C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Romain,

Resending my review because I didn't reply to all :)

> On 7 Nov 2021, at 20:29, Romain Naour <romain.naour@gmail.com> wrote:
>=20
> =EF=BB=BFWhen booting with cortex-a53, qemu refuse to start with the follo=
wing message [1]:
>=20
>  qemu-system-aarch64: sbsa-ref: CPU type other than the built-in cortex-a5=
7 not supported

Thanks for catching this! Looks like removal of a53 support is a fairly rece=
nt change in QEMU: https://github.com/qemu/qemu/commit/4f335a6381f83beb5d6ac=
0d3993514379454a99d#diff-8efb73c3e0dd9d7a13b0597a056b4cd8fa9d9250c7de8b1d3b5=
38d07d98a8c50

> Use ARM cortex a57 as requested by Qemu.
>=20
> [1] https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D64580903c2b3aee0=
8d74d64e6248a313b246cb69
>=20
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Dick Olsson <hi@senzilla.io>
> ---
> board/qemu/aarch64-sbsa/readme.txt  | 2 +-
> configs/qemu_aarch64_sbsa_defconfig | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/=
readme.txt
> index 7935108ef1..b62947f55f 100644
> --- a/board/qemu/aarch64-sbsa/readme.txt
> +++ b/board/qemu/aarch64-sbsa/readme.txt
> @@ -17,7 +17,7 @@ Run the emulation with:
>=20
>   qemu-system-aarch64 \
>     -M sbsa-ref \
> -    -cpu cortex-a53 \
> +    -cpu cortex-a57 \
>     -smp 4 \
>     -m 1024 \
>     -nographic \
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sb=
sa_defconfig
> index 0e1c799b4d..d1e0adadd1 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -1,6 +1,6 @@
> # Architecture
> BR2_aarch64=3Dy
> -BR2_cortex_a53=3Dy
> +BR2_cortex_a57=3Dy
>=20
> # Toolchain
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=3Dy
> --=20
> 2.31.1

Looks good!

Reviewed-by: Dick Olsson <hi@senzilla.io>


--Apple-Mail-5717B023-E047-4A88-81F8-A2DA35C0C66C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Romain,<div><br></div><div>Resending my r=
eview because I didn't reply to all :)<br><div dir=3D"ltr"><br><blockquote t=
ype=3D"cite">On 7 Nov 2021, at 20:29, Romain Naour &lt;romain.naour@gmail.co=
m&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF<span>When booting with cortex-a53, qemu refuse to start with=
 the following message [1]:</span><br><span></span><br><span> &nbsp;qemu-sys=
tem-aarch64: sbsa-ref: CPU type other than the built-in cortex-a57 not suppo=
rted</span><br></div></blockquote><div><br></div><div><span style=3D"-webkit=
-text-size-adjust: auto; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); bac=
kground-color: rgb(255, 255, 255);">Thanks for catching this! Looks like rem=
oval of a53 support is a fairly recent change in QEMU:&nbsp;</span><a href=3D=
"https://github.com/qemu/qemu/commit/4f335a6381f83beb5d6ac0d3993514379454a99=
d#diff-8efb73c3e0dd9d7a13b0597a056b4cd8fa9d9250c7de8b1d3b538d07d98a8c50" sty=
le=3D"-webkit-text-size-adjust: auto;">https://github.com/qemu/qemu/commit/4=
f335a6381f83beb5d6ac0d3993514379454a99d#diff-8efb73c3e0dd9d7a13b0597a056b4cd=
8fa9d9250c7de8b1d3b538d07d98a8c50</a></div><br><blockquote type=3D"cite"><di=
v dir=3D"ltr"><span></span><span>Use ARM cortex a57 as requested by Qemu.</s=
pan><br><span></span><br><span>[1] https://git.qemu.org/?p=3Dqemu.git;a=3Dco=
mmitdiff;h=3D64580903c2b3aee08d74d64e6248a313b246cb69</span><br><span></span=
><br><span>Signed-off-by: Romain Naour &lt;romain.naour@gmail.com&gt;</span>=
<br><span>Cc: Dick Olsson &lt;hi@senzilla.io&gt;</span><br><span>---</span><=
br><span> board/qemu/aarch64-sbsa/readme.txt &nbsp;| 2 +-</span><br><span> c=
onfigs/qemu_aarch64_sbsa_defconfig | 2 +-</span><br><span> 2 files changed, 2=
 insertions(+), 2 deletions(-)</span><br><span></span><br><span>diff --git a=
/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt</sp=
an><br><span>index 7935108ef1..b62947f55f 100644</span><br><span>--- a/board=
/qemu/aarch64-sbsa/readme.txt</span><br><span>+++ b/board/qemu/aarch64-sbsa/=
readme.txt</span><br><span>@@ -17,7 +17,7 @@ Run the emulation with:</span><=
br><span></span><br><span> &nbsp;&nbsp;qemu-system-aarch64 \</span><br><span=
> &nbsp;&nbsp;&nbsp;&nbsp;-M sbsa-ref \</span><br><span>- &nbsp;&nbsp;&nbsp;=
-cpu cortex-a53 \</span><br><span>+ &nbsp;&nbsp;&nbsp;-cpu cortex-a57 \</spa=
n><br><span> &nbsp;&nbsp;&nbsp;&nbsp;-smp 4 \</span><br><span> &nbsp;&nbsp;&=
nbsp;&nbsp;-m 1024 \</span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;-nographic \</=
span><br><span>diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qe=
mu_aarch64_sbsa_defconfig</span><br><span>index 0e1c799b4d..d1e0adadd1 10064=
4</span><br><span>--- a/configs/qemu_aarch64_sbsa_defconfig</span><br><span>=
+++ b/configs/qemu_aarch64_sbsa_defconfig</span><br><span>@@ -1,6 +1,6 @@</s=
pan><br><span> # Architecture</span><br><span> BR2_aarch64=3Dy</span><br><sp=
an>-BR2_cortex_a53=3Dy</span><br><span>+BR2_cortex_a57=3Dy</span><br><span><=
/span><br><span> # Toolchain</span><br><span> BR2_TOOLCHAIN_BUILDROOT_WCHAR=3D=
y</span><br><span>-- </span><br><span>2.31.1</span><br></div></blockquote><b=
r></div><div>Looks good!</div><div><br></div><div>Reviewed-by: Dick Olsson &=
lt;hi@senzilla.io&gt;</div><div><br></div></body></html>=

--Apple-Mail-5717B023-E047-4A88-81F8-A2DA35C0C66C--

--===============5585827871407623430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5585827871407623430==--
