Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5666ACA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D87614BC;
	Fri, 29 Aug 2025 07:12:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYJ_NVs1T9By; Fri, 29 Aug 2025 07:12:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F9F1614B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9F1614B9;
	Fri, 29 Aug 2025 07:12:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A73869
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FA6484072
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZWr1mB-QrkG for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:12:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D5868407B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D5868407B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D5868407B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E91FFC653FE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D0B5606B9
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D3FE1C22D27D; 
 Fri, 29 Aug 2025 09:12:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 09:12:32 +0200
Message-ID: <20250829071234.695202-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756451556; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=g3NbQKHf6ubpVUR35y2cn/2r9tmW8ApClpUX917tBFk=;
 b=B/X1dtfryyXTDhjbVjdLt9OG0yS8YEPoxJiLXFkT1C3XAsM/sd4o143NCtZiIs0oEYom+t
 BDr0bCPzrNIpXAG2kzHPDLwo+7OhxK7aSu0BoOqICT+PRrHmPryKjWz22fgGCdG6kIJhn/
 fN1DCzb1sZQwt3vGLejp8nhFEUjJCBgnQzJrKxAZts8Op7O+lIlHQJUIjP7ZMIaAkbiOZJ
 lAjEBMbt7+B2Xhc1x4ADf5jA2MjeGSpfP0Hv/FJ/AjBIReogZ5yhIDwzSNxWUBRgxSOVmz
 z077rnbPNWLAuMWbPGPUArOVKtYzXWh2AZuQXL8hYvopQWp95FEk0btDpMuozQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=B/X1dtfr
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libXt: fix GCC 15.x
 build failure
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CgpTaGVsbC5jOiBJbiBmdW5jdGlvbiDigJhfWHRTaGVsbEFuY2VzdG9yU2Vuc2l0aXZl
4oCZOgpTaGVsbC5jOjEwMDU6MjA6IGVycm9yOiBleHBlY3RlZCBpZGVudGlmaWVyIG9yIOKAmCji
gJkgYmVmb3JlIOKAmHRydWXigJkKIDEwMDUgfCAgICAgc3RhdGljIEJvb2xlYW4gdHJ1ZSA9IFRy
dWU7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+fn4KU2hlbGwuYzoxMDA4OjM1OiBlcnJv
cjogbHZhbHVlIHJlcXVpcmVkIGFzIHVuYXJ5IOKAmCbigJkgb3BlcmFuZAogMTAwOCB8ICAgICAg
ICAgdmFsdWUtPmFkZHIgPSAoWFBvaW50ZXIpICgmdHJ1ZSk7CiAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4KCmJ5IGJhY2twb3J0aW5nIGFuIHVwc3RyZWFtIGNvbW1p
dC4KCkZpeGVzOgoKICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNDBl
MjAyMmE1NzE3MGZkMzJmZTlkZTFmZGMwNDJhYmI5NDgyODhhZi8KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLQogLi4uLzAw
MDEtaXNzdWUtMjAtYzIzLWJvb2xlYW4tY29uZmxpY3QucGF0Y2ggIHwgMzIgKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3gxMXI3L3hsaWJfbGliWHQvMDAwMS1pc3N1ZS0yMC1jMjMtYm9vbGVhbi1j
b25mbGljdC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UveDExcjcveGxpYl9saWJYdC8wMDAx
LWlzc3VlLTIwLWMyMy1ib29sZWFuLWNvbmZsaWN0LnBhdGNoIGIvcGFja2FnZS94MTFyNy94bGli
X2xpYlh0LzAwMDEtaXNzdWUtMjAtYzIzLWJvb2xlYW4tY29uZmxpY3QucGF0Y2gKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYTA3YjdiOTY0NwotLS0gL2Rldi9udWxsCisr
KyBiL3BhY2thZ2UveDExcjcveGxpYl9saWJYdC8wMDAxLWlzc3VlLTIwLWMyMy1ib29sZWFuLWNv
bmZsaWN0LnBhdGNoCkBAIC0wLDAgKzEsMzIgQEAKK0Zyb20gZjM0YTQxMWYxNzk1OTc2YzYxYjcw
ZjVhNzE5ODg1N2Q2MmNhNDg1NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206ICJUaG9t
YXMgRS4gRGlja2V5IiA8ZGlja2V5QGludmlzaWJsZS1pc2xhbmQubmV0PgorRGF0ZTogU3VuLCAx
MiBOb3YgMjAyMyAwNTozMzowNSAtMDUwMAorU3ViamVjdDogW1BBVENIXSBpc3N1ZSAjMjA6IGMy
MyBib29sZWFuIGNvbmZsaWN0CisKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBFLiBEaWNrZXkgPGRp
Y2tleUBpbnZpc2libGUtaXNsYW5kLm5ldD4KK1Vwc3RyZWFtOiA1Njg3NTM0NGIyYTYyODQ1Yjhh
NDk0ODMwYmZiMGE1ZjZlZDJkM2Q2CitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgorLS0tCisgc3JjL1NoZWxsLmMgfCA0ICsrLS0K
KyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZm
IC0tZ2l0IGEvc3JjL1NoZWxsLmMgYi9zcmMvU2hlbGwuYworaW5kZXggODI2MTZlZi4uNzhjNDRh
MSAxMDA2NDQKKy0tLSBhL3NyYy9TaGVsbC5jCisrKysgYi9zcmMvU2hlbGwuYworQEAgLTEwMDIs
MTAgKzEwMDIsMTAgQEAgX1h0U2hlbGxDb2xvcm1hcChXaWRnZXQgd2lkZ2V0LCBpbnQgY2xvc3Vy
ZSwgWHJtVmFsdWUgKnZhbHVlKQorIHN0YXRpYyB2b2lkCisgX1h0U2hlbGxBbmNlc3RvclNlbnNp
dGl2ZShXaWRnZXQgd2lkZ2V0LCBpbnQgY2xvc3VyZSwgWHJtVmFsdWUgKnZhbHVlKQorIHsKKy0g
ICAgc3RhdGljIEJvb2xlYW4gdHJ1ZSA9IFRydWU7CisrICAgIHN0YXRpYyBCb29sZWFuIHRydWVf
dmFsdWUgPSBUcnVlOworIAorICAgICBpZiAod2lkZ2V0LT5jb3JlLnBhcmVudCA9PSBOVUxMKQor
LSAgICAgICAgdmFsdWUtPmFkZHIgPSAoWFBvaW50ZXIpICgmdHJ1ZSk7CisrICAgICAgICB2YWx1
ZS0+YWRkciA9IChYUG9pbnRlcikgKCZ0cnVlX3ZhbHVlKTsKKyAgICAgZWxzZQorICAgICAgICAg
X1h0Q29weUZyb21QYXJlbnQod2lkZ2V0LCBjbG9zdXJlLCB2YWx1ZSk7CisgfQorLS0gCisyLjUw
LjEKKwotLSAKMi41MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
