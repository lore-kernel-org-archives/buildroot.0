Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16430CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2F6661410;
	Mon, 11 Aug 2025 15:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGi7eE-bilQ0; Mon, 11 Aug 2025 15:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC73861412
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC73861412;
	Mon, 11 Aug 2025 15:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F6121C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A8961412
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cewLGbytsR3 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3ADDD613E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ADDD613E8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3ADDD613E8
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:21:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C91CF780331;
 Mon, 11 Aug 2025 17:21:16 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 Aug 2025 17:21:16 +0200
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 17:21:16 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <db83c7e2-9f08-48e0-bdef-92e6ceceb89e@mind.be>
References: <20250811090700.20714-1-titouan.christophe@mind.be>
 <6ae17cd572cb689f27a1c1d959969c18@free.fr>
 <db83c7e2-9f08-48e0-bdef-92e6ceceb89e@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <b32652d4a8a5549323a09878af644b12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754925679;
 bh=/GGoB0co7hCp/RDRb50D4SmLpJLTzIvzaw6OnidoVns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TQxvdBRkmIK6MbD03OJpF2AlPxuAp8pEgyDAQamrNlGW2TTFbhbsq+Lumacb8Y0qz
 ZGO85y0gEPxFiiQBY7wXZyk1Bpp13PfknYOR3jcoHSL5hDU+odw2+pHwcb1bVTYtjy
 073FAB5PrKK5NR07kx89RPNC03RM58fMTSZWXoa1F73raH2J0wCJcNGOm/P9EAI/yg
 Lj1ov5EGoWhYUgcQTGq4L4p72vwkp1hNSHbrGQUqotnUIRLAC6GQLf46916ebZfC45
 DhZceeqwwVUKxX00nOVST42zx+Us5w/JpQC6/XmtaXvDo8EbC+JevHmraKGeAMYElH
 VYdGe2mtI9trw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TQxvdBRk
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGl0b3VhbiwKCk9uIDExLzA4LzIwMjUgMTc6MTEsIFRpdG91YW4gQ2hyaXN0b3BoZSB2aWEg
YnVpbGRyb290IHdyb3RlOgo+IEhlbGxvIEp1bGllbiwKPiAKPiBPbiAxMS8wOC8yNSAxNjo1MSwg
SnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4+IEhpIFRpdG91YW4sCj4+IAo+PiBUaGFuayB5b3UgZm9y
IHRoZSBwYXRjaC4KPj4gCj4+IE9uIDExLzA4LzIwMjUgMTE6MDcsIFRpdG91YW4gQ2hyaXN0b3Bo
ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4gRnJvbSB0aGUgcmVsZWFzZSBub3RlczoKPj4+ICho
dHRwczovL2dpdGh1Yi5jb20vcmVkaXMvcmVkaXMvYmxvYi84LjIuMC8wMC1SRUxFQVNFTk9URVMp
Cj4+PiAKPj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Cj4+PiA4LjIgR0EgKHY4LjIuMCnCoMKgwqAgUmVsZWFzZWQgTW9uIDQgQXVn
IDIwMjUgMTU6MDA6MDAgSVNUCj4+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiAKPj4gVGhpcyBpcyBhIHNob3J0IHN1bW1hcnkg
Zm9yIHRoZSA4LjIuMCByZWxlYXNlLiBMb29raW5nIGF0IHRoZSBmdWxsCj4+IHJlbGVhc2Ugbm90
ZToKPj4gaHR0cHM6Ly9naXRodWIuY29tL3JlZGlzL3JlZGlzL2Jsb2IvOC4yLjAvMDAtUkVMRUFT
RU5PVEVTCj4+IAo+PiBXZSBzZWUgdGhlIGNoYW5nZXMgZnJvbSA4LjAuMyB0byA4LjIuMCBpbmNs
dWRlcyB0aHJlZSBzZWN1cml0eSBmaXhlczoKPj4gLSAoQ1ZFLTIwMjUtMzIwMjMpIEZpeCBvdXQt
b2YtYm91bmRzIHdyaXRlIGluIGBIeXBlckxvZ0xvZ2AgY29tbWFuZHMKPj4gLSAoQ1ZFLTIwMjUt
NDgzNjcpIFJldHJ5IGFjY2VwdGluZyBvdGhlciBjb25uZWN0aW9ucyBldmVuIGlmIHRoZSAKPj4g
YWNjZXB0ZWQgY29ubmVjdGlvbiByZXBvcnRzIGFuIGVycm9yCj4+IC0gKENWRS0yMDI1LTI3MTUx
KSByZWRpcy1jaGVjay1hb2YgbWF5IGxlYWQgdG8gc3RhY2sgb3ZlcmZsb3cgYW5kIAo+PiBwb3Rl
bnRpYWwgUkNFCj4+IAo+PiBTbyBJIGJlbGlldmUgdGhpcyBwYXRjaCBzaG91bGQgYmUgbWFya2Vk
IGFzICJzZWN1cml0eSBidW1wIiAod2l0aCB0aGUKPj4gY29ycmVzcG9uZGluZyBpbmZvIGluIHRo
ZSBjb21taXQgbG9nKS4KPiAKPiBJIHRoaW5rIHRoYXQgdGhlIHJlbGVhc2Ugbm90ZXMgYXJlIHNs
aWdodGx5IG1pc2xlYWRpbmcuIFRoZSBtZW50aW9uZWQgCj4gQ1ZFIGZpeGVzIGFyZSBpbiBhIHNl
Y3Rpb24gZW50aXRsZWQgIlNlY3VyaXR5IGZpeGVzIChjb21wYXJlZCB0byAKPiA4LjItUkMxKSIu
IElmIHdlIGxvb2sgYXQgYGdpdCBsb2cgcGFja2FnZS9yZWRpc2AgaW4gQnVpbGRyb290LCB3ZSBz
ZWUgCj4gdGhhdCB0aGUgbGFzdCAyIGNvbW1pdHMgYXJlOgo+IAo+IC0gYzg3ZGRkNmVlNDcxZDhi
M2EyNmE2ODQ3MTJhNDUyOWVjNTc1NWUwNCBidW1wIHRvIHY4LjAuMwo+IMKgIMKgIGZpeGVzOiBD
VkUtMjAyNS0zMjAyMywgQ1ZFLTIwMjUtNDgzNjcKPiAKPiAtIDNjODc0ZTFhOTQ5MjViNDZhNzNh
Mzk0ODI1YzY1Y2EyZTA0YzJhY2UgYnVtcCB0byB2OC4wLjIKPiDCoCDCoCBmaXhlczogQ1ZFLTIw
MjUtMjcxNTEKPiAKPiBUbyB0aGUgYmVzdCBvZiBteSB1bmRlcnN0YW5kaW5nLCBpdCBsb29rcyBs
aWtlIFJlZGlzIDguMiB3YXMgaW4gdGhlIAo+IHdvcmtpbmcgZm9yIHF1aXRlIHNvbWUgdGltZS4g
VGhlIENWRXMgd2VyZSBmaXhlZCBjb25jdXJyZW50bHkgb24gdGhlIAo+IHByZXZpb3VzIGJyYW5j
aGVzLCBhbmQgd2VyZSB0aGVuIHBvcnRlZCBvbnRvIDguMiBiZWZvcmUgdGhlIEdlbmVyYWwgCj4g
QXZhaWxhYmlsaXR5IHJlbGVhc2UuCj4gCj4gVGhlcmVmb3JlIGFsbCBzZWN1cml0eSBpc3N1ZXMg
aGF2ZSBiZWVuIGFkZHJlc3NlZCBhbHJlYWR5IGluIEJ1aWxkcm9vdCwgCj4gYW5kIHRoaXMgdmVy
c2lvbiBidW1wIGNvbnRhaW5zIG9ubHkgbmV3IGZlYXR1cmVzLgo+IAo+PiAKPj4gQ291bGQgeW91
IHNlbmQgYW4gdXBkYXRlZCBwYXRjaCwgcGxlYXNlPwo+IAo+IENvbnNlcXVlbnRseSwgSSBkb24n
dCB0aGluayBhIG5ldyBwYXRjaCByZXZpc2lvbiBpcyBuZWVkZWQuCgpUaGFua3MgZm9yIHRoZSBj
bGFyaWZpY2F0aW9uLiAgSSdsbCBhcHBseSB0aGlzIHBhdGNoIHRvIHRoZSBicmFuY2ggLW5leHQg
CmFuZCBhZGQgYSBzbWFsbCBjb21tZW50IGFib3V0IHRoaXMgaW4gdGhlIGNvbW1pdCBsb2cuCgo+
PiAKPj4gQmVzdCByZWdhZWRzLAo+PiAKPj4gSnVsaWVuLgo+IAo+IFRoYW5rIHlvdSBmb3IgeW91
ciB0aG9yb3VnaCByZXZpZXcsIGFzIHVzdWFsICEKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gVGl0b3Vh
bgo+IAo+IChQUzogc29ycnkgZm9yIHRoZSBkb3VibGUgZW1haWwgISBJIHVuaW50ZW50aW9uYWxs
eSByZXBsaWVkIHRvIEp1bGllbiAKPiBvbmx5LCBhbmQgdGhpcyBzaG91bGQgbm93IGJlIGdvaW5n
IHRvIHRoZSBtYWlsaW5nIGxpc3QpCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
