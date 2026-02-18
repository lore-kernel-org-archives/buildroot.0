Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2EFE9A04B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F3440501;
	Wed, 18 Feb 2026 20:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKCXYLjLdpcD; Wed, 18 Feb 2026 20:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDCA440567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771447918;
	bh=mZayyXd6/VBTk16CbhvfmcBWs3Pb6ylVpY2g3QszDPs=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RE425BpGvhF82PQQ6YaQPLZ9AzcLKoZOO3q0JkrwPRciDIrVmVJ2U1wGo/x0TLX2O
	 XWqihoRgZomcoDHlMmh9TFfGKKfku04icxOnZ2zqVu7g5OpgEx9b4wNVvZd8whltZk
	 SPasPpkL/Rtmef1Rod52OYtdPi51EcFj6VsT9sqTXdoEdh+vRPY81+RQCqF920jWtq
	 HbPEz1b4y0tlegfdTucHWb54xAVYVhmzS4Hzqlb9jhgTcXRc5Eq8tDzkonAzBNFeDl
	 o45O9PCBRJph0SWvKWL3wgODtUL2SQa7TArhDRP/DfEWsYyHB7uRmyW7Lx6GIJAAhs
	 aVpgIxX4MBmXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDCA440567;
	Wed, 18 Feb 2026 20:51:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BDB01CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81BEC813F2
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35_B6JL96w5f for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 20:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00C50813EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C50813EC
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00C50813EC
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 20:51:54 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id soWVvesHtZCONsoWVvdYFg; Wed, 18 Feb 2026 21:51:51 +0100
Message-ID: <7dd4eb14-03f0-4aa3-a504-130110350cca@benettiengineering.com>
Date: Wed, 18 Feb 2026 21:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20260210000827.3811338-1-giulio.benetti@benettiengineering.com>
 <20260210000827.3811338-2-giulio.benetti@benettiengineering.com>
 <f65c7f97714ce0d26f6e57079bc9b9b7@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <f65c7f97714ce0d26f6e57079bc9b9b7@free.fr>
X-CMAE-Envelope: MS4xfK8MAkz7/oFqfB8cekJ6vBI0fl49MPqHBP/grSN7UcOjutHtNWKo44qUmmOTE6LxEYaX6ioXWVFjhs9Cnhq3JN0hTBgSA8yeKcDqnn1Kz8sb6/71CcWn
 jLuOXIQI24/RPn/VpjgFG9SCJW7dsowxxN91PXWcx1AL7vI2870Uzu3uDOHZRuqaUjIAsQ1NglYPyy4UPCsH2KHF6gyRh4AYPTkYfYhU18c73lLFGWjCntC1
 24/E9aZZEg7HWtCeILF8qcWHQgyEGkV9x2dKOAlmPSQBECK18Nq2BLLNOanQzKwyObWz2lc7dUmf6uLMUDVLYlr1pwoEta3NgkvKpUBabmbJQ25Ijot+GxRX
 ZexsdKQzUCTmrAJMRBQXK/1Gw00Ea+n0aDh1D019Q5vcLTAkqkeVTQ92o7EQXNc9guUqQY31UgjfMCjZrQrjTtMkW8yfwhKKQgBrq9diUYFPxUKbHT0gI2rk
 ySLZhPYvI4WEQ48COA/0kZA5MHDwWTNtedwGEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1771447911; bh=IKFNABwJ3GOlKBG1KOLYuz7BAPg+rBOu7OdQ+jHiFvA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=US7hJLSErD7RRdkoWyIRTL7SO+NoWk3DOOlNN8VhKr0MCy3d3y4LlJHUMc7yxEc0t
 TKtylCTtV3Yic17CA9LnOsPSCy6FqvQyYEMa0KT+B7wdvItKLDfMxIVMX4JV4eFFDd
 tNsjhyG+8UrnACI/B/rRI1Js0hM5mtMXIAmCdoQ5savRug67ceVe4BPU5P2FmThy3V
 Jm2A/7DokWTxZFx+21MPE0fIzqw2oMmCqaVj1W/izWWmiR9g4CaWIM2CdzUBVXs6Ge
 GW1uC054OvkPas6djYHlCY2Veq24YBcP9+rSbBo3JE71jNghBSXTyQhN9M9FhDRXbT
 d+rxct7k5PiVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=US7hJLSE
Subject: Re: [Buildroot] [PATCH v2 11/13]
 configs/olimex_a20_olinuxino_micro: bump Linux to 6.18.8 and U-Boot to
 2026.01
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

T24gMTQvMDIvMjAyNiAyMTowMSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkgR2l1bGlvLCBB
bGwsCj4gCj4gT24gMTAvMDIvMjAyNiAwMTowOCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IFRo
ZSBwYXRjaDoKPj4gKiBidW1wcyBMaW51eCBrZXJuZWwgdG8gdmVyc2lvbiA2LjE4LjgKPj4gKiBi
dW1wcyBVLUJvb3QgdG8gdmVyc2lvbiAyMDI2LjAxCj4+ICogZm9yY2VzIGNoZWNrIGhhc2hlcwo+
PiAqIHN3aXRjaGVzIHRvIGV4dGxpbnV4Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IFsuLi5dCj4+IGRp
ZmYgLS1naXQgYS9ib2FyZC9vbGltZXgvYTIwX29saW51eGluby9wYXRjaGVzL2xpbnV4L2xpbnV4
Lmhhc2ggYi8gCj4+IGJvYXJkL29saW1leC9hMjBfb2xpbnV4aW5vL3BhdGNoZXMvbGludXgvbGlu
dXguaGFzaAo+PiBpbmRleCA5ZGQ0OTc3NmIwLi41NjdlOWIzOGM1IDEwMDY0NAo+PiAtLS0gYS9i
b2FyZC9vbGltZXgvYTIwX29saW51eGluby9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPj4gKysr
IGIvYm9hcmQvb2xpbWV4L2EyMF9vbGludXhpbm8vcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4+
IEBAIC0xLDIgKzEsMyBAQAo+PiDCoCMgTG9jYWxseSBjb21wdXRlZAo+PiDCoHNoYTI1NiAKPj4g
N2E4ODc5MTY3Yjg5YzRiYWUwNzdkNmYzOWM0ZjIxMzA3NjlmMDVkYmRhZDJhYWQ5MTRhZGFiOWFm
YjdkN2Y5YSAKPj4gbGludXgtNi4xOC4zLnRhci54ego+PiArc2hhMjU2IAo+PiAzN2YwYzVkNWMy
NDJjMWQ2MDRlODdkNDhmMDg3OTVlODYxYTVhODVmNzI1YjRjYTExZDBhNTM4ZjEyZmY4Y2ZmIAo+
PiBsaW51eC02LjE4LjgudGFyLnh6Cj4gCj4gSXQgd291bGQgYmUgZ3JlYXQgaXMgc29tZWJvZHkg
Y291bGQgc2VuZCBhbiB1cGRhdGUgb2YgdGhlIHR3byBvdGhlciAKPiBkZWZjb25maWdzOgo+IG9s
aW1leF9hMjBfb2xpbnV4aW5vX2xpbWVfZGVmY29uZmlnCj4gb2xpbWV4X2EyMF9vbGludXhpbm9f
bGltZTJfZGVmY29uZmlnCj4gYnVtcGluZyB0aGUga2VybmVsIHRvIDYuMTguOCB0byBoYXZlIHRo
ZSB0aHJlZSBkZWZjb25maWdzIGFsaWduZWQsCj4gc28gd2UgY2FuIHJlbW92ZSB0aGUgNi4xOC4z
IGhhc2guCgpJJ20gdGFraW5nIGNhcmUgYWJvdXQgdGhpcywgYnVpbGRpbmcgcmlnaHQgbm93IGFu
ZCB0ZXN0aW5nIG9uIHRoZSBib2FyZHMKc29vbi4KCkJlc3QgcmVnYXJkcwpHaXVsaW8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
