Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD169CCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 19:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB8F843C6;
	Thu,  6 Nov 2025 19:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3weYVwQNNhT; Thu,  6 Nov 2025 19:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FBF843C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4FBF843C0;
	Thu,  6 Nov 2025 19:02:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8FCA64
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9676A60742
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfaXyBWDaFP6 for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 19:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD65A6073E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD65A6073E
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD65A6073E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 19:02:22 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id H5FTv3roOu8cPH5FUvuunY; Thu, 06 Nov 2025 20:02:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 6 Nov 2025 20:02:19 +0100
Message-Id: <A00AEB04-E4CE-4F5A-AE46-AA985CBA14E7@benettiengineering.com>
References: <20251106183101.2197897-1-bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251106183101.2197897-1-bernd@kuhls.net>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailer: iPhone Mail (23B85)
X-CMAE-Envelope: MS4xfJdQjeOOcdM9DM/CEdZzpLADCXW5GYDJoOiieZOOu3PJn+xoKvCOBioT888c1jUVRSp1awengW5TBoqiMU8QxPbMjakYNR9oGUbz7uJqt36xM6RJ0kgu
 eJGM2gBPgSB1gw1RIZELXU18M5UGPQq5nZ6eztcforFs4zsQpBGD6yH78ONJhaQufoU8h37HkfPLs/oYXBbCG4QeenQFp0fDX36Yy5+fcYRYRsLQgv+0PekG
 4a51JmZ33cgRolmfMnOvLA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1762455740; bh=cxwMnyT+5gQJU8Y2NGp/Lk9febfpcMvn70IvSg85frE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Y3HaQ2riz7rIrfz8sbKV4G7lLKHLlGnBMF7buXqULkqceZy47gXOFS1L1C1KTUmfS
 y3NO0aBv5mW5XBxkzsFt8MUBCL5WkYuj+ivqKBxVoXtuIAol/xh9Nku0xKXsCnb9sZ
 KJYm0ZYSvHorgtTYIBFHPFO1j3FipjYtXiX9VBb5B3tlhjCwYSkHMOkuUFuqdL4XAu
 Kmh9T6NBefL6fh9EqMKGFWtbcVL0ggyjaMHNdFLZrIHZPYfcAr/xYN56GxLkJ5nbM6
 xHvMeUMx0+loHPVkKSTGb8xmWAJjwv6q2FZSe5Juy2LPiji1AVD5oY0bK78WW71T4m
 Bde9tBXNcxB+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Y3HaQ2ri
Subject: Re: [Buildroot] [PATCH 1/1] package/libnvme: fix build error
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

SGkgQmVybmQsCgo+IElsIGdpb3JubyA2IG5vdiAyMDI1LCBhbGxlIG9yZSAxOTozMSwgQmVybmQg
S3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gaGEgc2NyaXR0bzoKPiAKPiDvu79BZGRlZCB1cHN0cmVh
bSBwYXRjaCB0byBmaXggYnVpbGQgZXJyb3IgY2F1c2VkIGJ5IHZlcnNpb24gYnVtcCB0byAxLjE2
Cj4gYnkgYnVpbGRyb290IGNvbW1pdCAxMjUwMGZiMDYwOTk3YTBjNzZkYWE3MjUyMTYxNTAzOGM4
NTE0ZDI1Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
CgpSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+CgpUaGFuayB5b3UKQmVzdCByZWdhcmRzIAoKR2l1bGlvCgo+IC0tLQo+IC4u
Lm5nLWNyb3NzLWJ1aWxkcy13aXRoLU9wZW5TU0wtZW5hYmxlZC5wYXRjaCB8IDMxICsrKysrKysr
KysrKysrKysrKysKPiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+IGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL2xpYm52bWUvMDAwMS1idWlsZC1hdm9pZC1icmVha2luZy1jcm9z
cy1idWlsZHMtd2l0aC1PcGVuU1NMLWVuYWJsZWQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJudm1lLzAwMDEtYnVpbGQtYXZvaWQtYnJlYWtpbmctY3Jvc3MtYnVpbGRzLXdpdGgt
T3BlblNTTC1lbmFibGVkLnBhdGNoIGIvcGFja2FnZS9saWJudm1lLzAwMDEtYnVpbGQtYXZvaWQt
YnJlYWtpbmctY3Jvc3MtYnVpbGRzLXdpdGgtT3BlblNTTC1lbmFibGVkLnBhdGNoCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43Y2Y5MWZkOThlCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvbGlibnZtZS8wMDAxLWJ1aWxkLWF2b2lkLWJyZWFraW5nLWNy
b3NzLWJ1aWxkcy13aXRoLU9wZW5TU0wtZW5hYmxlZC5wYXRjaAo+IEBAIC0wLDAgKzEsMzEgQEAK
PiArRnJvbSA4MjA2NmU1ZjQ2ZDc0M2U3YTdjZjM5NmJlN2Y5NWU1NzcwODRiOTNlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBEYW5pZWwgV2FnbmVyIDx3YWdpQGtlcm5lbC5vcmc+
Cj4gK0RhdGU6IFRodSwgNiBOb3YgMjAyNSAwODoxMDoyNyArMDEwMAo+ICtTdWJqZWN0OiBbUEFU
Q0hdIGJ1aWxkOiBhdm9pZCBicmVha2luZyBjcm9zcyBidWlsZHMgd2l0aCBPcGVuU1NMIGVuYWJs
ZWQKPiArCj4gK1RoZSBPcGVuU1NMIHNhbml0eSBjaGVjayB3YW50cyB0byBiZSBleGVjdXRlZCwg
dGh1cyB3ZSBzaG91bGQgb25seSB0cnkKPiArdGhpcyBpZiBpdCdzIHBvc3NpYmxlLiBTaW5jZSB0
aGlzIGlzIGp1c3QgYSB3YXJuaW5nLCB3ZSBjYW4ganVzdCBza2lwIGl0Cj4gK2lmIGl0IGlzIG5v
dCBwb3NzaWJsZS4KPiArCj4gK1NpZ25lZC1vZmYtYnk6IERhbmllbCBXYWduZXIgPHdhZ2lAa2Vy
bmVsLm9yZz4KPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtbnZtZS9s
aWJudm1lL3B1bGwvMTA5MAo+ICsKPiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD4KPiArLS0tCj4gKyBtZXNvbi5idWlsZCB8IDIgKy0KPiArIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL21l
c29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKPiAraW5kZXggZGNlNWM2OGUuLjZkMWY1MjA0IDEwMDY0
NAo+ICstLS0gYS9tZXNvbi5idWlsZAo+ICsrKysgYi9tZXNvbi5idWlsZAo+ICtAQCAtMjUyLDcg
KzI1Miw3IEBAIGVsc2UKPiArICAgY29uZi5zZXQoJ2ZhbGx0aHJvdWdoJywgJ2RvIHt9IHdoaWxl
ICgwKSAvKiBmYWxsdGhyb3VnaCAqLycpCj4gKyBlbmRpZgo+ICsKPiArLWlmIG9wZW5zc2xfZGVw
LmZvdW5kKCkKPiArK2lmIG9wZW5zc2xfZGVwLmZvdW5kKCkgYW5kIG1lc29uLmNhbl9ydW5faG9z
dF9iaW5hcmllcygpCj4gKyAgIGlmIG9wZW5zc2xfZGVwLnR5cGVfbmFtZSgpICE9ICdpbnRlcm5h
bCcKPiArICAgICAjIENoZWNrIGZvciBhIGJ1ZyBpbiB0aGUgRVZQX1BLRVlfQ1RYX2FkZDFfaGtk
Zl9pbmZvIGltcGxlbWVudGF0aW9uCj4gKyAgICAgcmVzID0gY2MucnVuKAo+IC0tCj4gMi40Ny4z
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
