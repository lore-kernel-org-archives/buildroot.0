Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45135C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0A94173A;
	Mon,  7 Mar 2022 21:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BnKZAW_A_KGY; Mon,  7 Mar 2022 21:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D51341733;
	Mon,  7 Mar 2022 21:49:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF7391BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD433404AA
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkHFXR6gBnGU for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:49:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD47404A9
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:49:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x15so25434542wru.13
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WcAXG4qW5y+zPFUuXLT02h42/ZsA1Dwja+nMtQng4s8=;
 b=Y8Hj8F0nUbU8h15NBCHfP1ApbpDZ5d0R2BTlQtOl5StbF8C+eykQUUzWrNCwtkqcmC
 rIROOYxUkmux1pSW7HHoIN/xfc5ClqXiXKCncGITxsO1xPDNj1eyrWlpVXVe8uxLWy1+
 ZYwhg+bbqayl2qzdToYvYdIMDMsRdjJyXyDXQB2hyVrb/PdLQSQF+1chwc1AqVzQQyNN
 WwlL/hYeu/UlInwr5gD5VbVv5TkVgGUYm4Gd8cE+V1PsRf3aBWnSXs7CziAhk9IJKdwp
 j2duTwRTwhihxT6CVhwdH0c3vW0pyzldQzl5ygswCgLrwojd2ghrE5eZ6pvYHFBA80rn
 QrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WcAXG4qW5y+zPFUuXLT02h42/ZsA1Dwja+nMtQng4s8=;
 b=bCSBE6iEMKNxWj6xNjnzelZgDsfFz5Brh4EruIc1X5nkN0mmsZzD5mS8QEU3p6cBJD
 eNaFK/ThZ3OOCM+7X+wv1N1DSpiHc0CMnpyI7NM3gOQL4/JtLIIURkW3RMB9CcpTCNmE
 5rvKyLFInMrtLntFIvF+jusAV421Kc63skL6GhnQTY18KFfb3lqFOVaa6GurW43QSiUZ
 bSuW2WQN2pC+qguoCJDpnvU+E6XI0E///W6Hw7tR73G6O/Rktu5a6wV+0DvTaEunycZm
 p5ZSEP9LQ4DL2QZMIFdIvNgbKw89kYEONjoezydIov0d3eo8ZB+EUaziUXBBV1T3wvjh
 aR6A==
X-Gm-Message-State: AOAM5315IeEoiWaOSGEy13C/qjGUs16lr9zXWVL3eXLL94QN01tOCoij
 wgdWaLymn4FfHVIGYRtnzx0=
X-Google-Smtp-Source: ABdhPJxpJ16yeVb8WCzNeZ4FSkHfdiLVo67VyV9vTO5RMhKKgKSolQqEbCfDuTjAQqsb3/vc+sus+A==
X-Received: by 2002:adf:8b9e:0:b0:1f0:25ca:6d81 with SMTP id
 o30-20020adf8b9e000000b001f025ca6d81mr9626537wra.247.1646689765147; 
 Mon, 07 Mar 2022 13:49:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm11773540wrq.3.2022.03.07.13.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:49:24 -0800 (PST)
Message-ID: <d2685b34-a9d7-3196-ef38-68c59be02d9d@gmail.com>
Date: Mon, 7 Mar 2022 22:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220225171148.701977-1-romain.naour@gmail.com>
 <87zgm15yir.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87zgm15yir.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH] package/Makefile.in: year2038 makes time_t
 64-bit for glibc toolchains
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
Cc: Christophe Blaess <christophe.blaess@logilin.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAwNy8wMy8yMDIyIMOgIDIwOjU0LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4gd3JpdGVzOgo+IAo+ICA+IFRvIHVzZSB0aW1lX3QgNjQtYml0IGZvciBnbGliYyA+
PSAyLjM0IHRvb2xjaGFpbnMgd2UgaGF2ZSB0byBzZXQgYm90aAo+ICA+IF9GSUxFX09GRlNFVF9C
SVRTPTY0IGFuZCBfVElNRV9CSVRTPTY0IGZvciBnbGliYyB0b29sY2hhaW5zLiBCdWlsZHJvb3QK
PiAgPiBhbHJlYWR5IGRlZmluZSBfRklMRV9PRkZTRVRfQklUUz02NCBzaW5jZSAyMDA4IFsxXSBi
ZWZvcmUgdGhlIGZpcnN0Cj4gID4gcmVsZWFzZSB0YWcgMjAwOS4wMi4KPiAKPiAgPiBfVElNRV9C
SVRTIGlzIG5vdCBuZWVkZWQgZm9yIG11c2wgbGliYyBzaW5jZSBpdCBhbHJlYWR5IHllYXIyMDM4
Cj4gID4gcmVhZHkgWzJdLgo+IAo+ICA+IFRoZSB1Y2xpYmMtbmcgbGliYyBvbmx5IHN1cHBvcnQg
dGltZV90IDMyLWJpdCAobG9uZyBpbnQpIHNvIGl0IHdpbGwgYmUKPiAgPiBhZmZlY3RlZCBieSB0
aGUgeWVhcjIwMzggaXNzdWUgWzNdLgo+IAo+ICA+IEZpeGVzIChpbiBGcmVuY2gsIGNoYXB0ZXIg
QnVpbGRyb290IDIwMjIgYW5kIEdsaWJDKToKPiAgPiBodHRwczovL3d3dy5ibGFlc3MuZnIvY2hy
aXN0b3BoZS8yMDM4Cj4gCj4gID4gUnVudGltZSB0ZXN0ZWQgd2l0aCBxZW11X2FybV92ZXhwcmVz
c19kZWZjb25maWcgYW5kIHRoZSBCb290bGluIGdsaWJjCj4gID4gYmxlZWRpbmctZWRnZSAyMDIx
LjExLTEgdG9vbGNoYWluLgo+IAo+ICA+IEJlZm9yZToKPiAgPiAgIyBkYXRlCj4gID4gIFR1ZSBK
YW4gMTkgMDM6MTQ6MDcgVVRDIDIwMzgKPiAgPiAgIyBkYXRlCj4gID4gIFRodSBKYW4gIDEgMDA6
MDA6MDAgVVRDIDE5NzAKPiAKPiAgPiBBZnRlcjoKPiAgPiAgIyBkYXRlCj4gID4gIFR1ZSBKYW4g
MTkgMDM6MTQ6MDcgVVRDIDIwMzgKPiAgPiAgIyBkYXRlCj4gID4gIFR1ZSBKYW4gMTkgMDM6MTQ6
MDggVVRDIDIwMzgKPiAgPiAgIyBkYXRlCj4gID4gIFR1ZSBKYW4gMTkgMDM6MTQ6MDkgVVRDIDIw
MzgKPiAKPiBBaGgsIGdvb2QgY2F0Y2guIE1heWJlIHNvbWV0aGluZyB0byBhZGQgYSBydW50aW1l
IHRlc3QgZm9yPwo+IAo+IENvbW1pdHRlZCwgdGhhbmtzLgoKU29ycnkgYnV0IEkgZ3Vlc3MgdGhp
cyBwYXRjaCBuZWVkcyBtb3JlIHRlc3RpbmcuCgo+IAo+ICA+IFsxXSA2MGI1ZWVlNzZlZGZhMTUz
ZWYxMThkMjc4OGM3NGFjOGRhMTQ5N2EwCj4gID4gWzJdIGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5v
cmcvY2dpdC9tdXNsL3RyZWUvaW5jbHVkZS9hbGx0eXBlcy5oLmluP2g9djEuMi4yI24zCj4gID4g
WzNdIGh0dHBzOi8vY2dpdC51Y2xpYmMtbmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvdHJl
ZS9pbmNsdWRlL3RpbWUuaD9oPXYxLjAuNDAjbjc1Cj4gID4gICAgIGh0dHBzOi8vY2dpdC51Y2xp
YmMtbmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvdHJlZS9saWJjL3N5c2RlcHMvbGludXgv
Y29tbW9uL2JpdHMvdHlwZXMuaD9oPXYxLjAuNDAjbjEwNgo+IAo+ICA+IFNpZ25lZC1vZmYtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAgPiBDYzogQ2hyaXN0b3Bo
ZSBCbGFlc3MgPGNocmlzdG9waGUuYmxhZXNzQGxvZ2lsaW4uZnI+Cj4gID4gLS0tCj4gID4gIHBh
Y2thZ2UvTWFrZWZpbGUuaW4gfCAyICstCj4gID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+ICA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL01ha2VmaWxl
LmluIGIvcGFja2FnZS9NYWtlZmlsZS5pbgo+ICA+IGluZGV4IDUwOGVhN2MzNjYuLmNkZTA1MGNh
ODIgMTAwNjQ0Cj4gID4gLS0tIGEvcGFja2FnZS9NYWtlZmlsZS5pbgo+ICA+ICsrKyBiL3BhY2th
Z2UvTWFrZWZpbGUuaW4KPiAgPiBAQCAtMTY3LDcgKzE2Nyw3IEBAIGVsc2UgaWZlcSAoJChCUjJf
Rk9SVElGWV9TT1VSQ0VfMikseSkKPiAgPiAgVEFSR0VUX0hBUkRFTkVEICs9IC1EX0ZPUlRJRllf
U09VUkNFPTIKPiAgPiAgZW5kaWYKPiAgCj4gID4gLVRBUkdFVF9DUFBGTEFHUyArPSAtRF9MQVJH
RUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0
Cj4gID4gK1RBUkdFVF9DUFBGTEFHUyArPSAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklM
RTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX1RJTUVfQklUUz02NAoKSSBub3Rp
Y2VkIHRoYXQgZ2xpYmMgMi4zNCBzdG9wIHRoZSBidWlsZCBpZiBfVElNRV9CSVRTIGlzIHNldCB3
aXRob3V0Cl9GSUxFX09GRlNFVF9CSVRTLgpXaGF0IGlmIHNvbWV0aGluZyAoYnVpbGQgc3lzdGVt
KSB1bnNldCBfRklMRV9PRkZTRVRfQklUUyA/ClRoZXJlIGlzIHNvbWV0aGluZyB3ZWlyZCB3aXRo
IGxpYnpsaWIgcGFja2FnZS4KCkkgc3VnZ2VzdCB0byBhcHBseSBmb3IgbmV4dCBmaXJzdCBhbmQg
YmFja3BvcnQgaXQgbGF0dGVyIHRvIHRoZSBzdGFibGUgYnJhbmNoLgoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+ICA+ICBUQVJHRVRfQ0ZMQUdTID0gJChUQVJHRVRfQ1BQRkxBR1MpICQoVEFSR0VU
X0FCSSkgJChUQVJHRVRfT1BUSU1JWkFUSU9OKSAkKFRBUkdFVF9ERUJVR0dJTkcpICQoVEFSR0VU
X0hBUkRFTkVEKQo+ICA+ICBUQVJHRVRfQ1hYRkxBR1MgPSAkKFRBUkdFVF9DRkxBR1MpCj4gID4g
IFRBUkdFVF9GQ0ZMQUdTID0gJChUQVJHRVRfQUJJKSAkKFRBUkdFVF9PUFRJTUlaQVRJT04pICQo
VEFSR0VUX0RFQlVHR0lORykKPiAgPiAtLSAKPiAKPiAgPiAyLjM1LjEKPiAKPiAgPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ICA+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiAgPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ICA+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
