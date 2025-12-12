Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01027D59F52
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 23:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1384541113;
	Fri, 12 Dec 2025 23:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0aYxntYNLRd; Fri, 12 Dec 2025 23:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DA7D40F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765581522;
	bh=EVUp6HyOKClTAKgnwsd6k58wrq2iqDzdzagnkAqUqUQ=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C31orD8T8hBasQ7MRpaHctDNg2KpjnPHqYN7g5EafnbHns7eG9VIhoRG8Jrm8qCRm
	 h+cgYQKsG8OlbxsI+nuMCyoo2biJgkRoMKKRh5vvTPJQ9b4vbQ5t+/OCXRTXJXied+
	 8hpMzoQ2cCOFKCmoCu+j0vQOVQGW1k+C+gx8+/wfE4uOx9sFeUcSyH4j6h2uKohiFV
	 TBj0EGLFSyirgbce7xK+ZVbHCISrDu2uOJj5oza5SRfYskFO3QmkyqO6dHzpeCI8XZ
	 Oi6LxOeiQvusQLFPYXtdFpbl5NCrV/Gd2biuzKea1zTEs2BwKvxqJ9lQx2oxsoAp5O
	 OkBRFswhRufBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA7D40F7A;
	Fri, 12 Dec 2025 23:18:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B04F913D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 23:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96C1740C91
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 23:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWyeQ5c_ZTij for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 23:18:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A20840F7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A20840F7A
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A20840F7A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 23:18:36 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id UCPBvGKqU5SteUCPBvEqki; Sat, 13 Dec 2025 00:18:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 13 Dec 2025 00:18:33 +0100
Message-Id: <69C776C6-313F-47DD-A59F-DD7A9BE0F1B3@benettiengineering.com>
References: <20251212225057.GA173789@pevik>
Cc: buildroot@buildroot.org
In-Reply-To: <20251212225057.GA173789@pevik>
To: Petr Vorel <petr.vorel@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-CMAE-Envelope: MS4xfDI2rXiABkMbNZbvJXjfAJekI5RMTtaSH7QHSeoPAaNEaQeyl7ec/u7eN4V5fboI8XLsnkXyif0C8w9aGbiPJPmUzX74+XCvINOX4o9pxjyKUWJO09kf
 IvwApO7NxY8Zud/GxKu3p81PZO1LEdfx2iS689/lIzK8LfHPHuztichKjwNUtoSQ6OOwRVAnmnW6GCAP6ce2zsw2fYW3tj9NGpIcElcRdCwAubqQ18yVdZKB
 DPqIVBsNPpRHrGzabqwEhw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765581514; bh=aS4hJ/u2fqDu9yEhpWBSWQ50FLzkgf99WuMo5SK4NgA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=NkAoFgap9sAxAQzUb9cwfreM+LNPKYUV/G//3qAFhLGguroMovXUq/69rYlgsH9Q6
 BNk4DJDKTEopZAwbCS4zqAdr5NaChqFabUTCZUEi/ZDsH5ngkCjIEGNSLTpq2RwN7w
 Sm/0GLbI2FpFLNAn12Ko+W2Em3v3o8AHMcXmNxcNSJiRqeYh2iW+yDFgx2kO6Bn+s2
 zQ9TI6AeqHcj7FL9mXXGzT3qXC/UYHb3Hp/S0MD4f8WqLehEZC/FBoIHM3riAaU9Em
 TqW6nDDdh9Bt1tnIGFCB1erVroxa2xNscHyOdQ5e3+G26vwnBWtwr94+S4MgwZcDoN
 QrcYaZ/crCDKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NkAoFgap
Subject: Re: [Buildroot] [PATCH] pacakge/nfs-utils: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_DB
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ciwKCj4gSWwgZ2lvcm5vIDEyIGRpYyAyMDI1LCBhbGxlIG9yZSAyMzo1MSwgUGV0ciBW
b3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlv
LAo+IAo+PiBQYWNha2dlIG5mcy11dGlscyByZXF1aXJlcyBsaWJ0aXJwYyBycGNkYiBvcHRpb24s
IHNvIGxldCdzIHNlbGVjdCBpdCBieQo+IAo+IHMvUGFjYWtnZS9QYWNrYWdlLwo+IAo+PiBkZWZh
dWx0Lgo+IAo+PiBGaXhlczoKPj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzLzI5YWRmMmQwNGNmNGM0NmU0OTJhZjk1ZWRhYTk2OTgzOTg1ZDZiNTcvCj4gCj4+IFNpZ25l
ZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJp
bmcuY29tPgo+PiAtLS0KPj4gcGFja2FnZS9uZnMtdXRpbHMvQ29uZmlnLmluIHwgMSArCj4+IDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9u
ZnMtdXRpbHMvQ29uZmlnLmluIGIvcGFja2FnZS9uZnMtdXRpbHMvQ29uZmlnLmluCj4+IGluZGV4
IDAyY2M3ZTc4Y2MuLjNlMTNiZjg3YTkgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbmZzLXV0aWxz
L0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL25mcy11dGlscy9Db25maWcuaW4KPj4gQEAgLTks
NiArOSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9ORlNfVVRJTFMKPj4gICAgZGVwZW5kcyBvbiBC
UjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfM18xNyAjIGdldHJhbmRvbSgpCj4+ICAgIHNl
bGVjdCBCUjJfUEFDS0FHRV9MSUJFVkVOVAo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVElS
UEMgIyBJUHY2IHJlcXVpcmVzIGxpYnRpcnBjCj4+ICsgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QlRJUlBDX0RCCj4gCj4gSSdtIGNvbmZ1c2VkLiBUaGVyZSBpcyBubyBCUjJfUEFDS0FHRV9MSUJU
SVJQQ19EQiBpbiBtYXN0ZXIgYnJhbmNoLiBXaGF0IGFtIEkKPiBtaXNzaW5nPwoKSeKAmXZlIGZv
cmdvdHRlbiB0byBhZGQgdGhlIG90aGVyIHBhdGNoIEnigJl2ZSB3b3JrZWQgb24gdG8gYWRkIExJ
QlRJUlBDX0RCCgo+IAo+IEFuZCBlbmQgbG9nIGhhczoKPiBjb25maWd1cmU6IGVycm9yOiBOZWl0
aGVyIGdldHJwY2J5bnVtYmVyX3Igbm9yIGdldHJwY2J5bnVtYmVyIGFyZSBhdmFpbGFibGUKPiBU
aGVzZSBmdW5jdGlvbnMgYXJlIGZyb20gZ2xpYmMncyBOU1MgYW5kIDxuZXRkYi5oPiwgcmlnaHQ/
CgpBRkFJSyB0aG9zZSBmdW5jdGlvbnMgY2FuIGJlIHByb3ZpZGVkIGxpYnRpcnBjIGlmIOKAlGVu
YWJsZS1ycGNkYiBpcyBwYXNzZWQgdG8gY29uZmlndXJlLgoKTmVlZCB0byBzZW5kIGJvdGggcGF0
Y2hlcyBzb29uCgpUaGFua3MgdG8gbG9vayBpbnRvIHRoaXMKCktpbmQgcmVnYXJkcwpHaXVsaW8K
Cj4gCj4gS2luZCByZWdhcmRzLAo+IFBldHIKPiAKPj4gICAgc2VsZWN0IEJSMl9QQUNLQUdFX1NR
TElURQo+PiAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWAo+PiAgICBzZWxlY3QgQlIy
X1BBQ0tBR0VfVVRJTF9MSU5VWF9MSUJCTEtJRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
