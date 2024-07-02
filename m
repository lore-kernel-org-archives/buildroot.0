Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FAAC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 12:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CBBE41694;
	Tue,  2 Jul 2024 12:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFtYiZhHxTRv; Tue,  2 Jul 2024 12:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F5CF4022A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F5CF4022A;
	Tue,  2 Jul 2024 12:47:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BE431BF30D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0797B80DD0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Aq5txdDsmap for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 12:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7365E80D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7365E80D83
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7365E80D83
 for <buildroot@busybox.net>; Tue,  2 Jul 2024 12:47:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.29]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWASY-1suxcD1bGE-00IyMu; Tue, 02
 Jul 2024 14:47:19 +0200
Date: Tue, 2 Jul 2024 14:47:18 +0200
To: yann.morin@orange.com
Message-ID: <20240702144718.7a91e116@gmx.net>
In-Reply-To: <Zn1KBKfTGwI+jsXt@tl-lnx-nyma7486-2>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
 <20240626103623.7d7412c0@gmx.net> <ZnxsxFK_KDUDM652@landeda>
 <20240627095029.2d1fa5c0@gmx.net> <20240627102606.7de6b9cd@gmx.net>
 <Zn1KBKfTGwI+jsXt@tl-lnx-nyma7486-2>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:IJCGLEGdRj0mYivCUKBF92kcpdqGlrsoyyybiRww14q9u2i6zT1
 cP8xP2ekGs6P2qBtUPqivbALJIxtkqaUP+t73WG4C3JyzO7HoUpddcgLUAYnRqGIwxORHOP
 U5mOtliLJ19gcW1wCNiQL0JbEev8YGd5xqgK3v2fgX9JtUG4Cb76rdncE0kkel0OHAkBgAU
 5IZeCT3FuONNCFYGengxg==
UI-OutboundReport: notjunk:1;M01:P0:a49aPcErUZU=;cmhZPM/eAmsjvUn360Wb/YuDtq1
 MDa+mwt03JlHcFc5fpCSuBXzoGNKclmVlaSUEaV7e4DPo2zRjNeNjh272f0zfetbz90Xe5Luq
 wGRs4c5YfGXIERN65aTdQz/9EA0IAc0TMu8heb57JU4+6KKX1FzY+/CgS+RaPJ+D5dbkR7O1K
 7oboEcj5/v8p+0ymqQtRwnWTaChnVgngxvXUJrDYwJh1mceAdYCkBgGbPzrrAA4XTWioBM13h
 xQI6uK4nq0dBg3JAz26ZCGaGrg+k51LUcuXHHVsyqi941WyyD0ornBuo9nhl/IS+bveLFrsI8
 hYcyEKq5Y3K/zP4Bul7lYAsgVSPJbbM1y9xYBxXMlGr9uhyzkdUzO2VfBSODufDq5Qe1ku5iG
 NUo0s6j5jblC3WQq81errDw1lGbx9hQK1ejum+1KKYusJDTx23Qjrt9LXrll0o7WA018RAmwo
 mRcRinK1AyMvphmmochwHe/luydGFjzhJ+NmOksxe+usjGoQGUo/hzKDHaQQiUE23mV7u8Ki1
 TahsqSdMD/tRZfb0VF1TFmPqhlKrS31pC3oDM6+XfTzFU8c6lRn4G3uAqP5b3ZZKhqJjqIQ+w
 FIR9MJ0VLxMKH8u1VlLxdNNoIvV4/84Eo0Ilg+olBReX/fVRzDoEbvw/2ahLdAnM8+WlMkJNx
 I0c/9c45KTLWUgjaMdFWAbc8j9LhRDBxtas3tZGA+JpgB/RGL6t4ucFRJcpNAH3gAEgSzd3Qc
 GU8cLEZJv7d1SXvY1rDnqNn1udSzz0q79f0xF5U0NdRNGYeDGtXbA7KyuMU/4Wo4MRj9y4hkP
 j1twJwBp+LclALNZsaBxvKjI8lSwrvHW1XbVAJUpJ0JRU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719924439; x=1720529239; i=ps.report@gmx.net;
 bh=y4dsPlX7xl0zBBRp6/xSNVFaeIydqxl3tg1lWgm9s/U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ha/a/T4GU59X1k28uj28lQIZk7ezEvLYQ9uJf73dxd1f6XPnuteJ4y7P+jD1coDy
 cdfIn94tuNnPMu7+kztxgPjpJfZk6rE7PNObf2f9CnXF+yx23m/n5YHuQHTWEybDx
 YRZ7U9mENumCInnwtvVoFR3TZW69g5ijQNqqSp7loP0omIfh5lLQIymR43klXmoo6
 VTUGvCnrECfCsMb07mfzlip6c0gAZ7m3O2RWIe5rj1Y5PAGqOfVnF1SaLjgnBtzNx
 w612MNQhxL8IezG0mh344zlRmLR3jWGS0E2cP1vDWOwjFLnykSLypivHvoxBHudUF
 /fMe3LuMtHbMbJyqsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ha/a/T4G
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgKiwKCk9uIFRodSwgMjcgSnVuIDIwMjQgMTM6MTY6MjAgKzAyMDAsIHlhbm4u
bW9yaW5Ab3JhbmdlLmNvbSB3cm90ZToKCj4gUGV0ZXIsIEFsbCwKPiAKPiBPbiAyMDI0LTA2LTI3
IDEwOjI2ICswMjAwLCBQZXRlciBTZWlkZXJlciBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBUaHUsIDI3
IEp1biAyMDI0IDA5OjUwOjI5ICswMjAwLCBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5u
ZXQ+IHdyb3RlOiAgCj4gPiA+ID4gQW55d2F5LCBJIGhhdmUgbm93IHJldmVydGVkIHRoYXQgcGF0
Y2gsIGFzIGl0IHdhcyBleHBvc2luZyBhbm90aGVyIGlzc3VlCj4gPiA+ID4gd2l0aCBob3N0LXB5
dGhvbjMgKGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2lzc3Vl
cy81KSAgCj4gWy0tU05JUC0tXQo+ID4gVGhlIGZvbGxvd2luZyBxdWljayBwYXRjaCBzb2x2ZXMg
dGhlIGhvc3QteHogYW5kIGhvc3QtcHl0aG9uMyBidWlsZCBmYWlsdXJlcwo+ID4gZm9yIG1lOgo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94ei94ei5tayBiL3BhY2thZ2UveHoveHoubWsK
PiA+IGluZGV4IGIyMmI5Njg0OWQuLmIyMmNjYWM4NWYgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdl
L3h6L3h6Lm1rCj4gPiArKysgYi9wYWNrYWdlL3h6L3h6Lm1rCj4gPiBAQCAtMTIsNyArMTIsNyBA
QCBYWl9MSUNFTlNFID0gUHVibGljIERvbWFpbiwgQlNELTAtQ2xhdXNlLCBHUEwtMi4wKywgR1BM
LTMuMCssIExHUEwtMi4xKwo+ID4gIFhaX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJTkcu
MEJTRCBDT1BZSU5HLkdQTHYyIENPUFlJTkcuR1BMdjMgQ09QWUlORy5MR1BMdjIuMQo+ID4gIFha
X0NQRV9JRF9WRU5ET1IgPSB0dWthYW5pCj4gPiAKPiA+IC1YWl9DT05GX09QVFMgPSBcCj4gPiAr
WFpfQ09NTU9OX0NPTkZfT1BUUyA9IFwgIAo+IAo+IEkgdGhpbmsgX0NPTU1PTl9DT05GX09QVFMg
aXMgdG8gYmUgYXZvaWRlZDogaXQgaXMgZWFzeSB0byBhZGQvcmVtb3ZlCj4gb3B0aW9ucyBmcm9t
IHRoYXQgbGlzdCwgdGhhdCBhZmZlY3RzIGJvdGggYnVpbGRzLCBidXQgd2UgZG9uJ3Qgd2FudCB0
bwo+IGRvIHRoYXQgbW9zdCBvZiB0aGUgdGltZS4KPiAKPiBMb29raW5nIGF0IGEgZmV3IG90aGVy
IHBhY2thZ2VzLCB3ZSBsZWF2ZSB0aGUgaG9zdCBvcHRpb25zIHRvIGEgYmFyZQo+IG1pbmltdW0s
IHdoaWxlIHRoZXJlIGFyZSBtb3JlIG9wdGlvbnMgc3BlY2lmaWVkIGZvciB0aGUgdGFyZ2V0Lgo+
IAo+IEluIHRoaXMgY2FzZSwgSSBzZWUgdGhhdCBoZSBlbi9kZWNvZGVyIGxpc3QgaXMgaW5kZWVk
IHByb2JhYmx5IHNoYXJhYmxlLAo+IGJ1dCBJIHRoaW5rIEknZCBwdXQgaXQgaW4gYSB2YXJpYWJs
ZSBvZiBpdHMgb3duOgo+IAo+ICAgICBYWl9DT0RFUlMgPSBsem1hMTtsem1hMjtkZWx0YTt4ODY7
cG93ZXJwYztpYTY0O2FybTthcm10aHVtYjthcm02NDtzcGFyYztyaXNjdgo+ICAgICBYWl9DT05G
X09QVFMgPSBcCj4gICAgICAgICAtREVOQ09ERVJTPSIkKFhaX0NPREVSUykiIFwKPiAgICAgICAg
IC1EREVDT0RFUlM9IiQoWFpfQ09ERVJTKSIgXAo+ICAgICAgICAgLi4uCj4gCj4gICAgIEhPU1Rf
WFpfQ09ORl9PUFRTID0gXAo+ICAgICAgICAgLURFTkNPREVSUz0iJChYWl9DT0RFUlMpIiBcCj4g
ICAgICAgICAtRERFQ09ERVJTPSIkKFhaX0NPREVSUykiIFwKPiAgICAgICAgIC4uLgo+IAo+IEJ1
dCBkbyB3ZSBfaGF2ZV8gdG8gcGFzcyB0aGF0IGxpc3QgYXQgYWxsPyBDYW4ndCB3ZSBqc3V0IHRl
bGwgeHogdG8KPiBlbmFibGUgYWxsIG9mIHRoZW0/IEhvdyBjYW4gd2UgZGV0ZWN0IHRoYXQgYSBj
b2RlciBpcyBubyBsb25nZXIgdmFsaWQKPiBhbmQgc2hvdWxkIGJlIHJlbW92ZWQ/Cj4gCj4gSWYg
SSBsb29rIGF0IHRoZSByZXBvc2l0b3J5Cj4gCj4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS90dWth
YW5pLXByb2plY3QveHovYmxvYi92NS42LjIvQ01ha2VMaXN0cy50eHQjTDY5Mwo+IAo+ICAgICBz
ZXQoRU5DT0RFUlMgIiR7U1VQUE9SVEVEX0ZJTFRFUlN9IiBDQUNIRSBTVFJJTkcgIkVuY29kZXJz
IHRvIHN1cHBvcnQiKQo+IAo+IFNvIGl0IHdvdWxkIHNlZW0gdGhlIGRlZmF1bHQgaXMgdG8gZW5h
YmxlIGV2ZXJ5dGhpbmcsIGFuZCB3ZSBzaG91bGQganVzdAo+IGRyb3AgdGhlIG9wdGlvbiwgbm8/
Cj4gCj4gPiAgCS1ERU5DT0RFUlM9Imx6bWExO2x6bWEyO2RlbHRhO3g4Njtwb3dlcnBjO2lhNjQ7
YXJtO2FybXRodW1iO2FybTY0O3NwYXJjO3Jpc2N2IiBcCj4gPiAgCS1EREVDT0RFUlM9Imx6bWEx
O2x6bWEyO2RlbHRhO3g4Njtwb3dlcnBjO2lhNjQ7YXJtO2FybXRodW1iO2FybTY0O3NwYXJjO3Jp
c2N2IiBcCj4gPiAgCS1ETUFUQ0hfRklOREVSUz0iaGMzO2hjNDtidDI7YnQzO2J0NCIgXAo+ID4g
QEAgLTI1LDggKzI1LDkgQEAgWFpfQ09ORl9PUFRTID0gXAo+ID4gIAktREVOQUJMRV9TTUFMTD1P
RkYgXAo+ID4gIAktREVOQUJMRV9TQU5EQk9YPU9OIFwKPiA+ICAJLURDUkVBVEVfWFpfU1lNTElO
S1M9T04gXAo+ID4gLQktRENSRUFURV9MWk1BX1NZTUxJTktTPU9OIFwKPiA+IC0JLURCVUlMRF9T
SEFSRURfTElCUz1PRkYKPiA+ICsJLURDUkVBVEVfTFpNQV9TWU1MSU5LUz1PTgo+ID4gKwo+ID4g
K1haX0NPTkZfT1BUUyA9ICQoWFpfQ09NTU9OX0NPTkZfT1BUUykKPiA+IAo+ID4gIGlmZXEgKCQo
QlIyX1NZU1RFTV9FTkFCTEVfTkxTKSx5KQo+ID4gIFhaX0NPTkZfT1BUUyArPSAtREVOQUJMRV9O
TFM9T04KPiA+IEBAIC00MiwxMSArNDMsMTEgQEAgZW5kaWYKPiA+IAo+ID4gICMgd2UgYXJlIGJ1
aWx0IGJlZm9yZSBjY2FjaGUKPiA+ICBIT1NUX1haX0NPTkZfT1BUUyA9IFwKPiA+IC0JJChYWl9D
T05GX09QVFMpIFwKPiA+IC0JLURFTkFCTEVfTkxTPU9OIFwKPiA+ICsJJChYWl9DT01NT05fQ09O
Rl9PUFRTKSBcCj4gPiArCS1ERU5BQkxFX05MUz1PRkYgXCAgCj4gCj4gQnV0IHRoZSByZWFsIHF1
ZXN0aW9uIGlzOiB3aHkgZG9lcyBpdCBzb21ldGluZXMgd29yaywgYW5kIHNvbWV0aW1lcyBub3Q/
Cj4gVGhpcyBuZWVkcyB0byBiZSBleHBhaW5lZCBhbmQgdHJhY2VkIGluIHRoZSBjb21taXQgbG9n
LgoKSSBiZWxpZXZlIGl0IGlzIHRoZSBjb21iaW5hdGlvbiBvZiAnLURFTkFCTEVfTkxTPU9OJyBh
bmQgdGhlIGxlZ2FjeSBjbWFrZQp2ZXJzaW9uIGluIHRoZSBjb250YWluZXIgKDMuMTguNCksIHNl
ZSBDTWFrZUxpc3RzLnR4dDoKCiAyOTAgaWYoQ01BS0VfVkVSU0lPTiBWRVJTSU9OX0dSRUFURVJf
RVFVQUwgIjMuMjAiKQogMjkxICAgICBmaW5kX3BhY2thZ2UoSW50bCkKIDI5MiAgICAgZmluZF9w
YWNrYWdlKEdldHRleHQpCiAyOTMgCiAyOTQgICAgIGlmKEludGxfRk9VTkQpCiAyOTUgICAgICAg
ICBvcHRpb24oRU5BQkxFX05MUyAiTmF0aXZlIExhbmd1YWdlIFN1cHBvcnQgKHRyYW5zbGF0ZWQg
bWVzc2FnZXMpIiBPTikKWy4uLl0KIDMwNCAgICAgICAgIGlmKEVOQUJMRV9OTFMgQU5EIE5PVCBH
RVRURVhUX0ZPVU5EIEFORAogMzA1ICAgICAgICAgICAgICAgICBOT1QgRVhJU1RTICIke0NNQUtF
X0NVUlJFTlRfU09VUkNFX0RJUn0vcG8vdWsuZ21vIikKIDMwNiAgICAgICAgICAgICAjIFRoaXMg
b25seSBzZXRzIHRoZSB2YXJpYWJsZSwgbm90IHRoZSBjYWNoZSB2YXJpYWJsZSEKIDMwNyAgICAg
ICAgICAgICBzZXQoRU5BQkxFX05MUyBPRkYpClsuLi5dCiAzMzIgICAgIGVuZGlmKCkKIDMzMyBl
bmRpZigpCgpJc3N1ZSAoYW5kIHN1Z2dlc3RlZCBmaXgpIHJlcG9ydGVkIHVwc3RyZWFtOgoKCWh0
dHBzOi8vZ2l0aHViLmNvbS90dWthYW5pLXByb2plY3QveHovaXNzdWVzLzEyOQoJaHR0cHM6Ly9n
aXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9wdWxsLzEzMAoKPiAKPiBPbiBteSBGMzksIGFu
ZCBvbiBBcm5vdXQncyBGNDAsIGFzIHdlbGwgYXMgb24geW91ciBzeXN0ZW0sIGl0IHdhcwo+IHdv
cmtpbmcuIFdoYXQgY2hhbmdlZCBpbiB0aGUgcmVmZXJlbmNlIGJ1aWxkIGVudmlyb25tZW50IHRo
YXQgY2F1c2VzIHRoZQo+IGJ1aWxkIHRvIGZpYWw/IE9uIElSQywgQXJub3V0IGhhZCBhIHN1Z2dl
c3Rpb246ICJJIGd1ZXNzIHlvdSBoYXZlCj4gbGliaW50bC1kZXYgb3Igc29tZXRoaW5nIGluc3Rh
bGxlZCB0aGVyZT8iCj4gCj4gSW4gYW55IGNhc2UsIEkgYmVsaWV2ZSBzdWNoIGEgY29udmVyc2lv
biBjYW4gb25seSBiZSBkb25lIG9uY2UgdXBzdHJlYW0KPiBjb25pc2RlcnMgdGhlIGNtYWtlIGJ1
aWxkc3lzdGVtIGNvbXBsZXRlIGFuZCBvZmZpY2lhbCwgd2hpY2ggaXQKPiBjdXJyZW50bHkgZG9l
cyBub3QuCgpDaGFuZ2VkIHJlY2VudGx5LCBzZWUgJ0NNYWtlOiBOb3QgZXhwZXJpbWVudGFsIGFu
eW1vcmUnCihodHRwczovL2dpdGh1Yi5jb20vdHVrYWFuaS1wcm9qZWN0L3h6L2NvbW1pdC81Mjc5
ODI4NjM1YTk1YWJkZWY4MmU2OTFmYzQ5NzlkMzYyNzgwZTYzKQoKPiAKPiBUaGFuayB5b3UgZm9y
IHRlc3Rpbmcgb24geW91ciBzaWRlIGFzIHdlbGwhIPCfkY0KPiAKPiBJbiB0aGUgbWVhbnRpbWUs
IEkgaGFkIHN0YXJ0ZWQgYSB0ZXN0IGluIHRoZSBiYWNrZ3JvdW5kLCBidWlsZGlnIHRob3NlCj4g
Y29uZmlndXJhdGlvbnM6Cj4gCj4gICAtIGdsaWJjLCBubyBOTFMKPiAgIC0gZ2xpYmMsIE5MUwo+
ICAgLSBtdXNsLCBubyBOTFMKPiAgIC0gbXVzbCwgTkxTCj4gICAtIHVDbGliYy1ORywgbm8gTkxT
Cj4gICAtIHVDbGliYy1ORywgTkxTCj4gCj4gQWxsIDYgY29tYmluYXRpb25zIHlpZWxkIGEgY29u
ZmlndXJhdGlvbiB3aGVyZSB4eiAodGhlIHRhcmdldCB2YXJpYW50KQo+IGJ1aWxkcyBzdWNjZXNz
ZnVsbHkuIFNvIGl0IHNlZW1zIE5MUz1PTi9PRkYgd29ya3MgT0sgZm9yIHRoZSB0YXJnZXQuCgpE
aWQgeW91IHRlc3Qgb24gYSBsb2NhbCBzeXN0ZW0gb3IgY29udGFpbmVyICh3aGljaCBjbWFrZSB2
ZXJzaW9uKHMpKT8KClJlZ2FyZHMsClBldGVyCgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJ
Ti4KPiAKPiA+ICAJLURFTkFCTEVfVEhSRUFEUz1PTiBcCj4gPiAgCS1EQ01BS0VfQ19DT01QSUxF
Ul9MQVVOQ0hFUj0iIiBcCj4gPiAtCS1EQ01BS0VfQ1hYX0NPTVBJTEVSX0xBVU5DSEVSPT0iIgo+
ID4gKwktRENNQUtFX0NYWF9DT01QSUxFUl9MQVVOQ0hFUj0iIgo+ID4gCj4gPiAgJChldmFsICQo
Y21ha2UtcGFja2FnZSkpCj4gPiAgJChldmFsICQoaG9zdC1jbWFrZS1wYWNrYWdlKSkKPiA+IAo+
ID4gUmVnYXJkcywKPiA+IFBldGVyCj4gPiAKPiA+ICAgCj4gPiA+Cj4gPiA+IE1heWJlIGFsdGhv
dWdoIHJldmVydGluZyAncGFja2FnZS94ejogZXhwbGljaXRseSBzcGVjaWZ5IGFsbCBhdXRvY29u
ZiBvcHRpb25zJwo+ID4gPiAoYW5kICdwYWNrYWdlL3h6OiBlbmFibGUgeWVhcjIwMzggb3B0aW9u
JykgYXMgSSB1c2VkIHRoZSBzYW1lCj4gPiA+ICdIT1NUX1haX0NPTkZfT1BUUyA9ICQoWFpfQ09O
Rl9PUFRTKS4uLicgcGF0dGVybiBoZXJlPwo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBQZXRl
cgo+ID4gPiAgCj4gPiAKPiA+IFsuLi5dCj4gPiAgIAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
