Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63787C433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E262B40123;
	Mon,  3 Jan 2022 20:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gYZtQF6ovaw; Mon,  3 Jan 2022 20:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDB9B403AA;
	Mon,  3 Jan 2022 20:45:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCCBD1BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9D8B40890
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBo-XoYQhx3j for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:45:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C26314088F
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:45:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v6so10298166wra.8
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 12:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SG7eG4O2MFwJZ23ClLRdLSYVSlJEJ/GewDxyitmc2Ww=;
 b=HtRk9RjLde6gPmZ6xp8RgWDzj3XnLXLsfeT8cDE/Hh8irXPE3BeWAAll6C3eRzO33Q
 L31nTPXDTueI0qeUpNABQm6u+qU4Ju3Qy9Sv7gDZnI6zv54BHbfvbkt/Nb4nI0OshIpm
 IACeYMYBqRCRf/3rU/OIUtWBTk1otrS/gW6BiSs2Rw/IezKdLfXBqpyoU/VwBaBsrrDd
 yJNE6ow9AaGbIGi4EVJ+LXU1tsUrMroVD3fxrnST78cw18X/9zNyXNzQ2fibF1mG2VlS
 hH37zwnufM4JpcM8MHe0IN+A9uLowv2R4x2wdWhlnN30wFQy7vN/7oY3SdfrDuA7VsJb
 N0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SG7eG4O2MFwJZ23ClLRdLSYVSlJEJ/GewDxyitmc2Ww=;
 b=55HcgjCBYNBk9e3XviFuY49Be4JMQEXr51pZjS+VES3Wtlg43LmdX+dXKQd5gMSZRV
 16nCdmgwKXDsZwUuBTqnMSOQ97Khf1eMjrvhUpnyvjN6/d2q9ETmoUiywsi2ZaeLBotD
 XFW5YVVxsM7iceD9OFWTlhK4T3SjO/+ifNALfGgq3ZDWMaxSccqMtzTdPO3pNMLYIxvx
 kp73Xwq6GqFqyx/XCsj5E394/hEcUcmEivoQnVy5+bHkDikirCbxBhA7kUftdpIlZnzy
 0wFUq/NVpYO45XVLPd26/LqFNW1SrRLa5k0BcmNt6f2wC5M7F5343AqPkjtQfqr2dTQs
 mC1g==
X-Gm-Message-State: AOAM532ep9D7oqe7j1BgdOQKosAW5VkKFB72r5Ev3v36U5SNYwQu2np1
 JrE4gJwoFYHvCn8+w9n7wq4=
X-Google-Smtp-Source: ABdhPJz7mA9SUC2PzFo7h9o0cwSBIblZWGIEgOBA6qJlpa6NFMOUDespFyNcJHXI5RNj625yWmJrxA==
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr39166612wrx.110.1641242716866; 
 Mon, 03 Jan 2022 12:45:16 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id r11sm36192555wrw.5.2022.01.03.12.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 12:45:16 -0800 (PST)
Message-ID: <85e542af-edfa-629f-3b6e-1afa7eb55c31@gmail.com>
Date: Mon, 3 Jan 2022 21:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220102165431.3551867-1-romain.naour@gmail.com>
 <20220103204344.GJ69135@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220103204344.GJ69135@scaer>
Subject: Re: [Buildroot] [PATCH] board/qemu/aarch64-sbsa: use
 partition-type-uuid for genimage-15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDAzLzAxLzIwMjIgw6AgMjE6NDMsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIyLTAxLTAyIDE3OjU0ICswMTAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBHZW5pbWFnZSAxNSByZXN0cmljdGVkIHRoZSBwYXJ0
aXRpb24tdHlwZSBvcHRpb24gdG8gbWJyIGFuZCBoeWJyaWQKPj4gcGFydGl0aW9uLXRhYmxlLXR5
cGUgYW5kIG5vdyBwcmludHMgYSB3YXJuaW5nIHdoZW4gaXQgaXMgdXNlZCBbMV06Cj4+Cj4+IEVS
Uk9SOiBoZGltYWdlKGRpc2suaW1nKTogcGFydCBib290OiAncGFydGl0aW9uLXR5cGUnIGlzIG9u
bHkgdmFsaWQgZm9yIG1iciBhbmQgaHlicmlkIHBhcnRpdGlvbi10YWJsZS10eXBlCj4+Cj4+IFsx
XSBodHRwczovL2dpdGh1Yi5jb20vcGVuZ3V0cm9uaXgvZ2VuaW1hZ2UvY29tbWl0LzFkNzJkODA5
MWY4Mzc5MGEwYTM1YTFlYTdkYzI1ZDQ2YWRiYTg4NzYKPj4KPj4gU3luYyB0aGUgZ2VuaW1hZ2Uu
Y2ZnIHdpdGggdGhlIG9uZSB1c2VkIGZvciBhYXJjaDY0X2VmaV9kZWZjb25maWcKPj4KPj4gRml4
ZXM6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMv
MTkyOTcxNzE3OQo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzE5MjE3OTIyNjIKPiAKPiBJJ3ZlIGFkZGVkIGEgbGluayB0byB0aGUgV2lraXBlZGlh
IHBhZ2UgdGhhdCBsaXN0cyB0aGUgVVVJRHM6Cj4gICAgIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9y
Zy93aWtpL0dVSURfUGFydGl0aW9uX1RhYmxlI1BhcnRpdGlvbl90eXBlX0dVSURzCgpUaGFua3Ms
IHVzZWZ1bCBsaW5rIQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+PiBTaWduZWQtb2ZmLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IENjOiBEaWNrIE9sc3Nv
biA8aGlAc2VuemlsbGEuaW8+Cj4+IENjOiBQaWVycmUtSmVhbiBUZXhpZXIgPHRleGllci5wajJA
Z21haWwuY29tPgo+IAo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gUmVnYXJkcywK
PiBZYW5uIEUuIE1PUklOLgo+IAo+PiAtLS0KPj4gIGJvYXJkL3FlbXUvYWFyY2g2NC1zYnNhL2dl
bmltYWdlLmNmZyB8IDYgKysrKy0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9hYXJjaDY0LXNi
c2EvZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvZ2VuaW1hZ2UuY2ZnCj4+
IGluZGV4IDEyMWFlOWYzN2IuLmJkZjhhODlkNzUgMTAwNjQ0Cj4+IC0tLSBhL2JvYXJkL3FlbXUv
YWFyY2g2NC1zYnNhL2dlbmltYWdlLmNmZwo+PiArKysgYi9ib2FyZC9xZW11L2FhcmNoNjQtc2Jz
YS9nZW5pbWFnZS5jZmcKPj4gQEAgLTE4LDEyICsxOCwxNCBAQCBpbWFnZSBkaXNrLmltZyB7Cj4+
ICAJfQo+PiAgCj4+ICAJcGFydGl0aW9uIGJvb3Qgewo+PiAtCQlwYXJ0aXRpb24tdHlwZSA9IDB4
RUYKPj4gIAkJaW1hZ2UgPSAiZWZpLXBhcnQudmZhdCIKPj4gKwkJcGFydGl0aW9uLXR5cGUtdXVp
ZCA9IGMxMmE3MzI4LWY4MWYtMTFkMi1iYTRiLTAwYTBjOTNlYzkzYgo+PiArCQlvZmZzZXQgPSAz
MksKPj4gKwkJYm9vdGFibGUgPSB0cnVlCj4+ICAJfQo+PiAgCj4+ICAJcGFydGl0aW9uIHJvb3Qg
ewo+PiAtCQlwYXJ0aXRpb24tdHlwZSA9IDB4ODMKPj4gKwkJcGFydGl0aW9uLXR5cGUtdXVpZCA9
IGI5MjFiMDQ1LTFkZjAtNDFjMy1hZjQ0LTRjNmYyODBkM2ZhZQo+PiAgCQlpbWFnZSA9ICJyb290
ZnMuZXh0MiIKPj4gIAl9Cj4+ICB9Cj4+IC0tIAo+PiAyLjMxLjEKPj4KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
