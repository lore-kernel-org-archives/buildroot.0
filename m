Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87DCFF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 07:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8947C612F3;
	Wed, 29 Apr 2026 07:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r28xZiuPGLCc; Wed, 29 Apr 2026 07:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1F5612F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777448525;
	bh=LbhIgYrBMR/jkDLHmKDOTlzS/FaiXHbxZuOIybHJzXc=;
	h=Date:From:In-Reply-To:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jbv0l5n+3oyWIEuqAlD9fOXMltN4AmqqJ+WlUUdVAd2tz891Nl0Rc7gn+Hv74zN+P
	 wK7CjsZgHssFKRB4YI9CRvc1VI4foae2HugLdt+/GJFX4AkfH9zmbyWEyqD3J+HEfU
	 T+7z6t78/LRE+2CYsC7LjAKreo8fQ+cGlWvh0rD2QRbJJ9yqMDQYJ5Ek4LC0va8jD3
	 7G9Hj7VWeP5n3ij37IIzROoQS5fh7NeggDGtUBzzSiGRVGyoh9PdZwYmrkqCqm0HUP
	 u+NcYtqUvsVVo7sNnB6bh83YV7q3erGzsydm9J/VjAtIQrpr/czzyTUDy/dAC0kNgR
	 8JO0t04KidMsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D1F5612F6;
	Wed, 29 Apr 2026 07:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B821B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2BD040AE7
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTgVQw-jRU31 for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 07:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.233;
 helo=cvsmtppost16.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C4854044A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C4854044A
Received: from cvsmtppost16.nm.naver.com (cvsmtppost16.nm.naver.com
 [114.111.35.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C4854044A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 07:42:01 +0000 (UTC)
X-Originating-IP: 125.132.232.68
X-Works-Smtp-Source: srKwFAbXFqJCpNmlKxurWHF0
Received: from cvsendbo010.nm ([10.112.20.44])
 by cvsmtppost16.nm.naver.com with ESMTP id F5aRWQ4zRQK-3x7khXqE7Q
 for <multiple recipients>; Wed, 29 Apr 2026 07:41:59 -0000
X-Session-ID: 9992ca9023d53fbafa94e9dce8a05ddd0a9b6f1187bb8f7bdc9f683ecca8243e
MIME-Version: 1.0
Message-ID: <40f8359b3e468bd18117bc655d762b@cweb011.nm>
Date: Wed, 29 Apr 2026 16:41:59 +0900
From: =?utf-8?B?Q0hFUk5JQUVWIEFORFJFSQ==?= <dungeonlords789@naver.com>
In-Reply-To: <1e38b2e2-7d54-4c80-9339-c0650e7b0ec3@gmx.de>
References: <20260427112820.3753844-1-dungeonlords789@naver.com>
 <1e38b2e2-7d54-4c80-9339-c0650e7b0ec3@gmx.de>
Importance: normal
To: =?utf-8?B?RmlvbmEgS2x1dGU=?= <fiona.klute@gmx.de>,
 <buildroot@buildroot.org>
Cc: <hi@senzilla.io>, <romain.naour@gmail.com>, <kory.maincent@bootlin.com>,
 <vincent.stehle@arm.com>, <ju.o@free.fr>, <jiaxun.yang@flygoat.com>,
 <fancp2007@gmail.com>
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: p/YljAIYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1777448519; bh=OQc53km6z6j/7N9Srb52hww3TXJ+qwmgcPcZMvStOX8=;
 h=Message-ID:Date:From:To:Subject:From:Subject:Feedback-ID:
 X-Works-Security;
 b=KTvJmmoTF0b4tKGdOT/gnjkj0Z6BNC+Vy59op94nTgFF0dTWU0uI7LAEMZcud5rn+
 gwV84uTsIrq7zuX/smI5YUeuO7P4pgUOaXpedTdU6mHph0oLDYmUR/shLkPyIHneYv
 KyAlYOVX4IEc1CIwOl7jfsmMkvwgq0aBs6gWsYIGH1LrYLi1ZdsOrIAkgFVoKlJuWb
 LmwoR2lREbSc9zPsvwA9n/5aCqIV3glRUAwsneAhrCFMCnJUVOhsLNK/6tDQLgsheQ
 SqBN/wfafBn5noxeoGNwiavOK9+DbmUZDSgRZJpkutGd0qhjjWWkd0F+iDeLWICKX6
 NetAcRSa25vCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=KTvJmmoT
Subject: Re: [Buildroot] 
	=?utf-8?q?=5BPATCH_1/1=5D_boot/edk2=3A_fix_descripti?=
	=?utf-8?q?on?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dGhhbmsgeW91IGZvciB5b3VyIGF0dGVudGlvbiwKMSkgIlBsZWFzZSBkb24ndCByZW1vdmUgdGhl
IHVwc3RyZWFtIFVSTC4gSWYgaXQncyBpbmNvcnJlY3Qvb3V0ZGF0ZWQgdXBkYXRlIGl0IGFuZCBu
b3RlIHRoZSBjaGFuZ2UgKGlkZWFsbHkgd2l0aCByZWZlcmVuY2UpIGluIHRoZSBjb21taXQgbWVz
c2FnZSwgb3RoZXJ3aXNlIGtlZXAgaXQgYXMtaXMuIgp1cHN0cmVhbSBVUkwgaXMgbG9jYXRlZCBp
biBjb3JyZXNwb25kaW5nIG1rIGZpbGUsIG5vdCBpbiBoZWxwLiBBbmQgZ2l0aHViLmNvbS90aWFu
b2NvcmUvdGlhbm9jb3JlLmdpdGh1Yi5pby93aWtpL0VESy1JSSBpcyBub3QgdXBzdHJlYW0sIGl0
IGlzIHdpa2kKMikgIkFsc28sIEkgZG9uJ3QgdGhpbmsgaXQncyBnb29kIHRvIHJlbW92ZSB0aGUg
Z2VuZXJhbCBwYWNrYWdlIGRlc2NyaXB0aW9uLCBiZXR0ZXIgYWRkIGEgc2VudGVuY2UgYWJvdXQg
aXQgcHJvdmlkaW5nIE9WTUYgZm9yIGJvb3RpbmcgaW4gUWVtdS4iCm9yaWdpbmFsIGRlc2NyaXB0
aW9uIGlzIHVuY2xlYXIuIEl0IGNhbiBvbmx5IGJlIHJlY29nbml6ZWQgYnkgYSBwZXJzb24gYWxy
ZWFkeSBpbiBFREsgSUkgY29udGV4dC4gRGVzY3JpcHRpb24gZnJvbSB3aWtpICJUaWFub0NvcmUg
RURLIElJIChmb3JtZXJseSBUaWFubykgaXMgdGhlIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBv
ZiBVRUZJIGJ5IEludGVsLiIgaXMgYmV0dGVyLiBCdXQgc3RpbGwgdGhlIHNhbWU6IGl0IGNhbiBi
ZSByZWNvZ25pemVkIGJ5IGEgcGVyc29uIHdobyBhbHJlYWR5IGtub3dzIHdoYXQgaXMgRURLIElJ
LiBTbyBJIHN1Z2dlc3QgdG8gZGVzY3JpYmUgbm90IHdoYXQgaXMgRURLIElJIChpbXBvc3NpYmxl
KSBidXQgd2hhdCBpcyBCUjJfVEFSR0VUX0VESzIKCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
CkZyb206ICJGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IjxidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zz4gClRvOiAiQW5kcmVpIENoZXJuaWFldiI8ZHVuZ2VvbmxvcmRzNzg5QG5hdmVyLmNvbT47IDxi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZz47IApDYzogPGhpQHNlbnppbGxhLmlvPjsgPHJvbWFpbi5u
YW91ckBnbWFpbC5jb20+OyA8a29yeS5tYWluY2VudEBib290bGluLmNvbT47IDx2aW5jZW50LnN0
ZWhsZUBhcm0uY29tPjsgPGp1Lm9AZnJlZS5mcj47IDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT47
IDxmYW5jcDIwMDdAZ21haWwuY29tPjsgClNlbnQ6IDIwMjYtMDQtMjggKO2ZlCkgMDE6NTQ6NDIg
KEdNVCswOTowMCkKU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIFtQQVRDSCAxLzFdIGJvb3QvZWRr
MjogZml4IGRlc2NyaXB0aW9uCgpBbSAyNy4wNC4yNiB1bSAxMzoyOCBzY2hyaWViIEFuZHJlaSBD
aGVybmlhZXY6Cj4gMSkgdXN1YWxseSB1c2VyIHNob3VsZCBub3QgdHJ5IHRvIGZpbmQgT1ZNRi5m
ZCBzb21ld2hlcmUgbWFudWFsbHkKPiAyKSBib2FyZC9xZW11L3g4Nl82NC1lZmkvcmVhZG1lLnR4
dCBpcyB0cnlpbmcgdG8gYmUgZHVwbGljYXRlIG9mIGJvYXJkL3BjL3JlYWRtZS50eHQuIFdlIHNo
b3VsZCBub3QgZHVwbGljYXRlIGluZm8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWkgQ2hlcm5p
YWV2IDxkdW5nZW9ubG9yZHM3ODlAbmF2ZXIuY29tPgo+IC0tLQo+IMKgIGJvYXJkL3BjL3JlYWRt
ZS50eHQgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDEwICsrKysrLS0tLS0KPiDCoCBib2FyZC9xZW11
L3g4Nl82NC1lZmkvcmVhZG1lLnR4dCB8IDE3ICsrKy0tLS0tLS0tLS0tLS0tCj4gwqAgYm9vdC9l
ZGsyL0NvbmZpZy5pbiDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgwqA2ICsrLS0tLQo+IMKgIDMgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2JvYXJkL3BjL3JlYWRtZS50eHQgYi9ib2FyZC9wYy9yZWFkbWUudHh0Cj4gaW5kZXgg
MThiMWUzZGNmMC4uMzFjYTUzNTdlOSAxMDA2NDQKPiAtLS0gYS9ib2FyZC9wYy9yZWFkbWUudHh0
Cj4gKysrIGIvYm9hcmQvcGMvcmVhZG1lLnR4dAo+IEBAIC02MywxMiArNjMsMTIgQEAgUnVuIHRo
ZSBlbXVsYXRpb24gd2l0aDoKPiDCoCAKPiDCoCBxZW11LXN5c3RlbS14ODZfNjQgXAo+IMKgIAkt
TSBwYyBcCj4gLQktYmlvcyA8L3BhdGgvdG8vT1ZNRl9DT0RFLmZkPiBcCj4gKwktYmlvcyBvdXRw
dXQvaW1hZ2VzL09WTUYuZmQgXAo+IMKgIAktZHJpdmUgZmlsZT1vdXRwdXQvaW1hZ2VzL2Rpc2su
aW1nLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IFwKPiDCoCAJLW5ldCBuaWMsbW9kZWw9dmlydGlvIFwK
PiDCoCAJLW5ldCB1c2VyCj4gwqAgCj4gLU5vdGUgdGhhdCA8L3BhdGgvdG8vT1ZNRi5mZD4gbmVl
ZHMgdG8gcG9pbnQgdG8gYSB2YWxpZCB4ODZfNjQgVUVGSQo+IC1maXJtd2FyZSBpbWFnZSBmb3Ig
cWVtdS4gSXQgbWF5IGJlIHByb3ZpZGVkIGJ5IHlvdXIgZGlzdHJpYnV0aW9uIGFzIGEKPiAtZWRr
MiBvciBPVk1GIHBhY2thZ2UsIGluIHBhdGggc3VjaCBhcwo+IC0vdXNyL3NoYXJlL2VkazIvb3Zt
Zi9PVk1GX0NPREUuZmQgLgo+ICtOb3RlIHRoYXQgT1ZNRi5mZCBuZWVkcyB0byBiZSBhIHZhbGlk
IHg4Nl82NCBVRUZJIGZpcm13YXJlIGltYWdlIGZvciBxZW11LiBUaGUKPiArZWFzaWVzdCB3YXkg
aXMgdG8gZ2VuZXJhdGUgaXQgZHVyaW5nIHRoZSBCdWlsZHJvb3QgYnVpbGQgYnkgc2V0Cj4gK0JS
Ml9UQVJHRVRfRURLMi4gQWx0ZXJuYXRpdmVseSBpdCBtYXkgYmUgcHJvdmlkZWQgYnkgeW91ciBk
aXN0cmlidXRpb24gYXMgYQo+ICtlZGsyIG9yIE9WTUYgcGFja2FnZSwgaW4gcGF0aCBzdWNoIGFz
IC91c3Ivc2hhcmUvZWRrMi9vdm1mL09WTUZfQ09ERS5mZCAuCj4gZGlmZiAtLWdpdCBhL2JvYXJk
L3FlbXUveDg2XzY0LWVmaS9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS94ODZfNjQtZWZpL3JlYWRt
ZS50eHQKPiBpbmRleCA3ZjY5YmUwNjVmLi4wMzYyMzk4MTlhIDEwMDY0NAo+IC0tLSBhL2JvYXJk
L3FlbXUveDg2XzY0LWVmaS9yZWFkbWUudHh0Cj4gKysrIGIvYm9hcmQvcWVtdS94ODZfNjQtZWZp
L3JlYWRtZS50eHQKPiBAQCAtMTIsMTcgKzEyLDYgQEAgQnVpbGQKPiDCoCBFbXVsYXRpb24KPiDC
oCA9PT09PT09PT0KPiDCoCAKPiAtUnVuIHRoZSBlbXVsYXRpb24gd2l0aDoKPiAtCj4gLSDCoCDC
oHFlbXUtc3lzdGVtLXg4Nl82NCBcCj4gLSDCoCDCoCDCoCDCoC1NIHBjIFwKPiAtIMKgIMKgIMKg
IMKgLW0gMTAyNCBcCj4gLSDCoCDCoCDCoCDCoC1zZXJpYWwgc3RkaW8gXAo+IC0gwqAgwqAgwqAg
wqAtYmlvcyBvdXRwdXQvaW1hZ2VzL09WTUYuZmQgXAo+IC0gwqAgwqAgwqAgwqAtZHJpdmUgZmls
ZT1vdXRwdXQvaW1hZ2VzL2Rpc2suaW1nLGZvcm1hdD1yYXcgXAo+IC0gwqAgwqAgwqAgwqAtbmV0
ZGV2IHVzZXIsaWQ9bmV0MCBcCj4gLSDCoCDCoCDCoCDCoC1kZXZpY2UgdmlydGlvLW5ldC1wY2ks
bmV0ZGV2PW5ldDAgIyBxZW11X3g4Nl82NF9lZmlfZGVmY29uZmlnCj4gLQo+IC1PcHRpb25hbGx5
IGFkZCAtc21wIE4gdG8gZW11bGF0ZSBhIFNNUCBzeXN0ZW0gd2l0aCBOIENQVXMuCj4gLQo+IC1U
aGUgbG9naW4gcHJvbXB0IHdpbGwgYXBwZWFyIGluIHRoZSBncmFwaGljYWwgd2luZG93Lgo+ICsg
wqAgwqBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKPiArb3IKPiArIMKgIMKgb3V0cHV0L2lt
YWdlcy9zdGFydC1xZW11LnNoIC0tc2VyaWFsLW9ubHkgLS11c2Utc3lzdGVtLXFlbXUKPiBkaWZm
IC0tZ2l0IGEvYm9vdC9lZGsyL0NvbmZpZy5pbiBiL2Jvb3QvZWRrMi9Db25maWcuaW4KPiBpbmRl
eCAyNjIwYzc5MDc2Li5hMmVhMTE4MGYwIDEwMDY0NAo+IC0tLSBhL2Jvb3QvZWRrMi9Db25maWcu
aW4KPiArKysgYi9ib290L2VkazIvQ29uZmlnLmluCj4gQEAgLTEyLDEwICsxMiw4IEBAIGNvbmZp
ZyBCUjJfVEFSR0VUX0VESzIKPiDCoCAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9M
RUFTVF81Cj4gwqAgCXNlbGVjdCBCUjJfUEFDS0FHRV9FREsyX1BMQVRGT1JNUwo+IMKgIAloZWxw
Cj4gLQkgwqBFREsgSUkgaXMgYSBtb2Rlcm4sIGZlYXR1cmUtcmljaCwgY3Jvc3MtcGxhdGZvcm0g
ZmlybXdhcmUKPiAtCSDCoGRldmVsb3BtZW50IGVudmlyb25tZW50IGZvciB0aGUgVUVGSSBhbmQg
UEkgc3BlY2lmaWNhdGlvbnMuCj4gLQo+IC0JIMKgaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29y
ZS90aWFub2NvcmUuZ2l0aHViLmlvL3dpa2kvRURLLUlJCj4gKwkgwqBidWlsZCBFREsgSUkgKGFu
ZCBPVk1GKSB0byBoYXZlIGNhcGFiaWxpdHkgdG8gYm9vdCBCdWlsZHJvb3QKPiArCSDCoGluIFFF
TVUgKFVFRkkgbW9kZSkKPiDCoCAKPiDCoCBpZiBCUjJfVEFSR0VUX0VESzIKUGxlYXNlIGRvbid0
IHJlbW92ZSB0aGUgdXBzdHJlYW0gVVJMLiBJZiBpdCdzIGluY29ycmVjdC9vdXRkYXRlZCB1cGRh
dGUgCml0IGFuZCBub3RlIHRoZSBjaGFuZ2UgKGlkZWFsbHkgd2l0aCByZWZlcmVuY2UpIGluIHRo
ZSBjb21taXQgbWVzc2FnZSwgCm90aGVyd2lzZSBrZWVwIGl0IGFzLWlzLgoKQWxzbywgSSBkb24n
dCB0aGluayBpdCdzIGdvb2QgdG8gcmVtb3ZlIHRoZSBnZW5lcmFsIHBhY2thZ2UgZGVzY3JpcHRp
b24sIApiZXR0ZXIgYWRkIGEgc2VudGVuY2UgYWJvdXQgaXQgcHJvdmlkaW5nIE9WTUYgZm9yIGJv
b3RpbmcgaW4gUWVtdS4KCkJlc3QgcmVnYXJkcywKRmlvbmEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
