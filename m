Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A2BC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4C840394;
	Tue, 22 Apr 2025 21:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGNhQVUIfG9m; Tue, 22 Apr 2025 21:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBD9409DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBD9409DF;
	Tue, 22 Apr 2025 21:31:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AA741A0;
 Tue, 22 Apr 2025 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 209E780CEA;
 Tue, 22 Apr 2025 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiGAUD87x55z; Tue, 22 Apr 2025 21:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2712980CD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2712980CD8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2712980CD8;
 Tue, 22 Apr 2025 21:31:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 183DB1C0FDA; Tue, 22 Apr 2025 23:30:44 +0200 (CEST)
Message-ID: <4a1839ca-f072-4529-bbf7-1e47e8e9a9f2@rnout.be>
Date: Tue, 22 Apr 2025 23:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Buildroot Mailing List <buildroot@buildroot.org>,
 ML_BuildrootUsers <buildroot-users@buildroot.org>,
 Buildroot LTS <buildroot-lts@buildroot.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1745357505; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=mX0rBbHpERTfwzPT/U6xyaXbILvL1wLwviaOqEyYxxc=;
 b=YXrqVI63vzKu8g+nfpZ/mSmmNiGWl3HNbhLW2p8W+S/OmSoyvvkVX8aZdP/ooBuyN7L9TU
 wvtP/zz6tY/3Wa3zg6KweXqtrlXGhPeetSG53fDkVebq5h8OosGZBnMgzmzl5G/2sV0drS
 Ep5YuWCSfPPyi9ucuHTs3s5xeQ6QYW18/BOqhJKEFm7TK1tYwACGnd86Pazhoua49HKuL2
 issEwyNZUi5nLwif0VTMU5GTP1IqI4d5ELQoT4yj2SkXIqoACikrXhORDVO0nB3+6YClkD
 HlEKSl5RTOJaV06r5SxVDwd3hjYZkyeVb8rHE4+ts/kbj83YyKA2GLqgi5+miA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: [Buildroot] Buildroot 2024.02.13 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI0LjAyLjEzIGlzIHJlbGVhc2VkIC0gR28gZG93bmxvYWQgaXQgYXQ6CgpodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjEzLnRhci5negoKb3IKCmh0dHBz
Oi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuMTMudGFyLnh6CgpP
ciBnZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QuZ2l0ICgyMDI0LjAyLjEzIHRhZykKCk5vdGljZSB0aGF0IHRoZSAyMDI0LjAyLnggc2Vy
aWVzIGlzIG5vdyBlbmQgb2YgbGlmZS4gUGxlYXNlIG1pZ3JhdGUgdG8KdGhlIDIwMjUuMDIueCBz
ZXJpZXMgaW5zdGVhZC4KCgpCdWlsZHJvb3QgMjAyNC4wMi4xMyBpcyBhIGJ1Z2ZpeCByZWxlYXNl
LCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8Kc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMg
ZGlzY292ZXJlZCBzaW5jZSB0aGUgMjAyNC4wMi4xMiByZWxlYXNlLgoKCkltcG9ydGFudCAvIHNl
Y3VyaXR5IHJlbGF0ZWQgZml4ZXM6CgotIHhzZXJ2ZXJfeG9yZy1zZXJ2ZXIgJiB4d2F5bGFuZDog
Q1ZFLTIwMjQtOTYzMiwgQ1ZFLTIwMjUtMjY1OTQsCiDCoMKgwqBDVkUtMjAyNS0yNjU5NSwgQ1ZF
LTIwMjUtMjY1OTYsIENWRS0yMDI1LTI2NTk3LCDCoENWRS0yMDI1LTI2NTk4LAogwqDCoMKgQ1ZF
LTIwMjUtMjY1OTksIENWRS0yMDI1LTI2NjAwLCBDVkUtMjAyNS0yNjYwMS4KLSBleGltOiBDVkUt
MjAyNS0zMDIzMi4KLSBtYmVkdGxzOiBDVkUtMjAyNS0yNzgwOSwgQ1ZFLTIwMjUtMjc4MTAuCi0g
YXVnZWFzOiBDVkUtMjAyNS0yNTg4LgotIGxpYmFyY2hpdmU6IENWRS0yMDI0LTU3OTcwLCBDVkUt
MjAyNS0xNjMyLCBDVkUtMjAyNS0yNTcyNC4KLSBsaWJvcGVuaDI2NDogQ1ZFLTIwMjUtMjcwOTEu
Ci0gbGlibW9kc2VjdXJpdHk6IENWRS0yMDI1LTI3MTEwLgotIHRpbnl4bWwyOiBDVkUtMjAyNC01
MDYxNS4KLSBsaWJuZHA6IENWRS0yMDI0LTU1NjQuCi0geHdheWxhbmQ6IENWRS0yMDI0LTMxMDgw
LCBDVkUtMjAyNC0zMTA4MSwgQ1ZFLTIwMjQtMzEwODMsCiDCoMKgwqBDVkUtMjAyNC05NjMyLCBD
VkUtMjAyNS0yNjU5NCwgQ1ZFLTIwMjUtMjY1OTUsCiDCoMKgwqBDVkUtMjAyNS0yNjU5NiwgQ1ZF
LTIwMjUtMjY1OTcsIENWRS0yMDI1LTI2NTk4LAogwqDCoMKgQ1ZFLTIwMjUtMjY1OTksIENWRS0y
MDI1LTI2NjAwLCBDVkUtMjAyNS0yNjYwMS4KLSBsaWJmcmVlZ2x1dDogQ1ZFLTIwMjQtMjQyNTgs
IENWRS0yMDI0LTI0MjU5LgoKVXBkYXRlZC9maXhlZCBwYWNrYWdlczoKCmxpYnNvdXAzLCBsaW51
eCwgYXByLCBtYWxpLWRyaXZlciwKbGliY29hcCwgcHl0aG9uLWZhc3RhcGksIHB5dGhvbi10d2lz
dGVkLCB0b3IsIGxpbnV4LWhlYWRlciwKbGludXgtdG9vbHMsIGxpYm1vZHNlY3VyaXR5CgpUZXN0
IEltcHJvdmVtZW50czoKCi0gbGludXgtdG9vbHM6IHNlbGZ0ZXN0czogQWRkIHBhdGggY29udGFp
bmluZyBCUEYgYmluYXJ5LgotIHRlc3Rpbmc6IGFkZCBnaXQgcnVudGltZSB0ZXN0LgoKSW5mcmFz
dHJ1Y3R1cmUgdXBkYXRlcy9maXhlczoKCi0gREVWRUxPUEVSUzogY2hhbmdlIGFybm91dCdzIGFk
ZHJlc3MuCi0gREVWRUxPUEVSUzogYWRkIERhcmlvIEJpbmFjY2hpIGZvciB0aS1rMy1ib290LWZp
cm13YXJlLgotIHN1cHBvcnQvZG93bmxvYWQvc3ZuOiB1c2UgJ3N2biBpbmZvJyB3aGl0aCBMQ19B
TEw9Qy4KLSBkaWxsbzogRml4IGFuIGlzc3VlIHJlbGF0ZWQgdG8gX1NJVEUgdXJsIGZvciBtYWtl
IHNob3ctaW5mby4KLSBrY29uZmlnOiBIYW5kbGUgYmFja3NwYWNlICheSCkga2V5LgotIHBrZy1z
dGF0czogYWRkIC12Ly0tdmVyYm9zZSBvcHRpb24KCkJ1aWxkIGlzc3Vlcy9wcm9ibGVtcyBzb2x2
ZWQgZm9yOgpnbGliYywgbWVzYTNkLWRlbW9zLgoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBD
SEFOR0VTIGZpbGU6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9ibG9iLzIwMjQuMDIuMTMvQ0hBTkdFUwoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2Vz
IGFyZSBzdHJvbmdseSBlbmNvdXJhZ2VkIHRvIHVwZ3JhZGUuCgoKTWFueSB0aGFua3MgdG8gYWxs
IHRoZSBwZW9wbGUgY29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAt
cyAtbiAyMDI0LjAyLjEyLi4KCiDCoMKgwqDCoDUgwqBCZXJuZCBLdWhscwogwqDCoMKgwqA0IMKg
UGV0ZXIgS29yc2dhYXJkCiDCoMKgwqDCoDQgwqBUaG9tYXMgUGVyYWxlCiDCoMKgwqDCoDIgwqBD
b2xpbiBFdnJhcmQKIMKgwqDCoMKgMiDCoERhcmlvIEJpbmFjY2hpCiDCoMKgwqDCoDIgwqBGaW9u
YSBLbHV0ZSAoV0lXQSkKIMKgwqDCoMKgMiDCoEdpbGxlcyBCYXJkb3V4CiDCoMKgwqDCoDIgwqBO
aWtsYXMgQ2Fzc2VsCiDCoMKgwqDCoDIgwqBUaG9tYXMgUGV0YXp6b25pCiDCoMKgwqDCoDEgwqBB
cm5vdXQgVmFuZGVjYXBwZWxsZQogwqDCoMKgwqAxIMKgRnJhbmsgVmFuYmV2ZXIKIMKgwqDCoMKg
MSDCoEdpdWxpbyBCZW5ldHRpCiDCoMKgwqDCoDEgwqBKdWxpZW4gT2xpdmFpbgogwqDCoMKgwqAx
IMKgTWFyY3VzIEhvZmZtYW5uCiDCoMKgwqDCoDEgwqBNYXRoZXVzIFRhdmFyZXMgQmVybmFyZGlu
bwogwqDCoMKgwqAxIMKgUmFwaGHDq2wgTcOpbG90dGUKIMKgwqDCoMKgMSDCoFJvbWFpbiBOYW91
cgogwqDCoMKgwqAxIMKgU8OpYmFzdGllbiBTenltYW5za2kKIMKgwqDCoMKgMSDCoFRob21hcyBE
ZXZvb2dkdAoKUmVnYXJkcywKQXJub3V0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
