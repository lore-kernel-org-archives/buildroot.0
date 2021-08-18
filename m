Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC9CC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:24:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981F06108D
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 981F06108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F5AA400E0;
	Wed, 18 Aug 2021 22:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnPUNw7UD0nS; Wed, 18 Aug 2021 22:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF4D540200;
	Wed, 18 Aug 2021 22:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 249BE1BF869
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1460C402D1
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5PPtLkKNSOG for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 22:24:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8847D402C8
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 22:24:12 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GTygm3jvVZx06GTyhmhj0r; Thu, 19 Aug 2021 00:24:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629325451; bh=OZGNWUn+MYRELeRDoNsSreY4Qh5Fmpxt8HJzreClZzQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=lQvRocnE40dJI85O5kSeiYJ+3o8DkK/dZ5LAg7UPbCNG2Q81JsVFdTHqWQS4vZ0cx
 lo/OT2TzsGubmrWwpUfPMS0KiJnFTlAKmiSi7tLGxMh4RrJYrTh/p/3gmslD31aEax
 boi6E8+8MO9gnVy1LuYafek32XOCIzG9fnN2w/nVV1mje90W7JgmvCg7Sy5AZIJjbO
 /fDp4ozarW+0+xMyel3uCh5exJbuhyflUjj5fWCXmEtaqOft4eFZZcpLEokPtyQcT8
 wTPBOxLum3ey0vMO5EixR3iyB2P0np9TAn+OeZNtbV3aRRKVVAGYNEBPVLtjv5w4WE
 lmC0pvLLsznew==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Arnout Vandecappelle <arnout@mind.be>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <412e2832-62e5-8cbe-6a85-e797b3281978@benettiengineering.com>
Date: Thu, 19 Aug 2021 00:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818234453.03d2237a@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCFaYBKOjWI6gDKCGGZitK5fed0RFXyAIsAzu/1x+SkrWNVfg35y39C59AjzV2Cl7xHPjh6nrrmnj0i8ctv7vDDNW5lqM7qIk/KuhMkmvvcIIsyInhFM
 z2TILv0opvha0tD6nlkgV7q8nhrb+iH/MiDWzVXYFmxg5aQ9YD4/GYQ/4IShnkrcGmEtQu8SOBzZATWOQ5zEAwXWaky1khK7Bu/rkGniGlyiCoK7hhC8IWgk
 Xg316+/Ssoc2DSrGD0Ff+Bk6ad4gVJqbf3aFaNmODpk/Dd/Rc7CAg/UUbXmfbPGHQXYwYFQI+48aCnrIyHdKlEefZeoIenoNLzSybcYCmRgKro29KpVmuCFh
 JngPIQZVSdMosCUcdWKU2hzTB3jHJuwrsHCaVtD7dFUdykfxU7Wx8kp0Uh7jlN3fu11he2CW6TRSdG7xPNhu19UxBZNb0um3k7CDCIUiOnxLs1djvptYMkyx
 l8f1TF4iQXrSMFHACJjUssqJmTD9pMJy0zuow9AGKBCuDTuG7Sv9yN2x4gZ3LKiJYAyZGm3wkU8FUpxo7coyzxTlhohZOdPpeiJ6Zh5D4LG5AEKzSE0hApD5
 ZQc=
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKT24gOC8xOC8yMSAxMTo0NCBQTSwgVGhvbWFzIFBldGF6em9uaSB3cm90
ZToKPiBIZWxsbywKPiAKPiBNYXR0LCBGYWJyaWNlLCBBZGFtLCBIZXJ2w6ksIEdpdWxpbywgQmVy
bmQsIEd3ZW5oYWVsLCBBcm5vdXQsIEVyaWMsIHNlZQo+IGJlbG93ISA6LSkKPiAKPiBPbiBXZWQs
IDE4IEF1ZyAyMDIxIDA2OjU3OjIyIC0wMDAwCj4gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4+ICAgICAgICBicmFuY2ggfCAgT0sgfCBO
T0sgfCBUSU0gfCBUT1QgfAo+PiAgICAyMDIxLjAyLnggIHwgMzQgIHwgIDcgIHwgIDAgIHwgNDEg
IHwKPj4gICAgMjAyMS4wNS54ICB8IDM1ICB8ICA3ICB8ICAwICB8IDQyICB8Cj4+ICAgICAgbWFz
dGVyICAgfCAxODYgfCAzMCAgfCAgNSAgfCAyMjEgfAo+IAo+IFdlJ3JlIGRvaW5nIHJlYWxseSBn
b29kIG9uIHRoZSBtYXN0ZXIgYnJhbmNoIG5vdy4gTGV0J3Mgc2VlIHdoYXQgd2UKPiBoYXZlIGxl
ZnQhCj4gCgpbU05JUF0KCj4+ICAgICAgbTY4ayAgICAgfCAgICAgIGxpYm1vZHNlY3VyaXR5LTMu
MC41ICAgICAgfCBOT0sgfCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9i
OTI5ODBhNTYzZmU3ZWUzMzFlNzBmMjg4Y2UwNDFiZTBiZjI5ZDQwIHwKPiAKPiAvdG1wL2NjaXg5
OGc5LnM6IEFzc2VtYmxlciBtZXNzYWdlczoKPiAvdG1wL2NjaXg5OGc5LnM6IEZhdGFsIGVycm9y
OiBUcmllZCB0byBjb252ZXJ0IFBDIHJlbGF0aXZlIGJyYW5jaCB0byBhYnNvbHV0ZSBqdW1wCj4g
Cj4gQW5vdGhlciB0b29sY2hhaW4gaXNzdWUuLi4gQWRkaW5nIEdpdWxpbyBpbiB0aGUgbG9vcC4K
PiAKCkknbSByZXByb2R1Y2luZyBpdCBub3cuCgo+PiAgICAgIG9yMWsgICAgIHwgICAgICAgICBv
cGVuYWwtMS4yMS4xICAgICAgICAgIHwgTk9LIHwgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvNmEyODA5ZjhlZWZkZWVhY2E4YTRjNjExMzBhOGQ4NTUxMTY4NWNmYyB8Cj4g
Cj4gL2RhdGEvYnVpbGRyb290LWF1dG9idWlsZGVyL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBh
Y2thZ2Uvb3BlbmFsL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2Mvb3Ixay1i
dWlsZHJvb3QtbGludXgtdWNsaWJjLzkuMy4wLy4uLy4uLy4uLy4uL29yMWstYnVpbGRyb290LWxp
bnV4LXVjbGliYy9iaW4vbGQ6IENNYWtlRmlsZXMvT3BlbkFMLmRpci9hbC9maWx0ZXIuY3BwLm86
IHBjLXJlbGF0aXZlIHJlbG9jYXRpb24gYWdhaW5zdCBkeW5hbWljIHN5bWJvbCBhbEZpbHRlcmkK
PiAvZGF0YS9idWlsZHJvb3QtYXV0b2J1aWxkZXIvaW5zdGFuY2UtMC9vdXRwdXQtMS9wZXItcGFj
a2FnZS9vcGVuYWwvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9vcjFrLWJ1
aWxkcm9vdC1saW51eC11Y2xpYmMvOS4zLjAvLi4vLi4vLi4vLi4vb3Ixay1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjL2Jpbi9sZDogQ01ha2VGaWxlcy9PcGVuQUwuZGlyL2FsL2ZpbHRlci5jcHAubzog
cGMtcmVsYXRpdmUgcmVsb2NhdGlvbiBhZ2FpbnN0IGR5bmFtaWMgc3ltYm9sIGFsR2V0RmlsdGVy
aQo+IC9kYXRhL2J1aWxkcm9vdC1hdXRvYnVpbGRlci9pbnN0YW5jZS0wL291dHB1dC0xL3Blci1w
YWNrYWdlL29wZW5hbC9ob3N0L29wdC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL29yMWst
YnVpbGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8uLi8uLi9vcjFrLWJ1aWxkcm9vdC1s
aW51eC11Y2xpYmMvYmluL2xkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFkIHZhbHVlCj4gY29sbGVj
dDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4gCj4gVG9vbGNoYWluIGlzc3Vl
LiBHaXVsaW8sIGFuIGlkZWEgPwoKVGhpcyB3YWl0cyBmb3IgeW91IHRvIHJlbGVhc2UgbmV3IE9w
ZW5SaXNjIEJvb3RsaW4gdG9vbGNoYWluLiBBdCAKQnVpbGRyb290IGxldmVsIGFsbCBPcGVuUmlz
YyBwYXRjaGVzIHdlJ3JlIGNvdmVyZWQob24gZ2NjIDExLjEuMCB0b28gCmZyb20geWVzdGVyZGF5
KS4gU28gd2l0aCB0aGF0IHlvdSBzaG91bGQgYmUgYWJsZSB0byBjcmVhdGUgdGhlIG5ldyAKQm9v
dGxpbiBPcGVuUmlzYyBUb29sY2hhaW4gdGhhdCB3aWxsIGFsc28gZW5hYmxlIC1tY21vZGVsPWxh
cmdlIGZvciAKbGliZ2VvcyBhbmQgcHJvdG9idWYsIGJhc2ljYWxseSB0aGV5IHdpbGwgYmUgYm90
aCByZS1lbmFibGVkIGZvciAKT3BlblJpc2MgOi0pCgo+PiAgICAgIGk1ODYgICAgIHwgIG9wZW52
bXRvb2xzLTEwLjMuNS0xMDQzMDE0NyAgIHwgTk9LIHwgaHR0cDovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvZWIzZGZlNjc5NTM2YjU3OGEwZjE2NzYyMzEyYTk2YWRhNzE2MjA5NSB8
Cj4gCj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0zL291dHB1dC0xL2J1aWxk
L29wZW52bXRvb2xzLTEwLjMuNS0xMDQzMDE0Ny9saWIvaW5jbHVkZS92bV9hc3NlcnQuaDozMzE6
NzogZXJyb3I6IHN0YXRpYyBhc3NlcnRpb24gZmFpbGVkOiAic2l6ZW9mICh1bml4VGltZS0+dHZf
c2VjKSA9PSA0Igo+ICAgIDMzMSB8ICAgICAgIF9TdGF0aWNfYXNzZXJ0KGUsICNlKTsgXAo+IAo+
IEFub3RoZXIgcGFja2FnZSBub3QgcmVhZHkgd2l0aCA2NC1iaXQgdGltZV90IGl0IHNlZW1zLgoK
WWVwCgo+IFdlIGNsZWFybHkgZG9uJ3QgaGF2ZSB0aGUgbGF0ZXN0IHZlcnNpb24gb2Ygb3Blbi12
bS10b29scywgYnV0IGl0Cj4gaGFzbid0IGJlZW4gZml4ZWQgdXBzdHJlYW06Cj4gaHR0cHM6Ly9n
aXRodWIuY29tL3Ztd2FyZS9vcGVuLXZtLXRvb2xzL2Jsb2IvbWFzdGVyL29wZW4tdm0tdG9vbHMv
bGliL2hnZnMvaGdmc1V0aWwuYyNMMTE3Cj4gCj4gVGhpcyBpc3N1ZSBpcyBkaXNjdXNzZWQgYXQK
PiBodHRwczovL2dpdGh1Yi5jb20vdm13YXJlL29wZW4tdm0tdG9vbHMvaXNzdWVzLzQzMC4gVGhl
Cj4gbWV0YS1vcGVuZW1iZWRkZWQgbGF5ZXIgaGFzIHRoZSBwYXRjaAo+IC4vbWV0YS1uZXR3b3Jr
aW5nL3JlY2lwZXMtc3VwcG9ydC9vcGVuLXZtLXRvb2xzL29wZW4tdm0tdG9vbHMvMDAwMS1NYWtl
LUhnZnNDb252ZXJ0RnJvbU50VGltZU5zZWMtYXdhcmUtb2YtNjQtYml0LXRpbWVfLnBhdGNoCj4g
dG8gZml4IHRoaXMuCj4gCj4gQW55b25lIHZvbHVudGVlcmluZyB0byBmaXggdGhpcz8KPiAKCkkg
Y2FuIGRvIHRoYXQuIE9ubHkgdGhhdCBwYXRjaCBVUkwgaXMgYnJva2VuIGJ1dCB0aGVyZSBpcyBh
IFBSIGZvciB0aGF0IAp0byB0YWtlIHRoZSBwYXRjaDoKaHR0cHM6Ly9naXRodWIuY29tL3Ztd2Fy
ZS9vcGVuLXZtLXRvb2xzL3B1bGwvMzg3L2NvbW1pdHMvM2YwNTgwZjI1NDZkZThiZTdhY2YxYmM3
OGE1NWEyNTdiYzYzOGViZQpJIGNhbiBkZWFsIHdpdGggaXQuIEFsc28gd2UgZG9uJ3QgaGF2ZSBh
IG1haW50YWluZXIgZm9yIGl0LCBtYXliZSBJIGNhbiAKYmUgdGhlIG9uZS4KCj4+ICAgICAgb3Ix
ayAgICAgfCAgICAgICAgICAgIHVua25vd24gICAgICAgICAgICAgfCBOT0sgfCBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy85MmMwODZiMGM1YzJhMjk4YTgyYTZlYjljMjg5
ZGM1M2M1OGE1ZTVlIHwKPiAKPiBUb3AtbGV2ZWwgcGFyYWxsZWwgYnVpbGQsIG5vIGlkZWEgd2hh
dCB0aGUgaXNzdWUgaXMuCgpDYW4gc29tZWJvZHkgcG9pbnQgbWUgc29tZSBpZGVhIG9uIGhvdyB0
byBhcHByb2FjaCBUb3AtbGV2ZWwgcGFyYWxsZWwgCmJ1aWxkIGRlYnVnZ2luZz8gSSBhbHNvIGhh
dmUgc29tZSB1ZGlza3MgcGFja2FnZSBmYWlsdXJlIGR1ZSB0byB0aGF0LgpJIG1lYW4sIG5vdyB3
aGF0IEkgZG8gaXMgLi9icl9yZXByb2R1Y2VfYnVpbGQgU0hBMSwgdGhlbiBJIENUUkwtQyBhbmQ6
CiMgY2QgU0hBMQojIGNkIG91dHB1dAojIG1ha2UgcGFja2FnZS10aGF0LWZhaWxzCgpCdXQgd2l0
aCBUb3AtbGV2ZWwgSSBoYXZlIG1vcmUgb3V0cHV0LXgsIGhvdyBjYW4gSSByZWlzc3VlIHRoZSBj
b21tYW5kIAphbmQgYXJlIHRoZXJlIGFueSB0cmljayB0byBkZWJ1ZyBpdD8KCj4+ICAgICAgb3Ix
ayAgICAgfCAgICAgICAgICB6ZXJvbXEtNC4zLjQgICAgICAgICAgfCBOT0sgfCBodHRwOi8vYXV0
b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9mNmQ5YzNiMWU3YmUwZTNjNzIyZjc5YmFkN2I4
OWM3ZjFiZDBmMmYwIHwKPj4gICAgICBvcjFrICAgICB8ICAgICAgICAgIHplcm9tcS00LjMuNCAg
ICAgICAgICB8IE5PSyB8IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2M2
YjRmMzdlMzBiN2M2ZjgwM2QzMmU2ZDlkMGRlYzhlMTVlN2VjMzAgfAo+IAo+IEdpdWxpbyA/CgpI
ZXJlIGlzIHRoZSBzYW1lIHRoYXQgZ29lcyBmb3Igb3BlbmFsLCBleHRlcm5hbCBCb290bGluIE9w
ZW5SaXNjIApUb29sY2hhaW4gdXBkYXRlZCBtdXN0IHNvbHZlIGl0LgoKQmVzdCByZWdhcmRzCi0t
IApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
