Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D00C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1199E60E82;
	Wed, 16 Apr 2025 21:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7RZz_BHqXYw; Wed, 16 Apr 2025 21:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E5156F508
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E5156F508;
	Wed, 16 Apr 2025 21:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C42F6159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B4E40A87
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kzY1l2zbDys for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89E8840546
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E8840546
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89E8840546
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AE191C00C0; Wed, 16 Apr 2025 23:24:22 +0200 (CEST)
Message-ID: <4cc6f6d6-c322-44bc-9515-a0f3262c2552@rnout.be>
Date: Wed, 16 Apr 2025 23:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: Asaf Kahlon <asafka7@gmail.com>
References: <20250401071035.2066802-1-buildroot@heine.tech>
Content-Language: en-GB
In-Reply-To: <20250401071035.2066802-1-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744838662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pnjd75ZYW9bYwiEXJvOb7uT4goLJW0QmDGDlgweB4pw=;
 b=GcaJ4aKp91LAASsOFjd5TLb9qn4iwXqMMPw2mxBg0ODjWXvyVP9dE+Wg9pzXsw8x9dfL92
 N74vir6/C/g05oVeDeYC0Mkav+pJSL7PAb5FGnLSQ3JCkzA3Aoz0mB3BxJdHHLn+7Bhs/H
 BiFaoaLWPGXf+d0bmCSiLZGb9jyhrRZgrP7uWU1ppL3puqbxKTtjWKnS32qg0SgbicQEzs
 1196wU+5QnHIiOE288OflPJ9z9wpjvOFnuWV0Wk0KMmDx3kuGd/kfZcZY0vsMO7Dy2D4F0
 EtoPr7UUXN0lRo3kpaUyy80h2yHDecCxsWTKt1mvztcsIkNHNlKqLNXcNqqVmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump to version 1.15.2
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

Ck9uIDAxLzA0LzIwMjUgMDk6MTAsIE1pY2hhZWwgTm9zdGhvZmYgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBSZWxlYXNlIE5vdGVzOiBodHRwczovL2dpdGh1Yi5jb20vZ2FiaW1lL3NwZGxvZy9yZWxl
YXNlcy90YWcvdjEuMTUuMgo+Cj4gLSBmaXhlcyBhbiBpc3N1ZSB3aXRoIHRoZSAlRCBmb3JtYXQg
ZmxhZyBmb3VuZCBieSBPU1MtRnV6ego+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBOb3N0aG9m
ZiA8YnVpbGRyb290QGhlaW5lLnRlY2g+CgogwqBBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtz
LgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9zcGRsb2cvc3BkbG9n
Lmhhc2ggfCAyICstCj4gICBwYWNrYWdlL3NwZGxvZy9zcGRsb2cubWsgICB8IDIgKy0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvc3BkbG9nL3NwZGxvZy5oYXNoIGIvcGFja2FnZS9zcGRsb2cvc3BkbG9n
Lmhhc2gKPiBpbmRleCA4YzY4MzgxNjBiLi4xMmZkMmUyZmQ0IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvc3BkbG9nL3NwZGxvZy5oYXNoCj4gKysrIGIvcGFja2FnZS9zcGRsb2cvc3BkbG9nLmhhc2gK
PiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgMjVj
ODQzODYwZjAzOWExNjAwZjIzMmM2ZWI5ZTAxZTY2MjdmN2QwMzBhMmFlNWUyMzJiZGQzYzkyMDVk
MjZjYyAgc3BkbG9nLTEuMTUuMS50YXIuZ3oKPiArc2hhMjU2ICA3YTgwODk2MzU3ZjNlOGU5MjBl
ODVlOTI2MzNiMTRiYTBmMjI5YzUwNmU2Zjk3ODU3OGJkYzM1YmEwOWU5YTVkICBzcGRsb2ctMS4x
NS4yLnRhci5nego+ICAgc2hhMjU2ICA0Y2NlY2FiMThkMWZmMGI2MTE3NGZlM2Q2YzQzMDU0MTYy
NWQzZGRiODY1YjBkNTg4N2RiMjk2Zjg4M2M3NmU3ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3BkbG9nL3NwZGxvZy5tayBiL3BhY2thZ2Uvc3BkbG9nL3NwZGxvZy5tawo+IGluZGV4
IDA5ZDQzMmRlZmUuLmZiOWEzM2MyY2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zcGRsb2cvc3Bk
bG9nLm1rCj4gKysrIGIvcGFja2FnZS9zcGRsb2cvc3BkbG9nLm1rCj4gQEAgLTQsNyArNCw3IEBA
Cj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLVNQRExPR19WRVJTSU9O
ID0gMS4xNS4xCj4gK1NQRExPR19WRVJTSU9OID0gMS4xNS4yCj4gICBTUERMT0dfU0lURSA9ICQo
Y2FsbCBnaXRodWIsZ2FiaW1lLHNwZGxvZyx2JChTUERMT0dfVkVSU0lPTikpCj4gICBTUERMT0df
TElDRU5TRSA9IE1JVAo+ICAgU1BETE9HX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
