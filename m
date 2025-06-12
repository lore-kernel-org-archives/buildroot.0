Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EAFC61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA13406B1;
	Thu, 12 Jun 2025 20:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aak0j1_MEJd5; Thu, 12 Jun 2025 20:04:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257FF4088A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257FF4088A;
	Thu, 12 Jun 2025 20:04:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56B04183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC3F4088A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CouEPFR8DTRw for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:04:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96A78406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A78406B1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96A78406B1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:04:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8BF81C0E09; Thu, 12 Jun 2025 22:04:20 +0200 (CEST)
Message-ID: <0838a168-8b44-42b0-922f-b9e51e3b4961@rnout.be>
Date: Thu, 12 Jun 2025 22:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay@rtone.fr>
References: <20250518121131.2821530-1-arnout@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250518121131.2821530-1-arnout@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8D6dVKQzcxVnRJQZYGxUcOls/vhsukfpp1BeL9acvVk=;
 b=F9+S0w+ar2g8X1Mfi4CvnsxnrfkLqHqWE0/sxMXLOZSTRxfs9BrXz9xZXDPkGBkMLfYTCi
 l1vGmEa/vsC62ifxgQbR/QdHHmckiEpn/pfrNAbyQpGNn0QLEz+2LkqnMRrTMb4SKfsAeU
 bRd6E3T7u44XDZOjTUoQ7dNsgajJ/NxghWdcjpVGiQTX6sjeM00M3SLFLn0k6GoC3V8ku0
 Lo6UabPFjHcdksyVt/jgZZ/Z2LqoQrzvOiaNhL0kgMzp+3p6oCOY+fHjANlSJPtxaYxmOc
 dfk/gZvCww5a2Yd7jzJwFIYw76IoYaJSYDpWiJJpHEk1jv4NDzNE3rLzBYbO6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=F9+S0w+a
Subject: Re: [Buildroot] [PATCH 0/3] Remaining fixes for qt5webengine
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

CgpPbiAxOC8wNS8yMDI1IDE0OjExLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiBUaGlz
IGxpdHRsZSBzZXJpZXMgaGFzIHJlbWFpbmluZyBmaXhlcyBmb3IgUXQ1V2ViRW5naW5lLCBhZnRl
ciBhcHBseWluZyBhbGwKPiB0aGUgZml4ZXMgZnJvbSBHYWXMiGwuCj4gCj4gVGhlIGZpcnN0IHBh
dGNoIHdvcmtzIGFyb3VuZCBhbiBpc3N1ZSB3aXRoIHRodW1iIGRldGVjdGlvbi4gSXQgaXMga2lu
ZCBvZiBhCj4gaGFjaywgYnV0IHRoZSB0aHVtYiBkZXRlY3Rpb24gbG9naWMgaXMgYW55d2F5IGEg
aGFjay4gQmVjYXVzZSBpdCBpcyBzbyBpZmZ5Cj4gSSBoYXZlbid0IHN1Ym1pdHRlZCBpdCB1cHN0
cmVhbS4KPiAKPiBUaGUgb3RoZXIgdHdvIHBhdGNoZXMgZml4IGlzc3VlcyB3aXRoIGhvc3QgR0ND
IDE1LCBvbmUgaW4gcXQ1ZGVjbGFyYXRpdmUsIHRoZQo+IG90aGVyIGluIHF0NXdlYmVuZ2luZS1j
aHJvbWl1bS4KPiAKPiBJdCBoYXMgb25seSBiZWVuIGJ1aWxkLXRlc3RlZCwgbm90IHJ1bnRpbWUg
dGVzdGVkLiBJJ3ZlIHRlc3RlZCB0aGUgZm9sbG93aW5nCj4gY29uZmlndXJhdGlvbnMsIGFsbCBv
biBhIEZlZG9yYSA0MiBidWlsZCBzZXJ2ZXI6Cj4gLSByYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29u
ZmlnCj4gLSBhbm90aGVyIDMyLWJpdCBBUk0gY29uZmlnIHdpdGggbWVzYS9ldG5hdml2IGFuZCBh
IEJvb3RsaW4gdG9vbGNoYWluCj4gLSBhIDY0LWJpdCBBUk0gY29uZmlnIHdpdGggbWVzYS9ldG5h
dml2IGFuZCBhIEJvb3RsaW4gdG9vbGNoYWluCj4gCj4gQXJub3V0IFZhbmRlY2FwcGVsbGUgKDMp
Ogo+ICAgIHBhY2thZ2UvcXQ1L3F0NWRlY2xhcmF0aXZlOiBmaXggYnVpbGQgd2l0aCBHQ0MgMTUK
PiAgICBwYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUtY2hyb21pdW06IGZpeCBidWlsZCB3aXRoIGhv
c3QgR0NDIDE1Cj4gICAgcGFja2FnZS9xdDUvcXQ1d2ViZW5naW5lOiBmaXggdGh1bWIgZGV0ZWN0
aW9uIGxvZ2ljCgogIEFwcGxpZWQgYWxsIHRvIDIwMjUuMDIueCwgdGhhbmsgeW91IG15c2VsZiEK
CiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gICAuLi4vMDAwMy1JbmNsdWRlLWNzdGRpbnQtZm9y
LXVpbnRwdHJfdC5wYXRjaCAgfCAgNTAgKysrKysrKysrCj4gICAuLi5kZS1jc3RkaW50LWZvci11
aW50cHRyX3QtdWludDhfdC1ldGMucGF0Y2ggfCAxMDEgKysrKysrKysrKysrKysrKysrCj4gICAu
Li5tb3ZlLXNvbWUtb2YtdGhlLXRodW1iLWRldGVjdGlvbi1sb2cucGF0Y2ggfCAgNjkgKysrKysr
KysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1ZGVjbGFyYXRpdmUvMDAwMy1JbmNsdWRlLWNzdGRp
bnQtZm9yLXVpbnRwdHJfdC5wYXRjaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1
L3F0NXdlYmVuZ2luZS1jaHJvbWl1bS8wMDEyLUluY2x1ZGUtY3N0ZGludC1mb3ItdWludHB0cl90
LXVpbnQ4X3QtZXRjLnBhdGNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1
d2ViZW5naW5lLzAwMDMtY29uZmlndXJlLnByaS1yZW1vdmUtc29tZS1vZi10aGUtdGh1bWItZGV0
ZWN0aW9uLWxvZy5wYXRjaAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
