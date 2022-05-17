Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCFBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDF8E40359;
	Tue, 17 May 2022 21:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIhTvtV9D1ye; Tue, 17 May 2022 21:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B2F401FB;
	Tue, 17 May 2022 21:08:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2517D1BF28E
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21DD941A53
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=cosmos-ink.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lwyD5i91Cx2 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net [95.217.104.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F50541A52
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EADA51C6E454; Tue, 17 May 2022 23:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652821686;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XxrizqnPgs5dqMgjb+DE2DZ8/9G7tcGsScrOYlUd+wQ=;
 b=WEbAp8EGawMLQVz/bJMlhgBjyZNI54UnRMOf703k5HmoXrsDwmYb2dl2UnhbMFLdYrfuEs
 9b53QKBfVlc3sgJyDt//e+XzQHJhiRKziCKT8vyK8k8r++bm2LCfr7+LAQ0ycHChS981zv
 C2oFlIPYMyVRCP40H8dWrQqm11qBxXow6Fn9HFo93ojMXqSKJZvC1dS4qvi0DV7iaA7vGN
 Es/Zt+TnbrIKby1ejkNnAWhrej7vN11Cz7sH08o45JFHCfuYIKtTKEvIHCTZlVrqxRxkxh
 +4B/eL/bfVg8a/zGanwuVAlmtsJOoeg0b06i8qRvLeihrU2CIDCX+Fk2EM+EKA==
Message-ID: <26c74944-3c0e-7f91-a81b-36a76734c4de@cosmos-ink.net>
Date: Tue, 17 May 2022 23:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220517141938.3395-1-linus@cosmos-ink.net>
 <20220517204027.GS1597494@scaer>
 <7700647d-b901-b966-8588-8ae73590cd78@cosmos-ink.net>
 <20220517210403.GV1597494@scaer>
In-Reply-To: <20220517210403.GV1597494@scaer>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: needs more test cases
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
From: Linus via buildroot <buildroot@buildroot.org>
Reply-To: Linus <linus@cosmos-ink.net>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBFcnIuLiB3ZSBkbyBoYXZlIGl0LCBubz8gU2VlOiBwYWNrYWdlL3B2Lw0KT2gsIGRpZG4ndCBu
b3RpY2Ugc29tZWhvdyHCoCBUaGFua3MgZm9yIHRoZSBoZWFkcyB1cCENCg0KR3JlZXRpbmdzLA0K
TGludXMgS2FzY2h1bGxhDQoNCkFtIDE3LjA1LjIyIHVtIDIzOjA0IHNjaHJpZWIgWWFubiBFLiBN
T1JJTjoNCj4gTGludXMsIEFsbCwNCj4NCj4gT24gMjAyMi0wNS0xNyAyMjo1NiArMDIwMCwgTGlu
dXMgc3Bha2UgdGh1c2x5Og0KPj4gWW91J3ZlIGJlZW4gcmVhbGx5IGhlbHBmdWwuIEkgcmVhbGx5
IGFwcHJlY2lhdGUgdGhlIHRpbWUgeW91IHNldCBhc2lkZSBmb3INCj4+IG1lLg0KPiBJdCBiZW5l
Zml0cyB1cyBhbGwsIHNvIHRoYW5rcyENCj4NCj4+IEh1Z2UgVGhhbmtzLA0KPj4gTGludXMgS2Fz
Y2h1bGxhDQo+Pg0KPj4gUC5TLjogSSBtaWdodCBwcm9iYWJseSBhZGQgdGhlIHB2IHV0aWxpdHkg
KHBpcGV2aWV3KSBzb21ldGltZSBsYXRlciBhcyBJDQo+PiBjb25zaWRlciB0aGUgdG9vbCBlc3Nl
bnRpYWwgYW5kIG5vdGljZWQgaXQgbWlzc2luZy4gQnV0IG1pZ2h0IGJlIGEgZmV3DQo+PiBtb250
aHMgdW50aWwgSSBnZXQgdG8gdGhhdC4gU2hvdWxkIGJlIGEgcHJldHR5IGVhc3kgYWRkdGlvbiB0
b3VnaC4NCj4gRXJyLi4gd2UgZG8gaGF2ZSBpdCwgbm8/IFNlZTogcGFja2FnZS9wdi8NCj4NCj4g
UmVnYXJkcywNCj4gWWFubiBFLiBNT1JJTi4NCj4NCj4+IEFtIDE3LjA1LjIyIHVtIDIyOjQwIHNj
aHJpZWIgWWFubiBFLiBNT1JJTjoNCj4+PiBMaW51cywgQWxsLA0KPj4+DQo+Pj4gT24gMjAyMi0w
NS0xNyAxNDoxOSArMDAwMCwgTGludXMgS2FzY2h1bGxhIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1
c2x5Og0KPj4+PiBGb3IgdGhlIG5ldyBwYXRjaCwgYWRkaW5nIGJsb2NrIHNpemUgb3B0aW9ucyAo
Y29tbWl0IDU1NWY4ZGZkKSwNCj4+Pj4gWWFubiBFLiBNT1JJTiByZXF1ZXN0ZWQgdXBkYXRlZCB0
ZXN0Y2FzZXMgdGhhdCBzcGVjaWZpY2FsbHkgZW5zdXJlDQo+Pj4+IHRoZSBleHRyZW1lIGJsb2Nr
c2l6ZXMgKDRLIGFuZCAxMDI0SykgZG9uJ3QgY2F1c2UgaXNzdWVzLg0KPj4+Pg0KPj4+PiBUaGlz
IHBhdGNoIHNwbGl0cyB0aGUgY3VycmVudCB0ZXN0IGNhc2UgaW4gMiwgdGVzdGluZyB3aXRoIGJv
dGgNCj4+Pj4gYmxvY2sgc2l6ZXMgYW5kIGVuc3VyaW5nIHRoZSBibG9jayBzaXplIHdhcyBhcHBs
aWVkIGluIHRoZSBzYW1lDQo+Pj4+IGZhc2hpb24gYXMgZm9yIHRoZSBzcGVjaWZpZWQgY29tcHJl
c3Npb24uDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IExpbnVzIEthc2NodWxsYSA8bGludXNA
Y29zbW9zLWluay5uZXQ+DQo+Pj4+IC0tLQ0KPj4+PiAgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9m
cy90ZXN0X3NxdWFzaGZzLnB5IHwgMTcgKysrKysrKysrKysrKysrKy0NCj4+Pj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0KPj4+PiBkaWZm
IC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2ZzL3Rlc3Rfc3F1YXNoZnMucHkgYi9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvZnMvdGVzdF9zcXVhc2hmcy5weQ0KPj4+PiBpbmRleCBhOTE0ZjVh
YWM3Li4wNzIzOWZjY2UyIDEwMDY0NA0KPj4+PiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
ZnMvdGVzdF9zcXVhc2hmcy5weQ0KPj4+PiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvZnMv
dGVzdF9zcXVhc2hmcy5weQ0KPj4+PiBAQCAtMywxMyArMywxNSBAQCBpbXBvcnQgb3MNCj4+Pj4g
ICBpbXBvcnQgaW5mcmEuYmFzZXRlc3QNCj4+Pj4gLWNsYXNzIFRlc3RTcXVhc2hmcyhpbmZyYS5i
YXNldGVzdC5CUlRlc3QpOg0KPj4+PiArY2xhc3MgVGVzdFNxdWFzaGZzTWluQmxvY2tzaXplKGlu
ZnJhLmJhc2V0ZXN0LkJSVGVzdCk6DQo+Pj4gSW4gZmFjdCBJIHRoaW5rIHdlIG5lZWQgdG8ga2Vl
cCB0aGUgZXhpc3RpbmcgdGVzdCB0aGF0IHVzZXMgdGhlIGRlZmF1bHQNCj4+PiB2YWx1ZSB0b28u
DQo+Pj4NCj4+Pj4gICAgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENIQUlO
X0NPTkZJRyArIFwNCj4+Pj4gICAgICAgICAgICIiIg0KPj4+PiAgICAgICAgICAgQlIyX1RBUkdF
VF9ST09URlNfU1FVQVNIRlM9eQ0KPj4+PiArICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19TUVVB
U0hGU19CU180Sz15DQo+Pj4+ICAgICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGUzRf
TFpPPXkNCj4+Pj4gICAgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQN
Cj4+Pj4gICAgICAgICAgICIiIg0KPj4+PiArICAgIGV4cGVjdGVkX2Jsb2Nrc2l6ZV9pbl9ieXRl
cyA9IDEwMjQgKiA0DQo+Pj4+ICAgICAgIGRlZiB0ZXN0X3J1bihzZWxmKToNCj4+Pj4gICAgICAg
ICAgIHVuc3F1YXNoZnNfY21kID0gWyJob3N0L2Jpbi91bnNxdWFzaGZzIiwgIi1zIiwgImltYWdl
cy9yb290ZnMuc3F1YXNoZnMiXQ0KPj4+PiBAQCAtMTgsNiArMjAsNyBAQCBjbGFzcyBUZXN0U3F1
YXNoZnMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToNCj4+Pj4gICAgICAgICAgIHNlbGYuYXNzZXJ0
RXF1YWwob3V0WzBdLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRm91bmQgYSB2
YWxpZCBTUVVBU0hGUyA0OjAgc3VwZXJibG9jayBvbiBpbWFnZXMvcm9vdGZzLnNxdWFzaGZzLiIp
DQo+Pj4+ICAgICAgICAgICBzZWxmLmFzc2VydEVxdWFsKG91dFszXSwgIkNvbXByZXNzaW9uIGx6
byIpDQo+Pj4+ICsgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwob3V0WzRdLCAiQmxvY2sgc2l6ZSB7
fSIuZm9ybWF0KHNlbGYuZXhwZWN0ZWRfYmxvY2tzaXplX2luX2J5dGVzKSkNCj4+Pj4gICAgICAg
ICAgIGltZyA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5z
cXVhc2hmcyIpDQo+Pj4+ICAgICAgICAgICBpbmZyYS5pbWdfcm91bmRfcG93ZXIyKGltZykNCj4+
Pj4gQEAgLTMxLDMgKzM0LDE1IEBAIGNsYXNzIFRlc3RTcXVhc2hmcyhpbmZyYS5iYXNldGVzdC5C
UlRlc3QpOg0KPj4+PiAgICAgICAgICAgY21kID0gIm1vdW50IHwgZ3JlcCAnL2Rldi9yb290IG9u
IC8gdHlwZSBzcXVhc2hmcyciDQo+Pj4+ICAgICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkN
Cj4+Pj4gKw0KPj4+ICAgICAgJCBtYWtlIGNoZWNrLWZsYWtlOA0KPj4+ICAgICAgV0FSTklORzog
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2ZzL3Rlc3Rfc3F1YXNoZnMucHk6NDA6MTogRTMwMiBleHBl
Y3RlZCAyIGJsYW5rIGxpbmVzLCBmb3VuZCAxDQo+Pj4NCj4+PiBZZXMsIGxpa2UgY2hlY2stcGFj
a2FnZSwgdGhpcyBpcyAxMDAlIHRvdGFsbHkgdW5kb2N1bWVudGVkLiA6LV0NCj4+Pg0KPj4+IFNv
LCBJJ3ZlIHJlc3RvcmVkIHRoZSBvcmlnaW5hbCB0ZXN0IHRoYXQgY2hlY2tzIHRoZSBkZWZhdWx0
LCBhbmQgdHdvIG5ldw0KPj4+IHRlcnN0cyB0aGF0IGNoZWNrIHRoZSBtaW4gYW5kIG1heCwgYW5k
IEkgZml4ZWQgdGhlIGZsYWtlOCBpc3N1ZS4NCj4+Pg0KPj4+IEFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuDQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IFlhbm4gRS4gTU9SSU4uDQo+Pj4NCj4+Pj4g
KyMgUmV1c2luZyBUZXN0U3F1YXNoZnNNaW5CbG9ja3NpemUncyB0ZXN0X3J1bigpLCBidXQgY2hh
bmdlDQo+Pj4+ICsjIGJsb2Nrc2l6ZSBpbiBjb25maWcgdGhlIG1heGl1bSB0byBlbnN1cmUgYWxs
IGV4dGVtZXMgd29yay4NCj4+Pj4gK2NsYXNzIFRlc3RTcXVhc2hmc01heEJsb2Nrc2l6ZShUZXN0
U3F1YXNoZnNNaW5CbG9ja3NpemUpOg0KPj4+PiArICAgIGNvbmZpZyA9IGluZnJhLmJhc2V0ZXN0
LkJBU0lDX1RPT0xDSEFJTl9DT05GSUcgKyBcDQo+Pj4+ICsgICAgICAgICIiIg0KPj4+PiArICAg
ICAgICBCUjJfVEFSR0VUX1JPT1RGU19TUVVBU0hGUz15DQo+Pj4+ICsgICAgICAgIEJSMl9UQVJH
RVRfUk9PVEZTX1NRVUFTSEZTX0JTXzEwMjRLPXkNCj4+Pj4gKyAgICAgICAgQlIyX1RBUkdFVF9S
T09URlNfU1FVQVNIRlM0X0xaTz15DQo+Pj4+ICsgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNf
VEFSIGlzIG5vdCBzZXQNCj4+Pj4gKyAgICAgICAgIiIiDQo+Pj4+ICsgICAgZXhwZWN0ZWRfYmxv
Y2tzaXplX2luX2J5dGVzID0gMTAyNCAqIDEwMjQNCj4+Pj4gLS0gDQo+Pj4+IDIuMzUuMQ0KPj4+
Pg0KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
Pj4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
DQo+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
