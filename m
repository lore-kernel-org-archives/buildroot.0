Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCF9C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E8183B8E;
	Tue, 15 Apr 2025 19:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d0mqzg9hhSP; Tue, 15 Apr 2025 19:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3D3281CD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D3281CD0;
	Tue, 15 Apr 2025 19:33:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FCAC109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10D7761253
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru6inKoHGo5u for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EF506100C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF506100C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EF506100C
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:33:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5BACE13F8C2;
 Tue, 15 Apr 2025 21:33:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 21:33:04 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 21:33:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, Sergey
 Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20250411125452.1377323-1-vincent.stehle@arm.com>
References: <20250411125452.1377323-1-vincent.stehle@arm.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7e5842db58da5b6aa3edbe61a8acb930@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744745588;
 bh=5gFrKmKQ2jdmS01cfCGW3mKTGY7GbePvIwuzzbjwbzw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LMa/v9Dzy25MBjpZqzJaFE7tlOiXet/QUuhI1mkJaLd19t2VkwglLikEeix+/UGhR
 UiZmNAHjH8E65wmIm+fEwfCjOT6g59a1P6w7p4pn0jDEv5cqs4ZpI4pybpKgqF76YH
 9A4qlITY3e9YcyAXKKX+dca0ISn1CbAZlPtP105t5MXY4YHKYNNBlmX5p5y7uPG5vh
 BdcYZCq1HWyCiKGsYK9GEcQQxLHRqrt5Pakub7fm9eKGNx2xF430HBOSXQCtEY1/Ch
 6XF+0Kb5tG530P+x9WhbkfbjfdFUO1PuMsxTw/ku+Efdz6XfSFxe4F3AHv04/wZ4MW
 9yeCm1ISDa/Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LMa/v9Dz
Subject: Re: [Buildroot] [PATCH v2] boot/arm-trusted-firmware: fix the build
 for macchiatobin
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

T24gMTEvMDQvMjAyNSAxNDo1NCwgVmluY2VudCBTdGVobMOpIHdyb3RlOgo+IFdoZW4gQnVpbGRp
bmcgYXJtLXRydXN0ZWQtZmlybXdhcmUgZm9yIHRoZSBNYWNjaGlhdG9iaW4gcGxhdGZvcm0KPiAo
YTgweDBfbWNiaW4pLCB3aGljaCBkZXBlbmRzIG9uIHRoZSBtdi1kZHItbWFydmVsbCBwYWNrYWdl
LCB0aGUgYnVpbGQgCj4gZmFpbHMKPiBjb21wbGFpbmluZyB0aGF0IHRoaXMgcGFja2FnZSdzIGZv
bGRlciAiZG9lcyBub3QgY29udGFpbiB2YWxpZAo+IG12LWRkci1tYXJ2ZWxsIGdpdCByZXBvc2l0
b3J5Ii4KPiBUaGlzIGlzIGV4cGVjdGVkIHVuZGVyIEJ1aWxkcm9vdCwgd2hlcmUgd2UgdXNlIGlu
dGVybWVkaWF0ZSBhcmNoaXZlcy4KPiAKPiBBZGQgcGF0Y2hlcyB0byBmaXggdGhlIGJ1aWxkIGZv
ciB0aGlzIHBsYXRmb3JtLCBmb3IgYSBmZXcgdmVyc2lvbnMgb2YgCj4gVEYtQQo+ICh2Mi42LCB2
Mi43LCB2Mi44LCBsdHMtdjIuOC4yMCwgdjIuOSwgdjIuMTAsIGx0cy12Mi4xMC41LCB2Mi4xMSwg
djIuMTIgCj4gYW5kCj4gbHRzLXYyLjEyLjEpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQg
U3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGljayBPbHNzb24gPGhpQHNl
bnppbGxhLmlvPgo+IENjOiBTZXJnZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4K
CkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpJIHdhcyB3b25kZXJpbmcgaWYsIGV2ZW4gaWYg
dGhvc2UgcGF0Y2hlcyBhcmUgbm90IG1lYW50IGZvciB1cHN0cmVhbQphcyBpcywgc29tZXRoaW5n
IGNvdWxkIGJlIHByb3Bvc2VkIHVwc3RyZWFtLiBXaGlsZSBJIGJlbGlldmUgdGhpcwpjaGVjayB3
YXMgYWRkZWQgZm9yIGEgc3BlY2lmaWMgcmVhc29uLCBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUg
c29tZQpjb250cm9sIHRvIG92ZXJyaWRlIGl0IGZvciBzcGVjaWZpYyBjYXNlcywgbGlrZSBCdWls
ZHJvb3QuIEZvciBleGFtcGxlCmEgdmFyaWFibGUgbGlrZSAibWFrZSBNVl9ERFJfU0tJUF9HSVRf
Q0hFQ0s9MSAuLi4iCgpXaGF0IGRvIHlvdSB0aGluaz8KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
