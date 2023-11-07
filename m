Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB3AC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 12:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E43841735;
	Tue,  7 Nov 2023 12:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E43841735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5QSm416r3k5; Tue,  7 Nov 2023 12:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC7341736;
	Tue,  7 Nov 2023 12:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EC7341736
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5231BF574
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 12:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87BD41736
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 12:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87BD41736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUn7-5o7ppPN for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 12:23:07 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31D8A41735
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 12:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31D8A41735
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 45F1E5C243C;
 Tue,  7 Nov 2023 13:23:03 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 13:23:03 +0100
From: Stefan Agner <stefan@agner.ch>
To: =?UTF-8?Q?Jan_=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
In-Reply-To: <20231107110909.401532-1-sairon@sairon.cz>
References: <20231107110909.401532-1-sairon@sairon.cz>
Message-ID: <7de12a5434c759ebfc9770fd9affea29@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1699359783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAJRTY3OSBY3iNt736jmDbA/AurvAosUFqX2R9EEn0I=;
 b=RtxaDsI6Rj3rP++jQel2UKHXWDjFq6MV1QnvXFrYUO7u6PWH3a/KonVWKarEQVip0flSu6
 fp/XB0tQH5R1RyKj39EcmSlFIrkfzgOMMc1AMeRrbMZncy89qmGzjr6BzWHYt2I9en4Fv8
 Ro5JEwH8q+RxRLhX6CPsssgR0B/rnVo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=RtxaDsI6
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add RTL8851/RTL8852
 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAyMy0xMS0wNyAxMjowOSwgSmFuIMSMZXJtw6FrIHdyb3RlOgo+IEFkZCBmaXJtd2FyZSBm
aWxlcyBmb3IgUlRMODg1MSBhbmQgUlRMODg1MiBjYXJkcyB1c2VkIGJ5IHRoZSBydGxidCBkcml2
ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6Pgo+
IC0tLQo+ICBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rIHwgNiArKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4g
Yi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJlLm1rCj4gaW5kZXggYzJjZjBm
ZWMxOS4uNmQ3ZTI5NDYxMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xp
bnV4LWZpcm13YXJlLm1rCj4gKysrIGIvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJt
d2FyZS5tawo+IEBAIC05MCw3ICs5MCwxMSBAQCBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBcCj4g
IAlydGxfYnQvcnRsODgyMWNfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMWNfZncuYmluIFwKPiAg
CXJ0bF9idC9ydGw4ODIyYl9jb25maWcuYmluIHJ0bF9idC9ydGw4ODIyYl9mdy5iaW4gXAo+ICAJ
cnRsX2J0L3J0bDg4MjJjc19jb25maWcuYmluIHJ0bF9idC9ydGw4ODIyY3NfZncuYmluIFwKPiAt
CXJ0bF9idC9ydGw4ODIyY3VfY29uZmlnLmJpbiBydGxfYnQvcnRsODgyMmN1X2Z3LmJpbgo+ICsJ
cnRsX2J0L3J0bDg4MjJjdV9jb25maWcuYmluIHJ0bF9idC9ydGw4ODIyY3VfZncuYmluIFwKPiAr
CXJ0bF9idC9ydGw4ODUxYnVfZncuYmluIHJ0bF9idC9ydGw4ODUxYnVfY29uZmlnLmJpbiBcCj4g
KwlydGxfYnQvcnRsODg1MmF1X2Z3LmJpbiBydGxfYnQvcnRsODg1MmF1X2NvbmZpZy5iaW4gXAo+
ICsJcnRsX2J0L3J0bDg4NTJidV9mdy5iaW4gcnRsX2J0L3J0bDg4NTJidV9jb25maWcuYmluIFwK
PiArCXJ0bF9idC9ydGw4ODUyY3VfZncuYmluIHJ0bF9idC9ydGw4ODUyY3VfY29uZmlnLmJpbgoK
VGhlcmUgaXMgYWxzbyBydGw4ODUyY3VfZndfdjIuYmluIGluIG5ld2VyIGxpbnV4LWZpcm13YXJl
IHJlbGVhc2VzCihCdWlsZHJvb3QgbWFzdGVyIHVzZXMgdGhlIGxhdGVzdCB0YWcgMjAyMzEwMzAp
LiBTbyB3aGlsZSBhdCBpdCwgd2UKY291bGQgYWRkIHRoaXMgZmlybXdhcmUgYXMgd2VsbC4KClNl
ZSBhbHNvOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9m
aXJtd2FyZS9saW51eC1maXJtd2FyZS5naXQvY29tbWl0L3J0bF9idC9ydGw4ODUyY3VfZndfdjIu
YmluP2lkPTQyZDMxZjhmNmVkNjRmNTUwOGYxMGQwOTQ1MWY2MGQ1MjQxMDdlZTAKCi0tClN0ZWZh
bgoKPiAgTElOVVhfRklSTVdBUkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5ydGx3aWZp
X2Zpcm13YXJlLnR4dAo+ICBlbmRpZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
