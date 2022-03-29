Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF918C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 18:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201A1403BE;
	Tue, 29 Mar 2022 18:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7YhuT-Jxb_iH; Tue, 29 Mar 2022 18:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A4B740137;
	Tue, 29 Mar 2022 18:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B66A1BF83C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18265416C7
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 72g68_bEFisy for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 18:25:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDD2B41675
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 18:25:39 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id y10so13303052pfa.7
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q76zJhPvUT2XoPnjDZdvb/zDeDtYD4958hAeQNnN0YM=;
 b=QTxlVCTN9wH1x4AqXiJeoxdW5naNJJBy01At1mPfbfqB5JgruKRSQvQEt+9qbc+ix3
 hodxBNg6J4rZ2ROgXHjDY+VhJiQMufYpNtKQ4UYkmQihh2jhb4G254jiGOS3/Lvsu4/O
 G9kdQrGQ6boBrKpyzS18z8MYVSoGttv3ObPSaEt2IfdZVfXYt+sgLa9yPofXRTCFMg4i
 Y/laqaJSJp7yMW2mHSw1CftNAm6kXFxwHgtXOE/Cd3akM1i5ZGwJqyPxTo8Ib5z1ZMkK
 Xy6obZ7m7qV+qXjfSjarVchWyjo6/+AqhWn9yDiMKSDC/zdlIbcYBvgDbF4seQ+/f58G
 k1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q76zJhPvUT2XoPnjDZdvb/zDeDtYD4958hAeQNnN0YM=;
 b=JTgTLe32301MeDn+1GEOsl16T2kr1wtEuXAIwOgdmwcrUdN0zidBt0L8FOSelt56kn
 jQolOh3EcQZmsg+IIRnUxWxkwqv7rbD8Avk+6XC6lEoGE7rRZPJslQ6nGVB1VB6vxhzr
 YVa5wmqPb6nh4rpSkPn1FhgTTOrJRd2+K04ZJod9i2wjnGhG0x62hxpzr5Xnl0+E3TCY
 HU7AQjAYgiZC6F/EhHrq5JBCypOOaqYFhRlFzlRwrWg7Nn7XUIWBQSlGEhkOHQEfv8BO
 j+GtfqIBwNY1hCWgS1nt+rdijauR14KJbsYWS/YfLkV5DS//2pEHcxsLELZ77GTjU6/l
 2eEw==
X-Gm-Message-State: AOAM531E1kW+L/Z0ZX7Ch9urNQzJHkjA59DElEVnnMdO7NbTlcgTJGYt
 gWrPWy+odUbfzytPLaABH58ZmR0fi1aa4Q==
X-Google-Smtp-Source: ABdhPJwpaz5F4Rxhi3C0sGzgo0F9pRb4wGEVSXzeScqACLdAuhAkSimDeNOCvKy+geEdejv8ZpfwMQ==
X-Received: by 2002:a05:6a00:b8e:b0:4fa:de88:9fc7 with SMTP id
 g14-20020a056a000b8e00b004fade889fc7mr29223619pfj.56.1648578338915; 
 Tue, 29 Mar 2022 11:25:38 -0700 (PDT)
Received: from smtpclient.apple ([2806:1000:8003:5c6c:78d4:5f4f:bbd6:8f9a])
 by smtp.gmail.com with ESMTPSA id
 qe15-20020a17090b4f8f00b001c6f4991cd4sm3710693pjb.45.2022.03.29.11.25.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Mar 2022 11:25:38 -0700 (PDT)
From: Alsey Miller <alseycmiller@gmail.com>
X-Google-Original-From: Alsey Miller <Alseycmiller@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
In-Reply-To: <20220329145904.63900-1-andreynech@gmail.com>
Date: Tue, 29 Mar 2022 11:25:36 -0700
Message-Id: <9D9C16F3-628C-4BA5-B218-5066F12FAEFD@gmail.com>
References: <20220329145904.63900-1-andreynech@gmail.com>
To: Andrey Nechypurenko <andreynech@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBuZXdlciB2ZXJzaW9uIG9mIGNtYWtlIGlzIGFsc28gbmVlZGVkIHRvIGNyb3NzIGNvbXBp
bGUgQXBwbGXigJlzIFN3aWZ0IHByb2dyYW1taW5nIGxhbmd1YWdlLCBzbyBpdCB3b3VsZCBiZSBn
cmVhdCBpZiB0aGlzIGdvdCBtZXJnZWQuCgo+IE9uIE1hciAyOSwgMjAyMiwgYXQgNzo1OSBBTSwg
QW5kcmV5IE5lY2h5cHVyZW5rbyA8YW5kcmV5bmVjaEBnbWFpbC5jb20+IHdyb3RlOgo+IAo+IFZl
cnNpb24gMy4yMCBpcyB0aGUgZmlyc3Qgb25lIHdoZXJlIHRoZSBmb2xsb3dpbmcgaXNzdWUgaXMg
Zml4ZWQ6Cj4gaHR0cHM6Ly9naXRsYWIua2l0d2FyZS5jb20vY21ha2UvY21ha2UvLS9pc3N1ZXMv
MTgyOTkKPiBXYXMgYWZmZWN0ZWQgYnkgdGhpcyBidWcgYW5kIGRlY2lkZSB0byBidW1wIHRoZSB2
ZXJzaW9uIHRvIHRoZQo+IGxhdGVzdCBzdGFibGUKPiAtLS0KPiBwYWNrYWdlL2NtYWtlL2NtYWtl
Lmhhc2ggfCA0ICsrLS0KPiBwYWNrYWdlL2NtYWtlL2NtYWtlLm1rICAgfCA0ICsrLS0KPiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9jbWFrZS9jbWFrZS5oYXNoIGIvcGFja2FnZS9jbWFrZS9jbWFrZS5oYXNo
Cj4gaW5kZXggZGE1MTRhNmQ2Yi4uMTc0OWRiOGMyNyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nt
YWtlL2NtYWtlLmhhc2gKPiArKysgYi9wYWNrYWdlL2NtYWtlL2NtYWtlLmhhc2gKPiBAQCAtMSw1
ICsxLDUgQEAKPiAtIyBGcm9tIGh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3YzLjE4L2NtYWtlLTMu
MTguNi1TSEEtMjU2LnR4dAo+IC1zaGEyNTYgIDEyNGY1NzFhYjcwMzMyZGE5N2ExNzNjYjc5NGRm
YTA5YTViMjBjY2JiODBhMDhlNTY1NzBhNTAwZjQ3YjY2MDAgIGNtYWtlLTMuMTguNi50YXIuZ3oK
PiArIyBGcm9tIGh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3YzLjIyL2NtYWtlLTMuMjIuMy1TSEEt
MjU2LnR4dAo+ICtzaGEyNTYgIDlmODQ2OTE2NmY5NDU1M2I2OTc4YTE2ZWUyOTIyN2VjNDlhMmVi
NWNlYjYwODI3NWRlYzQwZDhhZTBkMWI1YTAgIGNtYWtlLTMuMjIuMy50YXIuZ3oKPiAKPiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAo+IHNoYTI1NiAgMTMxYjlmZjc1NmI2NGEyNWI3NDYxYzNjMTM4MmU3
MGIxNmM3MGE1YjQ4MzNhMTU3Nzg5N2ZhM2VhNmQ4OGY4ZCAgQ29weXJpZ2h0LnR4dAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2NtYWtlL2NtYWtlLm1rIGIvcGFja2FnZS9jbWFrZS9jbWFrZS5tawo+
IGluZGV4IDQxNzdiMTE5YWIuLjA1MzY1OGZhZDYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9jbWFr
ZS9jbWFrZS5tawo+ICsrKyBiL3BhY2thZ2UvY21ha2UvY21ha2UubWsKPiBAQCAtNCw4ICs0LDgg
QEAKPiAjCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiAtQ01BS0VfVkVSU0lPTl9NQUpP
UiA9IDMuMTgKPiAtQ01BS0VfVkVSU0lPTiA9ICQoQ01BS0VfVkVSU0lPTl9NQUpPUikuNgo+ICtD
TUFLRV9WRVJTSU9OX01BSk9SID0gMy4yMgo+ICtDTUFLRV9WRVJTSU9OID0gJChDTUFLRV9WRVJT
SU9OX01BSk9SKS4zCj4gQ01BS0VfU0lURSA9IGh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3YkKENN
QUtFX1ZFUlNJT05fTUFKT1IpCj4gQ01BS0VfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+IENNQUtF
X0xJQ0VOU0VfRklMRVMgPSBDb3B5cmlnaHQudHh0Cj4gLS0gCj4gMi4zMi4wCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
