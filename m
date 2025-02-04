Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E286C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 20:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C100360E71;
	Tue,  4 Feb 2025 20:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3F-HYxnGujhw; Tue,  4 Feb 2025 20:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D7260E67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D7260E67;
	Tue,  4 Feb 2025 20:30:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEE5312F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 20:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D4760E63
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 20:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VISw-pOzyEjr for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 20:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A52160E0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A52160E0B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A52160E0B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 20:30:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1tRiOT3s8Y-00xNJJ; Tue, 04
 Feb 2025 21:30:00 +0100
Content-Type: multipart/mixed; boundary="------------a5vITXvTnKKSPIFyKPhHI0Zt"
Message-ID: <b99b664a-c050-43f9-b38e-b3467c47e123@gmx.de>
Date: Tue, 4 Feb 2025 21:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <Z6IodGr39h7X02e1@yd-6wlzhs3> <d8942b7b-a7f2-49ef-b9c2-f0c3d46c6b17@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <d8942b7b-a7f2-49ef-b9c2-f0c3d46c6b17@gmx.de>
X-Provags-ID: V03:K1:79ySZAUHc8aWu50CZWRPySDO4VfIJfpJb6wIebQ6/ThuIotwMVN
 0sT3pb3MVBoCf2URAjlnzc4JE//cTuShM/oPfFqq1kIqKYWm2j/VtQY3qWn1KZpDxAyVxqs
 e7d8GsvsOAdKQhHuUBtEHYmCCsr7lt8GuC2w9cYngT/Rk5mPxXBkhsyFGcLXFusgWw7Kttw
 SwN6iTDDkca9oxdrexQTQ==
UI-OutboundReport: notjunk:1;M01:P0:swwd5n3C7Ss=;+9p2T1a0HrTPjn3BXuQA4CrKVdu
 6hcLWTQ486eNhZBGawCeP0MaGu8ph1e2GnTR7yHhHqtamrmB52xPE9g5nmVmTMKF6+wOsp6kk
 shm6/wzDoBzWSn3pQ6boM9dBQp+jDrHyOybrZRdR5/a1EqhN7I2g9ECtr8MQvPSnW2iIFzQxK
 qH9ArEm4+H+JZwwBf3Hr1edamUztzr8qzb2UY7a60K0zqPm7DfoJQ7ydY9SiUTkBtqd4bFida
 W0jsILGMzGX/DimAaJ5+m0hW5v7npBd6U8LQ2mR+K8dxizb2UhPcwKL8m9XBJbarOtbhvgNtQ
 sqlQKMQHQyAIFXJWTg7kUa4C7iWnNGGaTfA/fNpfbaRnDd6U0mBxdlbapq9N0qs4WmUgKez2U
 oee3xLCLQPoJLq7a20LZflT1/ArF1JU3I/p7gxXm8JK/k0+ElVJ6rKVNpr078zjEPr+6ds7Uv
 IA1sOPcWrD9GbbwEaVPJIMzJciifhY4ASoEma2X706+2/09BtWmoONi3GC5przYaEltoJVOch
 jKRYbBcdb0gn+G4Zzrg1dUQWhaCAcwblDQ7z1DmBEmDTV0TCyBYl49nQ/wwUK+SmXSTUcQgTe
 +/0UfKrl9WD+oMQlLVslekvW4MHIBPAqyZ/EEwERVSHDoOy0uHkkBt7q2/JXwYHcQOdeXsPzv
 zSq7Q/9lbl961XdlP+lDAORQwcgDBnz94mKFL2hum8bGyklVyKTGcYhSRoEKHZP7fpEyLTk04
 mdHJE3I2tn2osKgq9qdw9JXazRFJlSqrHfkkjWDE+OQHOm8mTUhO9egAsRmeA8w2pff/7nAe2
 Zpd3Bbk4/Qz7ZEdc2gEPl6CC+x0CYNU1pMYPFp+AUclQ9dFzGiqaYDqYz/q9hJ6lJ2+pfCZBb
 j2+N8qCD3AKe4OFW4AWJvaQn0eVgNwfoZZsPNqoH9EgFr2ndSrwk9mpgZzUqS+p6D3jCfwgbN
 SB+wlhDOVwSuYrKLDmc3aBmiuJSnAEoPWGI9axa3v4NePIMHaIwWEuVgxn4KjubBONvL6ce8V
 /PUi8JuMnKCAmC6/yQM4zgpsBk2oUlJ74GGxLm18xqIhKWPFdPe+2o0TPKNi/Ujsf2hjD+k2J
 QvZOvdXMev69O5Uh2VW1ecLg6O0KW3uEPgxiXykxH6J/EnZ0dgh5l84VbiaY9fsE8ZQ5Dgwid
 buqX8ynIsNyU32YnbWTm6XTJdf1UnBJIeihO7Ml0WGWw0dueuPUj52hMB3TeFlzU2h790dW52
 7dwqcH+VjhyNk+A+ptD4Um6SAhuZMoZrMonr+ac5yZmKS7C9zCiA4lkT7N9jgboqNwDH8PejH
 3LHwYkDwH1xNrlljMf+/pujsXBcTW2iIXjwTG4oh829S6wdLyeMnycXxD3JS7wHVt4g5WNhXw
 hjPmcnxxuTVZO2UHgx7I0yp2c3hZeBpWaevb0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738701000; x=1739305800; i=fiona.klute@gmx.de;
 bh=axhHeNtUlsgFUX2DnvpOKSuEeuxcA9kpYVgoXh0Jkpg=;
 h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
 Subject:From:To:Cc:References:In-Reply-To:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=p758Z7UEPbT28g8NpdaYvKIrEGqPxxqVfdQjoJsjLZxkX52fQbO7YrUT/wYMUL3B
 151H3aE/iRKIAJDy69woPI1OZ0hVFFrzmt/7RCplZG46/T7tobQe/yLCKWkNFlUPL
 lmioxJZyhaqrAPS0Ty9EvuefWORJEQIqP16dSnBtmf93DoDBVMnAvmsQs/n+t137I
 LlQ6OFPjhOgZEM43VIeu+LDKtmDVFHpGpcGKI2rOkim9+uYf+eJjx7OYD7H0Oxcfn
 O1wshN1OxKr3HXxR+/2yNdzox6Z85E5IlSezuUT75pPY3fXKVvQUUtWitJrMx50Py
 QzSFMX2TOYXD5eD84w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=p758Z7UE
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------a5vITXvTnKKSPIFyKPhHI0Zt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 04.02.25 um 19:36 schrieb Fiona Klute:
> Hi Yann!
>
> Am 04.02.25 um 15:47 schrieb yann.morin@orange.com:
>> Fiona, All,
>>
>> On 2025-02-04 15:32 +0100, Fiona Klute spake thusly:
>>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>> [--SNIP--]
>>> Additionally disable PIE on musl to fix "read-only segment has dynamic
>>> relocations" errors during linking [2].
>> [--SNIP--]
>>> +ifeq ($(BR2_aarch64),y)
>>> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD tha=
t
>>> +# is fixed in Binutils >=3D 2.41 (so all versions provided by
>>> +# Buildroot). Forcing Gold will break with toolchains that don't
>>> +# provide it, so override the flag and use BFD.
>>> +# See: https://github.com/golang/go/issues/22040
>>> +CONTAINERD_EXTLDFLAGS +=3D -fuse-ld=3Dbfd
>>> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>>> +# Go exe build with PIE doesn't work with musl.
>>> +# See: https://github.com/golang/go/issues/17847
>>> +CONTAINERD_EXTLDFLAGS +=3D -Wl,--no-pie
>>> +endif
>>> +endif
>>
>> Is the PIE issue really only hapenning on Aarch64? The upstream issue
>> 17847 does not make it that obvious, but at least mips64 is said to hav=
e
>> the issue as well, and someone even mentioned amd64 (aka x86_64).
>>
>> I.e. don't we need the musl workaround out of the aarch64 condition?
> I'm not sure. The Go code has a check if PIE works with the given
> compiler & linker and disables it otherwise [1], and I didn't run into
> this problem when patching the forced --fuse-ld=3Dgold out of Go, so I
> *assume* the --fuse-ld=3Dbfd override breaks that check in some way and =
we
> don't need --no-pie it if we don't override the linker.
>
> It definitely would be good to actually test that. I'll see if I can fit
> a build in, though I'd appreciate if someone who can actually test the
> result gives it a try. Note that the bug will only show with a toolchain
> that builds PIE by default.

Update: I've tested it now with a build for x86_64 Qemu (config based on
configs/qemu_x86_64_defconfig attached). Build passes and works
(alpine:latest runs), except not with the default Qemu command line from
board/qemu/x86_64/readme.txt: I had to add "-cpu max", with the default
Docker refuses to start due to missing CPU features.

On mips64 I can't enable Docker due to
BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS=3Dn.

Conclusion: I think the patch is good as-is. :-)

Best regards,
Fiona

--------------a5vITXvTnKKSPIFyKPhHI0Zt
Content-Type: text/plain; charset=UTF-8; name="qemu_x86_64_docker.config"
Content-Disposition: attachment; filename="qemu_x86_64_docker.config"
Content-Transfer-Encoding: base64

QlIyX3g4Nl82ND15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQpCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU5fWDg2XzY0X01VU0xfU1RBQkxFPXkKQlIyX0RMX0RJUj0iJChIT01F
KS8uYnVpbGRyb290L2RsIgpCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcWVtdS9wYXRj
aGVzIgpCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKQlIyX1NZU1RFTV9ESENQ
PSJldGgwIgpCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9xZW11L3g4Nl82
NC9wb3N0LWJ1aWxkLnNoIgpCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9x
ZW11L3Bvc3QtaW1hZ2Uuc2giCkJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJf
REVGQ09ORklHKSIKQlIyX0xJTlVYX0tFUk5FTD15CkJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQpCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEy
LjkiCkJSMl9MSU5VWF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQpCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9DT05GSUdfRklMRT0iYm9hcmQvcWVtdS94ODZfNjQvbGludXguY29uZmln
IgpCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfTElCRUxGPXkKQlIyX1BBQ0tBR0VfQ0Ff
Q0VSVElGSUNBVEVTPXkKQlIyX1BBQ0tBR0VfRE9DS0VSX0NMST15CkJSMl9QQUNLQUdFX0RP
Q0tFUl9FTkdJTkU9eQpCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKQlIyX1RBUkdFVF9ST09U
RlNfRVhUMl9TSVpFPSIyNTZNIgojIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0
CkJSMl9QQUNLQUdFX0hPU1RfUUVNVT15CkJSMl9QQUNLQUdFX0hPU1RfUUVNVV9TWVNURU1f
TU9ERT15Cg==

--------------a5vITXvTnKKSPIFyKPhHI0Zt
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------a5vITXvTnKKSPIFyKPhHI0Zt--
