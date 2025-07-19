Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F04C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 19:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 132C641B60;
	Sat, 19 Jul 2025 19:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcrOVtjnr3RY; Sat, 19 Jul 2025 19:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 559B441B72
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 559B441B72;
	Sat, 19 Jul 2025 19:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB543222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E9C84803
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8y7hxX1rdG0 for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 19:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0F8C84800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0F8C84800
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0F8C84800
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 19:12:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6BDAD13F86E;
 Sat, 19 Jul 2025 21:12:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 21:12:05 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 21:12:05 +0200
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@sevenlab.de>
Cc: buildroot@buildroot.org, Colin Foster <colin.foster@in-advantage.com>
In-Reply-To: <20250716133220.3484511-1-gero.schwaericke@sevenlab.de>
References: <20250716133220.3484511-1-gero.schwaericke@sevenlab.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <adb85a6fa657f29e004be080afeefb51@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752952327;
 bh=R9+xFsOsPTepfeW9RWKC53Bh5feNzuxYnmyGyyZQXf4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LPAqhjAToDCkGofoi4qr7s22Z9YMRKVeSNNHacan1Sx18j7mK8ge37IlVsBm+J4Uj
 xA01Gz/WtCyivFXqoOjbN2mxIG4ybmd63VeD9daspiUvSpV30hgwXogzhCNuKPNzWQ
 +vipRA02QYpR/DHgIjtmdsOQgIRiJhr1pulbPLKtq2MI44sRaDhw22+hYhhn/b/LTF
 cOQqF4hvkxqszYUKCjkZkLNxAKuhrfKOY7z4zb9eIiCoeSzHzgMISwpQKQ0j2YpcED
 7Rn98pttmcSoxh8UsKe1FVes1ITZJmb9/0IH1081/spsVez7aX+iD+Z6FVN0fqJSCr
 JaYj9nGkUdhuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LPAqhjAT
Subject: Re: [Buildroot] [PATCH v2] package/rauc-hawkbit-updater: fix
 missing user
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

T24gMTYvMDcvMjAyNSAxNTozMCwgR2VybyBTY2h3w6RyaWNrZSB3cm90ZToKPiBTeXN0ZW1kIHN1
cHBvcnQgZm9yIHRoZSBSQVVDIGhhd2tiaXQgdXBkYXRlciB3YXMgYWRkZWQgaW4KPiAKPiAgIDRh
YTdhNGFkOGEgKHBhY2thZ2UvcmF1Yy1oYXdrYml0LXVwZGF0ZXI6IGFkZCBzeXN0ZW1kIG9wdGlv
bmFsIAo+IGRlcGVuZGVuY3ksIDIwMjQtMDctMTApCj4gCj4gVGhpcyBpbnN0YWxscyB0aGUgUkFV
QyBoYXdrYml0IHVwZGF0ZXIgc2VydmljZSwgd2hpY2ggZXhlY3V0ZXMgYXMgdXNlcgo+ICJyYXVj
LWhhd2tiaXQiIFsxXSwgd2hpY2ggZG9lc24ndCBleGlzdCBieSBkZWZhdWx0Lgo+IAo+IFsxXSAK
PiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjLWhhd2tiaXQtdXBkYXRlci9ibG9iLzI3MTFj
MGUwMjc4MWViOWQ5NzI4NWM4NzE5N2YxYmFmZWY3NWQwZDEvc2NyaXB0L3JhdWMtaGF3a2JpdC11
cGRhdGVyLnNlcnZpY2UKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJv
LnNjaHdhZXJpY2tlQHNldmVubGFiLmRlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
