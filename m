Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC168C54EBC
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7483E60FAA;
	Tue, 10 Jan 2023 12:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7483E60FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBlZhCTD_Bix; Tue, 10 Jan 2023 12:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A360B60F93;
	Tue, 10 Jan 2023 12:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A360B60F93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE311BF307
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5613340338
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 12:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5613340338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QlhwbgK3a1b for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 12:39:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D8F4026E
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D8F4026E
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 12:39:29 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id tz12so28231068ejc.9
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 04:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AKLBrwOlRja6705uoEJ0YkcrGQOcP1pUyplojx6QJo=;
 b=XKMSM6qB3KdHnUL0BhY9hXsTymql8cEr+9Du0OpvWPTljE/S6SW/GeTgHnv+szwfDV
 YU2uY+Y6lcbdEk8N475GdV5/phRjhh7YJ2GDbP/wEnNPRMlL1RvlApHPe2i8KZPAxJSa
 aCnqKfx4IdTnnTCeUQL7iKA4CInEgxCVbUhbpUqjM05Qo4Szoj9aam2xhBcUXIjeX5pf
 lMDuh44froZRmOQ+Irrlp6aFuIOVWw4hvIKLroRkwD/5UFSfuDpwwGlUCI1ntgOucFJh
 lQ//32PFeOg2RTgi7ZIYFY3qlSOM8qV2FJiTTw30X4sEafIwsG5EUBx6O+0e0daq5TA9
 gyaw==
X-Gm-Message-State: AFqh2kqO0V8iPlw5xULWYCnw+22AkICILAe454p+eEkmB3I31FjI7qAW
 w4qTw2FRX26OLbeeHLBjXz3k+/h/7mz/LISAvEZEY2+RzwSZ9lWE
X-Google-Smtp-Source: AMrXdXvN36RJIkjECzzZft6cVKrtjvHjoxZTgBWzl4cugstrQVBTLBanIbRqxcgqOwmpEFNkibeJJif2NRclqrJnB74=
X-Received: by 2002:a17:906:33d6:b0:84d:39d2:be19 with SMTP id
 w22-20020a17090633d600b0084d39d2be19mr1115591eja.363.1673354368184; Tue, 10
 Jan 2023 04:39:28 -0800 (PST)
MIME-Version: 1.0
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-7-james.hilliard1@gmail.com>
In-Reply-To: <20221128175851.1913859-7-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 10 Jan 2023 13:39:16 +0100
Message-ID: <CAKcgs2xQrBQN1ah4hSBGfdd1moUGe_H_2KHGQ0hPxrsnHhDmtw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4AKLBrwOlRja6705uoEJ0YkcrGQOcP1pUyplojx6QJo=;
 b=YPdiL1W+vERxrfGDQqvgpd88ZVpWgL0d4eGR9ANacz75Vf9Kw2GmSzcdPi+DAWpjog
 QHBmaE3UI2JCr/BjZSy/1l0EfjjLp/5b8tTonlq9Wmyj6FPGmdYjNkMHO33lt+TntlN2
 5zBDxFXOhIvhiDCEpa8M0Bst7nQsip9Ei63OnBG+lkL0QXwNjaOG5jTGObBrDaUKphEO
 cRiMehkWxB5OfvG3GuqqosKNfHXfTBSkAQapPure10HsRzIYj/GXLRvk6stvGBug68T7
 QM7H3ikhvYT5YB0lCSlx9QZhIhF3aD2pm4PzLcXuP99PN7rGWaU5V9SLZkDBKuJeOU9z
 pwBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YPdiL1W+
Subject: Re: [Buildroot] [PATCH v2 7/8] package/farmhash: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIEhpIFN0ZWZhbiwKCkxlIGx1bi4gMjggbm92LiAyMDIyIMOgIDE5OjAwLCBKYW1l
cyBIaWxsaWFyZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gRnJv
bTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPgo+IFRoaXMgcGFj
a2FnZSBpcyByZXF1aXJlZCBieSB0ZW5zb3JmbG93LWxpdGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBnaW56aW5nZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAgMSArCklmIHlvdSB3YW50IHRvIGJlIG1haW50
YWluZXJzIGZvciB0aGlzIHBhY2thZ2UsIGRvIG5vdCBmb3JnZXQgdG8KdXBkYXRlIHRoZSBERVZF
TE9QRVJTIGZpbGUuCgo+ICBwYWNrYWdlL2Zhcm1oYXNoL0NvbmZpZy5pbiAgICAgfCAgNyArKysr
KysrCj4gIHBhY2thZ2UvZmFybWhhc2gvZmFybWhhc2guaGFzaCB8ICA0ICsrKysKPiAgcGFja2Fn
ZS9mYXJtaGFzaC9mYXJtaGFzaC5tayAgIHwgMTQgKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Zh
cm1oYXNoL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9mYXJtaGFzaC9m
YXJtaGFzaC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Zhcm1oYXNoL2Zhcm1o
YXNoLm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZp
Zy5pbgo+IGluZGV4IGZlNjM2ZmRlOWQuLmE1OWQwNzQ0MzAgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0xOTg4LDYgKzE5ODgs
NyBAQCBtZW51ICJPdGhlciIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9lbGZ1dGlscy9Db25m
aWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZWxsL0NvbmZpZy5pbiIKPiAgICAgICAg
IHNvdXJjZSAicGFja2FnZS9mYWxjb3NlY3VyaXR5LWxpYnMvQ29uZmlnLmluIgo+ICsgICAgICAg
c291cmNlICJwYWNrYWdlL2Zhcm1oYXNoL0NvbmZpZy5pbiIKPiAgICAgICAgIHNvdXJjZSAicGFj
a2FnZS9mZnQyZC9Db25maWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZmZ0dy9Db25m
aWcuaW4iCj4gICAgICAgICBzb3VyY2UgInBhY2thZ2UvZmxhbm4vQ29uZmlnLmluIgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2Zhcm1oYXNoL0NvbmZpZy5pbiBiL3BhY2thZ2UvZmFybWhhc2gvQ29u
ZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wYWQxNmY5
MzNiCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmFybWhhc2gvQ29uZmlnLmluCj4g
QEAgLTAsMCArMSw3IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GQVJNSEFTSAo+ICsgICAgICAg
Ym9vbCAiZmFybWhhc2giCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQ
UApJdCBzZWVtcyBsaWtlIHlvdSBhcmUgdXNpbmcgQysrMTEgdG8gYnVpbGQgdGhlIHBhY2thZ2Uu
IENhbiB5b3UgcGxlYXNlCnNldCB0aGUgbWluaW11bSBHQ0MgdmVyc2lvbj8KPiArICAgICAgIGhl
bHAKPiArICAgICAgICAgRmFybUhhc2gsIGEgZmFtaWx5IG9mIGhhc2ggZnVuY3Rpb25zLgo+ICsK
PiArICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9mYXJtaGFzaApQbGVhc2UgbWVu
dGlvbiB0aGUgZGVwZW5kZW5jaWVzIChDKysgYW5kIEMrKyB2ZXJzaW9uKQoKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9mYXJtaGFzaC9mYXJtaGFzaC5oYXNoIGIvcGFja2FnZS9mYXJtaGFzaC9mYXJt
aGFzaC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hZmRm
YzBmOTk0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmFybWhhc2gvZmFybWhhc2gu
aGFzaAo+IEBAIC0wLDAgKzEsNCBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYg
IDE4MzkyY2YwNzM2ZTFkNjJlY2JiOGQ2OTVjMzE0OTZiNjUwNzg1OWU4Yzc1NTQxZDdhZDBiYTA5
MmRjNTIxMTUgIGZhcm1oYXNoLTBkODU5YTgxMTg3MGQxMGY1M2E1OTQ5MjdkMGQwYjk3NTczYWQw
NmQudGFyLmd6Cj4gKyMgTGljZW5zZSBmaWxlcywgbG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1
NiAgNDE2MmRkMDkxY2FhZTIzNGY3MmQzYjU3ZTEzODE3NGY3MzNlNzM2YjI0MzBhNGM1MWIwOThi
MTdkODY2ZmNiNiAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zhcm1oYXNoL2Zhcm1o
YXNoLm1rIGIvcGFja2FnZS9mYXJtaGFzaC9mYXJtaGFzaC5tawo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNmFiN2QxYTg4Ygo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL2Zhcm1oYXNoL2Zhcm1oYXNoLm1rCj4gQEAgLTAsMCArMSwxNCBAQAo+ICsjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgZmFybWhhc2gKPiArIwo+ICsjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ICsKPiArRkFSTUhBU0hfVkVSU0lPTiA9IDBkODU5YTgxMTg3MGQxMGY1
M2E1OTQ5MjdkMGQwYjk3NTczYWQwNmQKPiArRkFSTUhBU0hfU0lURSA9ICQoY2FsbCBnaXRodWIs
Z29vZ2xlLGZhcm1oYXNoLCQoRkFSTUhBU0hfVkVSU0lPTikpCj4gK0ZBUk1IQVNIX0xJQ0VOU0Ug
PSBNSVQKPiArRkFSTUhBU0hfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArRkFSTUhBU0hfSU5T
VEFMTF9TVEFHSU5HID0gWUVTCj4gK0ZBUk1IQVNIX0NPTkZfRU5WICs9IENYWEZMQUdTPSIkKFRB
UkdFVF9DWFhGTEFHUykgLXN0ZD1jKysxMSIKPiArCj4gKyQoZXZhbCAkKGF1dG90b29scy1wYWNr
YWdlKSkKPiAtLQo+IDIuMzQuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKdGhhbmtzCkdpbGxlcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
