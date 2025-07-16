Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE4CC83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 06:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2766C4063A;
	Wed, 16 Jul 2025 06:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3fcW9S-ijdR; Wed, 16 Jul 2025 06:20:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 493A1405AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 493A1405AE;
	Wed, 16 Jul 2025 06:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A714B1514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718C983CCB
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZsdpo6tkpFJ for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 06:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.146.106.76;
 helo=smtp06-ext.udag.de; envelope-from=philipp.ludwig@passerro.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD47083C6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD47083C6E
Received: from smtp06-ext.udag.de (smtp06-ext.udag.de [62.146.106.76])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD47083C6E
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 06:20:01 +0000 (UTC)
Received: from [192.168.15.156] (p578aae36.dip0.t-ipconnect.de [87.138.174.54])
 by smtp06-ext.udag.de (Postfix) with ESMTPA id 6AA69E0E7F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 08:19:58 +0200 (CEST)
Message-ID: <13e60f08-7ff6-43d6-bfbe-54f3aa68b96f@passerro.de>
Date: Wed, 16 Jul 2025 08:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <DBCMY08KG84D.1F2PPB3UFPRK8@bootlin.com>
Content-Language: en-US
From: Philipp Ludwig <philipp.ludwig@passerro.de>
In-Reply-To: <DBCMY08KG84D.1F2PPB3UFPRK8@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=passerro.de; s=uddkim-202310; 
 t=1752646798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z91m1eZgDSC0feDxmpNj0fn91M4pDexvPGatrEMDLKA=;
 b=N/Fj0YY2ZYXheCmghhst3QRUJldRt8Wt5DTL+IhWBCHyR109MKMy4U3XDddDXSJcs8ijzh
 A3UnJjs/b80mt51j7fF0QOGYpljX2qBPvPAEjYuCX5Mi55Xx/z5hTVkPGpWXRntEja3fWX
 MfuG5O0f/y5kgjgUFH5qc6d3R0xQncmxuCK0miURj6HHdCi06waFv5M/XbNHmTWpt9OZ/e
 B0JzvGWPTkAKyBXHcDy/X8bXknNKQG0BPr2OKTk46r0KyXmu5gGQLDMLEA2YzqXJtqkVxF
 8Kbca5dGi/cL1Q0k9RvBwIjc5oz9ZPYq/IrJV7fjalZCg0x7te2npXO+b1IexQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=passerro.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=passerro.de header.i=@passerro.de header.a=rsa-sha256
 header.s=uddkim-202310 header.b=N/Fj0YY2
X-Mailman-Original-Authentication-Results: smtp06-ext.udag.de;
 auth=pass smtp.auth=philipp.ludwig@passerro.de
 smtp.mailfrom=philipp.ludwig@passerro.de
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8xNS8yNSAxNDo0MiwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
SSBhbSBmYWNpbmcgYSBidWlsZCBpc3N1ZSB3aXRoIHF0NXdlYmtpdCBwYWNrYWdlIG9uIGJ1aWxk
cm9vdCAyMDI1LjAyLnguCj4gVGhlIGJ1aWxkIG91dHB1dHMgdGhlIGZvbGxvd2luZyBlcnJvcjoK
PiAKPiAvaG9tZS9hbGV4aXMvc3JjL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9vcHQvZXh0LXRvb2xj
aGFpbi9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9pbmNsdWRlL2MrKy8xNC4yLjAvdHlw
ZV90cmFpdHM6MTIzNzo1MjogZXJyb3I6IG5vbi1jb25zdGFudCBjb25kaXRpb24gZm9yIHN0YXRp
YyBhc3NlcnRpb24KCj4gSSBhbSBub3QgdmVyeSBmbHVlbnQgaW4gQysrLCBzbyBJIHN0cnVnZ2xl
IHRvIGZpeCBpdC4gQmFzZWQgb24gdGhlIGJ1aWxkCj4gbG9ncywgSSBndWVzcyBpdCByZWxhdGVz
IHRvIHNvbWUgbWlzc2luZyBzb21lIGhlYWRlciBpbmNsdWRlCj4gKENvbnRlbnRTZWN1cml0eVBv
bGljeUhhc2guaCwgSSBiZWxpZXZlIGl0IGhhcyB0byBkbyB3aXRoIHRoZSBxdDV3ZWJraXQgc291
cmNlIG5vdCB3b3JraW5nIHdpdGggdGhlCmcrKyB2ZXJzaW9uIHlvdSBnb3QuIFlvdXIgZysrIG1p
Z2h0IGJlIHRvbyBuZXcuIHR5cGVfdHJhaXRzIGhhcyBjaGFuZ2VkIAphIGJpdCBvdmVyIHRoZSBw
YXN0LCBzbyB0aGF0ICptaWdodCogaGF2ZSBzb21ldGhpbmcgdG8gZG8gd2l0aCBpdC4KCiA+IGFu
ZCBxdHdlYmtpdCBkb2VzIG5vdCBsb29rIGFsaXZlLCBiYXNlZCBvbiBsYXRlc3QgY29tbWl0cyBk
YXRlcykuCkl0IHdhcyBkZXByZWNhdGVkIGluIFF0IDUuNSBiYWNrIGluIDIwMTUuIFNvbWUgcGVv
cGxlIGZvcmtlZCBpdCBhbmQga2VwdCAKaXQgYWxpdmUgdW50aWwgMjAxOSBvciBzbywgYW5kIG5v
dyB0aGVyZSBpcyBhbm90aGVyIGZvcmsgZ29pbmcgb24gaGVyZToKCmh0dHBzOi8vZ2l0aHViLmNv
bS9tb3ZhYmxlaW5rL3dlYmtpdAoKVGhlICJvZmZpY2lhbCIgcmVjb21tZW5kYXRpb24gaXMgdG8g
dXNlIFF0V2ViRW5naW5lIG9yIFF0V2ViVmlldywgCndoYXRldmVyIGlzIG1vcmUgYXBwcm9wcmlh
dGUuIEJ1dCBJIGNvdWxkIG5vdCBnZXQgZWl0aGVyIG9mIHRoZW0gdG8gCmJ1aWxkIHdpdGggYnVp
bGRyb290LCBzbyBZTU1WLgoKQW4gZW1iZWRkZWQgdmVyc2lvbiBvZiB3ZWJraXQgaXMgV1BFLCB3
aGljaCBpcyBhbHNvIGF2YWlsYWJsZSBpbiAKYnVpbGRyb290IGFzIFdQRVdFQktJVDogaHR0cHM6
Ly93ZWJraXQub3JnL3dwZS8KCkJlc3QgcmVnYXJkcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
