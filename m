Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224DCCA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 15:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D10FB840E4;
	Tue,  2 Sep 2025 15:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rkctEH-VDc80; Tue,  2 Sep 2025 15:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0BED83FF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0BED83FF2;
	Tue,  2 Sep 2025 15:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA65439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 252A060B21
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxKAJFXVJm6N for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 15:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40ADC60AD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40ADC60AD3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40ADC60AD3
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:43:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 111204E40C5C;
 Tue,  2 Sep 2025 15:42:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D759B60695;
 Tue,  2 Sep 2025 15:42:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F05AC1C22DE2C; 
 Tue,  2 Sep 2025 17:42:44 +0200 (CEST)
Date: Tue, 2 Sep 2025 17:42:43 +0200
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>, Romain
 Naour <romain.naour@smile.fr>
Message-ID: <20250902174243.7e73b14a@windsurf>
In-Reply-To: <f834c040-70df-46dc-91b1-c50b9a91a69d@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
 <20250902154936.1563f079@windsurf>
 <cdae50eb-2553-4baf-ac3d-450838705c32@smile.fr>
 <20250902171144.479f13a6@windsurf>
 <f834c040-70df-46dc-91b1-c50b9a91a69d@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756827777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rnCnKiQf+ORs8BD0yUNh16YGz6RHveebjlGZtYpJMX4=;
 b=dax3MU5NMxTOFZorKcwr/XzcmR5FK9JOr6LMgSqMvDZyboVv6IzfdL0wPbv4O7Ea4xhuPw
 jHtBckWEZWN0AdR7gmio7z2KDlX0SDzSldJkwsDTK0Z5g1X+3qN6OelyUhEtqz5KCTFaGu
 J9ZpK4uWr/KNrwM8An8vrYXgB2RDzzJUn5XKwBP2tIpBPVDln8qm9qHGZqsiQr5uur5vpz
 Imm1rNnMEMEVeRs++HlyZaTTRuSRx2dASjQS+9kqawQMc1YzlF9MEFPzAgZUF/ifgEARLc
 wbBkUHXCfgZbT7t7r/qfdxU3RmDJUAsXSzTaiVuI9wCgLbfR5smZvp6lSxFVuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dax3MU5N
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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

T24gVHVlLCAyIFNlcCAyMDI1IDE3OjI4OjQxICswMjAwCkVsIE1laGRpIFlPVU5FUyA8ZWxtZWhk
aS55b3VuZXNAc21pbGUuZnI+IHdyb3RlOgoKPiBUaGUgcGF0Y2ggd2FzIG5vdCBzdWJtaXR0ZWQg
dXBzdHJlYW0gYmVjYXVzZSB0aGVyZSBpcyBhbHJlYWR5IGFuIG9uZ29pbmcKPiBkaXNjdXNzaW9u
IGFib3V0IHJlbW92aW5nIE9uaWd1cnVtYSBmcm9tIGJhdCBhbHRvZ2V0aGVyLCBzaW5jZSBPbmln
dXJ1bWEKPiBoYXMgYmVlbiBkZWNsYXJlZCBhcmNoaXZlZDoKPiAKPiAgwqAgaHR0cHM6Ly9naXRo
dWIuY29tL3NoYXJrZHAvYmF0L2lzc3Vlcy8zMjg1Cj4gCj4gRm9yIG5vdywgc29tZSBmZWF0dXJl
cyBpbiBiYXQgc3RpbGwgZGVwZW5kIG9uIE9uaWd1cnVtYSBieSBkZWZhdWx0LCBzbwo+IHVwc3Ry
ZWFtIGtlZXBzICdyZWdleC1vbmlnJyBhcyB0aGUgZGVmYXVsdCBlbmdpbmUuIFRoYXTigJlzIHdo
eSBJIGRpZCBub3QKPiBwcm9wb3NlIHRoaXMgcGF0Y2ggdXBzdHJlYW0uCgpXb3VsZCBiZSBnb29k
IHRvIGhhdmUgdGhpcyBleHRlbnNpdmUgZXhwbGFuYXRpb24gaW4gdGhlIHBhdGNoLCBpbnN0ZWFk
Cm9mIGp1c3QgIlVwc3RyZWFtOiBub3Qgc3VibWl0dGVkIi4KCj4gQWNjb3JkaW5nIHRvIHRoZSB1
cHN0cmVhbSBkaXNjdXNzaW9uLCBpdCBzdGlsbCBtYWtlcyBzZW5zZSBmb3IgYmF0IHRvCj4ga2Vl
cCBPbmlndXJ1bWEgYXMgdGhlIGRlZmF1bHQgZW5naW5lIGZvciBub3cuIFNvIGJlZm9yZSBzZW5k
aW5nIGEgdjIsIEkKPiB3b3VsZCBsaWtlIHRvIHRha2UgYSBzdGVwIGJhY2sgYW5kIGV4cGxvcmUg
YW5vdGhlciBhcHByb2FjaC4KPiAKPiBJIGtub3cgdGhhdCAnb25pZ19zeXMnIGNhbiBzb21ldGlt
ZXMgbGluayBhZ2FpbnN0IGEgc3lzdGVtLXByb3ZpZGVkCj4gT25pZ3VydW1hIGxpYnJhcnkgaW5z
dGVhZCBvZiBjb21waWxpbmcgaXQuIEluIEJ1aWxkcm9vdCB3ZQo+IGFscmVhZHkgaGF2ZSAnb25p
Z3VydW1hJyBhdmFpbGFibGUgYXMgYSBwYWNrYWdlLCBzbyB3ZSBjb3VsZCBjb25zaWRlcgo+IHVz
aW5nIHRoYXQgc3lzdGVtIGxpYnJhcnkgcmF0aGVyIHRoYW4gcGF0Y2hpbmcgYmF0IHRvIHN3aXRj
aCB0bwo+ICdyZWdleC1mYW5jeScuIFRoaXMgd2F5LCB3ZSBjb3VsZCBrZWVwIGJhdCBhbGlnbmVk
IHdpdGggdXBzdHJlYW0gd2hpbGUKPiBzdGlsbCBmaXhpbmcgdGhlIEdDQyAxNSBidWlsZCBpc3N1
ZS4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcz8KPiAKPiBzZWUKPiAKPiBodHRwczovL2Ny
YXRlcy5pby9jcmF0ZXMvb25pZy82LjUuMQoKVGhhdCB3b3VsZCB3b3JrIHdpdGggbWUgYXMgd2Vs
bC4gV2hhdCdzIGltcG9ydGFudCBpcyB0aGF0IHdlIGhhdmUgYSBHQ0MKMTUueCBidWlsZCBmaXgg
YXZhaWxhYmxlIGluIHRoZSBzaG9ydCB0ZXJtLiBBbm90aGVyIG9wdGlvbiBpcyB0byB0YWtlCnlv
dXIgcXVpY2sgZml4IGFzLWlzLCBhbmQgbGF0ZXIgb24gaW1wcm92ZSB0byB1c2UgYWdhaW4gT25p
Z3VydW1hLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
