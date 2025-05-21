Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4DDC54E71
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 17:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0DCB608AB;
	Wed, 21 May 2025 17:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97W2jnKPmJT2; Wed, 21 May 2025 17:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 664D860675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 664D860675;
	Wed, 21 May 2025 17:41:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85515758
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F95401AF
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fr03Lfdultlc for <buildroot@buildroot.org>;
 Wed, 21 May 2025 17:41:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1E23400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E23400F1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E23400F1
 for <buildroot@buildroot.org>; Wed, 21 May 2025 17:41:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 37601B0056A;
 Wed, 21 May 2025 19:41:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 May 2025 19:41:05 +0200
MIME-Version: 1.0
Date: Wed, 21 May 2025 19:41:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org
In-Reply-To: <aCz2yzLU7y0HenIB@romuald.bergerie>
References: <20250520174435.1385934-1-ju.o@free.fr>
 <aCz2yzLU7y0HenIB@romuald.bergerie>
User-Agent: Webmail Free/1.6.10
Message-ID: <8d6a529a183c6eb819c9e36782cfe0da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747849266;
 bh=0jvkSBppQuMBTnyDO2xXmaJHnKvypUz7ItLaZwiDWbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Snb++WnOYNmNhYxQNHD6cz/z7AG5yNtADp8ASmQ1hpjgYDDsoLFTBRIF/ZUJXhKiY
 JJUpMmN2f1suCWtixx2/6YOANlxGS4NDEd65uH8zFcv8PVe17GwyCL6+5ANm3TxHz1
 XXlBSK1j6bdkD4e1hOJBsLvTntKH0NDxurzJHwUk90+PKvAiyZEzmDaj98gqfqexIg
 JO3VtWkraI2foKA26m52pZbTugC9tLVus/8l9viYiVBB5kBA/gxNVEFQ4nvDzGIhbU
 l7Rk9WBknESOKQ1wYAFRgSGOwTzg1giHM2WUIi6WtFybL+TBP2Kl8eqy1yUnYuWNBE
 rTx5b/Dkm6emg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Snb++WnO
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_xen: fix runtime
 test
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

SGkgVmluY2VudCwKCk9uIDIwLzA1LzIwMjUgMjM6NDAsIFZpbmNlbnQgU3RlaGzDqSB2aWEgYnVp
bGRyb290IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDA3OjQ0OjM1UE0gKzAyMDAs
IEp1bGllbiBPbGl2YWluIHdyb3RlOgo+ICguLikKPj4gU2luY2UgdGhpcyBjb21taXQgWzNdLCB0
aGUgdGVzdF94ZW4gcnVudGltZSB0ZXN0IGlzIGZhaWxpbmcKPj4gd2hpbGUgYXR0ZW1wdGluZyB0
byBzZXQgdGhlIGRhdGUuIFRoaXMgaXMgYmVjYXVzZSBpdCBpcyBpbnZva2VkIGJlZm9yZQo+PiB0
aGUgdGVzdCBzY3JpcHQgZXhlY3V0ZXMgdGhpcyAic3R0eSByYXciIGNvbW1hbmQuCj4gKC4uKQo+
PiB0aGlzIGNvbW1pdCBzaW1wbHkgbW92ZXMgdGhpcyAic3R0eSByYXciIGludm9jYXRpb24KPj4g
ZnJvbSB0aGUgcnVudGltZSB0ZXN0IHNjcmlwdCB0byBhIGN1c3RvbSAvZXRjL3Byb2ZpbGUuZC9z
dHR5LXJhdy5zaAo+PiBmaWxlIG9uIHRhcmdldCByb290ZnMgb3ZlcmxheSwgdG8gZG8gdGhpcyBj
YWxsIGp1c3QgYXQgdGhlIGxvZ2luLgo+PiAKPj4gRml4ZXM6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTAwMDAwMTEzNTAKPiAKPiBIaSBKdWxp
ZW4sCj4gCj4gVGhhbmtzIGZvciBjYXRjaGluZyBhbmQgcmVwYWlyaW5nIHRoaXMhCj4gCj4gWW91
ciBwYXRjaCBkb2VzIGluZGVlZCBmaXggdGhlIFhlbiB0ZXN0IGZvciBtZSwgb24gZ2l0bGFiIGFu
ZCBsb2NhbGx5Lgo+IAo+ICAgVGVzdGVkLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGxhcG9zdGUubmV0PgoKVGhhbmtzIGZvciB0ZXN0aW5nISAgSSBhcHBsaWVkIHRoaXMgcGF0
Y2ggb24gbWFzdGVyLgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gVmluY2VudC4KPiAKPj4gCj4+IFsx
XSAKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzA1NWY4MmViYmQwN2I1ODJjOTkyZWVkMzBlZjUxOTFmMTg4NzNiYTQKPj4gWzJdIAo+PiBodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvY2QwZmZkNTk4
Y2Y5NGI5ZDE1YzQ4OWYyNDI5NjAyODI1YTE4NzUzYwo+PiBbM10gCj4+IGh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9jZjg2NDFiNzNlN2YxNTc3NjM3
YmZlZjBlY2U3OGRkNTE5YjI1ZDE5Cj4+IAo+PiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50
LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1
Lm9AZnJlZS5mcj4KPj4gLS0tCj4+IFBhdGNoIHRlc3RlZCBpbjoKPj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2pvYnMvMTAwOTAyNjMzNjIKCkJlc3QgcmVnYXJkcywK
Ckp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
