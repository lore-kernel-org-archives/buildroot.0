Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDE5C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141CE60E14;
	Wed, 16 Apr 2025 21:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2y3UJjB2SrN; Wed, 16 Apr 2025 21:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7CC6F642
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7CC6F642;
	Wed, 16 Apr 2025 21:02:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F6A9159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C4E46F52D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGthp9tsa4pO for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:02:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25C416F60C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C416F60C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25C416F60C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:02:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 53EF31C00C0; Wed, 16 Apr 2025 23:02:11 +0200 (CEST)
Message-ID: <fbc769e4-ad67-419b-ada8-40f58ea0993b@rnout.be>
Date: Wed, 16 Apr 2025 23:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250310105350.2848707-1-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20250310105350.2848707-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Y36Ww/zh+sIYj7ZRLO8uK1B5xrPK1/aVn2x6GLK1/YE=;
 b=ABusoJXzKKVliNKRU/EWzycdQf6ArwUZ+qB6UMCpT2D3Y+adWf5nwAIjsYwH1CH06CzvmO
 aAtdmrni0/Yp8oQ5Lj9D848VNP1VtGKy+8EX3V22WVokW+gkIkXQ/NEhVhQuXJWNxjBY2g
 rruhNf5BgCAp1Bn1scCh1GvtxcFn6cgeIT2bD8Rpqq2PaQmLPGRyuqQEDpJHi7k/iqOxme
 ioM6KGQRTpwheqRBxW6JIjf3ITfS/xNWrhxgIdSVsgenul+jJmqKYXBddALl0n0mXmQgOA
 MAtDKVDAS8bwwpvhSwIOrIf+8bQRz5bCuXJ+snUr0gCy2jISHcIPN5BJeDPfNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v3 1/2] package/mesa3d-demos: depend on
 vulkan-loader if enabled
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

Ck9uIDEwLzAzLzIwMjUgMTE6NTMsIEZpb25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KPgo+IFZ1bGth
biBzdXBwb3J0IGluIG1lc2EzZC1kZW1vcyByZXF1aXJlcyB2dWxrYW4tbG9hZGVyLiBXaXRob3V0
IGFuCj4gZXhwbGljaXQgY29uZmlnIGZsYWcgaXQgaXMgYXV0b2RldGVjdGVkLCBhbmQgbWF5IG9y
IG1heSBub3QgYmUgZW5hYmxlZAo+IGRlcGVuZGluZyBvbiBidWlsZCBvcmRlciwgbGVhZGluZyB0
byB1bnByZWRpY3RhYmxlIHJlc3VsdHMuCj4KPiBGaXggdGhpcyBieSBleHBsaWNpdGx5IGVuYWJs
aW5nIFZ1bGthbiBzdXBwb3J0IGFuZCBkZXBlbmRpbmcgb24KPiB2dWxrYW4tbG9hZGVyIGlmIEJS
Ml9QQUNLQUdFX1ZVTEtBTl9MT0FERVI9eSwgYW5kIGRpc2FibGluZyBWdWxrYW4KPiBzdXBwb3J0
IG90aGVyd2lzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8ZmlvbmEu
a2x1dGVAZ214LmRlPgoKIMKgQXBwbGllZCBib3RoIHRvwqAyMDI1LjAyLngsIDIwMjQuMTEueCBh
bmQgMjAyNC4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gQ2hh
bmdlcyB2MiAtPiB2MzogQWRkIHRoaXMgcGF0Y2ggdG8gcmVsaWFibHkgZW5hYmxlL2Rpc2FibGUg
VnVsa2FuIHN1cHBvcnQKPgo+ICAgcGFja2FnZS9tZXNhM2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1r
IHwgNyArKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1rIGIvcGFja2FnZS9t
ZXNhM2QtZGVtb3MvbWVzYTNkLWRlbW9zLm1rCj4gaW5kZXggOGFjYmE5MjcwYS4uY2MwMTIxZjZk
NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC1kZW1vcy9tZXNhM2QtZGVtb3MubWsKPiAr
KysgYi9wYWNrYWdlL21lc2EzZC1kZW1vcy9tZXNhM2QtZGVtb3MubWsKPiBAQCAtNjksNCArNjks
MTEgQEAgZWxzZQo+ICAgTUVTQTNEX0RFTU9TX0NPTkZfT1BUUyArPSAtRHdheWxhbmQ9ZGlzYWJs
ZWQKPiAgIGVuZGlmCj4gICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9WVUxLQU5fTE9BREVSKSx5
KQo+ICtNRVNBM0RfREVNT1NfREVQRU5ERU5DSUVTICs9IHZ1bGthbi1sb2FkZXIKPiArTUVTQTNE
X0RFTU9TX0NPTkZfT1BUUyArPSAtRHZ1bGthbj1lbmFibGVkCj4gK2Vsc2UKPiArTUVTQTNEX0RF
TU9TX0NPTkZfT1BUUyArPSAtRHZ1bGthbj1kaXNhYmxlZAo+ICtlbmRpZgo+ICsKPiAgICQoZXZh
bCAkKG1lc29uLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
