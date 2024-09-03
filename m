Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B0CD13CF
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 09:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F21540966;
	Tue,  3 Sep 2024 09:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqsFDTzN1h78; Tue,  3 Sep 2024 09:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 497A44043F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 497A44043F;
	Tue,  3 Sep 2024 09:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEB541BF38E
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 09:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC5ED80896
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 09:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eh5CPfyzo_UG for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 09:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F3448083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F3448083F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F3448083F
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 09:49:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.24]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm2D-1srkcD048x-00540O; Tue, 03
 Sep 2024 11:49:30 +0200
Message-ID: <7dcfa2ab-5cf3-472f-a163-83d0ca65620f@gmx.de>
Date: Tue, 3 Sep 2024 11:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 Michael Walle <michael@walle.cc>, buildroot@buildroot.org
References: <20240902112735.728574-1-michael@walle.cc>
 <a9865fde-0c09-42dd-8cd2-d174412dce28@gmx.de>
 <D3W3GXLAY046.CI48SHS5EP44@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <D3W3GXLAY046.CI48SHS5EP44@gmail.com>
X-Provags-ID: V03:K1:i+cK4LG41xgNpZxZGX5CDQzsI+4CyUIpYotVh/KtG7NlJOvMu4q
 y2WTgEWfVZtqjHQxgLRH1KOVioJKMimCQXG5Xv4Tlh8ghMF0lu6h7krxKUwBQKolsctbQDR
 o1EJtAVHQHTBfcR6XX0pklkfcoSXlTYdpVsM04+589CQRi1hw/k0TXjZYtaB71y15wonueN
 CK9n0eERmkMKl0pL8n+BA==
UI-OutboundReport: notjunk:1;M01:P0:eEgthXET+as=;0eilBclu+JvjEHiTTioESl399q6
 OHIlXO3iDode4nJcL4ywM/+QiZ3HFGcrW8o1D3SuMnLI2lYnDxHzTj8uuN8fjkYDxNb21UIWk
 idSDkI3HjcsWeRDtmQThrAAVEuM3utKEPLGUwBCQBwGlUJEN7tRyb/Q49yuFGy51y42d5tw5s
 kWd7iopkICqYo5O8gj2zR+/9h6UYPMNkGk4SToAmo84e685Jasoq38vja8iABrM0GyxCXKQZO
 NVIUayoZE1OjK++7zJfcjOK7+gChApseTly8n8slow17KmWKlL5MgsQVc35Xr7ADUVmUOacXS
 kkaD1cgtwrbPEvAwJe0C+MUzx/5ntfThBjUMhnhtoK+Ehjt+E7ifcggwCgy0AnpyLnObNFlfp
 mtbVO8KblKfhMfKqXCOxvfT4H5iQaQk5gB7bMhZjO9aCWque6N4rqQMLIWwsLu3qVXu0sH9tu
 cUziSczYUeObQlOjEMEI0rehgs/SzdPM9t0SyN3pRvEvyHhHbBdNjs51qyHJiCx27s4HFG2m0
 /D4jQXQJsP9sHzr+OC6whba1/AYfmVHHjsIF36LVSRYe/55qguQoorncxhSS0ZK8RNBI8KVup
 MORfJQaMIwufAhqv5BWCBXEuheNbFDgfqKZ1TCTmzFDjXcKH43D03rDJZbJ/Ln8y/vB5gPw3W
 uZkhzji74z3h4tYBD/djtL3hT2eCvn9mFxUSl5W9LZH2feLxidQBL2PDP+w7CxdZCcdLu4LgY
 HnY9tBks+A2Ug4Q7qUj3xsx8HLKTahK5AbYmJw9y1t66tJ4gZFu4Uk3lRs4zcd9tr4wzadHDw
 mi++CKeFcllOr8gG47FU84fA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725356970; x=1725961770; i=fiona.klute@gmx.de;
 bh=I3l3F40awIdD8eh5tQESJVZPlc66+Thcr4lhvXQqRoI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=g9VNdH8we7vkSNBzF14nX3jQknPJTu1nNQc9tgCQKBwytssFSANq6zFZXp1qC1gq
 UjSV5LI97x9V6v4PP1O9wMkgyPA8NAJqKOVKgQ5298zYuUaySr92Y7HciieKlnI6B
 mcUte5iVUMAmGhBu8tW/0ulqr1TOYTQAOYXg++8DJLajR/xblZpJegEnNHRKFJCnY
 +duPL2LB5wGCQX+lRjkV8fWTc44/FVqe4P+B48YhQEtYVpAP+pdilYfEShGpSh/qW
 tIg7UrzH2oTXezatpQhbHSJi/3/aYJwk8Efmf6df1I8o/mf0fonlnavWXlA4kZ2tQ
 wKTXjcMBS8TSdlDEbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=g9VNdH8w
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Damien Le Moal <dlemoal@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMDIuMDkuMjQgdW0gMjI6NTIgc2NocmllYiBHYcOrbCBQT1JUQVk6Cj4gQWxsLCB0aGFuayB5
b3UgZm9yIHlvdXIgaW50ZXJlc3QgaW4gYnJpbmdpbmcgdGhlIHN1cHBvcnQgZm9yIGR0Ym8hCj4K
PiBPbiBNb24gU2VwIDIsIDIwMjQgYXQgNDozMiBQTSBDRVNULCBGaW9uYSBLbHV0ZSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+Pj4gLUxJTlVYX0RUU19OQU1FICs9ICQoYmFzZW5hbWUgJChmaWx0ZXIg
JS5kdHMsJChub3RkaXIgJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RU
U19QQVRIKSkpKSkKPj4+ICtMSU5VWF9DVVNUT01fRFRTX1BBVEggPSAkKGNhbGwgcXN0cmlwLCQo
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEgpKQo+Pj4gK0xJTlVYX0RUU19OQU1FICs9
ICQoYmFzZW5hbWUgJChmaWx0ZXIgJS5kdHMsJChub3RkaXIgJChMSU5VWF9DVVNUT01fRFRTX1BB
VEgpKSkpCj4+PiArTElOVVhfRFRTT19OQU1FUyArPSAkKGJhc2VuYW1lICQoZmlsdGVyICUuZHRz
bywkKG5vdGRpciAkKExJTlVYX0NVU1RPTV9EVFNfUEFUSCkpKSkKPj4+Cj4+PiAtTElOVVhfRFRC
UyA9ICQoYWRkc3VmZml4IC5kdGIsJChMSU5VWF9EVFNfTkFNRSkpCj4+PiArTElOVVhfRFRCUyA9
ICQoYWRkc3VmZml4IC5kdGIsJChMSU5VWF9EVFNfTkFNRSkpICQoYWRkc3VmZml4IC5kdGJvLCQo
TElOVVhfRFRTT19OQU1FUykpCj4+Cj4+IFRoaXMgbG9va3MgbGlrZSB0aGUgRFRCT3Mgd2lsbCBi
ZSBpbnN0YWxsZWQgdG8gJEJJTkFSSUVTX0RJUiBhbG9uZyB3aXRoCj4+IHRoZSBEVEJzLiBBdCBs
ZWFzdCBvbiBSUGkgcGxhdGZvcm1zIGl0J2QgYmUgcHJlZmVyYWJsZSB0byBiZSBhYmxlIHRvIHB1
dAo+PiB0aGVtIGluIGFuIG92ZXJsYXlzLyBkaXJlY3RvcnksIHRvIG1ha2UgaXQgZWFzaWVyIHRv
IGNyZWF0ZSB0aGUKPj4gc3RydWN0dXJlIGV4cGVjdGVkIGJ5IHRoZSBmaXJtd2FyZSBpbiBhIGdl
bmltYWdlIGNvbmZpZyB3aXRob3V0Cj4+IHRlbXBsYXRpbmcuIEkgZG9uJ3Qga25vdyBob3cgY29t
bW9uIHRoaXMgaXMgYWNyb3NzIG90aGVyIHBsYXRmb3JtcyB0aGF0Cj4+IHVzZSBEVCBvdmVybGF5
cy4KPj4KPgo+IElJUkMsIEkgaGF2ZSBzZWVuIHBsYXRmb3JtcyB0aGF0IHB1dCB0aGUgZHRiIGFu
ZCBkdGJvIGF0IHRoZSBzYW1lIHBsYWNlLgo+Cj4gSSBzdHJvbmdseSB0aGluayB0aGUgUGkgaXMg
dGhlIG9uZSB0aGF0IHB1dCB0aGUgZHRibyBpbiB0aGUgc3ViZGlyZWN0b3J5Cj4gb3ZlcmxheXMv
Lgo+Cj4+IFdvdWxkIGl0IGJlIHByYWN0aWNhbCB0byBhZGQgYW4gb3B0aW9uIHRvIGluc3RhbGwg
RFRCT3MgaW4gYQo+PiAoY29uZmlndXJhYmxlKSBzdWJkaXJlY3Rvcnk/Cj4+Cj4KPiBXZWxsLCBJ
IGRvIG5vdCByZWFsbHkgbGlrZSBhZGRpbmcgYW4gb3B0aW9uIHRvIHNldCB0aGUgdGFyZ2V0IGRp
cmVjdG9yeS4KPgo+IEluIG15IHBhdGNoIHNlcmllIEkgaGF2ZSBjb21wbGV0bHkgc3BsaXQgdGhl
IGR0Ym8gZnJvbSB0aGUgZHRiOyBzbyB5b3UKPiBjYW4ga2VlcCBvciBub3QgdGhlICJ0b3AiIGRp
cmVjdG9yeSBmb3IgZHRiIChicm9hZGNvbSkgYW5kIGZvciBkdGJvCj4gKG92ZXJsYXlzKS4KPgo+
IEkgZG8gbm90IHRoaW5rIGl0IHdvcnRoIGl0LCBidXQgaXQgaGVscHMgZm9yIHRoZSBQaS4KPgo+
IEluIHRoZSBjYXNlIG9mIHRoZSBQaSwgeW91IHNldDoKPgo+IAkjIEJSMl9MSU5VWF9LRVJORUxf
RFRCX0tFRVBfRElSTkFNRSBpcyBub3Qgc2V0Cj4gCUJSMl9MSU5VWF9LRVJORUxfRFRCT19LRUVQ
X0RJUk5BTUU9eQo+Cj4gVG8gaW5zdGFsbCBkdGJvcyB0byAkQklOQVJJRVNfRElSL292ZXJsYXlz
IGFuZCBkdGIgdG8gJEJJTkFSSUVTX0RJUi4KClRoaXMgaXMgZm9yIGluLXRyZWUgRFRCT3MgKHdo
aWNoIGlzIGRlZmluaXRlbHkgYSBnb29kIHRoaW5nIHRvCnN1cHBvcnQhKSwgbXkgcXVlc3Rpb24g
d2FzIGFib3V0IG91dC1vZi10cmVlIG9uZXMuIFRvIGV4cGxhaW4gbXkKcGVyc3BlY3RpdmU6IEkg
Y3VycmVudGx5IGhhdmUgYSBwYWNrYWdlIGluIGFuIGV4dGVybmFsIHRyZWUgdGhhdCB1c2VzCmhv
c3QtZHRjIHRvIGNvbXBpbGUgY3VzdG9tIERUU09zIGFuZCBpbnN0YWxsIHRoZW0gdG8KJEJJTkFS
SUVTX0RJUi9vdmVybGF5cywgYW5kIGl0J2QgYmUgbmljZSB0byByZXBsYWNlIHRoYXQgd2l0aCBn
ZW5lcmljCmluZnJhc3RydWN0dXJlIGZvciBvdmVybGF5cy4KCldpdGggTWljaGFlbCdzIHBhdGNo
IHRoYXQgc2hvdWxkIG1vc3RseSBiZSBwb3NzaWJsZSBhbHJlYWR5LCBJJ2QganVzdApoYXZlIHRv
IHNodWZmbGUgdGhlIERUQk9zIGFyb3VuZCBpbiBhIHBvc3QtYnVpbGQvcG9zdC1pbWFnZSBzY3Jp
cHQgdG8KcHV0IHRoZW0gd2hlcmUgdGhlIGZpcm13YXJlIG5lZWRzIHRoZW0sIGhlbmNlIG15IHF1
ZXN0aW9uIGFib3V0IGEKY29uZmlndXJhYmxlIHRhcmdldCBkaXIuIElmIHRoYXQncyBjb25zaWRl
cmVkIHRvbyBuaWNoZSBmb3IgZ2VuZXJpYwppbmZyYXN0cnVjdHVyZSwgZmFpciBlbm91Z2guIDot
KQoKQmVzdCByZWdhcmRzLApGaW9uYQoKPiAJaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDkwMjIwMzUzMy4zOTYxMTA4LTItZ2FlbC5wb3J0
YXlAcnRvbmUuZnIvCj4KPiBJIGhhdmUgbm8gc3Ryb25nIG9waW5pb24gYWJvdXQgeW91ciB3b3Jr
IChtb3JlIHNpbXBsZSkgYW5kIG1pbmUgKG1vcmUKPiBkdXBsaWNhdGlvbikuCj4KPj4gRWl0aGVy
IHdheSB0aGFuayB5b3UgZm9yIHdvcmtpbmcgb24gdGhpcyEKPj4KPgo+IFllcyB0aGFuayB5b3Ug
KGFnYWluKS4KPgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEZpb25hCj4+Cj4KPiBLaW5kIFJlZ2FyZHMs
Cj4gR2HDq2wKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
