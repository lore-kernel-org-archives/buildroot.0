Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B78ACA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D86B40CE0;
	Mon,  1 Sep 2025 08:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esxrTZJ18UGs; Mon,  1 Sep 2025 08:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 321C940CD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 321C940CD5;
	Mon,  1 Sep 2025 08:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81941169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72AA183F03
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puiWlQ5itQ6Y for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:12:18 +0000 (UTC)
X-Greylist: delayed 522 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Sep 2025 08:12:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 626E483EF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 626E483EF3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=richard.genoud@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 626E483EF3
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:12:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B08621A099C;
 Mon,  1 Sep 2025 08:03:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8345B60699;
 Mon,  1 Sep 2025 08:03:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5500A1C22C8BB; 
 Mon,  1 Sep 2025 10:03:31 +0200 (CEST)
Message-ID: <dda8aca0-2c2c-40bc-922f-a8f613aca52f@bootlin.com>
Date: Mon, 1 Sep 2025 10:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756713812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=6l/xoEYg9tYx87HCpOIpbVWwNkyoUQvOuHq9iKZtuWM=;
 b=iumuPo/GwjLgkIZeWYym2BEedWUK8b8Nu1WQYhRJG2gZUKMLuLbUPgaJjhL4P9m6IJf2os
 5OkbZPH1JUEH6sBlHa2r8+r7+/kcXWaCyNUUQhn9X6u3mmV3M73id0C4WMYfCpHTT8slj5
 RZtuSFFvC1wvRYgjuWkz0x628MqluGgj2MGK/wtWSHpeUo407IfbIk4bkYTpBle4HA7Rih
 GE/tCRExXPuta/C0u4KX+fk/2dvzazoi+CjN2c+J0CaX8np6OpmQoxpKDcjRiAOXmWelu6
 Og6RC1iGLcTF9qDNvVdaigdiSVMsxp7qPDnqU/0lJBeDmZodx9q64k2KpOwhyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iumuPo/G
Subject: Re: [Buildroot] [RFC v3 0/5] Support qmake for Qt6
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
From: Richard GENOUD via buildroot <buildroot@buildroot.org>
Reply-To: Richard GENOUD <richard.genoud@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTQvMDgvMjAyNSDDoCAxNzozMiwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXTCoDoKPiBUaGUg
c2VyaWVzIHN1cHBvcnRzIHFtYWtlIGZvciBxdDYuClRoaXMgaXMgZ3JlYXQgdG8gaGF2ZSB0aGlz
IG1vdmluZyBmb3J3YXJkLgoKVGhhbmtzIGZvciB0aGlzIGpvYiEKCj4gCj4gQXMgc3RhdGVkIGlu
IGh0dHBzOi8vZG9jLnF0LmlvL3F0LTYvcXQ2LWJ1aWxkc3lzdGVtLmh0bWw6Cj4gCj4gICAgIlRo
aXMgb25seSBhZmZlY3RzIHVzZXJzIHRoYXQgd2FudCB0byBidWlsZCBRdCBmcm9tIHNvdXJjZXMu
Cj4gICAgIFlvdSBjYW4gc3RpbGwgdXNlIHFtYWtlIGFzIGEgYnVpbGQgdG9vbCBmb3IgeW91ciBh
cHBsaWNhdGlvbnMuIgo+IAo+IFRoaXMgc2VyaWVzIHJldml2ZXMgYW4gb2xkZXIgcGF0Y2ggdGhh
dCBleHBvcnRlZCBxbWFrZSBmb3IgUXQ2LAo+IGFwcGx5aW5nIGEgbWluaW1hbCBmaXguIEl0IGV4
dGVuZHMgcGtnLXFtYWtlIHRvIHN1cHBvcnQgUXQ2IGFuZCB1c2VzCj4gcXd0IGFuZCBjdXRla2V5
Ym9hcmQgYXMgdGVzdCBjYXNlcyB0byB2YWxpZGF0ZSB0aGUgY2hhbmdlcy4KPiAKPiBUaGUgc2Vy
aWVzIGlzIG1hcmtlZCBhcyBSRkMgYmVjYXVzZSBoYXJkY29kaW5nIHRoZSBRdDUgYW5kIFF0NiB2
ZXJzaW9uCj4gbnVtYmVycyBpbiBwa2ctcW1ha2UgaXMgbm90IGlkZWFsLCBldmVuIGlmIHRoZSBR
dDUgdmVyc2lvbnMgd2VyZQo+IGFscmVhZHkgaGFyZGNvZGVkLgo+IAo+IEFuIGFsdGVybmF0aXZl
IGFwcHJvYWNoIGNvdWxkIGJlIHRvIGFkZCBhIEJSMl9QQUNLQUdFX1FUezUsNn1fVkVSU0lPTl9W
QUxVRQo+IG9wdGlvbiwgYnV0IHRoaXMgY2FuIGJlIGRpc2N1c3NlZCBkdXJpbmcgcmV2aWV3Lgo+
IAo+IERhcmlvIEJpbmFjY2hpICg0KToKPiAgICBwYWNrYWdlL3F3dDogYnVtcCB0byB2ZXJzaW9u
IDYuMy4wCj4gICAgcGFja2FnZS9wa2ctcW1ha2U6IHN1cHBvcnQgUXQ2Cj4gICAgcGFja2FnZS9x
d3Q6IGVuYWJsZSBidWlsZCB3aXRoIFF0Ngo+ICAgIHBhY2thZ2UvY3V0ZWtleWJvYXJkOiBlbmFi
bGUgYnVpbGQgd2l0aCBRdDYKPiAKPiBKZXNzZSBWYW4gR2F2ZXJlICgxKToKPiAgICBwYWNrYWdl
L3F0NjogQWRkIHFtYWtlIGZ1bmN0aW9uYWxpdHkKPiAKPiAgIHBhY2thZ2UvY3V0ZWtleWJvYXJk
L0NvbmZpZy5pbiAgICAgICB8IDEzICsrKysrKy0tLS0KPiAgIHBhY2thZ2UvY3V0ZWtleWJvYXJk
L2N1dGVrZXlib2FyZC5tayB8ICA2ICsrKystCj4gICBwYWNrYWdlL3BrZy1xbWFrZS5tayAgICAg
ICAgICAgICAgICAgfCAyMSArKysrKysrKysrKystLS0tCj4gICBwYWNrYWdlL3F0Ni9xdDYubWsg
ICAgICAgICAgICAgICAgICAgfCAxOCArKysrKysrKysrKysrKwo+ICAgcGFja2FnZS9xdDYvcXQ2
YmFzZS9xbWFrZS5jb25mLmluICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAgcGFja2FnZS9xdDYvcXQ2YmFzZS9xcGxhdGZvcm1kZWZzLmggIHwgIDEgKwo+ICAgcGFja2Fn
ZS9xdDYvcXQ2YmFzZS9xdC5jb25mLmluICAgICAgIHwgIDcgKysrKysrCj4gICBwYWNrYWdlL3F0
Ni9xdDZiYXNlL3F0NmJhc2UubWsgICAgICAgfCAxOCArKysrKysrKysrKysrKwo+ICAgcGFja2Fn
ZS9xd3QvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKy0tLS0tLS0KPiAg
IHBhY2thZ2UvcXd0L3F3dC5oYXNoICAgICAgICAgICAgICAgICB8ICA4ICsrKy0tLS0KPiAgIHBh
Y2thZ2UvcXd0L3F3dC5tayAgICAgICAgICAgICAgICAgICB8ICA2ICsrKystCj4gICAxMSBmaWxl
cyBjaGFuZ2VkLCAxMzIgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9xdDYvcXQ2YmFzZS9xbWFrZS5jb25mLmluCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9xdDYvcXQ2YmFzZS9xcGxhdGZvcm1kZWZzLmgKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3F0Ni9xdDZiYXNlL3F0LmNvbmYuaW4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
