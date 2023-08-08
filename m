Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53174C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16C441799;
	Tue,  8 Aug 2023 21:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C16C441799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlqEas-8tOeV; Tue,  8 Aug 2023 21:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88B4441793;
	Tue,  8 Aug 2023 21:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B4441793
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5609F1BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1DF81F8F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1DF81F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FuistkQmV_O for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:24:57 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AE7F81DAB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE7F81DAB
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0879240002;
 Tue,  8 Aug 2023 21:24:52 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:24:51 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230808232451.31faff5b@windsurf>
In-Reply-To: <20230808205047.GC421096@scaer>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <20230726212009.221147-2-thomas.petazzoni@bootlin.com>
 <20230808205047.GC421096@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691529894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sc6db4bDtywY7D+xC2eWdob7l3IJFaqe/LSLpjSiGto=;
 b=g3f1W7atu3Juo6bay6Em6qI0Q0J0x+lyNy8tyEEhmmIUEwuoHq4dhVBsUQb6/4N4twp28I
 n1er4b8m1HLOFzpvm8TxpFIRBasQCJi7EgUhgMdes2pWs5Byu3HS5X5t4kCnIVBtze0R5u
 io8GQwllr8SJWoczwgEeNyzJnWLOq57Jdo7dCTCHlbLeHQ4ECbYgC/2DORKTjZRMhPrpWI
 RxdWG/+G6CNZekYrhxm77yu+ucm+oQLOzw7vVHeICcl9ylT14CFmZfUOp4M4R5VnJXT626
 02ITEw76G6V1p4vK103V8cKclwysggrkf3lJhAC4mT/qbFwWOBWI8YwT7CaB7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g3f1W7at
Subject: Re: [Buildroot] [PATCH RFC 2/2] utils/docker-run: mount the
 download directory if specified
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@paral.in>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUdWUsIDggQXVnIDIwMjMgMjI6NTA6NDcgKzAyMDAKIllhbm4gRS4gTU9SSU4i
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IFNvLCBJIGd1ZXNzIHlvdXIgaXNz
dWUgaXMgdGhhdCAvZGwgZG9lcyBub3QgZXhpc3QgaW4gdGhlIGNvbnRhaW5lciwgc28KPiBpdCBp
cyBjcmVhdGVkIGJ5IHRoZSBkb2NrZXIgcnVudGltZSBhbmQgdGh1cyBncm91cC1iZWxvbmdzIHRv
IGRvY2tlciwKPiBhbmQgdGhlIFNFTGludXggbGFiZWxsaW5nIG1lYW5zIHRoYXQgZXZlcnl0aGlu
ZyBiZW5lYXRoIGl0IGFsc28gYmVsb25ncwo+IHRvIGRvY2tlci4KPiAKPiBBbHNvOgo+IAo+ICog
d2hhdCBhYm91dCBmaWxlcyB0aGF0IGFscmVhZHkgZXhpc3RlZCBiZWZvcmU6IGFyZSB0aGUgY2hn
cnAtZWQgdG8KPiAgIGRvY2tlciwgb3IgZG8gdGhleSByZXRhaW4gdGhlaXIgZ3JvdXA/CgpGb2xk
ZXJzIGluIC9kbCB0aGF0IGV4aXN0ZWQgYmVmb3JlIGluIHRoZSBCUjJfRExfRElSIG9uIG15ICJo
b3N0IiBsb29rCmxpa2UgdGhpcyBvdXRzaWRlIHRoZSBjb250YWluZXI6CgokIGxzIC1sIH4vZGwv
eHoKZHJ3eHIteHIteC4gMiB0aG9tYXMgdGhvbWFzIDQwOTYgIDYgYW/Du3QgIDAwOjA1IC9ob21l
L3Rob21hcy9kbC94egoKYW5kIGluc2lkZSB0aGUgY29udGFpbmVyOgoKJCAuL3V0aWxzL2RvY2tl
ci1ydW4gbHMgLWxkIC9kbC94egpkcnd4ci14ci14LiAyIGJyLXVzZXIgYnItdXNlciA0MDk2IEF1
ZyAgNSAyMjowNSAvZGwveHoKCj4gKiBhbmQgZnJvbSB3aXRoaW4gdGhlIGNvbnRhaW5lciwgd2hv
bSBkbyB0aGUgZmlsZXMgYmVsb25nIHRvPwoKVGhlIGZpbGVzIGRvd25sb2FkZWQgaW4gL2RsIGZy
b20gd2l0aGluIHRoZSBjb250YWluZXIgKGJ5IHJ1bm5pbmcgYQpCdWlsZHJvb3QgYnVpbGQgaW4g
dGhlIGNvbnRhaW5lciwgdGhhdCBjYXVzZXMgc29tZSBkb3dubG9hZHMgdG8gdGFrZQpwbGFjZSku
IFRoZXkgYXBwZWFyIG91dHNpZGUgdGhlIGNvbnRhaW5lciBhcyBzdWNoOgoKJCBscyAtbGQgfi9k
bC9zd2lnCmRyd3hyLXhyLXguIDIgdGhvbWFzIGRvY2tlciA0MDk2IDI2IGp1aWwuIDIzOjAwIC9o
b21lL3Rob21hcy9kbC9zd2lnLwoKQW5kIHdpdGhpbiB0aGUgY29udGFpbmVyIHRoZXkgYXBwZWFy
IGFzIHN1Y2g6CgokIC4vdXRpbHMvZG9ja2VyLXJ1biBscyAtbGQgL2RsL3N3aWcKZHJ3eHIteHIt
eC4gMiBici11c2VyIDk3NiA0MDk2IEp1bCAyNiAyMTowMCAvZGwvc3dpZwoKSW5zaWRlIHRoZSBj
b250YWluZXIsIHRoZSAvZGwgZGlyZWN0b3J5IGl0c2VsZiBpcyBvd25lZCBieQpici11c2VyOmJy
LXVzZXI6CgokIC4vdXRpbHMvZG9ja2VyLXJ1biBscyAtbGQgL2RsCmRyd3hyLXhyLXguIDI3NiBi
ci11c2VyIGJyLXVzZXIgMTIyODggQXVnICA4IDIxOjE4IC9kbAoKRG9lcyB0aGF0IGFuc3dlciB5
b3VyIHF1ZXN0aW9uPwoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
