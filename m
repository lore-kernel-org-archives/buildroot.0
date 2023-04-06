Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5545EC7618D
	for <buildroot@archiver.kernel.org>; Thu,  6 Apr 2023 16:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5691607DE;
	Thu,  6 Apr 2023 16:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5691607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CLMsDHKmAuhz; Thu,  6 Apr 2023 16:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E18B660C1F;
	Thu,  6 Apr 2023 16:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E18B660C1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D39D01BF289
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 16:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD56E843C8
 for <buildroot@lists.busybox.net>; Thu,  6 Apr 2023 16:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD56E843C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9DfyBtD3grb for <buildroot@lists.busybox.net>;
 Thu,  6 Apr 2023 16:10:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29173843C0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29173843C0
 for <buildroot@buildroot.org>; Thu,  6 Apr 2023 16:10:15 +0000 (UTC)
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MqJuN-1qEovB3YTz-00nNB7; Thu, 06 Apr 2023 18:10:11 +0200
Message-ID: <194ac639-44e4-b267-7e8e-9739a15f12a4@vivier.eu>
Date: Thu, 6 Apr 2023 18:10:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: fr, en-US
From: Laurent Vivier <laurent@vivier.eu>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230201204848.2099336-1-laurent@vivier.eu>
 <20230201204848.2099336-2-laurent@vivier.eu>
 <52ab86d4-8008-9044-47e4-628c3da5ef7b@mind.be>
 <4c554ddf-38c1-ee71-826f-00e22f2cc180@vivier.eu>
In-Reply-To: <4c554ddf-38c1-ee71-826f-00e22f2cc180@vivier.eu>
X-Provags-ID: V03:K1:6QiLzSTx8p15fkcQBom5/m338iB5gfPXR/LScH/0ZhxejzEVV79
 Nt/UaU1IVrPkSLlrCCcCT604uTqFu7KT1my6/7wX1ClPONLZ5MaxJljg+wE8qK4qqMnjLtV
 oodhiGNHxfqxYBiilFuaC4E2waN+hfcCYRmKIpWXpD1zAjKyvLqb6mcEu7fs6h/VySwueqw
 m845KMroQquhfjn1UQTqg==
UI-OutboundReport: notjunk:1;M01:P0:qurhiARO+SY=;SygoyktMUJl2PdHtsj0E3bYJOhQ
 QYkOZ0r24JelsQtfFwG+UtPODZiDq902SDD07D/kyPfur8hUObBaVd1xuedSw8jjO/puWc14u
 9c6u/5Wm5ydN5YYST4kV7NtYiQflrr/Lht7J4sfUmp5D86e+IxLBu7nwvT148sJz3bJ2p0uyd
 0HGc49qcmYSYAkhEcbNA7e+E2l6j515W9gZFs9Q1Eujcb+dU/HlhEXb9NG917e3i3v6cxHKOT
 uFT0UyGE6fsvcoApEUwyFIQ2Oz3ff5VdF42kgcq+ihh8BXWZVTXe3wJo0oxVsCyFvN9zZIalQ
 vF/b7mWUQZ53S1HWB998+7rcnnlc5LgQA5h3DeFbxaTA9rTwPu/bJVGU5/DZDW5sS1fvQAXcZ
 mIsGlVGg5T1lClFvSqCtubcAGHo0uj2twVE4euL1yS13imvP9/4ccdTCqB7oWd3ftRf/eqSVs
 x/1yNbA2ceMloqkWD8DBc9CVXXOs/6+IlBaCok4wtxZOscLbqWVNlrprrgFMj7FmcnoRe9E2J
 w8rIQNy21AzbfoX/lGAB4K5XxtU8ox1eE8pCHPhevN+CYPhxb/k25s8qgHmVoh6J7UIJ5Ktc8
 PV3eW26q/Ux+ItuOsLkpbTrxzO03ppJ1Kg6CFvlcpBhCoiHuLWOwmE9C9Rnx8TdFzYZh2Pkub
 czofg7XtgDk73fqf3T4QOfFqhNImP1NuMFBD0nXk6g==
Subject: Re: [Buildroot] [PATCH v10 1/3] package: add petitboot
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDYvMDQvMjAyMyDDoCAxNToyNCwgTGF1cmVudCBWaXZpZXIgYSDDqWNyaXTCoDoKPiBIaSBB
cm5vdXQsCj4gCj4gdGhhbmsgeW91IGZvciB5b3VyIHdvcmsuCj4gCj4gVGhlIHVwZGF0ZSB0byBr
ZXhlYyAyLjAuMjYgaGFzIGJyb2tlbiB0aGUgYnVpbGQgd2l0aCBtNjhrOgo+IAo+IGNvbW1pdCA2
OTA1MzE4NmM5ZjE1NjE4NTUzNTdiZTU3NGM3MGMwYjNhZDBkZGNiCj4gQXV0aG9yOiBKdWxpZW4g
T2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IERhdGU6wqDCoCBXZWQgTWFyIDEgMjM6MDE6NTggMjAy
MyArMDEwMAo+IAo+ICDCoMKgwqDCoCBwYWNrYWdlL2tleGVjOiBidW1wIHRvIHZlcnNpb24gMi4w
LjI2Cj4gCj4gIMKgwqDCoMKgIFNlZSByZWxlYXNlIGFubm91bmNlOgo+ICDCoMKgwqDCoCBodHRw
czovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2tleGVjLzIwMjItRGVjZW1iZXIvMDI2
Mzk5Lmh0bWwKPiAKPiAgwqDCoMKgwqAgU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1
Lm9AZnJlZS5mcj4KPiAgwqDCoMKgwqAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAKPiAKPiBrZXhlYy9hcmNoL202OGsvYm9v
dGluZm8uYzogSW4gZnVuY3Rpb24gJ2Jvb3RpbmZvX2FkZF9ybmdfc2VlZCc6Cj4ga2V4ZWMvYXJj
aC9tNjhrL2Jvb3RpbmZvLmM6MjMxOjEzOiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiAnZ2V0cmFuZG9tJzsgZGlkIHlvdSAKPiBtZWFuICdzcmFuZG9tJz8gWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gIMKgwqAgMjMxIHzCoMKgwqDCoMKgwqDCoMKg
IGlmIChnZXRyYW5kb20oYmktPnJuZ19zZWVkLmRhdGEsIFJOR19TRUVEX0xFTiwgR1JORF9OT05C
TE9DSykgIT0gUk5HX1NFRURfTEVOKSB7Cj4gIMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF5+fn5+fn5+fgo+ICDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzcmFuZG9tCj4ga2V4ZWMvYXJjaC9tNjhrL2Jvb3RpbmZvLmM6MjMxOjU2OiBlcnJvcjog
J0dSTkRfTk9OQkxPQ0snIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+
ICDCoMKgIDIzMSB8wqDCoMKgwqDCoMKgwqDCoCBpZiAoZ2V0cmFuZG9tKGJpLT5ybmdfc2VlZC5k
YXRhLCBSTkdfU0VFRF9MRU4sIEdSTkRfTk9OQkxPQ0spICE9IFJOR19TRUVEX0xFTikgewo+IAo+
IEl0J3Mgc3RyYW5nZSBiZWNhdXNlIHN5cy9yYW5kb20uaCBpcyBjb3JyZWN0bHkgaW5jbHVkZWQu
Cj4gCj4gVGhpcyBjb21lcyBmcm9tOgo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ob3Jtcy9rZXhl
Yy10b29scy9jb21taXQvYjlkZTA1MTg0ODE2ZjE1ZjBkNjE1ZmUxOWM0MDY3YzEzODcyNTk4Ygo+
IAo+ICDCoMKgIG02OGs6IHBhc3Mgcm5nIHNlZWQgdmlhIEJJX1JOR19TRUVECj4gIMKgwqAgSW4g
b3JkZXIgdG8gcGFzcyBmcmVzaCBlbnRyb3B5IHRvIGtleGVjJ2Qga2VybmVscywgdXNlIEJJX1JO
R19TRUVECj4gIMKgwqAgZm9yIHBhc3NpbmcgYSBzZWVkLCB3aXRoIHRoZSBzYW1lIHNlbWFudGlj
cyB0aGF0IGtleGVjLXRvb2xzIGN1cnJlbnRseQo+ICDCoMKgIHVzZXMgZm9yIGkzODYncyBzZXR1
cF9kYXRhLgo+IAo+ICDCoMKgIExpbms6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMv
Yy9kYzYzYTA4NmRhZWU5MmM2M2UzCj4gIMKgwqAgU2lnbmVkLW9mZi1ieTogSmFzb24gQS4gRG9u
ZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+Cj4gIMKgwqAgU2lnbmVkLW9mZi1ieTogU2ltb24gSG9y
bWFuIDxob3Jtc0BrZXJuZWwub3JnPgo+IAo+IERvIHdlIG5lZWQgc29tZXRoaW5nIHNwZWNpYWwg
aW4gYnVpbGRyb290PwoKVGhlIHByb2JsZW0gc2VlbXMgdG8gY29tZSBmcm9tIHVjbGliYy0xLjAu
NDMsIGluIGluY2x1ZGUvc3lzL3JhbmRvbS5oIHRoYXQgY29uZGl0aW9uYWxseSBkZWZpbmVzIHRo
ZW06CgojaWYgZGVmaW5lZCBfX1VDTElCQ19MSU5VWF9TUEVDSUZJQ19fICYmIGRlZmluZWQgX19V
U0VfR05VCiMgaWYgMCAvKmRlZiBfX0FTU1VNRV9HRVRSQU5ET01fU1lTQ0FMTCAqLwojICBpbmNs
dWRlIDxsaW51eC9yYW5kb20uaD4KIyBlbHNlCiMgIHVuZGVmIEdSTkRfTk9OQkxPQ0sKIyAgdW5k
ZWYgR1JORF9SQU5ET00KLyoKICAqIEZsYWdzIGZvciBnZXRyYW5kb20oMikKICAqCiAgKiBHUk5E
X05PTkJMT0NLICAgICAgICBEb24ndCBibG9jayBhbmQgcmV0dXJuIEVBR0FJTiBpbnN0ZWFkCiAg
KiBHUk5EX1JBTkRPTSAgICAgICAgICBVc2UgdGhlIC9kZXYvcmFuZG9tIHBvb2wgaW5zdGVhZCBv
ZiAvZGV2L3VyYW5kb20KICAqLwojICBkZWZpbmUgR1JORF9OT05CTE9DSyAweDAwMDEKIyAgZGVm
aW5lIEdSTkRfUkFORE9NICAgMHgwMDAyCiMgZW5kaWYKLyogRklYTUU6IGFyZW4ndCB0aGVyZSBh
IGNvdXBsZSBvZiBfX3Jlc3RyaWN0IGFuZCBjb25zdCBtaXNzaW5nID8gKi8KZXh0ZXJuIGludCBn
ZXRyYW5kb20odm9pZCAqX19idWYsIHNpemVfdCBjb3VudCwgdW5zaWduZWQgaW50IGZsYWdzKQog
ICAgICAgICAgICBfX25vbm51bGwgKCgxKSkgX193dXI7CiNlbmRpZgoKVGhpcyBmaXhlcyB0aGUg
cHJvYmxlbToKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2tleGVjL2tleGVjLm1rIGIvcGFja2FnZS9r
ZXhlYy9rZXhlYy5tawppbmRleCA1NjJiMDkwMTJiNjMuLmU0ZWM0ZWNlMTMzMiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9rZXhlYy9rZXhlYy5taworKysgYi9wYWNrYWdlL2tleGVjL2tleGVjLm1rCkBA
IC0xMyw2ICsxMyw5IEBAIEtFWEVDX0NQRV9JRF9QUk9EVUNUID0ga2V4ZWMtdG9vbHMKICBLRVhF
Q19DUEVfSURfVkVORE9SID0ga2V4ZWMtdG9vbHNfcHJvamVjdAogIEtFWEVDX1NFTElOVVhfTU9E
VUxFUyA9IGtkdW1wCgorIyBfR05VX1NPVVJDRSBpcyBuZWVkZWQgdG8gaGF2ZSBkZWZpbml0aW9u
IG9mIGdldHJhbmRvbSgpIHdpdGggdWNsaWJjCitLRVhFQ19DT05GX0VOViArPSBDRkxBR1M9IiQo
VEFSR0VUX0NGTEFHUykgLURfR05VX1NPVVJDRSIKKwogICMgTWFrZWZpbGUgZXhwZWN0cyAkU1RS
SVAgLW8gdG8gd29yaywgc28gbmVlZGVkIGZvciAhQlIyX1NUUklQX3N0cmlwCiAgS0VYRUNfTUFL
RV9PUFRTID0gU1RSSVA9IiQoVEFSR0VUX0NST1NTKXN0cmlwIgoKVGhhbmtzLApMYXVyZW50Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
