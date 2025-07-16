Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7338EC83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 16:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2345983DFA;
	Wed, 16 Jul 2025 16:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoQMeQZ4R7e7; Wed, 16 Jul 2025 16:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 360D083C19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 360D083C19;
	Wed, 16 Jul 2025 16:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBE791514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 16:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD3954095C
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 16:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pi2CKM1VVJE7 for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 16:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD8D040958
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8D040958
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD8D040958
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 16:21:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88C78442A0;
 Wed, 16 Jul 2025 16:21:05 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 16 Jul 2025 18:21:05 +0200
Message-Id: <DBDM80RGBKL3.28PXMVWQU0RW8@bootlin.com>
To: "Philipp Ludwig" <philipp.ludwig@passerro.de>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <DBCMY08KG84D.1F2PPB3UFPRK8@bootlin.com>
 <13e60f08-7ff6-43d6-bfbe-54f3aa68b96f@passerro.de>
In-Reply-To: <13e60f08-7ff6-43d6-bfbe-54f3aa68b96f@passerro.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehkedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeftdelgeduffehtdehhfefteehjeevgfejueeltdegheetvdfgteduheeggfekheenucffohhmrghinhepghhithhhuhgsrdgtohhmpdifvggskhhithdrohhrghdpsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehphhhilhhiphhprdhluhgufihighesphgrshhsvghrrhhordguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752682865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19METr8aPfJ6uyAQ7hsi+2HadN5jf+e2thgvJZVQxOs=;
 b=K6PzTw84pt4nZ/DL6mXf/EBCmN9bTcaEbKF8awt0i5Bp5uDb3D32gVqS03tIVFNgvHcJX2
 Ufq8nDny5t5xCd/8u9+9HMRuSaa32lJ26ndiPogxyGCKLq6201UBSKdN6pw7aQB2U6odkf
 fvuQN2dhpUWCHn+N2CdbxSfF96PXDf9L2JvfZe2yAixxGLsVzTb70CNCyVLD8euM3Xc5se
 KfbbYxWMn7D9RQjcFfUQ1lZPkr6y1hncZT+kMwov1Ml8XvKghP4zGqAZhgnvPQ2IKidzQh
 tBSmP9qUiKmV7qh2/jnT46KYWkB3xs7IB5cOYSSkhS66df5qUW+b9qnM06ZYpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K6PzTw84
Subject: Re: [Buildroot] Build failure on qt5webkit
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

SGkgIFBoaWxpcHAsCgpPbiBXZWQgSnVsIDE2LCAyMDI1IGF0IDg6MTkgQU0gQ0VTVCwgUGhpbGlw
cCBMdWR3aWcgd3JvdGU6Cj4gT24gNy8xNS8yNSAxNDo0MiwgQWxleGlzIExvdGhvcsOpIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4+IEkgYW0gZmFjaW5nIGEgYnVpbGQgaXNzdWUgd2l0aCBxdDV3ZWJr
aXQgcGFja2FnZSBvbiBidWlsZHJvb3QgMjAyNS4wMi54Lgo+PiBUaGUgYnVpbGQgb3V0cHV0cyB0
aGUgZm9sbG93aW5nIGVycm9yOgo+PiAKPj4gL2hvbWUvYWxleGlzL3NyYy9idWlsZHJvb3Qvb3V0
cHV0L2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYv
aW5jbHVkZS9jKysvMTQuMi4wL3R5cGVfdHJhaXRzOjEyMzc6NTI6IGVycm9yOiBub24tY29uc3Rh
bnQgY29uZGl0aW9uIGZvciBzdGF0aWMgYXNzZXJ0aW9uCj4KPj4gSSBhbSBub3QgdmVyeSBmbHVl
bnQgaW4gQysrLCBzbyBJIHN0cnVnZ2xlIHRvIGZpeCBpdC4gQmFzZWQgb24gdGhlIGJ1aWxkCj4+
IGxvZ3MsIEkgZ3Vlc3MgaXQgcmVsYXRlcyB0byBzb21lIG1pc3Npbmcgc29tZSBoZWFkZXIgaW5j
bHVkZQo+PiAoQ29udGVudFNlY3VyaXR5UG9saWN5SGFzaC5oLCBJIGJlbGlldmUgaXQgaGFzIHRv
IGRvIHdpdGggdGhlIHF0NXdlYmtpdCBzb3VyY2Ugbm90IHdvcmtpbmcgd2l0aCB0aGUKPiBnKysg
dmVyc2lvbiB5b3UgZ290LiBZb3VyIGcrKyBtaWdodCBiZSB0b28gbmV3LiB0eXBlX3RyYWl0cyBo
YXMgY2hhbmdlZCAKPiBhIGJpdCBvdmVyIHRoZSBwYXN0LCBzbyB0aGF0ICptaWdodCogaGF2ZSBz
b21ldGhpbmcgdG8gZG8gd2l0aCBpdC4KClllcywgdGhhdCdzIHZlcnkgbGlrZWx5IG15IG5ldyB0
b29sY2hhaW4gdmVyc2lvbiB0aGF0IGlzIHRyaWdnZXJpbmcgdGhpcwppc3N1ZS4gSSBoYWQgYSBi
dWlsZCBwYXNzaW5nIHdpdGggYSBzbGlnaHRseSBvbGRlciB0b29sY2hhaW4uIFRoZSB0b29sY2hh
aW4KdXBkYXRlIGhhcyBiZWVuIGRyaXZlbiBieSB0aGUgbmVlZCBvZiBmcmVzaGVyIGtlcm5lbCBo
ZWFkZXJzIGZvciBvdGhlcgpwYWNrYWdlcywgYnV0IGEgc29sdXRpb24gY291bGQgYmUgdG8gdXNl
IGEgY3VzdG9tIHRvb2xjaGFpbiB3aXRoIG9ubHkgdGhlCmtlcm5lbCBoZWFkZXJzIHVwZGF0ZSwg
bm90IHVwZGF0aW5nIGcrKy4KCj4gID4gYW5kIHF0d2Via2l0IGRvZXMgbm90IGxvb2sgYWxpdmUs
IGJhc2VkIG9uIGxhdGVzdCBjb21taXRzIGRhdGVzKS4KPiBJdCB3YXMgZGVwcmVjYXRlZCBpbiBR
dCA1LjUgYmFjayBpbiAyMDE1LiBTb21lIHBlb3BsZSBmb3JrZWQgaXQgYW5kIGtlcHQgCj4gaXQg
YWxpdmUgdW50aWwgMjAxOSBvciBzbywgYW5kIG5vdyB0aGVyZSBpcyBhbm90aGVyIGZvcmsgZ29p
bmcgb24gaGVyZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tb3ZhYmxlaW5rL3dlYmtpdAo+Cj4g
VGhlICJvZmZpY2lhbCIgcmVjb21tZW5kYXRpb24gaXMgdG8gdXNlIFF0V2ViRW5naW5lIG9yIFF0
V2ViVmlldywgCj4gd2hhdGV2ZXIgaXMgbW9yZSBhcHByb3ByaWF0ZS4gQnV0IEkgY291bGQgbm90
IGdldCBlaXRoZXIgb2YgdGhlbSB0byAKPiBidWlsZCB3aXRoIGJ1aWxkcm9vdCwgc28gWU1NVi4K
Pgo+IEFuIGVtYmVkZGVkIHZlcnNpb24gb2Ygd2Via2l0IGlzIFdQRSwgd2hpY2ggaXMgYWxzbyBh
dmFpbGFibGUgaW4gCj4gYnVpbGRyb290IGFzIFdQRVdFQktJVDogaHR0cHM6Ly93ZWJraXQub3Jn
L3dwZS8KClRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbiBhbmQgdGhlIGhpbnRzIGZvciBuZXcg
cGFja2FnZXMuIEkgaGF2ZSBnaXZlbiBhCnF1aWNrIHRyeSB0byB0aGUgZm9yaywgYnV0IGl0IGRv
ZXMgbm90IGxvb2sgYW55IGJldHRlci4gU29tZSBicmFuY2hlcwptZW50aW9uZWQgaW4gdGhlIFJF
QURNRSBjYW4gbm90IGV2ZW4gYmUgZm91bmQgaW4gdGhlIHJlcG8uIEkgZ3Vlc3MgSSdsbApuZWVk
IHRvIGdldCByaWQgb2YvcmVwbGFjZSB0aG9zZSBkZXBlbmRlbmNpZXMuCgpUaGFua3MsCgpBbGV4
aXMKPgo+IEJlc3QgcmVnYXJkcwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgoKCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
