Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D9CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B105C61036;
	Thu, 25 Jun 2026 15:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbyZXUfgtUlL; Thu, 25 Jun 2026 15:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D746C61037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782401447;
	bh=ShGwz+238Qm7h7oBPlc21Dj/Vi2Zxn3UaR7BEWMM5T8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BJTSVa9Eao3IRee+kkJ/omxDwfnb2G93zBDMbXe+G3ysonF8Iz0nvyQXpigij0oNd
	 PYcIEISqEuuMb9aZioVojvUBLMOXo+Emo5ndQmaoCH5AG48kR5czPISTRBcypErfCv
	 /BduUnkscI1LjNvpcglROQmDql9DuapIrW8TKu9gVSwUti9jgzECGBWL4eAY6n/q7d
	 lx9v5wzpeLp3K+Cym3qJEBCp/ZzdkeFGhKHdscEa4JaZjOIKA6spKhrENMMpo+n7zO
	 99MicOUIMvObk/a2Qe4DXwlRbAEEaJhHF6JRtpoJt3UducO4SpkeibpKZ2LaTgHZjJ
	 7CFNp3fqolayg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D746C61037;
	Thu, 25 Jun 2026 15:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E49A254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E855161037
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzvEzgNuuaO8 for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9B9561036
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9B9561036
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9B9561036
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:30:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCtj-1xBHyK2xJH-00aAI8; Thu, 25
 Jun 2026 17:30:39 +0200
Message-ID: <fa115ece-d58b-4133-96ec-cab29704eab2@gmx.de>
Date: Thu, 25 Jun 2026 17:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260621075519.924777-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260621075519.924777-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:+PwoInCO58w/SdvlSf0MiL/oUBX9FIk7awSGIHQCVdxaXBexRDV
 MnoCs1EpHVnhiMitMfBWm3Dk0LMMleDp3dElYQg2nkQ22nYZXQv7IgscTT3XdhvsXh1GXvR
 qAQEHN8tyG/nhveLOucrudk8Dkd1HweyCUVFgwfx8NjlAD6hDsdWLPs4bZxLLMyLmV7++Mh
 JVYXkXJKNdKOGLS2pGCxA==
UI-OutboundReport: notjunk:1;M01:P0:3aHIosXZbYI=;aGqQeu6WygKraxPiNT9jEDMgvMt
 lLHzgri6fGF2cuWSjAvDii9jYiBrvEO36UADi+6xBHT8I6nC7gMZXxqSI46MUIxlHj4WbXlcY
 kwxUiWcN430n+i3Ax9mQTBKOiEsA3GkHhxJx67BIV6AZAZ6UF3yY5QqcBHDqCOlA6GUdhZYwa
 Q7rpt7iEeDcRwbuKhsddKxAy//OXKws+mkrhi7HlF/JKC8AsJKJmORjmmVUjN00EkQb2fW85o
 +iOpG874t2BknkP/jjoUrDO5TMs+d9rU4Y+oPNJDPgwHriNCHjbpWD3Qb6aJ1/9DexakXkuVD
 I6eQHnSVaxNvGAu4ICyVSocKRi36WirLSVh8YusNkKgYosMp1qTFN92A9eQwXcZs8lsNRV1MR
 HbIQ2qgpFZknUlk/KCgwCgybkOBrNwAgmBmnUkMDOmpwD7B/hfthN2ADSAPzLxbN6opljIQKO
 V/o4yh44Jrin6bzRQQ5ZuQJZ6SF9AsAoNeRnAIRZU8C5svrR7qi6ZCksiLyAsSmP6QV6ERvK+
 SNeuCgAoaLbN5AbiKwmixknMVDmWOMTxU5SdNDDks69hdL81ctJK+43S76hwgNxBo1w6Hoq7v
 JG2iAtzbBHXNoOBo7kqtBZc87tu1Ywk4oM9lWmmhW79CJtLfUPdFdvYUWOXKgJzn3fqLmV62B
 I1TYxKe8u++2JksTaVa4B9Z9O1jyGPRiZN9nHjq1AdqEEYt2tz+5qUNJkp27mE1D2OG9zyFaL
 JRyANKw5KC7EarzNcAx+DJW46RNzn2GLRN0FSOjunnpr9wF+6WKlRnmM4Y/Wy0I0/VDl6VVAE
 hZ8y6NcaGYK5cz7zWEB/duVl0+sCs2UpJdCkkLfeEj+1Uf8Ga8UdG7hrIXYxP4TQQcaulmaV2
 6YvGAVT6HHCY9oodKMg/w72uUd8n/y3hbrJXDercYIJU/Hr36D7t9QLza2rrQF+q70ner+IuB
 /WZusPErpVDmykCZe5hWelrrYb06LTjrJmfeHg7znVuYeWdOLzjxd7yXMdp77wPG4yaIxIPdK
 qvGmWBKmhDS3m1jEoPy3/OOFKkLZV7HyduzjZ12/kbP9R9isBdXc2EJ+rImuD/rv/V9P9FuP/
 SplDLLkkkMv9Cf+j7640nMobTHELyq5oey16KX011NKNgQqvp5ufMV56nBUuuIX8APuTTNqOc
 uA312FNdpK7qHsUibGoNss1qEUsPKe1DYsxbP31ECpnTcJGXtj+ySCVXnmoKNPeVQA3CAdoTZ
 qjfpJCPkFZd+MCFa4j2ZFsOm7rPc0Isk21oetxkV6Wd72Dj7cI4yk9khlP2OwHG7LseUpVIiO
 /elyAm8lxv4Eb/5Ra9G+1jDk4GoQtJ87RAVrVHi2fD/PnkZRaNn38rCIGRc/Xh+YvZR2OtmTl
 SXNiy8RUk8peJt8BrovLLnrH4UgmwrMyMp/SFL6EWEZv7jY0U8ScoP8z5NXc1EZieX4Xpm3y6
 1C++OChYY5HwOjwtZ21TbtPFE9b2D0yVM71uDGrN79pRkQmDQLrD9C7O3yiS5AKL1rcDlzn/0
 fXoMfZxbcFn2IsPtQS5DRT/ptmcq42Q2RqkTeoyJZmj7W3+vDW6cKQs1pbBEJ7snsJPPy8j7Q
 4eNDZmn3S0a1lz1zkRkZm+CSeJRpuJcz2adNnlDxmsgA40tgKr9xiS+C277I0dwM1VFH71f3A
 N3qgP8msGY0uYqf2wmNssNGVWztFHOT1Ln/KZ+M1OMADriubnUG1xpf/vsc4pdWSklOYN6d5v
 VzLXA6KgWF1g6Yldy4WjTkAjA1x939rWWIBviZ/WaSIoOKslHNFqlfq1+odFlyUIw6849BFwo
 0bIRDlLY1fUnL7tgOf942ddW/ehBO/gx7+WzCC1+kEcAeueD6rvXB+hTJV2Ui+pubsTas9IIz
 2CGBdtip0tENFzBtBsxaRuyXpLpO780U4xwuZwCkJUbXnvHwVqPedVy73M0u8FjWgcxUfZeME
 BVNkaOrmLTZraPpJBB0RsYPLwXIBXHpfa0DgXnZAOvUCDX8SJfa5RcxVbAUnyTvbX1zkYq0Qv
 IMb7mVhX1Bj9lXvRu47h0xX023EO/8eOrMSfKg15YjbFS27IM+IsyAmEH+HQ8Gw2hkVGdCZrs
 bS61EDuc2jc6wavIqLPY1IiU3tMylKNyBY4Xmhgs+NriR+REBolkmU0oXfCk0uLqXTWptwV2y
 P5Le2/aJECKrOGcysAnVzrBaw+YrM8B0XjhWub8qlTdY9YFv2i2BWClE1piR6Kf+g1CMdRyNX
 BHalK2ZM/maqEkujWnYYWsMHItA/XcKDPC3YBCy2EiDm3Hywd1bkFZxBhuWwiUIjtWUUbYio+
 SjvPfIec4l5xDAMtYFzclz8MEoPvbgVYxESxUB5QreFRcNVFh/vmZFmOOcPmI6f7VpDU9+J0c
 VBtdQJNXwLVoDa6RcTxozPzxaoDoMHA2N4YzoyqNWm/oExdX1x1Ww3NkXVIbKxIqhZ+FQf1y/
 DfakYZo8DP1/4dVTJpIQ2pwJgC6rp31/zs6um53E1eE0OvSCVGcBPSrgrtArd81yu63/UQcK2
 Ch4urpEmGq7GiS7QxSid+nOhGfipRZbf7XezhqZeAiG1y3xPntrHn08pobeNPQA3fPLp75iKv
 /BakMksijxIyn/jGL/ks2xyMy2TyRkGf6fFscKYQQfevhvP7etPlEtmbv5BtuxmTiBCgJosaQ
 wDuPSttBQBfAmrLFj6vk+xFZIf7kZ+3PVkeIx6reZTv1VtElulxoyjjOFaLzzyNOumVtQrndX
 lT+Nyw3xcJLP24n1NAsMbRjalPMmJ0YCwzoNqiyl0MOx7zAKr7+k4vVLGlvpZMPC6ZWGv08Uz
 zohTZf1Z3xENYBehaxTabL6Ja735Xf/iAFHekT21TkkTmeUQ7vZKw/x5zAWnPM7cKFyfv28IY
 lSxxaALEkvzV0JmTMgZ8G9H/Nbyhu+p9NW7uMMcuMj/z/+iYd8LBSpfCSWfbK+0rCsnQIJN0d
 +vayIlpnMgaV3zMLZxf5OLf3QxnM/s3FV8f6gfLMay8bOV12VqDaGnaSVSj5MQ8B0VFPJo2M9
 PN84jfxes98rgqn2+HWIVon43aOo+yj8peA8CpOvHYfYMRMIMBGy2gSQhDXHfNhaSh11KUoBx
 6vJky8buAMXyD4u5YCSPl+Yg2ZwUAu5/qWGBOW4WEHC5Ya/1Nj1EMAddzZBnq4YYz8eSaJ4jk
 RHYVyUNbLNJTBSUkc+hFHBT/lD9AXVKOOV4BVsba9XwRfbEX0ReIwbKq69smGnnhKcttvSqxA
 h4nWIPZxD69lSePGU9/L1YnGen2AHEmEazdQ5DZHGu9ViCs/Fa+4UrbkrjJtLRAYSIXVM3a8m
 oMy5X+hVSVKk1RCxpwK+bLCuJ63n+KLceHq7ML/5gdfsHbFRz0qeYSuhpusVaCd3xsU4hYXuE
 xiRM8P1kX1NDV1fExGu12JyWmubjjLmJwqkf9gTnZNL0U76bxD9yfPw99eVRBQlybGeHt0yhl
 SQNSJwjK/3G3FOxTdW8Wpe67lieQ4oKBRsq9uaIpeYnuD2tixxFZDVORQWjcKgPjOr3rBjV0j
 rDTB4wnYhkfOTkVPQbNZHdKzJbw5guzq7SnNPaQ9Op6if0XhNgo1+wvIHy1FKytj66Qyzz5lV
 /Wics4yqRmfGD/5GADs/eD7LCHajmoaU1ktoeVELfe2eFM/UxdWAUXfJLpSxDU949+GLS8KOP
 wTD7gpfiQ1gFLTp2xcLa6I3o6wim+rzucvO42H4iXjqb//sEjHbiHZiGPQkP3W9JE5L9kyRfu
 QE0iIjhDahqqX5NeUBHP3gKGSeRbCe+SmbXRSBhFXMsPlJtC/drBI3tEQvNo3d/MsplR9mv4F
 hljI0AOhcv+pLWZJIHWRq9BJ0W67W7fCfwQJrP0njwFaCKskeeo9q+JV0FT5lQRgcjKYcNXX3
 SyqLnpBk7y6Y9e6OUcoD7EsZP0RmcS2hna5I+n3ngg7GxUerq5D7kUESwzH57wvXuAZa+DJlv
 vBxS8Ov3IO5pdPAr1X2fHQt98+3dS7M4yxHwinC9C9G72T1F0ZaeMWs74y1QRMEyX75a/5ywJ
 RgbzGhL8jEGGamCW7XrlhtqH7izvpqTN3q+sFF8jgyjIVMj2MwZRC7tXuTfBJdgpnEc3Bv9Q8
 osvnpGFWUTBbrLY86/tjPmMx+jXeucLwBPlRpaGYysKafEar6Z0Ur37ATKqY+62qwgyFyCj2l
 1ehOoka4IuaRUw1HsHYpzZxhKVEUjcUoYm0HV2+G61qg8pkWk8necbwUfmCxk4NcxlWUjBIb6
 iYCnAfJ43N2IEG9fUyv1tBtRMSN4wK7XePG+CWwTwxeCS2sClG4PSFL86YIZ0CZ3wlplV4msU
 +IX3PGRMHrJ8H6K+mca0h0EhAVN0Azm42OHrwC90WyoQPlxqOXH/ibng0bDcdKMnyj52lzIKj
 rpeRBadMGUCme0g9U0S2Fr+SAlMay5OHEIKLdaW8s81j+MGXTNUmrdO40DdSlubodRX9Pd0gG
 +141kHXLS0jCN6VLiPKfj+4ByXDuWk768vMJR6ncPqTMzUXosuafIZitmzVNDo8a4SUU2m/pG
 YJ83dHfCXfhI6BSDUb12Mo1U3QJkGKZzdc+H+mYfmRtQlF0yWq175Q6e2oj8ml9CUACdkqpOK
 3XTwsV1A2PypBrUTZWH05N4g8rdxln4y7NPpDE4e/fE7EMHFeOFmhf9ghidt0Arzye3p0bgSS
 /pFAmMKenNo5bpIGFn7x2/bcTnA0x5zVre/kR5NKLPMltoNOxa4qkcCHgUzBOoNQNm8+o2SR3
 x49SDz7McEbK9w600KwCY3sphBVq7MctLSBEnSglhWCFnlKB6Zv0R4aJu2vfix3wq1/HcAeqW
 M8C4lrGlLXSb9Lyi1L7iy/1hQylmqav5YEob206C6KFxWIWvTY2pIy0PioBaHQ4RuOFW6pSoc
 C0nCrH8dobKHeP0lo21roylKZrcHduulxTZNOxkrAyDAU8sckgIeJDPZQtfkal36hcjHCGG7t
 7i0wKZTGwjvBOFGrzuYVuOV2Hn8a0mYfXNchFTOspkSnVSEbQlqUccZctvBp9U9Q7GV6/f5TG
 yk917kR5jFDadwmeYVPFAOhjWruNBvzH7WvXuXB8Wwe50qPyE6tzD53HKwptCnfeLa38XZn8L
 UUBGwtr3kIwhNZIKZAWblVV3QSv+dIy20RQdYOPBqC0Rn+wowFOfwGVSxO3nGPnIosqiTt051
 fqz5yOL1D9Yp29TeNNaUyw0ed0gk0+bfV2AYBLSs4rJSBOozkiemubvjAhTQN8iyAAWCDrydz
 rLbat2+ezgrq5yyKo1uYSy7rWzR/3lRrM6lK654W3zFJV4MdAVDZnCMT6iHAWqw1tCMTk+YAe
 WaA2orVQzdjcT1m4ZHJTT28zkCeBJzf59mQDRxjC/k6i39ji4s4KFvWD8HO++6EQ9JqXCZ4Hr
 MWMnKsuLY19QAIRqIDqi4mJmj6Iqs2uL4fdPdt2RYMmPfNmqw+i9jz9fYdBgwdFs4d3XdVgxh
 NcPawAUvh78v5lOwxNsjuFfLXOQ1rsqvqB7Ok3VFIqikI+r5cvtRxv0l56mVG+ZR2TA2yW3Fz
 CRQt+Q8yxbUtU9GzZk7mJH3c32GNF+b0ZHRXkPZwNeS07gzQtNbh2QDQO9K+wLU5t9tHZ/IH6
 AJ5xsjRb5isa7RJRRX5PHz8SOKpD2N5CoaORinUtoFt7c9RCGYDXbpYmPF1MpTZVGkZicS5i5
 FmejOoPJXPDyhqSnd9yok5dHsAavS7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782401439; x=1783006239; i=fiona.klute@gmx.de;
 bh=4BhcZHIaKbJvl7tq5PcVRO/JcbzDn4xulb0BG9kRzVA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=s0zR8YfC2wVnURSPVHQJkA1Dr56P0TWrsPfbYRfBy/0BVUE4ruLzbLMKchMOJUvW
 DIjQ0VaUyd+x5p9t+ob5ABPlafBlqg1DyTtbxVxjPXNasOz03G2Rqy6knOxqzZhQY
 W4xd/iaIKnBruGskOph6zi+pHv6zvTQh3H+P0oIaFbSZBlmt1SsQHlU4jRew/mWwK
 SNnDmqMkB0gAw0EHd4I+jQotz3wkEwWRqjQb9y6Zj7eJIUFfr5/MHBEg2PKvGPyvs
 9Biqy1brzGYGIXhseQYfF6YQGdA9ry3tCiffYdzKFnVK6JALL3zCK4RIWF7O/pbJp
 C+NT9Cw4xvjB2hxFGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=s0zR8YfC
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: lsfd needs headers
 >= 4.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 21.06.26 um 09:55 schrieb Bernd Kuhls:
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
> package to 2.41.1 which includes upstream commit
> https://github.com/util-linux/util-linux/commit/036d72749ca274294051b43fd66727061a772b9c
> adding a dependency to BPF_OBJ_NAME_LEN for lsfd.
> 
> BPF_OBJ_NAME_LEN was added to the kernel headers in version 4.15:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cb4d2b3f03d8eed90be3a194e5b54b734ec4bbe9
> 
> so we need to raise the header version dependency for lsfd.
> 
> The build error was found by the Gitlab pipelines for the defconfig
> bootlin-aarch64-glibc-old.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/bba1881a5eaf4a127a6580872c665fd095724b03
> 
>   package/util-linux/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index c63cec2a9c..3df149b3de 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -233,15 +233,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
>   config BR2_PACKAGE_UTIL_LINUX_LSFD
>   	bool "lsfd"
>   	depends on BR2_USE_MMU # libsmartcols
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
>   	depends on !BR2_TOOLCHAIN_USES_UCLIBC # process_vm_readv
>   	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
>   	help
>   	  List file descriptors (modern replacement for lsof)
>   
> -comment "lsfd needs a musl or glibc toolchain w/ headers >= 3.19"
> +comment "lsfd needs a musl or glibc toolchain w/ headers >= 4.15"
>   	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19 \
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 \
>   		|| BR2_TOOLCHAIN_USES_UCLIBC
>   
>   config BR2_PACKAGE_UTIL_LINUX_LSLOGINS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
