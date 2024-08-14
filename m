Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5AFC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 23:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61576089F;
	Wed, 14 Aug 2024 23:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2g-46wcqzpJQ; Wed, 14 Aug 2024 23:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC132608A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC132608A8;
	Wed, 14 Aug 2024 23:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C74461BF599
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 23:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B476F608A8
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 23:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrlvTOiZ-8rZ for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 23:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5A316089F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A316089F
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5A316089F
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 23:41:14 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9777A3535C0F; Thu, 15 Aug 2024 01:41:10 +0200 (CEST)
Date: Thu, 15 Aug 2024 01:41:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zr1AlnZfmJyJGFRC@waldemar-brodkorb.de>
References: <ZrrZvTetrbgQqpCL@waldemar-brodkorb.de>
 <20240814234938.651915c6@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814234938.651915c6@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723678870; bh=RJM7XJUJT9CgE7eFl1Ezyf7NkqmKcSANZE227qgqA3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ehfj5vKbaZxcbK9MfDdIHqf/MePQr582faz/G2kygv++WqZDxxS793OmZ7ayYP+1R
 +tx0kOuv1ciMukAP8x8S354tq/Tt2UYKkoXfq91jDNQDngHI9wOM/6eWLHkVXUphMi
 KelF2q2ONqa8ZV8XedVT2RkXxBK3jkvthVJwiXnXyIJfWZF6mojUmeVrHs0NU1IJXv
 H6TkqDbHzEJwrENLF8pYESypD8MmH/6X8OPZ738mIvgc19nwKnxMemvSbBf4mRUd0R
 rUwwNrQxQZTWAqz7IambpV/7ykZZqIJu0LdJwNaGqp0GN/8rJCUPfMdPtdClLZ0NI8
 whXCTYhlK9hDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ehfj5vKb
Subject: Re: [Buildroot] [PATCH] package/uclibc: update to 1.0.50
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLApUaG9tYXMgUGV0YXp6b25pIHdyb3RlLAoKPiBPbiBUdWUsIDEzIEF1ZyAyMDI0
IDA1OjU3OjQ5ICswMjAwCj4gV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4gd3Jv
dGU6Cj4gCj4gPiBTZWUgdGhpcyBnaXQgc2hvcnRsb2cgZm9yIGNoYW5nZXM6Cj4gPiAKPiA+IERt
aXRyeSBDaGVzdG55a2ggKDIpOgo+ID4gICAgICAgRml4IGNvbXBpbGF0aW9uIHdpdGggNC54IGtl
cm5lbCBoZWFkZXJzCj4gPiAgICAgICBHcm91cCBjb25kaXRpb25zIGFmdGVyIGAmJmAKPiA+IAo+
ID4gRnJhbmsgTWVobmVydCAoNik6Cj4gPiAgICAgICBsaWJkbDogcHJvcGVybHkgY2FzdCBwYXJh
bWV0ZXJzIGZvciAlcCBmb3JtYXQgc3RyaW5nIHNwZWNpZmllcgo+ID4gICAgICAgaWNvbnY6IGV4
cGxpY2l0IGNhc3QgdG8gYHVuc2lnbmVkIGNoYXIqYAo+ID4gICAgICAgaWNvbnY6IGV4cGxpY2l0
bHkgc3RhdGUgb3BlcmF0b3IgcHJlY2VkZW5jZQo+ID4gICAgICAgbGRzby5jOiB1c2UgJ3Vuc2ln
bmVkIGludCcgYXMgbG9vcCB2YXJpYWJsZSB0eXBlCj4gPiAgICAgICBpY29udjogZml4IHBhcmFt
ZXRlciB0eXBlIG9mIHV0ZjhzZXFfaXNfe292ZXJsb25nLHN1cnJvZ2F0ZSxpbGxlZ2FsfQo+ID4g
ICAgICAgaWNvbnY6IHByZXZlbnQgY29tcGlsZXIgd2FybmluZyBkdXJpbmcgaW5pdGlhbGl6YXRp
b24gd2l0aCBqaXMwMjA4Cj4gPiAKPiA+IEouIE5ldXNjaMOkZmVyICgxKToKPiA+ICAgICAgIGJp
dHMvc3RhdC5oOiBEZWNsYXJlIHN0X210aW0gaWYgZGVmaW5lZChfX1VTRV9YT1BFTjJLOCksIGV2
ZXJ5d2hlcmUKPiA+IAo+ID4gTWFyY3VzIEhhZWhuZWwgKDUpOgo+ID4gICAgICAgbGRzby9kbC12
ZHNvOiBhdm9pZCBjb21waWxlciB3YXJuaW5nIGlmIGNvbmZpZ3VyZWQgd2l0aG91dCB2ZHNvCj4g
PiAgICAgICB1Y2xpYmM6IEZpeCBkb3VibGUgcHJvbW90aW9uIHdhcm5pbmcKPiA+ICAgICAgIGxp
Ym06IEZpeCBmbG9hdCBjb252ZXJzaW9uIGNvbXBpbGVyIHdhcm5pbmcKPiA+ICAgICAgIGZlYXR1
cmVzLmg6IGFkZCBjbGFuZyBwcmVyZXF1aXNpdGUgbWFjcm8KPiA+ICAgICAgIGJ1aWxkc3lzOiBh
bGxvdyBidWlsZGluZyB3aXRoIGdjYy0xNAo+ID4gCj4gPiBTdmVuIExpbmtlciAoMSk6Cj4gPiAg
ICAgICBjKys6IFJlbW92ZSBkZXByZWNhdGVkIGR5bmFtaWMgZXhjZXB0aW9uIHNwZWNpZmljYXRp
b24KPiA+IAo+ID4gVmFsZW50aW4gR2VocmtlICgxKToKPiA+ICAgICAgIGFybTogUmVwbGFjZSBk
ZXByZWNhdGVkIGFzbSBpbnN0cnVjdGlvbnMgZm9yIEFSTXY4IEFBcmNoMzIKPiA+IAo+ID4gV2Fs
ZGVtYXIgQnJvZGtvcmIgKDkpOgo+ID4gICAgICAgQ2xhbmcgc3VwcG9ydCBmb3IgZ251X2lubGlu
ZSBhdHRyaWJ1dGUKPiA+ICAgICAgIGFsbG93IHRvIHVzZSA8c3lzL3Vjb250ZXh0Lmg+Cj4gPiAg
ICAgICBhZGQgU0VFS19EQVRBL1NFRUtfSE9MRQo+ID4gICAgICAgbHNlZWs6IGFsbG93IFNFRUtf
REFUQS9TRUVLX0hPTEUgdG8gYmUgdXNlZAo+ID4gICAgICAgYml0cy9zdGF0Lmg6IERlY2xhcmUg
c3RfbXRpbSBpZiBkZWZpbmVkKF9fVVNFX1hPUEVOMks4KSwgYWRkIG1pc3NpbmcKPiA+ICAgICAg
IHJpc2N2OiByZW1vdmUgaW5jb21wbGV0ZSBjb250ZXh0IGltcGxlbWVudGF0aW9uLCB1c2UgbGli
dWNvbnRleHQKPiA+ICAgICAgIGFkZCBtZW1mZF9jcmVhdGUgc3lzY2FsbCB3cmFwcGVyCj4gPiAg
ICAgICBnZXRyYW5kb206IHJlbW92ZSBfX1VTRV9HTlUgLyBhZGQgR1JORF9JTlNFQ1VSRQo+ID4g
ICAgICAgYnVtcCB2ZXJzaW9uIGZvciAxLjAuNTAgcmVsZWFzZQo+ID4gCj4gPiBZYW5uIExlIER1
ICgxKToKPiA+ICAgICAgIHN0ZGxpYjogaW5jcmVhc2UgbnVtYmVyIG9mIHN0YXRpYyBhdGV4aXQg
aGFuZGxlcnMgdG8gMzIKPiA+IAo+ID4gQWxsIGJ1aWxkcm9vdCBwYXRjaGVzIGFyZSB1cHN0cmVh
bS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRr
Lm9yZz4KPiA+IC0tLQo+IAo+IEl0J3MgYSB2ZXJzaW9uIGJ1bXAgb2YgYSBjcml0aWNhbCBjb21w
b25lbnQsIGluIG1hc3RlciwgcXVpdGUgbGF0ZSBpbgo+IHRoZSByZWxlYXNlIGN5Y2xlLCBidXQg
cmVhbGx5IHRoZSBudW1iZXIgb2YgY2hhbmdlcyB1cHN0cmVhbSBpcwo+IGxpbWl0ZWQsIHNvIGxl
dCdzIGdpdmUgaXQgYSB0cnkgYW5kIGhvcGUgaXQgd29uJ3QgYnJlYWsgYW55dGhpbmcgOi0pCj4g
Cj4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcyEKClRoYW5rcyEKTm93IGl0IHdvdWxkIGJlIGdy
ZWF0IGlmIHlvdSBjb3VsZCB1cGRhdGUgdGhlIEJvb3RsaW4gVG9vbGNoYWlucyB0bwp1c2UgMS4w
LjUwLiBUaGFua3MgaW4gYWR2YW5jZSEKClN1bnNoaW5lIQogV2FsZGVtYXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
