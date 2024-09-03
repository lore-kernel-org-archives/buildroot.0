Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F845CD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3F3E6058B;
	Tue,  3 Sep 2024 21:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5sEc5nDTqQs; Tue,  3 Sep 2024 21:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0710B607C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0710B607C1;
	Tue,  3 Sep 2024 21:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417AA1BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F31080DB9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AE5ZNiPtHoPs for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 233BC80DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233BC80DB2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 233BC80DB2
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:45:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 037ED13F88D;
 Tue,  3 Sep 2024 23:45:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 23:45:29 +0200
Date: Tue, 3 Sep 2024 23:45:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZteDeUgdmo3xjPSh@landeda>
References: <20240901-rgbmatrix-v2-0-3a10c3c367e4@gmx.net>
 <20240901-rgbmatrix-v2-3-3a10c3c367e4@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901-rgbmatrix-v2-3-3a10c3c367e4@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725399936;
 bh=Xj4ic8Nzz/7HFXT4DERbdEcOj+9B3QyDNXlMxxrLbvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kdnW4xQunMY0KWgR4lNRKmXLNbS9iqb86bPC4ddxJo7m6EcxquR2sVBXyW0zNTWl4
 uXusYlw0xSQQsC+HXU/mPmdnrK5V567sCmtWYFtgGTJHhPDp+cP9ohYrLmrGiHr4vT
 GEUwzEmwAps+KX5x0l+NUZn1H3XqqTQn4WK2NfkygM+84/xw0v02uRA0+gUgsOeSuv
 ntkoyHXgYB2aeIRB1qSk/57FayXESYAK2no2v43sMrAWWI8owAtIXC6vOvSU6600SL
 MGrSHuCAusQuFn9Lt2ZzjJy0IYaaMHkauIn8eOQ4yc4Y6UsuCxtPhuMQf5kkg+VZRp
 dgaHpdRx6Eztw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kdnW4xQu
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_v2_3/3=5D_DEVELOPERS=3A_add_J=2E_?=
 =?utf-8?q?Neusch=C3=A4fer_for_rpi-rgb-led-matrix/python-rgbmatrix?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4sIEFsbCwKCk9uIDIwMjQtMDktMDEgMTY6MjkgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEFkZCBteXNlbGYgYXMgbWFpbnRhaW5lciBzbyBJIGNh
biBiZSBub3RpZmllZCBvZiBwYXRjaGVzL3Byb2JsZW1zL2V0Yy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+IC0tLQo+ICBERVZFTE9Q
RVJTIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggNTcwZjRmZjExNS4uY2ZhNTY4
ZmRlMiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0x
NDU1LDYgKzE0NTUsOCBAQCBGOglwYWNrYWdlL21hd2svCj4gIE46CUouIE5ldXNjaMOkZmVyIDxq
Lm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gIEY6CXBhY2thZ2UvZXhlY2xpbmUvCj4gIEY6CXBhY2th
Z2UvbWRldmQvCj4gK0Y6CXBhY2thZ2UvcHl0aG9uLXJnYm1hdHJpeAo+ICtGOglwYWNrYWdlL3Jw
aS1yZ2ItbGVkLW1hdHJpeAoKUGF0aHMgdG8gZGlyZWN0b3JpZXMgbXVzdCBlbmQgaW4gYSBzbGFz
aCwgbGlrZSB0aGUgb3RoZXIgZW50cmllcyBhcm91bmQuCgpJIGZpeGVkIHRoYXQgYW5kIGFwcGxp
ZWQgdG8gbmV4dCwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIEY6CXBhY2th
Z2UvczYvCj4gIEY6CXBhY2thZ2UvczYtbGludXgtaW5pdC8KPiAgRjoJcGFja2FnZS9zNi1saW51
eC11dGlscy8KPiAKPiAtLQo+IDIuNDUuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
