Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4336BC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB90A60E11;
	Wed, 16 Apr 2025 21:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nY07elV2_fCF; Wed, 16 Apr 2025 21:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF9C560E82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF9C560E82;
	Wed, 16 Apr 2025 21:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15FFA11B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06F7641774
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hzxG3Tl-MgS for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD028406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD028406F3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD028406F3
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:10:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E1C091C00C0; Wed, 16 Apr 2025 23:10:40 +0200 (CEST)
Message-ID: <93ec0d9e-22db-4689-8ccf-0b1e8377694c@rnout.be>
Date: Wed, 16 Apr 2025 23:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250325185037.4FD5C82D9E@busybox.osuosl.org>
Content-Language: en-GB
In-Reply-To: <20250325185037.4FD5C82D9E@busybox.osuosl.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837841; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=B97GBEQ7Areh0kkVQatl1nhDIJVzm4ZOyniuzn1V+t0=;
 b=fqpmWTw2Px6bilRJDtUW4tpPl4TEn5kLQshADdsFSBTFRK3pbiCWH30jQzmCguUEMdkBTC
 NyqAVpey9VPKfFmkhS3UbvdvcNSnbzCb1ueZHYNP/rIAZGxHfEjEew0mkj56E63wkaBEBn
 g8IRME6lPPqoJGO9JpV+pFZrdkYP8YOACjLkYcGk9s9Axk7ze4rNLetUoOhXoDYos4RMUD
 ZprA+7sWfZGsUA+tvvQ615vD7P6iwYnBsJ7RVdF0h61rzqDfyUep7zn9lyOCw1zcg8tuHL
 S+2wbcGhzJ0mjPFXJ/ZKiBQreVJWvhXpx0ez+KXUAzs+b3JrTX71smxWJtA8Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [git commit] support/testing: add git runtime test
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

Ck9uIDI1LzAzLzIwMjUgMTk6MzQsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+IGNvbW1pdDogaHR0
cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD0yNGVmYjIzYTEwNzRi
OTIwZmUzMjc2M2FlNDU1YTQ2OTQ0MTBlYjZlCj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJv
b3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKIMKgQXBwbGllZCB0b8KgMjAy
NS4wMi54LCAyMDI0LjExLnggYW5kIDIwMjQuMDIueCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKg
QXJub3V0Cgo+IC0tLQo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCj4gICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2dpdC5weSB8
IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwg
NTggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJT
Cj4gaW5kZXggYzA4MDYwOGJjZi4uNDRmNzY4NGM5NyAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJT
Cj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xOTAwLDYgKzE5MDAsNyBAQCBGOglzdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2Z3dHMucHkKPiAgIEY6CXN1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfZ2F3ay5weQo+ICAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9naG9zdHNjcmlwdC5weQo+ICAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9naG9zdHNjcmlwdC8KPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9naXQucHkKPiAgIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
Z2xzbHNhbmRib3hfcGxheWVyLnB5Cj4gICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2dsc2xzYW5kYm94X3BsYXllci8KPiAgIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfZ251cGcyLnB5Cj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfZ2l0LnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9naXQucHkKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjg3OGM0
YzgwOTIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9naXQucHkKPiBAQCAtMCwwICsxLDU3IEBACj4gK2ltcG9ydCBvcwo+ICsKPiAraW1w
b3J0IGluZnJhLmJhc2V0ZXN0Cj4gKwo+ICsKPiArY2xhc3MgVGVzdEdpdChpbmZyYS5iYXNldGVz
dC5CUlRlc3QpOgo+ICsgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENIQUlO
X0NPTkZJRyArIFwKPiArICAgICAgICAiIiIKPiArICAgICAgICBCUjJfUEFDS0FHRV9HSVQ9eQo+
ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgICMgQlIyX1RBUkdF
VF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiArICAgICAgICAiIiIKPiArCj4gKyAgICBkZWYgdGVz
dF9ydW4oc2VsZik6Cj4gKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVp
bGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQo+ICsgICAgICAgIHNlbGYuZW11bGF0b3Iu
Ym9vdChhcmNoPSJhcm12NSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD0i
YnVpbHRpbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJk
IiwgY3Bpb19maWxlXSkKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKPiArCj4gKyAg
ICAgICAgIyBDaGVjayB0aGUgcHJvZ3JhbSBjYW4gZXhlY3V0ZS4KPiArICAgICAgICBzZWxmLmFz
c2VydFJ1bk9rKCJnaXQgLS12ZXJzaW9uIikKPiArCj4gKyAgICAgICAgIyBJbml0aWFsaXplIHNv
bWUgZ2l0IGdsb2JhbCBjb25maWd1cmF0aW9uLgo+ICsgICAgICAgIGdpdF9jZmcgPSBbCj4gKyAg
ICAgICAgICAgICgidXNlci5uYW1lIiwgIkJ1aWxkIFJvb3QiKSwKPiArICAgICAgICAgICAgKCJ1
c2VyLmVtYWlsIiwgImJ1aWxkLnJvb3RAbG9jYWxob3N0LmxvY2FsZG9tYWluIiksCj4gKyAgICAg
ICAgICAgICgiY29sb3IudWkiLCAiZmFsc2UiKSwKPiArICAgICAgICAgICAgKCJpbml0LmRlZmF1
bHRCcmFuY2giLCAibWFzdGVyIiksCj4gKyAgICAgICAgICAgICgiY29yZS5wYWdlciIsICIiKQo+
ICsgICAgICAgIF0KPiArICAgICAgICBmb3IgY2ZnX25hbWUsIGNmZ192YWx1ZSBpbiBnaXRfY2Zn
Ogo+ICsgICAgICAgICAgICBjbWQgPSBmImdpdCBjb25maWcgLS1nbG9iYWwge2NmZ19uYW1lfSAn
e2NmZ192YWx1ZX0nIgo+ICsgICAgICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCkKPiArCj4g
KyAgICAgICAgIyBSdW4gYSBzZXF1ZW5jZSBvZiBmZXcgZ2l0IGNvbW1hbmRzLgo+ICsgICAgICAg
IGNvbW1hbmRzID0gWwo+ICsgICAgICAgICAgICAibWtkaXIgd29ya2RpciIsCj4gKyAgICAgICAg
ICAgICJjZCB3b3JrZGlyIiwKPiArICAgICAgICAgICAgImdpdCBpbml0IiwKPiArICAgICAgICAg
ICAgImVjaG8gJ0hlbGxvIFdvcmxkJyA+IGZpbGUudHh0IiwKPiArICAgICAgICAgICAgImdpdCBh
ZGQgZmlsZS50eHQiLAo+ICsgICAgICAgICAgICAiZ2l0IGNvbW1pdCAtYXMgLW0gJ0luaXRpYWwg
Y29tbWl0JyIsCj4gKyAgICAgICAgICAgICJnaXQgY2hlY2tvdXQgLWIgbXlfYnJhbmNoIiwKPiAr
ICAgICAgICAgICAgInNlZCAtaSAncy9Xb3JsZC9CdWlsZHJvb3QvZycgZmlsZS50eHQiLAo+ICsg
ICAgICAgICAgICAiZ2l0IHN0YXR1cyIsCj4gKyAgICAgICAgICAgICJnaXQgY29tbWl0IC1hcyAt
bSAnUmVwbGFjZSBXb3JsZCBieSBCdWlsZHJvb3QnIiwKPiArICAgICAgICAgICAgImdpdCBmb3Jt
YXQtcGF0Y2ggLU0gLW4gLXMgLW8gcGF0Y2hlcyBtYXN0ZXIiLAo+ICsgICAgICAgICAgICAibHMg
LWFsIHBhdGNoZXMvKi5wYXRjaCIsCj4gKyAgICAgICAgICAgICJnaXQgY2hlY2tvdXQgLWIgYW5v
dGhlcl9icmFuY2ggbWFzdGVyIiwKPiArICAgICAgICAgICAgImdpdCBhbSBwYXRjaGVzLyoucGF0
Y2giLAo+ICsgICAgICAgICAgICAiZ2l0IGRpZmYgLS1leGl0LWNvZGUgbXlfYnJhbmNoIGFub3Ro
ZXJfYnJhbmNoIiwKPiArICAgICAgICAgICAgImdpdCB0YWcgLWEgLW0gJ1RhZ2dlZCB2MS4wJyB2
MS4wIiwKPiArICAgICAgICAgICAgImdpdCBsb2ciCj4gKyAgICAgICAgXQo+ICsgICAgICAgIGZv
ciBjbWQgaW4gY29tbWFuZHM6Cj4gKyAgICAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
