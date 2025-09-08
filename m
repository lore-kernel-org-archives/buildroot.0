Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B84CA1016
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 06:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C5A42B2C;
	Mon,  8 Sep 2025 06:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C24W8VyQghw; Mon,  8 Sep 2025 06:40:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3697542B29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3697542B29;
	Mon,  8 Sep 2025 06:40:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 317391D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 06:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17EDE413C9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 06:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLSl9XC8iyN7 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 06:40:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 483E841429
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483E841429
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 483E841429
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 06:40:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 48D334E40953;
 Mon,  8 Sep 2025 06:40:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2287B6061A;
 Mon,  8 Sep 2025 06:40:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C30F9102F2529; 
 Mon,  8 Sep 2025 08:40:28 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 08 Sep 2025 08:40:28 +0200
Message-Id: <DCN7OW3PFUKS.1KAEWCJEF19V7@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250811-php-lua-v3-1-f238174c6e4a@bootlin.com>
 <5120138b-60e2-40ba-9f17-ea421c56be14@smile.fr>
 <DCBLETOE9LO5.2XZ5QD1LFF31D@bootlin.com>
 <8c92dae4-f2f8-47c6-ba3c-79414815bc31@smile.fr>
In-Reply-To: <8c92dae4-f2f8-47c6-ba3c-79414815bc31@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757313641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=iUVGIWydgcPgRMFo6D/xFC7pi2nLVV1alWwSYLbt4UA=;
 b=ATNMNgOVzqtzFUq8+7d2z+9l5Oq5aP1aq7s6g7OatSNrXo+yWHonED1EtfEby6TvtCgDGy
 Z/ap5mP3kyoh+g+Ip5AXb26R9RbhemHPIv24xdgQWqnkbtZ2FKXQ8v3TeRFb0M6LB1cPtp
 UmLGatDNCn5kJDZOk2MXGamavCknqE8184DgAa6SmsD4Ke8xPSopjVOFgS2KeB+HqcdyVt
 s29l7eVYpuR8i9D4RSBZrURCK3ydArMjM8nRAN9eGx0gfiY/Kl9EOBFEq4lhLWjRD2PC1T
 asUkl/QkkGdfGOyoL5kCDe66VKu/xpGD2AODHh/e9NO5BfUODQGRwPBRRP2tMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ATNMNgOV
Subject: Re: [Buildroot] [PATCH v3] package/php-lua: fix build with
 PHP8/GCC14
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gU3VuIFNlcCA3LCAyMDI1IGF0IDEyOjE3IEFNIENFU1QsIFJvbWFpbiBO
YW91ciB3cm90ZToKPiBIZWxsbyBBbGV4aXMsIEFsbCwKPgo+IExlIDI1LzA4LzIwMjUgw6AgMTY6
NTMsIEFsZXhpcyBMb3Rob3LDqSBhIMOpY3JpdMKgOgo+PiBIaSBSb21haW4sCj4+IAo+PiBPbiBT
dW4gQXVnIDI0LCAyMDI1IGF0IDU6MzYgUE0gQ0VTVCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+Pj4g
SGVsbG8gQWxleGlzLCBUaG9tYXMsIEFsbCwKPj4+Cj4+PiBMZSAxMS8wOC8yMDI1IMOgIDA5OjUy
LCBBbGV4aXMgTG90aG9yw6kgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgoKWy4uLl0KCj4+IE15
IGJhZCBmb3IgdGhlIGFic2VuY2Ugb2YgcmVhY3Rpb24gb24gbXkgc2lkZSwgSSBoYXZlIGJlZW4g
b2ZmIGZvciBhIGZldwo+PiBkYXlzLCBhbmQgdGhlbiB0cmF2ZWxsaW5nIGZvciBjb25mZXJlbmNl
LiBUaGFua3MgZm9yIGhhbmRsaW5nIHRoaXMgIQo+Cj4gTm8gcHJvYmxlbSwgdGhhbmtzIGZvciB5
b3VyIGNvbnRyaWJ1dGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPiBJIG5vdGljZWQgYSBuZXcg
aXNzdWUgaW4gR2l0bGFiLUNJIHRoYXQgc2VlbXMgcmVsYXRlZCB0byB0aGlzIHBhdGNoIFsxXQo+
IEluZGVlZCwgdGhlIGJhY2twb3J0ZWQgY29tbWl0IFsyXSBpbnRyb2R1Y2UgYSBidWlsZCBpc3N1
ZSB3aXRoIGx1YSA8IDUwMgo+IGludGVycHJldGVycyBkdWUgdG8gcHJvYmFibHkgYSBjb3B5IHBh
c3Qgb2YgdGhpcyBsaW5lICh2YWwgaXMgbm90IGRlZmluZWQpOgo+Cj4gICBsdWFfcHVzaGxzdHJp
bmcoTCwgWlNUUl9WQUwodmFsKSwgWlNUUl9MRU4odmFsKSk7Cj4KPiBJIGd1ZXNzLCB3ZSBoYXZl
IHRvIHJlcGxhY2UgInZhbCIgYnkgIm1lbWJlciIgc2luY2UgWlNUUl9WQUwgbWFjcm8gdXNlcyBp
bnRlcm5hbAo+ICIoenN0ciktPnZhbCIgKCNkZWZpbmUgWlNUUl9WQUwoenN0cikgICh6c3RyKS0+
dmFsKSB0aGF0IHNlZW1zIG9ubHkgYXZhaWxhYmxlIGluCj4gIm1lbWJlciIuIEJ1dCBJIG1heSBi
ZSB3cm9uZy4uLgo+Cj4gICBsdWFfcHVzaGxzdHJpbmcoTCwgWlNUUl9WQUwobWVtYmVyKSwgWlNU
Ul9MRU4obWVtYmVyKSk7Cj4KPiBXaXRoIHRoYXQgZml4ZWQsIFRlc3RQaHBMdWFMdWFqaXQgcGFz
cy4KPgo+IENhbiB5b3UgaGF2ZSBhIGxvb2s/Cj4KPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTE3Njc3NDk0MQo+IFsyXSBodHRwczovL2dp
dGh1Yi5jb20vYmFkb28vcGhwLWx1YS9jb21taXQvZGUxMDY4ZDYzNDUxOWFiZjI0NjFkYWM5NDI3
YjVmZjI0YjY2MDNhZgoKU3VyZSwgSSdsbCBsb29rIGF0IGl0IGFuZCBzdWJtaXQgdGhlIHJlbGV2
YW50IHBhdGNoLgoKQWxleGlzCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+PiAKPj4g
QWxleGlzCj4+IAo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gUm9tYWluCj4+Pgo+PiAKCgoKCi0tIApB
bGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
