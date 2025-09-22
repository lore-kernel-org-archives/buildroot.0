Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B8CAC5AA
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 14:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6332A83C0F;
	Mon, 22 Sep 2025 14:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foJdirB8sK0h; Mon, 22 Sep 2025 14:11:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8625D83C4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8625D83C4E;
	Mon, 22 Sep 2025 14:11:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6F11C0
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 14:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF5761597
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 14:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyV2DZgwouJj for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 14:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 868B3612A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868B3612A5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 868B3612A5
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 14:11:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 21FA24E40D01
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 14:11:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECD0F60634;
 Mon, 22 Sep 2025 14:11:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 783CD102F1954; 
 Mon, 22 Sep 2025 16:11:19 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 22 Sep 2025 16:11:15 +0200
Message-Id: <DCZE1NNPYVQP.VA152ACRNNYT@bootlin.com>
Cc: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Baruch Siach" <baruch@tkos.co.il>,
 =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250921-fix_doc_dead_link-v1-1-4f39903e93c7@bootlin.com>
 <87wm5sosjs.fsf@tarshish>
In-Reply-To: <87wm5sosjs.fsf@tarshish>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1758550285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IeXJqfx3tr0PIeIL1SAJJAPVpOeSj2z241hj8etwjZM=;
 b=FLxb5Il/AL3eMur0Do2C5kV/9WqbGo1PfvpyqUnqJKox7W+K0AhK671Km/q2TAb+pV+PzD
 /zH44++ZgVfP4lT6GSfUEH/1OyYzNKhv11KYyaIjbAFpRxVf8Oxv/r+ZOsjzH19FE9GsuR
 Z0yY+fzu5TVA7V1WmiDcTi/APuG6cjSbeiQyIw8Hb5vhjJNEAIGg7ia6viYLk9CJsbSlLP
 Km3isK99eLMcbwdS286r56QzhLymB6ctHpguuyGOmh8h3ntOjRUlUSyeTVZ8PWDfuo7zEQ
 7o1T35r/DxlZ5QGnCA0uVsilFhg4YfDTLwfeJvs9jCD007Wh9BPLOwl+nQCzoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FLxb5Il/
Subject: Re: [Buildroot] [PATCH] docs/manual/getting: fix dead link
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

SGkgQmFydWNoLAoKT24gU3VuIFNlcCAyMSwgMjAyNSBhdCAzOjE1IFBNIENFU1QsIEJhcnVjaCBT
aWFjaCB3cm90ZToKPiBIaSBBbGV4aXMsCj4KPiBPbiBTdW4sIFNlcCAyMSAyMDI1LCBBbGV4aXMg
TG90aG9yw6kgdmlhIGJ1aWxkcm9vdCB3cm90ZToKClsuLi5dCgo+PiAgSWYgeW91IHdhbnQgdG8g
Zm9sbG93IGRldmVsb3BtZW50LCB5b3UgY2FuIHVzZSB0aGUgZGFpbHkgc25hcHNob3RzIG9yCj4+
ICBtYWtlIGEgY2xvbmUgb2YgdGhlIEdpdCByZXBvc2l0b3J5LiBSZWZlciB0byB0aGUKPj4gLWh0
dHA6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2FkW0Rvd25sb2FkIHBhZ2VdIG9mIHRoZSBCdWlsZHJv
b3Qgd2Vic2l0ZQo+PiAraHR0cDovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWQuaHRtbFtEb3dubG9h
ZCBwYWdlXSBvZiB0aGUgQnVpbGRyb290IHdlYnNpdGUKPgo+IE1heWJlIHN3aXRjaCB0byBodHRw
cyB3aGlsZSBhdCBpdD8gVGhpcyBsaW5rIHJlZGlyZWN0cyB0aGVyZSBhbnl3YXkuCgpTdXJlLiBC
dXQgaW4gdGhpcyBjYXNlLCBJIGd1ZXNzIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgdG8gZG8gaXQg
b25seSBmb3IKdGhpcyBsaW5rLCBhbmQgaXQgc2hvdWxkIGJlIGRvbmUgZm9yIGFueSBsaW5rIHBv
aW50aW5nIHRvIGJ1aWxkcm9vdC5vcmc6CgokIGdyZXAgLXJpICJodHRwOi8vLipidWlsZHJvb3Qu
b3JnIiB+L3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwKL2hvbWUvYWxleGlzL3NyYy9idWlsZHJv
b3QvZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jOkFsbCBidWlsZCByZXN1bHRzIGFyZSBhdmFp
bGFibGUgYXQgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnW10sCi9ob21lL2FsZXhpcy9z
cmMvYnVpbGRyb290L2RvY3MvbWFudWFsL2NvbnRyaWJ1dGUuYWRvYzpzdGF0aXN0aWNzIGFyZSBh
dCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvc3RhdHMucGhwW10uIEV2ZXJ5IGRheSwK
L2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jOiAg
ICBodHRwOi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290LXRlc3QvdHJlZS91dGlscy9ici1y
ZXByb2R1Y2UtYnVpbGRbYnItcmVwcm9kdWNlLWJ1aWxkXQovaG9tZS9hbGV4aXMvc3JjL2J1aWxk
cm9vdC9kb2NzL21hbnVhbC9jb250cmlidXRlLmFkb2M6Rml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzLzUxMDAwYTlkNDY1NmFmZTllMGVhNmYwN2I5ZjhlZDM3NGMy
ZTQwNjkKL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwvcmVzb3VyY2VzLmFk
b2M6aHR0cDovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3Rb
bWFpbGluZyBsaXN0IGluZm8KL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9jcy9tYW51YWwv
cmVzb3VyY2VzLmFkb2M6aHR0cDovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxk
cm9vdFtNYWlsbWFuXSBvciBhdAovaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdC9kb2NzL21hbnVh
bC9nZXR0aW5nLmFkb2M6UmVsZWFzZSB0YXJiYWxscyBhcmUgYXZhaWxhYmxlIGF0IGh0dHA6Ly9i
dWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9bXS4KL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3QvZG9j
cy9tYW51YWwvZ2V0dGluZy5hZG9jOmh0dHA6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2FkLmh0bWxb
RG93bmxvYWQgcGFnZV0gb2YgdGhlIEJ1aWxkcm9vdCB3ZWJzaXRlCi9ob21lL2FsZXhpcy9zcmMv
YnVpbGRyb290L2RvY3MvbWFudWFsL21hbnVhbC5hZG9jOmh0dHA6Ly9naXQuYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvdHJlZS9DT1BZSU5HP2lkPXtzeXM6Z2l0IHJldi1wYXJzZSBIRUFEfVtDT1BZ
SU5HXQovaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdC9kb2NzL21hbnVhbC9hZGRpbmctcGFja2Fn
ZXMtdGlwcy5hZG9jOkJ1aWxkcm9vdCBydW5zIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9bYXV0b2J1aWxkZXJzXSB3aGljaAoKSWYgbWFpbnRhaW5lcnMgYXJlIGZpbmUgd2l0aCB0aGF0
LCBJIGNhbiBhZGQgYSBkZWRpY2F0ZWQgY29tbWl0IGluIGEgdjIuCgpUaGFua3MsCgpBbGV4aXMK
CgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
