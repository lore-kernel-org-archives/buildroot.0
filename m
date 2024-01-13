Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB389C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 786D560D64;
	Sat, 13 Jan 2024 21:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 786D560D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpjmLihKiVFF; Sat, 13 Jan 2024 21:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CB160B83;
	Sat, 13 Jan 2024 21:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0CB160B83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F36B21BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DD4760B83
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD4760B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvMEP6B-vRKE for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:04:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D1F5607F1
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D1F5607F1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 665B9E0002;
 Sat, 13 Jan 2024 21:04:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOlB4-00DPKW-2c;
 Sat, 13 Jan 2024 22:04:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
References: <20240103063253.6833-1-zajec5@gmail.com>
Date: Sat, 13 Jan 2024 22:04:26 +0100
In-Reply-To: <20240103063253.6833-1-zajec5@gmail.com> (=?utf-8?Q?=22Rafa?=
 =?utf-8?Q?=C5=82_Mi=C5=82ecki=22's?=
 message of "Wed, 3 Jan 2024 07:32:53 +0100")
Message-ID: <87frz1osh1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] board/broadcom/northstar: fix building
 custom images
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
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhZmHFgiIgPT0gUmFmYcWCIE1pxYJlY2tpIDx6YWplYzVAZ21haWwuY29tPiB3cml0
ZXM6CgogPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+CiA+IEN1c3Rv
bSBOb3J0aHN0YXIgaW1hZ2VzIGFsbG93IGluc3RhbGxpbmcgKGZsYXNoaW5nKSB0aGVtIHVzaW5n
IHZlbmRvciBVSQogPiBvciBDRkUgYm9vdGxvYWRlci4gQ2hhbmdlIG9mIERUUyBmaWxlcyBwYXRo
cyAoImJyb2FkY29tLyIgcHJlZml4CiA+IGludHJvZHVjdGlvbikgcHJldmVudGVkIHBvc3Qgc2Ny
aXB0IGZyb20gZ2VuZXJhdGluZyB0aGVtLgoKID4gQWRqdXN0IHBvc3QtaW1hZ2Uuc2ggdG8gZGVh
bCB3aXRoIG5ldyBwYXRocy4KCkkgd2FzIGEgYml0IGNvbmZ1c2VkIHdoYXQgdGhpcyB3YXMgYWJv
dXQsIGJ1dCBJIGd1ZXNzIGl0IGlzIGp1c3QgYWJvdXQKdGhlIGFkZGl0aW9uIG9mIHRoZSBicm9h
ZGNvbS8gc3ViZGlyIGluIGtlcm5lbCA2LjUrLiBJJ3ZlIHNsaWdodGx5CnJld29yZGVkIHRoZSBj
b21taXQgZGVzY3JpcHRpb24gYW5kIGFwcGxpZWQsIHRoYW5rcy4KCiA+IFNpZ25lZC1vZmYtYnk6
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KID4gLS0tCiA+ICBib2FyZC9icm9h
ZGNvbS9ub3J0aHN0YXIvcG9zdC1pbWFnZS5zaCB8IDMgKystCiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgogPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYnJv
YWRjb20vbm9ydGhzdGFyL3Bvc3QtaW1hZ2Uuc2ggYi9ib2FyZC9icm9hZGNvbS9ub3J0aHN0YXIv
cG9zdC1pbWFnZS5zaAogPiBpbmRleCBiNjE1MGZjNTM5Li41NTllZDhiZjRiIDEwMDc1NQogPiAt
LS0gYS9ib2FyZC9icm9hZGNvbS9ub3J0aHN0YXIvcG9zdC1pbWFnZS5zaAogPiArKysgYi9ib2Fy
ZC9icm9hZGNvbS9ub3J0aHN0YXIvcG9zdC1pbWFnZS5zaAogPiBAQCAtMjcsOCArMjcsOSBAQCBi
dWlsZF90cngoKSB7CiA+ICAJcm0gLWYgJGltYWdlcy96SW1hZ2UuJGRldmljZS5sem1hCiA+ICB9
CiAKID4gLWRldmljZXM9IiQoc2VkIC1uICdzL15CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNf
TkFNRT0iXChbYS16MC05IFwtXSpcKSIkL1wxL3AnICR7QlIyX0NPTkZJR30pIgogPiArZGV2aWNl
cz0iJChzZWQgLW4gJ3MvXkJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJcKFteIl0q
XCkiJC9cMS9wJyAke0JSMl9DT05GSUd9KSIKID4gIGZvciBkZXZpY2UgaW4gJGRldmljZXM7IGRv
CiA+ICsJZGV2aWNlPSIke2RldmljZSNicm9hZGNvbS99IgogPiAgCWNhc2UgIiRkZXZpY2UiIGlu
CiA+ICAJCSJiY200NzA4LXNtYXJ0cmctc3I0MDBhYyIpCiA+ICAJCQlidWlsZF90cnggIiQxIiAi
JGRldmljZSIKID4gLS0gCgogPiAyLjM1LjMKCiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKID4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
