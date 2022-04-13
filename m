Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AC7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F93E60C1F;
	Wed, 13 Apr 2022 20:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKiwCXafau4N; Wed, 13 Apr 2022 20:28:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FCF460B78;
	Wed, 13 Apr 2022 20:28:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 703931BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD4D60B78
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiT4LhFaiFsc for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:28:48 +0000 (UTC)
X-Greylist: delayed 13:02:58 by SQLgrey-1.8.0
Received: from gateway.work-microwave.com (gateway.work-microwave.com
 [IPv6:2a03:4000:15:25e:0:6a7:b16:e3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09A9E6058C
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:28:47 +0000 (UTC)
Received: from mail.work-microwave.com (mail.work-microwave.com [10.9.5.20])
 by gateway.work-microwave.com (Postfix) with ESMTPS id 3D7AB40285
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 22:28:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.work-microwave.com (Postfix) with ESMTP id BCBC7F22B0F;
 Wed, 13 Apr 2022 22:28:45 +0200 (CEST)
Authentication-Results: mail-wsvr1.work-microwave.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=work-microwave.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 work-microwave.com; h=content-type:content-type:in-reply-to:from
 :from:references:content-language:subject:subject:mime-version
 :date:date:message-id; s=default; t=1649881723; bh=mIEXLSTmeU4rB
 PKlTWecsDcIgQ9ZPyy5CBD2Pw8+s68=; b=sARIK4QBszjjl/+fSE9oojVT5KluV
 RE2xMb6pwx/yw7BnHlvr9s4q3ctanca7hJH/lnZ8ZZ3TKnfcssmCBkDsBZxXKM1V
 G2WJ0i+HbeAFJx6IhiraJ2zZSwVxzquXYnaIHW2zYAJrOGwywZO+b+1o/z7shhIA
 /moZOCbzUMgvL42+C2nFR/HwXafKOlDWoPH4TcxFV0RuGDlQ8Pi0gXW/uC135pyl
 IMHzG0esSx2y6r/7m6wo8OqEaMtIWKY6Rwsh9PJydnLV19w98g8egJ/KIQvWRAAU
 sm8qo0rIs19tMYlecx3xUOYwHU8wolPAuzaZuUr0bi8P/XX0+eASJkFAw==
Received: from mail.work-microwave.com ([127.0.0.1])
 by localhost (mail-wsvr1.work-microwave.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id Aow3wP8ijWcK; Wed, 13 Apr 2022 22:28:43 +0200 (CEST)
Message-ID: <7e6c990c-2670-f945-79cb-b2597e3b961a@work-microwave.com>
Date: Wed, 13 Apr 2022 22:28:42 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220413072445.1600631-1-johannes.agricola@work-microwave.com>
From: Johannes Agricola <johannes.agricola@work-microwave.com>
Autocrypt: addr=johannes.agricola@work-microwave.com; keydata=
 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 unEt
In-Reply-To: <20220413072445.1600631-1-johannes.agricola@work-microwave.com>
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: Require C++ toolchain
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
Content-Type: multipart/mixed; boundary="===============1733686397955619407=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1733686397955619407==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2oOM6i3kLmcQnY0JVInighzW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2oOM6i3kLmcQnY0JVInighzW
Content-Type: multipart/mixed; boundary="------------fDazQmMMp2bx2DgGnIKxYDvv";
 protected-headers="v1"
From: Johannes Agricola <johannes.agricola@work-microwave.com>
To: buildroot@buildroot.org
Message-ID: <7e6c990c-2670-f945-79cb-b2597e3b961a@work-microwave.com>
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: Require C++ toolchain
References: <20220413072445.1600631-1-johannes.agricola@work-microwave.com>
In-Reply-To: <20220413072445.1600631-1-johannes.agricola@work-microwave.com>

--------------fDazQmMMp2bx2DgGnIKxYDvv
Content-Type: multipart/mixed; boundary="------------6qDJeRKa4uOSN5FBSIwp6x89"

--------------6qDJeRKa4uOSN5FBSIwp6x89
Content-Type: multipart/alternative;
 boundary="------------b5bfr9oDe1OnUhNuMsTvfqnr"

--------------b5bfr9oDe1OnUhNuMsTvfqnr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBpcyBvYnNvbGV0ZSB3aXRoIEZhYnJpY2UgRm9udGFpbmUncywNCg0KID4g
DQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNo
LzIwMjIwNDEzMTkwODE1Ljg4ODg1NC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tLw0K
DQp3aGljaCBoYXMgYWxzbyBhbHJlYWR5IGJlZW4gbWVyZ2VkIGludG8gbGlid2Vic29ja2V0
cyBtYXN0ZXIuDQoNCiA+IA0KaHR0cHM6Ly9naXRodWIuY29tL3dhcm1jYXQvbGlid2Vic29j
a2V0cy9jb21taXQvYTA0YWFhZDdmMGRiNjg1ZTRkOGFjYmVlMTk1MmZmMmM0YmU1MWVlMA0K
DQpQbGVhc2UgaWdub3JlIHRoaXMgb25lLiA6KQ0KDQpDaGVlZXJzDQoNCg==
--------------b5bfr9oDe1OnUhNuMsTvfqnr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>This patch is obsolete with Fabrice Fontaine's,</p>
    <p>&gt;
<a class=3D"moz-txt-link-freetext" href=3D"https://patchwork.ozlabs.org/p=
roject/buildroot/patch/20220413190815.888854-1-fontaine.fabrice@gmail.com=
/">https://patchwork.ozlabs.org/project/buildroot/patch/20220413190815.88=
8854-1-fontaine.fabrice@gmail.com/</a><br>
    </p>
    <p> which has also already been merged into libwebsockets master.</p>=

    <p>&gt;
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/warmcat/lib=
websockets/commit/a04aaad7f0db685e4d8acbee1952ff2c4be51ee0">https://githu=
b.com/warmcat/libwebsockets/commit/a04aaad7f0db685e4d8acbee1952ff2c4be51e=
e0</a></p>
    <p>Please ignore this one. :)<br>
    </p>
    <p>Cheeers</p>
  </body>
</html>

--------------b5bfr9oDe1OnUhNuMsTvfqnr--

--------------6qDJeRKa4uOSN5FBSIwp6x89
Content-Type: application/pgp-keys; name="OpenPGP_0x48B9A3F733BF03C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0x48B9A3F733BF03C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGDtZjgBEADdQZuPX0FHPRuF8jMHGE/sR9Dn1YKyR5WB6ceC6KuDmCOPFfzf
6bxIqqy6neGbEfSTH8RHr0xNdcOZqIwJLX7yl/EhuuqH4hvxxQsrYNubt9a9Kv3x
ftfRhBU7q+hWVYF0olx9Qos1PMgtBryiGuxAcYKo8fvfyZEYf6C+KKsspF50FR9v
LIkQ/r1vz/6PB/SPV8trj7yCnZjUAjwQTQCr5gW8UjwTlk2Vi2Inl5/sB20C8Z5d
OI6YL+S96NXb2WoOoD4Njp4ulFtE+kcHd2jOoyN2Xc+JnQL5YrykBo+nxfwmA2x/
JX+8uxk+qMsA6hXvlPcgeGKv5GgAJpQEiESRkrOZMXwlRmlxpSyIv7HN5OZzewnE
JPjJqcV89/SBCw/FT4aMjW/2kcI5et1y7lE6bteOOj8B9rKwnjv2AIUPh+/PZCKF
09tEeH3VKgXPBeSGRRgFlZN52ljnaQyYA0lKrypmS38G2Lx6i70NbZ4CljDqZHG4
7RqS+qNC2u+p/1b6SaXe+i41Wcd2r6/SyUNYa3VAUztY1AXiwOm6lJgTHFO20pav
nZwFynfHfRLkl4UcWAaf7y33uKL7d+cdQEDPuZRgQFMLvFE0FI+x+0y6zCRU/m+5
T7INeGod9jcllaF4RjKHrChBQXZdR1pRE6EGId68juZH0xDsC/KRxIB/mwARAQAB
zThKb2hhbm5lcyBBZ3JpY29sYSA8am9oYW5uZXMuYWdyaWNvbGFAd29yay1taWNy
b3dhdmUuY29tPsLBiQQTAQgAMxYhBIzE8H0jXkLhAV4xIUi5o/czvwPBBQJg7WY5
AhsDBQsJCAcCBhUICQoLAgUWAgMBAAAKCRBIuaP3M78DwaWSEAClwpHCCANW2E9b
0A7B5lgyO3T2ROMKLl0WtFgfs2/nZAMtS1YVhZZXsZFVOVbxHcSHBwF9wMaTnAy8
f1hEGdjQ8c8QE0uLLPu+04grMQIRQ878YLNi49BsqtN/5U+da1hJNF/LTKa6DaB5
Z61U5pftpZvi39b2a0ex17fTQDr5v+k1KttTHKdYujftRNzVtJgCFOY1JH/bKPWT
/a8ueKbgVJqOUYwcm5QAbYEgv6crXUZXSUR7zYqZ9UY1N0JoT1IRVWYZb5ZHQhuY
861EjNOw3d+RyA6gfs2hC/YgiWzBrZ5FEPeDq6mzntrWarsmI0Redm9yBsJukBwG
mzakHS9W9nQ+G0kaCoUFHUjEBpolMWtpCDrg1FvIknGwpHRvrSXXmr+dmDtBBRVZ
eX4XrqMAJjdXdK0y85iIkUWDvegZCcSXfzAOMTX0HNIfT9xRqw5ph9xqPawU6VZ6
AOyVqmfgGDoS2p8rZUEsDJj9UjnaCKyEw2nftNNnKAW5tvVcAWWl0EWPmqL22JKH
sN+dxRKbSSfb/LZCoBTFhzN1BRoyUnKy5bJh3YOd3/ZOwY8dHTPOru8ozl77f9M6
PFJNqGqyRJf92D7qmvK2uVuw1CC32vO/2CvwhLh7iVxEY5DvcnaKXQ18A3qAOMAH
0HV2BhWwwL26uy4sDDX4FL2AFTTuA87BTQRg7WY5ARAA0esJ2W5SKjzeJkfw/JD3
kSA3l5sfKY3rpJmc/HPI4kHHhLhACtC49R6s4O/i189hxeG+VvmgK2rauaxM5QMJ
VuTl+p7AtgCFwuHBHWGFB9c4C1x9AZcnDIMM9shl7y5E/Dvf3NRZTZFn8ictKxcC
NuGPTqfyI9fANcNcIocVWHNo2U02Qveigk8FlpViVEZ4Ah1yItUeDoJyf/HM/D8w
j8F4hd6GoslvwX/mv4eIwLWDAwd7wpwU75I58716wnl1xaD19Pmw5Nt1ZGXNg6F+
uJGPVO9oyc+haFlgwP6zjx9xfbhfyjoXrdI3qvyxVwlkkE5rRwsId2ONKMpXCEdp
sYzhAQHeBP7j4ACW2jjp3nYp/kKtuFyjHyfC9A5ug3XVHUfSUpT5aXNJtO3n6gSS
dZBShcTR1sKqY0ZkwGoAEWjE2iRavplV0qe1l+5se0PX50lFdC3Z76v5+DR6EJKg
Pcn+2VKkTG5zM9iYvBbPGPeyEeDBVg5qZPx/iUozEMiAOEL8xrd7gzXV3w+0kH0I
a9Udrm2ZEcPXIv41VfehC1alRhkUZke6esk9tKdFO7t8sM9WT4+iP1olHJKSRYAr
9xF1/bnWyG4nI71e9Ms0s+7xJmOkH+Ok2az8RRrBvzUQPOROkwi3Hn8sloQOyKvn
+IUkuTb9+QskXRplwsS6c+MAEQEAAcLBdgQYAQgAIBYhBIzE8H0jXkLhAV4xIUi5
o/czvwPBBQJg7WY6AhsMAAoJEEi5o/czvwPBqbkQALY8mSFMKHr5FK+O0e4X3uEX
OhAPhQuk0tbnlTXquAzR0qEAI2A99ZYs/W/YTKKG8tJAUSW2cfb+149W6WDzGqrf
z5COb7lTe5Z6X8f/YkAj3+wlgvICOCVghyt3GkoVCFsTU1sW6WIITKkgnk6IX1Hk
L1jTaC2RNKPJLDeqZbSPMtNFplFvFhWIGQwRaEhmiK0icePREIJcb0YDYYRSA8a8
KFlTIkqLXJJDwadLNOde1LoqROZ/10beSvLDo9u2pl3PHom6gDfUSXji+vvwlglO
3Hey+zKCow1ev+3kq9T66IBkrKDToNQVRTzl75N1Er3f0JY9d9C4niohIv8M8yEp
R5KnYc4N5r2fchIxeEW7J24raOGTtAMzCD/tnvHtXR1Cbs7+oMI0c249gHctASFQ
8nx7264pu/v/+ZaljaIRmKUs0LnUH4QiVbWTLwYTT4Qg2mkxvry1SiA+HIMoiAWR
o7Jt7JAykKFPj8KV908jRF9QtAEEuQ4ns7vZkUJjJ6f/IksnVM6dlprdyfqmsSs/
w4sPXEwKDIOgUsL69+YJrD8EvnSbuDKbpmXkyqOTifuypViInfNhCfdKurzjs6og
nHmidtb5glv5ZKGwzscWbAL0G1Fiseo7GB+5tHkfv23LDWkcm6rffSIu/DskbHTM
j/rlAD/OnHN9odIUunEt
=3D0aZm
-----END PGP PUBLIC KEY BLOCK-----

--------------6qDJeRKa4uOSN5FBSIwp6x89--

--------------fDazQmMMp2bx2DgGnIKxYDvv--

--------------2oOM6i3kLmcQnY0JVInighzW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEjMTwfSNeQuEBXjEhSLmj9zO/A8EFAmJXMnoFAwAAAAAACgkQSLmj9zO/A8FC
8w//ULWs1Nf0+58iHUy6LgSzTX7jt8uHl52k0cEs8VRV6PB2IHw1TgOcI7marNiwXeypsT2kMmui
BvvRlDYek4MNes7Wt4aYykfxV/M3eSoMD3UaUeMp4JV1yrByJi4UFNZ0/4hsfOi4A1O6eTwBt7zg
v9WKrrX72QTHZPFIsgZNBrpImY2H2ZWSMP1g4FTIUFQPWPD/zPtoqIiVNH0QhTPaYGuIwyFGE3Eo
jB/8aUztjzWcuJ8XMg/zoLWZrFbLneeOz1LwNM9Q6Sl3MXourfbu3MqYG80THCfnDcl+qdrN89UN
D87yO1rVOJQwkYOa12MnrHGdZ8ogx7UMP2+0Xd6fDnA9JZmCQ8s2KponeuABEd0BlJZeKj94hmG4
KyoikZpLQ88qIOf2EdUNljaB9xcKWJ578Bct6hi7Oxm7LPqOvgNixkz0gl1Vu66DXquQuEbY9p8u
DSgOZmJztYtLF8GuLhWLeM8iV/M59yTkdE0dFdXt9TxsrzKg4zprE5J/xjFGJGhj+X2Gu6/OuVjk
7N5pgxEelrs7C3H1NAicgBveaOxxkLCUqzFICXm6xnOa0EWKrayA4pSFK1M7RamG3Ujcr14XKL29
md9S2BpnXiVL2hE+ne2CWHR+UitFZqnyPllm5XmQShmIk7+Ja+CogaPKlrHtz9+mAIu/U94TFtDG
iOI=
=nP+C
-----END PGP SIGNATURE-----

--------------2oOM6i3kLmcQnY0JVInighzW--

--===============1733686397955619407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1733686397955619407==--
