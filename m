Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3079C369C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B85C76F5A9;
	Wed, 16 Apr 2025 21:17:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPoNMm7DbAtM; Wed, 16 Apr 2025 21:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9094561AD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9094561AD1;
	Wed, 16 Apr 2025 21:17:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54200159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45F57403F3
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqyNk73ZohqZ for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:17:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1DC640391
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DC640391
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1DC640391
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:17:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBF931C0083; Wed, 16 Apr 2025 23:17:41 +0200 (CEST)
Message-ID: <df02b6a7-4b5a-4d64-a78e-f8a7ffeb5bc2@rnout.be>
Date: Wed, 16 Apr 2025 23:17:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250326201652.3058963-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20250326201652.3058963-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=66FTPi6MYpLWPienbY0QY4EOeLN6jOBEQB1nGs2CnNQ=;
 b=PDTziFnkUQJ4UuTIhnCjLlZgakGd6WKID+RVXTcG2M4xu/r5YNmnFA/lmrl2aaDH3tSznj
 IWq1+LsEPEzZMGYfXRtdzz6TC7tWECATdbWymzsKfWomxnGIkE/OA10hwn0zJpLdxqPn7I
 pcm7xcpvy0WRvKAH2zkQym1WipLl9XqZSFfXcrCxI9BGLEbH0Oe8LW6+Nbs3qjLVg3JaHE
 6KqBHa/Ugj4FQyZuU3CgA0Ck8pER54BrVD4tKKNJOGPPB9bJHQ3ENcA6H20G1XkyMW9X6W
 7eSiE/N4xyPlIUj1chgrv9nHT5/KPSjWSJP+BneKJOd2k8S+eUJ0yZ+SIH+5Vg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to version
 2.8.10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI2LzAzLzIwMjUgMjE6MTYsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPiBGaXhlcyB0aGUg
Zm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKPgo+IC0gQ1ZFLTIwMjUtMjc4MDk6IE5vdGUgdGhh
dCBUTFMgY2xpZW50cyBzaG91bGQgZ2VuZXJhbGx5IGNhbGwKPiAgICBtYmVkdGxzX3NzbF9zZXRf
aG9zdG5hbWUoKSBpZiB0aGV5IHVzZSBjZXJ0aWZpY2F0ZSBhdXRoZW50aWNhdGlvbiAoaS5lLgo+
ICAgIG5vdCBwcmUtc2hhcmVkIGtleXMpLiAgT3RoZXJ3aXNlLCBpbiBtYW55IHNjZW5hcmlvcywg
dGhlIHNlcnZlciBjb3VsZCBiZQo+ICAgIGltcGVyc29uYXRlZC4gIFRoZSBsaWJyYXJ5IHdpbGwg
bm93IHByZXZlbnQgdGhlIGhhbmRzaGFrZSBhbmQgcmV0dXJuCj4gICAgTUJFRFRMU19FUlJfU1NM
X0NFUlRJRklDQVRFX1ZFUklGSUNBVElPTl9XSVRIT1VUX0hPU1ROQU1FIGlmCj4gICAgbWJlZHRs
c19zc2xfc2V0X2hvc3RuYW1lKCkgaGFzIG5vdCBiZWVuIGNhbGxlZC4KPgo+ICAgIGh0dHBzOi8v
bWJlZC10bHMucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L3NlY3VyaXR5LWFkdmlzb3JpZXMvbWJl
ZHRscy1zZWN1cml0eS1hZHZpc29yeS0yMDI1LTAzLTEvCj4KPiAtIENWRS0yMDI1LTI3ODEwOiBa
ZXJvaXplIHRlbXBvcmFyeSBoZWFwIGJ1ZmZlcnMgdXNlZCBpbiBQU0Egb3BlcmF0aW9ucy4KPiAg
ICBGaXggYSB2dWxuZXJhYmlsaXR5IGluIHRoZSBUTFMgMS4yIGhhbmRzaGFrZS4gIElmIG1lbW9y
eSBhbGxvY2F0aW9uCj4gICAgZmFpbGVkIG9yIHRoZXJlIHdhcyBhIGNyeXB0b2dyYXBoaWMgaGFy
ZHdhcmUgZmFpbHVyZSB3aGVuIGNhbGN1bGF0aW5nIHRoZQo+ICAgIEZpbmlzaGVkIG1lc3NhZ2Us
IGl0IGNvdWxkIGJlIGNhbGN1bGF0ZWQgaW5jb3JyZWN0bHkuICBUaGlzIHdvdWxkIGJyZWFrCj4g
ICAgdGhlIHNlY3VyaXR5IGd1YXJhbnRlZXMgb2YgdGhlIFRMUyBoYW5kc2hha2UuCj4KPiAgICBo
dHRwczovL21iZWQtdGxzLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9zZWN1cml0eS1hZHZpc29y
aWVzL21iZWR0bHMtc2VjdXJpdHktYWR2aXNvcnktMjAyNS0wMy0yLwo+Cj4gRm9yIG1vcmUgZGV0
YWlscywgc2VlIHRoZSByZWxlYXNlIG5vdGVzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9NYmVkLVRM
Uy9tYmVkdGxzL3JlbGVhc2VzL3RhZy9tYmVkdGxzLTIuMjguMTAKPgo+IFNpZ25lZC1vZmYtYnk6
IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCiDCoEFwcGxpZWQgdG/CoDIw
MjUuMDIueCwgMjAyNC4xMS54IGFuZCAyMDI0LjAyLngsIHRoYW5rcy4KCiDCoFJlZ2FyZHMsCiDC
oEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvbWJlZHRscy9tYmVkdGxzLmhhc2ggfCA0ICsrLS0K
PiAgIHBhY2thZ2UvbWJlZHRscy9tYmVkdGxzLm1rICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL21iZWR0bHMvbWJlZHRscy5oYXNoIGIvcGFja2FnZS9tYmVkdGxzL21iZWR0bHMuaGFzaAo+
IGluZGV4IDlkZTdmNzMxZGEuLjZmYzY4ZGRhYzYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tYmVk
dGxzL21iZWR0bHMuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbWJlZHRscy9tYmVkdGxzLmhhc2gKPiBA
QCAtMSw0ICsxLDQgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9BUk1tYmVkL21iZWR0
bHMvcmVsZWFzZXMvdGFnL3YyLjI4Ljk6Cj4gLXNoYTI1NiAgZTg1ZWE5N2FhZjc4ZGQ2YzBhNWJh
MmU1NGRkNTkzMmZmYTE1ZjM5YWJmYzE4OWMyNmJlZWY3Njg0NjMwYzAyYiAgbWJlZHRscy0yLjI4
LjkudGFyLmJ6Mgo+ICsjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL0FSTW1iZWQvbWJlZHRscy9y
ZWxlYXNlcy90YWcvdjIuMjguMTA6Cj4gK3NoYTI1NiAgMTllNWI4MWZkYWMwZmUyMjAwOWI5ZTJi
ZGNkNTJkN2RjYWZiZjYyYmM2N2ZjNTljZjBhNzZiNWI1NTQwZDE0OSAgbWJlZHRscy0yLjI4LjEw
LnRhci5iejIKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gICBzaGEyNTYgIDliNDA1ZWY0Yzg5
MzQyZjVlYWUxZGQ4Mjg4ODJmOTMxNzQ3ZjcxMDAxY2ZiYTdkMTE0ODAxMDM5YjUyYWQwOWIgIExJ
Q0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tYmVkdGxzL21iZWR0bHMubWsgYi9wYWNrYWdl
L21iZWR0bHMvbWJlZHRscy5tawo+IGluZGV4IDJmYWE2ZGZmNTUuLmZkNjY4MmZiZmQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9tYmVkdGxzL21iZWR0bHMubWsKPiArKysgYi9wYWNrYWdlL21iZWR0
bHMvbWJlZHRscy5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+ICAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgIAo+IC1NQkVEVExTX1ZFUlNJT04gPSAyLjI4LjkKPiArTUJFRFRMU19WRVJT
SU9OID0gMi4yOC4xMAo+ICAgTUJFRFRMU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL01iZWQt
VExTL21iZWR0bHMvcmVsZWFzZXMvZG93bmxvYWQvbWJlZHRscy0kKE1CRURUTFNfVkVSU0lPTikK
PiAgIE1CRURUTFNfU09VUkNFID0gbWJlZHRscy0kKE1CRURUTFNfVkVSU0lPTikudGFyLmJ6Mgo+
ICAgTUJFRFRMU19DT05GX09QVFMgPSBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
