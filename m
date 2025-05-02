Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF60C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 803AB81F10;
	Fri,  2 May 2025 10:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TWu71arf_dd; Fri,  2 May 2025 10:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B884A83D7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B884A83D7B;
	Fri,  2 May 2025 10:34:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7746CEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CD39605D1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dc9YgrHm7bMH for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF54060B27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF54060B27
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF54060B27
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:34:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE7521C1113; Fri,  2 May 2025 12:34:14 +0200 (CEST)
Message-ID: <3ac94fca-866f-49b8-83c4-d9880d9fbb49@rnout.be>
Date: Fri, 2 May 2025 12:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
 <20250418-ffmpt-v1-1-5540e2621486@gmx.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418-ffmpt-v1-1-5540e2621486@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GpP9pu9Dq05e7yzXD2Q1uKPHpW+m99SElgSMpD4XdL8=;
 b=kIOvEZm7HcEriir2NMa0XroRDHu1DJbQEDP86/FFAe0dJhP42GfHmY7L1L/QvzOISxZDmM
 Cyd+ttHPHRT/03e2XwuCnvzIKoxf+l91fA61YyO2QV0xl+MLbjdQMhw8fW9uAtLaILnYwx
 3bZ1+CxHMHHg38+12ucDcKYTf2wYp9q4rktMq4oNdbiotckY9l1PMvbqSr3sdpTUQgswkm
 c4PdkjQUbBhtNO2nQ82bFr53MPsJyU1Hkakf7oXwv9EbLqmRq5izw5P8dqPrwcfPX4gNcF
 QdTZITZFWsGJkGScZcrK/Qifug4fRuqeT04n7U7RqqiStRx5qI7cfBnDRRNgaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kIOvEZm7
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenmpt: install to staging
 to fix pkg-config
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

CgpPbiAxOC8wNC8yMDI1IDEwOjAzLCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFdpdGhvdXQgdGhpcywgZmZtcGVnIGlzIG5vdCBhYmxlIHRvIGZpbmQgdGhlIGxpYm9wZW5t
cHQgZGVwZW5kZW5jeSwKPiBhdCBsZWFzdCB3aXRoIEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklF
UyBlbmFibGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFl
ZmVyQGdteC5uZXQ+CgogIEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9saWJvcGVubXB0L2xpYm9wZW5tcHQubWsgfCAx
ICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYm9wZW5tcHQvbGlib3Blbm1wdC5tayBiL3BhY2thZ2UvbGlib3Blbm1wdC9saWJv
cGVubXB0Lm1rCj4gaW5kZXggNzRmZmJkYmJkNDIxNDA3ZWU3NGI0NDA3ODJmY2IxY2JlNDNmNGE3
Ni4uNTdjNDVjNmVhMTExOTE2MDNkNDgxMjAxN2U4YzE1Yjk1OWUxZGNiYiAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2xpYm9wZW5tcHQvbGlib3Blbm1wdC5tawo+ICsrKyBiL3BhY2thZ2UvbGlib3Bl
bm1wdC9saWJvcGVubXB0Lm1rCj4gQEAgLTExLDYgKzExLDcgQEAgTElCT1BFTk1QVF9MSUNFTlNF
ID0gQlNELTMtQ2xhdXNlCj4gICBMSUJPUEVOTVBUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4g
ICBMSUJPUEVOTVBUX0NQRV9JRF9WRU5ET1IgPSBvcGVubXB0Cj4gICBMSUJPUEVOTVBUX0RFUEVO
REVOQ0lFUyA9IGhvc3QtcGtnY29uZgo+ICtMSUJPUEVOTVBUX0lOU1RBTExfU1RBR0lORyA9IFlF
Uwo+ICAgCj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQk9QRU5NUFRfT1BFTk1QVDEyMykseSkK
PiAgIExJQk9QRU5NUFRfQ09ORl9PUFRTICs9IC0tZW5hYmxlLW9wZW5tcHQxMjMKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
