Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA71C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 08:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DE3860A5C;
	Sun, 14 Jan 2024 08:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DE3860A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejreCXsLgErT; Sun, 14 Jan 2024 08:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8012460A61;
	Sun, 14 Jan 2024 08:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8012460A61
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 148451BF366
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE9CA607DE
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 08:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE9CA607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEyW1Y--N4PS for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 08:53:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEB9F6062F
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 08:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEB9F6062F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E65C913F8AE;
 Sun, 14 Jan 2024 09:53:16 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 09:53:16 +0100
Date: Sun, 14 Jan 2024 09:53:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <ZaOg_Ed68ndZ4Y_P@landeda>
References: <20240102145029.242682-1-sairon@sairon.cz>
 <20240102145029.242682-2-sairon@sairon.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102145029.242682-2-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705222400;
 bh=BXCmMlzrt63bJulG/SCKBo3sK8jodAY1XLY2/Jxg0Aw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdFLzoNcBBiGyvML1WCHsbnBSz0ZgsqtPiH+s++4TX13jN77etcDhV1Mj5AodVtnU
 4KnTcFw/9iUCYlOIRcHtFO5oMnSUt4tvloUkLLqOhEX0R7L90nvpe6Vz2CfOG269fZ
 LfoYi7k6fhXijMlzlF8ncPR3AMrfiblpZViKde8P7QNbKEkCGrv3Nqq9cBI+1N3Xi7
 nmm/4KomyOovS40i5sKQxD9zIqY29LDasF5HutMF0Tv+5dazNEXayMPTazj5c3Bd0e
 T+w5wOQalYwsCDqDgJAy0i/w7QjhPlNtrRJdEiyenH0CDytI5g9OyBye9AmJGm1P2O
 N9oOz0nbnlgrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tdFLzoNc
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-firmware: add WiFi and BT
 firmware for MT7921 and MT7922
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFuLCBBbGwsCgpPbiAyMDI0LTAxLTAyIDE1OjUwICswMTAwLCBKYW4gxIxlcm3DoWsgc3Bha2Ug
dGh1c2x5Ogo+IEFsdGhvdWdoIHNpbWlsYXIgaW4gbmFtZSwgdGhleSB1c2UgZGlmZmVyZW50IGtl
cm5lbCBkcml2ZXIgKHdpdGggdGhlCj4gZXhjZXB0aW9uIG9mIGNvbW1vbiBCbHVldG9vdGggZHJp
dmVyLCBidXQgdGhlIGZpcm13YXJlIGZpbGUgaXMgcXVpdGUKPiBsYXJnZSBhbnl3YXksIHNvIGl0
J3Mgd29ydGggaGF2aW5nIHRoZSBwb3NzaWJpbGl0eSB0byBiZSBzcGVjaWZpYykuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6Pgo+IC0tLQo+ICBwYWNr
YWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbiAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysr
KysrCj4gIHBhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsgfCAyNiArKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluIGIvcGFj
a2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KPiBpbmRleCAxMjIxYTgwOTg0Li44MTA3ZjA3
Yjg5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtZmlybXdhcmUvQ29uZmlnLmluCj4gKysr
IGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9Db25maWcuaW4KPiBAQCAtNTksNiArNTksMTYgQEAg
Y29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lCVAo+ICAJICBGaXJtd2FyZSBmaWxl
cyBmb3IgSW50ZWwgMzE2MC83MjYwLzcyNjUvODI2MC84MjY1IFdpcmVsZXNzCj4gIAkgIGJsdWV0
b290aCBzdXBwb3J0Lgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX01U
NzkyMV9CVAo+ICsJYm9vbCAiTWVkaWFUZWsgTVQ3OTIxIgo+ICsJaGVscAo+ICsJICBGaXJtd2Fy
ZSBmaWxlcyBmb3IgTWVkaWFUZWsgTVQ3OTIxIGJsdWV0b290aCBzdXBwb3J0Cj4gKwo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTVQ3OTIyX0JUCj4gKwlib29sICJNZWRpYVRl
ayBNVDc5MjIiCj4gKwloZWxwCj4gKwkgIEZpcm13YXJlIGZpbGVzIGZvciBNZWRpYVRlayBNVDc5
MjIgYmx1ZXRvb3RoIHN1cHBvcnQKCkkndmUgcmVuYW1lZCB0aGUgb3B0aW9ucyB0byBpbmNsdWRl
ICJNRURJQVRFSyIgdG8gbWF0Y2ggdGhlIGZvbGxvd2luZwpvcHRpb24sIGFuZCBhbHNvIHJlb3Jk
ZXJlZCB0aGVtIGFmdGVyLCB0b286Cgo+ICBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdB
UkVfTUVESUFURUtfTVQ3NjUwCj4gIAlib29sICJNZWRpYVRlayBNVDc2NTAiCj4gIAloZWxwCj4g
QEAgLTM4Myw2ICszOTMsMTYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX01F
RElBVEVLX01UNzZYMkUKPiAgCWhlbHAKPiAgCSAgTWVkaWFUZWsgTVQ3NngyZQo+ICAKPiArY29u
ZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX01FRElBVEVLX01UNzkyMQoKSGVyZSwgdGhl
IFdpRmktcmVsYXRlZCBvcHRpb25zIGFscmVhZHkgaGFkIHRoZSAiTUVESUFURUsiIHBhcnQsIHNv
IHRoZQpCVCBvbmVzIHdlcmUgcmVhbGx5IHN0YW5kaW5nIGFwYXJ0IHdpdGhvdXQgaXQuCgo+ICsJ
Ym9vbCAiTWVkaWFUZWsgTVQ3OTIxIgo+ICsJaGVscAo+ICsJICBNZWRpYVRlayBNVDc5MjEKPiAr
Cj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9NRURJQVRFS19NVDc5MjIKPiAr
CWJvb2wgIk1lZGlhVGVrIE1UNzkyMiIKPiArCWhlbHAKPiArCSAgTWVkaWFUZWsgTVQ3OTIyCj4g
Kwo+ICBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUVVBTENPTU1fNjE3NAo+ICAJ
Ym9vbCAiUXVhbGNvbW0gQXRoZXJvcyA2MTc0Igo+ICAJaGVscAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIGIvcGFja2FnZS9saW51eC1maXJt
d2FyZS9saW51eC1maXJtd2FyZS5tawo+IGluZGV4IGQwNjFjOWY0MDIuLmE2YTEzOGIzYTMgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5tawo+ICsr
KyBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKPiBAQCAtNTksNiAr
NTksMTggQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gaW50ZWwvaWJ0LSoKPiAgTElOVVhfRklS
TVdBUkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5pYnRfZmlybXdhcmUKPiAgZW5kaWYK
PiAgCj4gKyMgTWVkaWF0ZWsgTVQ3OTIxIEJsdWV0b290aAo+ICtpZmVxICgkKEJSMl9QQUNLQUdF
X0xJTlVYX0ZJUk1XQVJFX01UNzkyMV9CVCkseSkKPiArTElOVVhfRklSTVdBUkVfRklMRVMgKz0g
bWVkaWF0ZWsvQlRfUkFNX0NPREVfTVQ3OTYxXzFfMl9oZHIuYmluCj4gK0xJTlVYX0ZJUk1XQVJF
X0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VOQ0UubWVkaWF0ZWsKPiArZW5kaWYKPiArCj4gKyMg
TWVkaWF0ZWsgTVQ3OTIyIEJsdWV0b290aAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJ
Uk1XQVJFX01UNzkyMl9CVCkseSkKPiArTElOVVhfRklSTVdBUkVfRklMRVMgKz0gbWVkaWF0ZWsv
QlRfUkFNX0NPREVfTVQ3OTIyXzFfMV9oZHIuYmluCj4gK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNF
TlNFX0ZJTEVTICs9IExJQ0VOQ0UubWVkaWF0ZWsKPiArZW5kaWYKClRoZSBvcmRlcmluZyBpbiB0
aGUgLm1rIGlzIGEgYml0IGxvb3NlLCBidXQgdGhlcmUgaXMgc29tZSBraW5kIG9mCmFscGhhYmV0
aWNhbCBvcmRlcmluZyBhbnl3YXksIHNvIEkgbW92ZWQgYWxsIHRoZSBuZXcgTWVkaWF0ZWsgb3B0
aW9uCnRvZ2V0aGVyIHdpdGggdGhlIGV4aXN0aW5nIEJUIG9uZS4KCkFsc28sIHRoZXJlIHdhcyBu
byBoYXNoIGZvciB0aGUgbGljZW5zZSBmaWxlLCBzbyBJIGFkZGVkIG9uZS4gUGxlYXNlCmNoZWNr
IGl0IG9uIHlvdXIgc2lkZSwgdG8gZWIgc3VyZSB3ZSBnZXQgdGhlIHNhbWUuCgpBcHBsaWVkIHRv
IG1hc3RlciB3aXRoIHRoZSBhYm92ZSBmaXhlcyAsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgo+ICAjIFF1YWxjb21tIEF0aGVyb3MgUm9tZSA2MTc0QSBCbHVldG9vdGgKPiAgaWZl
cSAoJChCUjJfUEFDS0FHRV9MSU5VWF9GSVJNV0FSRV9RVUFMQ09NTV82MTc0QV9CVCkseSkKPiAg
TElOVVhfRklSTVdBUkVfRklMRVMgKz0gcWNhL3JhbXBhdGNoX3VzYl8wMDAwMDMwMi5iaW4gcWNh
L252bV91c2JfMDAwMDAzMDIuYmluCj4gQEAgLTM4Miw2ICszOTQsMjAgQEAgTElOVVhfRklSTVdB
UkVfRklMRVMgKz0gbWVkaWF0ZWsvbXQ3NjYyLmJpbiBtZWRpYXRlay9tdDc2NjJfcm9tX3BhdGNo
LmJpbgo+ICBMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLnJhbGlu
a19hX21lZGlhdGVrX2NvbXBhbnlfZmlybXdhcmUKPiAgZW5kaWYKPiAgCj4gKyMgTVQ3OTIxCj4g
K2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfTUVESUFURUtfTVQ3OTIxKSx5KQo+
ICtMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBtZWRpYXRlay9XSUZJX01UNzk2MV9wYXRjaF9tY3Vf
MV8yX2hkci5iaW4gXAo+ICsJCQltZWRpYXRlay9XSUZJX1JBTV9DT0RFX01UNzk2MV8xLmJpbgo+
ICtMSU5VWF9GSVJNV0FSRV9BTExfTElDRU5TRV9GSUxFUyArPSBMSUNFTkNFLm1lZGlhdGVrCj4g
K2VuZGlmCj4gKwo+ICsjIE1UNzkyMgo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1X
QVJFX01FRElBVEVLX01UNzkyMikseSkKPiArTElOVVhfRklSTVdBUkVfRklMRVMgKz0gbWVkaWF0
ZWsvV0lGSV9NVDc5MjJfcGF0Y2hfbWN1XzFfMV9oZHIuYmluIFwKPiArCQkJbWVkaWF0ZWsvV0lG
SV9SQU1fQ09ERV9NVDc5MjJfMS5iaW4KPiArTElOVVhfRklSTVdBUkVfQUxMX0xJQ0VOU0VfRklM
RVMgKz0gTElDRU5DRS5tZWRpYXRlawo+ICtlbmRpZgo+ICsKPiAgIyBxY2E2MTc0Cj4gIGlmZXEg
KCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUVVBTENPTU1fNjE3NCkseSkKPiAgTElOVVhf
RklSTVdBUkVfRklMRVMgKz0gYXRoMTBrL1FDQTYxNzQKPiAtLSAKPiAyLjM0LjEKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
