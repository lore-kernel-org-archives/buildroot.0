Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1FDC0219B
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551C6413C4;
	Fri,  7 Feb 2025 17:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHlC3LCFEBBO; Fri,  7 Feb 2025 17:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2B141798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D2B141798;
	Fri,  7 Feb 2025 17:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D4081B7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D28B4176F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9BBS4knlBXcu for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC6F041824
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6F041824
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC6F041824
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:24:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.179]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1tLgbC1bEC-0127Jn; Fri, 07
 Feb 2025 18:23:58 +0100
Message-ID: <f815973c-63b3-4e52-beff-0cb6bb96a23e@gmx.de>
Date: Fri, 7 Feb 2025 18:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Jos=C3=A9_Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
 <20240831190126.366600-4-fiona.klute@gmx.de>
 <D7JTJDZQ286V.32BNGSIJOMVCI@gmail.com>
 <ba8e5707-9c21-4303-a9ae-1b307bc27173@gmx.de>
 <D7M4USL2KEM9.3MZ9W5ZLL5HOW@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <D7M4USL2KEM9.3MZ9W5ZLL5HOW@gmail.com>
X-Provags-ID: V03:K1:6Iy8rQWgFJk0CoV9LGLIK5Wi0chWwauVVtihJdbPfRIuoi3Y7we
 i2XG+uZDdeqgrPFETaOCIC98H3768MiT9IZljRnDUACZAk3Clc2YJcfyD4sKeNTld0WVc3R
 BeAJsho4mkiZ03wex0UCgk+OUDmelzPsMhiwBpR36oMm9U7/+c5AdaJWbnVZpHduJlqhJU8
 jVjOCXu41GZ5tUvJIVdZg==
UI-OutboundReport: notjunk:1;M01:P0:3nlDFxB7KDY=;z7ZdXkUSTujyYElOmALVAZRaENT
 ryqt5hlnl/NOdPZ0WNExPrN9o1RrlALV0ptswRocopufNJYQ1g6UaOuVhpN9mwA2us59y2JQU
 ckFpdejEQGil3ZKUonEpy1z5j1f/W6jx/t1IcrfN/+XyVnasAhhgI4je2x9bZsqAMknJXl2Fh
 e/37fzddc4aVGYRVBYOWyX+U3gB1miDh7G3ydvtGOgPvG744nhO9TEWytCoqgj2e7zwtssW9k
 PbsLXtezM2nAhU7b/Z7m3vn5Cibc7msdUxR1MDnshRGZAB4L/+KkC34yP8I4ka4pdt9ZGIw/9
 L1ASQRuQ1b6EwOklCrWVlzQ9zEsIxCH5os38uRh3Xb4q+4jSbYsouaiMFrGOsM3T9wwZQxED3
 W8ObRS5z48Lmt9PC02LYJUBY0PtN2M6r2eIDf+NiqlrJPz72WRLUXux3lwVBxKO7fOJWQ5UuI
 OW7DqFqhtwvTUPOIy7JW2e3eIuO+sZO3FEo2FxFMF1Jgo5y3SovoeTfaQD6v4eutcimFUjmTI
 i9jFi1cAfqoOUMxwAmMCokTgvnQOsL8IG0u2KFifxTtN7VLRvFv5fv8TzVflx7Qkz7RW/3ntW
 tAZRHpILMDViHJAjbUjBFZAS/EfLVIkD8X8xBlk3u2Gd24Zvy5616cu7oXv1MjoI4ufgUqcPt
 EX1YSz1HHqOc7E6h/F3DOvzE19qyXOokZPGQbkN8JMNVCC5O8+ytiByMCRB2lXvoXxPajbsLL
 4Ntxfffv4XSjqo08mu0eqoAzViCiKGRGBsmZGi8Nb/iHCKNXnbFYY6xs6nr/gaOE9OTDvsQmV
 Dm7lRgSAobVHNfaYrz4aLU+VhtWlMZylYrj1AQEq+GmfZZv62lqo92dDtotwite0plUCNbs9h
 gOcOluAkZ7mCxcZEJ1VAI5FWzDa8IZJrhksRipq8bNQq1XRJHgRLmE+/8s5FRJQJTDNw5GCgz
 C/44cUkJ484jPLpFSH3uF36LpfnV9GaW4Idmbdi0SmRldxRz9EQEwHMcfnospmaOkjF93O8eV
 WrLPDqbLQ6OqnXpQzsySJTWnmUlQDrfFRgK9ZZe4t5ApfbtwwPwGSIbeNxBGKIJ2tw/PJqUx0
 bTu4BQA3b3pOf2D2OktFV8OcgAi9vQicS9XsksGohivADlAsfRUg27kjIfB3y5CKSBTkk91rK
 Nnwk6fODizOJGXwxVIM06YVKBX3GBlyY/kf2Bn/lfcpNoAlVlmXc6hwO4fKFWR2NELQYiL5fb
 UmSNUXBn8XkZ/ZLokHCTcULbxgSXMl6EFbZHocZAmXQ91HlQjPdUhG9JcM7ThqHkHbljD0qxm
 aqoJCnSOLuZaOaB6ue7tmgUeHundmamz1GlroeSmJ6W4s+oSUgD0WVL1C9JWZPzCdEUmEKZ+l
 xA4KYTCBfM5xPFcm/9HhLdyPrt/ZgFowJ/wgxoAeaRBQDAjUFArP7lMmrp+4CZ1aUrrVPHhI9
 cCPYoSQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738949038; x=1739553838; i=fiona.klute@gmx.de;
 bh=ItPHDArs4wWcTj2xDH/0/ZMZt13SrIKFxFfctnAu90U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=G9TuWSIOMr+m36QHZfgh7CpkEFFN8feIgtPsX4V5aTVNiix7e1yjxAqmecy8Stvt
 ZE8lMhDeOcnjH/QfGPGqL0YgGwY7pz/aE+0kCkG708F2noO33r2WckKIO11UqRYER
 WwYNHxowmwndgkTKueFmeUBrW1U4Sfk13yrpQUkNF+bJi6p+6Bv88FcawSien5h4M
 uND4k1tZhH8ly7gUNv0UcqEoEeYsMmxtNERyr/NNUGXVYQgFwpvdkjrOePh27eMYg
 6Twazx+6coJkambiZ2mkJ39VIjM1wIW5RsZVl4pXYGF9Y1E5ELkOKKw86pJrQgKmO
 Jz4enJuu3UfHFe2Hbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=G9TuWSIO
Subject: Re: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2HDq2whCgpBbSAwNy4wMi4yNSB1bSAxMToxNCBzY2hyaWViIEdhw6tsIFBPUlRBWToKPiBP
biBXZWQgRmViIDUsIDIwMjUgYXQgNzowNyBQTSBDRVQsIEZpb25hIEtsdXRlIHdyb3RlOgo+Pj4+
IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9ib290LnNjci5pbiBiL2JvYXJkL3Jhc3Bi
ZXJyeXBpL2Jvb3Quc2NyLmluCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAw
MDAwMDAwMDAwLi5hNWM5ODZlZjk5Cj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2JvYXJk
L3Jhc3BiZXJyeXBpL2Jvb3Quc2NyLmluCj4+Pj4gQEAgLTAsMCArMSw5IEBACj4+Pj4gKyMgUGxl
YXNlIG5vdGUgdGhhdCB0aGlzIGlzIG9ubHkgYSBzYW1wbGUsIHdlIHJlY29tbWVuZCB5b3UgdG8g
Y2hhbmdlCj4+Pj4gKyMgaXQgdG8gZml0IHlvdXIgbmVlZHMuIFlvdSBzaG91bGQgb3ZlcnJpZGUg
dGhpcyBmaWxlIHVzaW5nCj4+Pj4gKyMgQlIyX1BBQ0tBR0VfSE9TVF9VQk9PVF9UT09MU19CT09U
X1NDUklQVF9TT1VSQ0UuCj4+Pj4gKwo+Pj4+ICsjIGxvYWQga2VybmVsIGZyb20gdGhlIHJvb3Qg
cGFydGl0aW9uCj4+Pj4gK2xvYWQgbW1jIDA6MiAke2tlcm5lbF9hZGRyX3J9IGJvb3QvSW1hZ2UK
Pj4+PiArZW52IHNldCBib290YXJncyAicm9vdD0vZGV2L21tY2JsazBwMiByb290d2FpdCBjb25z
b2xlPXR0eTEgY29uc29sZT10dHlBTUEwLDExNTIwMCIKPj4+PiArIyBib290IHVzaW5nIHRoZSBG
RFQgcHJvdmlkZWQgYnkgZmlybXdhcmUKPj4+PiArYm9vdGkgJHtrZXJuZWxfYWRkcl9yfSAtICR7
ZmR0X2FkZHJ9Cj4+Pgo+Pj4gVGhlIHJhc3BiZXJyeXBpNSB1c2VzIGEgZGlmZmVyZW50IGNvbnNv
bGUgKGkuZS4gY29uc29sZT10dHlBTUExMCwxMTUwMCkKPj4+IGFuZCB0aHVzIGl0IHJlcXVpcmVz
IGEgZGlmZmVyZW50IGZpbGUsIHJpZ2h0Pwo+Pgo+PiBFaXRoZXIgdGhhdCwgb3Igc29tZSBsb2dp
YyB0byBkZXRlY3QgZGlmZmVyZW50IGJvYXJkcyBhbmQgYWRqdXN0IHRoZQo+PiBjb21tYW5kIGxp
bmUgKGUuZy4gImZkdCBnZXQgdmFsdWUiIHRvIHJlYWQgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGFu
ZAo+PiBjb21wYXJlLCBvciBqdXN0IHRoZSBkZWZhdWx0IGJvYXJkX25hbWUgZW52aXJvbm1lbnQg
dmFyaWFibGUpLiBOb3Qgc3VyZQo+PiB3aGF0J3MgcHJlZmVyYWJsZSwgZG8geW91IGhhdmUgYW4g
b3Bpbmlvbj8KPj4KPgo+IE9oIEkgZ290IGl0Li4uCj4KPj4+IFdoYXQgZG8geW91IHRoaW5rIGFi
b3V0IGFkZGluZyBhIHN1ZmZpeCBzbyB3ZSBjYW4gbWFrZSB0aGUgZGlzdGluY3Rpb24KPj4+IGJl
dHdlZW4gdGhlIHdob2xlIFJhc3BiZXJyeSBQaSA0IDY0Yml0IGZhbWlsbHkgYW5kIGFuIGh5cG90
ZXRpY2FsCj4+PiBSYXNwYmVycnkgUGkgNSBib290LnNjciBmaWxlPwo+Pj4KPj4+IEkgYW0gdGhp
bmtpbmcgYWJvdXQgcmVuYW1pbmcgdGhlIGZpbGUgYm9vdF80XzY0Yml0LnNjciAob3IgbWF5YmUK
Pj4+IGJvb3RfY200aW9fNjRiaXQuc2NyIGl0IHRoZSBmaWxlIGlzIHNwZWNpZmljIHRvIHRoZSBD
TTQtSU8gQm9hcmQpIGFuZAo+Pj4gdXBkYXRlIEJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNf
Qk9PVF9TQ1JJUFRfU09VUkNFIGFjY29yZGluZ2x5Lgo+Pgo+PiBJJ2QgZXhwZWN0IGl0IHRvIHdv
cmsgd2l0aCBwcmV0dHkgbXVjaCBhbnkgNjQgYml0IFJQaSB2YXJpYW50LCBtYXliZQo+PiB3aXRo
IGFkanVzdG1lbnRzIHRvIHRoZSBib290YXJncyBhcyB5b3UgbWVudGlvbmVkLiBJdCdzIG5vdCBs
aWtlIHRoZQo+PiBzY3JpcHQgaXRzZWxmIGhhcyBhbnl0aGluZyBib2FyZCBzcGVjaWZpYywgdGhl
IHZhcmlhYmxlcyBhcmUgcHJvdmlkZWQgYnkKPj4gVS1Cb290LiBJZiB3ZSBnbyB3aXRoIHNlcGFy
YXRlIHNjcmlwdHMsIHRoZSBzdWZmaXggaXMgZmluZSB3aXRoIG1lLgo+Pgo+Cj4gLi4uLiBZb3Ug
YXJlIHJpZ2h0LCBzaW5jZSB0aGlzIGlzIGFsbCBhYm91dCBzY3JpcHRpbmcsIHRoaXMgY2FuIGJl
IGRvbmUKPiBhdCBydW50aW1lLiBUaHVzLCB3ZSBjYW4gaGF2ZSBhIHNpbmdsZSBib290LnNjciBj
b21wYXRpYmxlIHdpdGggZXZlcnkgcGkKPiAoMS00LTMyYml0LCBwaTEtNC02NGJpdCwgYW5kIHBp
NSksIGFuZCBhdm9pZCBhbm90aGVyIGhhc3NsZSBvZiBmaWxlcwo+IHdpdGggcHJlZml4ZXMuCgpJ
J2QgZXhwZWN0IHRoZSBzY3JpcHQgdG8gd29yayB3aXRoIHRoZSAzMmJpdCBSUGlzLCB0b28sIGJ1
dCB0aGV5J2xsIG5lZWQKYSBkaWZmZXJlbnQgVS1Cb290IGJ1aWxkIGRlZmNvbmZpZy4gcnBpX2Fy
bTY0X2RlZmNvbmZpZyBpcyBnZW5lcmljCih1c2luZyB0aGUgZmlybXdhcmUgRFQpLCBidXQgdGhl
cmUncyBubyBlcXVpdmFsZW50IGZvciAzMmJpdC4KCj4gU28sIElJVUMsIGFkZGluZyB0aGUgcmFz
cGJlcnJ5cGk1IGlzIGp1c3QgYWJvdXQgdXBkYXRpbmcgYm9vdC5zY3IgdGhpcwo+IHdheToKPgo+
IAkjIGxvYWQga2VybmVsIGZyb20gdGhlIHJvb3QgcGFydGl0aW9uCj4gCWxvYWQgbW1jIDA6MiAk
e2tlcm5lbF9hZGRyX3J9IGJvb3QvSW1hZ2UKPiAJLWVudiBzZXQgYm9vdGFyZ3MgInJvb3Q9L2Rl
di9tbWNibGswcDIgcm9vdHdhaXQgY29uc29sZT10dHkxIGNvbnNvbGU9dHR5QU1BMCwxMTUyMDAi
Cj4gCStpZiB0ZXN0ICIkYm9hcmRfbmFtZSIgPSAiNSBNb2RlbCBCIjsgdGhlbgo+IAkrICBlbnYg
c2V0IGJvb3RhcmdzICJyb290PS9kZXYvbW1jYmxrMHAyIHJvb3R3YWl0IGNvbnNvbGU9dHR5MSBj
b25zb2xlPXR0eUFNQTEwLDExNTIwMCIKPiAJK2Vsc2UKPiAJKyBlbnYgc2V0IGJvb3RhcmdzICJy
b290PS9kZXYvbW1jYmxrMHAyIHJvb3R3YWl0IGNvbnNvbGU9dHR5MSBjb25zb2xlPXR0eUFNQTAw
LDExNTIwMCIKPiAJK2ZpCj4gCSMgYm9vdCB1c2luZyB0aGUgRkRUIHByb3ZpZGVkIGJ5IGZpcm13
YXJlCj4gCWJvb3RpICR7a2VybmVsX2FkZHJfcn0gLSAke2ZkdF9hZGRyfQo+Cj4gU28gZm9yZ2V0
IHdoYXQgSSBzYWlkIGFib3V0IHRoZSBwcmVmaXgsIGFuZCBzdGljayB0byBib290LnNjciwgeW91
IGdvdAo+IHRoZSByaWdodCBhcHByb2FjaCA7KQo+Cj4gSGVyZSBhbGwgdGhlIGVudmlyb25tZW50
IGZvciB0aGUgcGk1Ogo+Cj4gCVUtQm9vdD4gcHJpbnRlbnYKPiAJYXJjaD1hcm0KPiAJYmF1ZHJh
dGU9MTE1MjAwCj4gCWJvYXJkPXJwaQo+IAlib2FyZF9uYW1lPTUgTW9kZWwgQgo+IAlib2FyZF9y
ZXY9MHgxNwo+IAlib2FyZF9yZXZfc2NoZW1lPTEKPiAJYm9hcmRfcmV2aXNpb249MHhEMDQxNzAK
PiAJYm9vdF90YXJnZXRzPW1tYyB1c2IgcHhlIGRoY3AKPiAJYm9vdGNtZD1ib290ZmxvdyBzY2Fu
Cj4gCWJvb3RkZWxheT0yCj4gCWNwdT1hcm12OAo+IAlkaGNwdWJvb3Q9dXNiIHN0YXJ0OyBkaGNw
IHUtYm9vdC51aW1nOyBib290bQo+IAlmZHRfYWRkcj0yZWZlYzEwMAo+IAlmZHRfYWRkcl9yPTB4
MDI2MDAwMDAKPiAJZmR0X2hpZ2g9ZmZmZmZmZmZmZmZmZmZmZgo+IAlmZHRjb250cm9sYWRkcj0z
ZjcyNmY4MAo+IAlmZHRmaWxlPWJyb2FkY29tL2JjbTI3MTItcnBpLTUtYi5kdGIKPiAJaW5pdHJk
X2hpZ2g9ZmZmZmZmZmZmZmZmZmZmZgo+IAlrZXJuZWxfYWRkcl9yPTB4MDAwODAwMDAKPiAJbG9h
ZGFkZHI9MHgxMDAwMDAwCj4gCXByZWJvb3Q9cGNpIGVudW07IHVzYiBzdGFydDsKPiAJcHhlZmls
ZV9hZGRyX3I9MHgwMjUwMDAwMAo+IAlyYW1kaXNrX2FkZHJfcj0weDAyNzAwMDAwCj4gCXNjcmlw
dGFkZHI9MHgwMjQwMDAwMAo+IAlzZXJpYWwjPXh4eHh4eHh4eHh4eHh4eHgKPiAJc29jPWJjbTI4
M3gKPiAJc3RkZXJyPXNlcmlhbCx2aWRjb25zb2xlCj4gCXN0ZGluPXNlcmlhbCx1c2JrYmQKPiAJ
c3Rkb3V0PXNlcmlhbCx2aWRjb25zb2xlCj4gCXVzYl9pZ25vcmVsaXN0PTB4MTA1MDoqLAo+IAl2
ZW5kb3I9cmFzcGJlcnJ5cGkKPgo+IEFuZCBJIHN1cHBvc2VkIHRoZSAzMmJpdCBzdXBwb3J0IGNh
biBiZSBhZGRlZCBieSB0ZXN0aW5nIHRoZSB2YXJpYWJsZQo+ICRjcHUuCgpJJ3ZlIGp1c3Qgc2Vu
dCB2MyB1c2luZyB0aGUgYm9hcmRfbmFtZSBjaGVjayB5b3Ugc3VnZ2VzdGVkLiBJIGRvbid0IGhh
dmUKICBhbiBSUGkgNSwgc28gSSdkIGFwcHJlY2lhdGUgaWYgeW91IGNvdWxkIHRlc3QgaXQuIEl0
IGRvZXMgYm9vdCBvbiBteQpDTTQgYmFzZWQgZGV2aWNlLgoKQmVzdCByZWdhcmRzLApGaW9uYQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
