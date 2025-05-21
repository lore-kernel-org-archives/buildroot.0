Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6579EC54E65
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 20:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1601460AC1;
	Wed, 21 May 2025 20:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TRtk-HPwsCf; Wed, 21 May 2025 20:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B5460C23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B5460C23;
	Wed, 21 May 2025 20:22:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AED5975B
 for <buildroot@buildroot.org>; Wed, 21 May 2025 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0AB040485
 for <buildroot@buildroot.org>; Wed, 21 May 2025 20:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN6eGBmtNBSS for <buildroot@buildroot.org>;
 Wed, 21 May 2025 20:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9414E40454
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9414E40454
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9414E40454
 for <buildroot@buildroot.org>; Wed, 21 May 2025 20:22:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 630512003CA;
 Wed, 21 May 2025 22:22:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 21 May 2025 22:22:10 +0200
MIME-Version: 1.0
Date: Wed, 21 May 2025 22:22:10 +0200
From: Julien Olivain <ju.o@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Buildroot development <buildroot@buildroot.org>, Petr Vorel
 <petr.vorel@gmail.com>
In-Reply-To: <4a4473d3-56d6-4576-9a8f-5b708a1569df@grenoble.cnrs.fr>
References: <4a4473d3-56d6-4576-9a8f-5b708a1569df@grenoble.cnrs.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <1f3bc78a69a8ae087f6edebeba0b7017@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747858932;
 bh=2fzbxsvwc/eSpp8pLtQrjS5k5viMiRDBhMxancS6Fvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r5ucnM3iFPoQo9GAECSUOrr2lWOrSkH74vy82VYC7zVS9r9VQM55M+OWLkhhDxhmk
 SW6/BWrQ9vDtHMnjUumy1lsEhl4LLi2swqjt/wAA9zdHgbPVqGdNRxFhw9PA80twds
 S7btHSGps8Njt5KwcicF7C5VOtR1yKnIdygzngpfkm221+ywv33n9Kw9OKxffxgxy/
 9Z3Lg7YHinMxtM/swA+14s4HGA50ESiFVuZuzWA/IZMP3+qFq5gvEcOSQvhLUCrd5N
 te0YUpBWmVMpb2T+hP78Gvqjj3nKzM+Mc1fsHdfJ3uxkmekc6sQWV/wLfpc4Rg9JPF
 bN4II1J8+9NPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r5ucnM3i
Subject: Re: [Buildroot] [PATCH 1/1] support/kconfig: fix another compiler
 warning
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

SGkgRWRnYXIsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIDE5LzA1LzIwMjUgMTE6MTUs
IEVkZ2FyIEJvbmV0IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gQ29tcGlsaW5nIHdpdGggR0NDIDEz
LjMgZ2VuZXJhdGVzIHRoaXM6Cj4gCj4gLi91dGlsLmM6IEluIGZ1bmN0aW9uIOKAmGZpbGVfd3Jp
dGVfZGVw4oCZOgo+IC4vdXRpbC5jOjg2OjI2OiB3YXJuaW5nOiDigJglc+KAmSBkaXJlY3RpdmUg
d3JpdGluZyAxMCBvciBtb3JlIGJ5dGVzIGludG8gYSAKPiByZWdpb24gb2Ygc2l6ZSBiZXR3ZWVu
IDEgYW5kIDQwOTcgWy1XZm9ybWF0LW92ZXJmbG93PV0KPiAgICA4NiB8ICAgICAgICAgc3ByaW50
ZihidWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn4KPiAuL3V0aWwuYzo4Njo5OiBub3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCAxMSBv
ciBtb3JlIGJ5dGVzIChhc3N1bWluZyA0MTA3KSAKPiBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6
ZSA0MDk3Cj4gICAgODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUp
Owo+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+
IFRoaXMgaXMgc2ltaWxhciB0byB0aGUgd2FybmluZ3MgZ2VuZXJhdGVkIGJ5IEdDQyA5LjQgYW5k
IGZpeGVkIGluCj4gMzI0NjEyZDY4ZSAoInN1cHBvcnQva2NvbmZpZzogZml4IGNvbXBpbGVyIHdh
cm5pbmdzIikuCj4gCj4gQXZvaWQgdGhlIHdhcm5pbmcgYnkgZW5sYXJnaW5nIHRoZSBkZXN0aW5h
dGlvbiBidWZmZXIgb2YgZnByaW50ZigpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0
IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+IC0tLQo+ICBzdXBwb3J0L2tjb25maWcvdXRpbC5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL3V0aWwuYyBiL3N1cHBvcnQva2NvbmZp
Zy91dGlsLmMKPiBpbmRleCA4NjY1ZjViYjg5Li44NmNlOTk0MzY3IDEwMDY0NAo+IC0tLSBhL3N1
cHBvcnQva2NvbmZpZy91dGlsLmMKPiArKysgYi9zdXBwb3J0L2tjb25maWcvdXRpbC5jCj4gQEAg
LTM1LDcgKzM1LDcgQEAgc3RydWN0IGZpbGUgKmZpbGVfbG9va3VwKGNvbnN0IGNoYXIgKm5hbWUp
Cj4gIGludCBmaWxlX3dyaXRlX2RlcChjb25zdCBjaGFyICpuYW1lKQo+ICB7Cj4gIAljaGFyICpz
dHI7Cj4gLQljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgrMV0sIGRpcltQQVRI
X01BWCsxXTsKPiArCWNoYXIgYnVmW1BBVEhfTUFYKzIwXSwgYnVmMltQQVRIX01BWCsxMV0sIGRp
cltQQVRIX01BWCsxXTsKCkJ1aWxkcm9vdCBpcyBjdXJyZW50bHkgdXNpbmcgYSAocmF0aGVyIG9s
ZCkgdmVyc2lvbiBvZiBLY29uZmlnCmZyb20gS2VybmVsIDQuMTctcmMyLiBTZWUgWzFdLiBCdWls
ZHJvb3QgbWFpbnRhaW5zIGEgbGlzdCBvZgpwYXRjaGVzIGFwcGxpZWQgb24gaXQsIGluIFsyXS4K
ClNlZSBmb3IgZXhhbXBsZSwgYW5vdGhlciBjb21taXQgYWRkaW5nIGEgcGF0Y2ggZm9yIEtjb25m
aWcgWzNdLgpOb3RlIHRoZSBjb21taXQgaXMgbW9kaWZ5aW5nIHRoZSBzb3VyY2Ugb2Yga2NvbmZp
ZyBhbmQgaXMgYWxzbwphZGRpbmcgYSBwYXRjaCBpcyB0aGUgZGlyZWN0b3J5LgoKU2luY2UgdGhl
IHdhcm5pbmcgeW91IHdhbnQgdG8gZml4IGlzIGludHJvZHVjZWQgYnkgb25lIG9mIHRoZSBCdWls
ZHJvb3QKcGF0Y2ggdG8gYmUgYXBwbGllZCBvbiBLY29uZmlnIGluIFs0XSwgeW91ciBwYXRjaCBz
aG91bGQgYWxzbwptb2RpZnkgWzRdIHRvIG1ha2Ugc3VyZSB5b3VyIGNoYW5nZSB3aWxsIGJlIHJl
YmFzZWQgb24gZnV0dXJlIGtjb25maWcKdXBkYXRlcy4KCkNvdWxkIHlvdSBzZW5kIGFuIHVwZGF0
ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIGFsc28gdXBkYXRpbmcgdGhlCmtjb25maWcgcGF0Y2gg
WzNdIHBsZWFzZT8KCj4gIAlzdHJ1Y3Qgc3ltYm9sICpzeW0sICplbnZfc3ltOwo+ICAJc3RydWN0
IGV4cHIgKmU7Cj4gIAlzdHJ1Y3QgZmlsZSAqZmlsZTsKPiAtLQo+IDIuNDMuMAoKQmVzdCByZWdh
cmRzLAoKSnVsaWVuLgoKWzFdIApodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iLzIwMjUuMDUtcmMxL3N1cHBvcnQva2NvbmZpZy9SRUFETUUuYnVpbGRyb290
ClsyXSAKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vdHJlZS8y
MDI1LjA1LXJjMS9zdXBwb3J0L2tjb25maWcvcGF0Y2hlcz9yZWZfdHlwZT10YWdzClszXSAKaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2Q2NWMxMGMy
MGFkZDU4ZjE3Y2YxZDdiNmRlOGU3OTAzYjBhYTlkZGMKWzRdIApodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDUtcmMxL3N1cHBvcnQva2NvbmZp
Zy9wYXRjaGVzLzE0LXN1cHBvcnQtb3V0LW9mLXRyZWUtY29uZmlnLnBhdGNoI0wxNzYKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
