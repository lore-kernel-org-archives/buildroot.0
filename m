Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BB8C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2842183FFE;
	Sat, 17 Sep 2022 09:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2842183FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeVoe7fGfDex; Sat, 17 Sep 2022 09:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64EA283F50;
	Sat, 17 Sep 2022 09:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64EA283F50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0BC71BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA0D341A12
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA0D341A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOg2zP9xW1_8 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:07:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1511341A11
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1511341A11
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:07:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D98EA100002;
 Sat, 17 Sep 2022 09:07:17 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:07:15 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "=?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= (Leonid Yuriev)"
 <leo@yuriev.ru>
Message-ID: <20220917110715.741a2b69@windsurf>
In-Reply-To: <20220911201936.2205800-1-leo@yuriev.ru>
References: <20220911201936.2205800-1-leo@yuriev.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663405638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xobJr+xsCQvSpRTtqfqXkdxMqIODFaOcaHkd/p8lCH0=;
 b=eOa3LnNTEFe/SVTt6SbLE/jM8bfFjmdAHQ1V8UMT/DGMMAXduk2BXYK1/xZEUI689hdcwI
 K0McQSSW0L12eBHVmilAK+dKhXZfh7DJFw7EQZl0cXNUy3YVEvYHrp/gi+lWZwK9h5PPhK
 yuvSpTeduX0iMJTsbjtFron5cj/rnM7z0xl+HWu6ApdpbqXJtUx+xjuuXFsFf5B5FcsOzs
 jYaYLQHCoddjn4A+94fpwj91vTDyQXjC0Pr9M0Gu+WB2y73wg84PSBWYXkQsNorSZ08Juy
 j+aprp0Wc5B2/0xe2bP/a53zCEy5EGoKWkeZ/ULdieoMjMgHOJfLNWBaNj4tZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eOa3LnNT
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.11
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTdW4sIDExIFNlcCAyMDIyIDIzOjE5OjM1ICswMzAwCtCb0LXQvtC90LjQtCDQ
rtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4gd3JvdGU6Cgo+IFRoaXMg
aXMgc3RhYmxlIGJ1Z2ZpeCByZWxlYXNlIG9mIGxpYm1kYnguIFNvIGl0IGlzIHJlYXNvbmFibGUg
dG8gYmFja3BvcnQKPiB0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2JyYW5j
aGVzIG9mIEJ1aWxkcm9vdC4KPiAKPiBSZWxlYXNlIG5vdGVzIHNpbmNlIHYwLjExLjg6Cj4gIC0g
Zm9yIHYwLjExLjkgIGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9y
ZWxlYXNlLzQ3NDI2NzFlLWE2OTEtNDVhNS04OGRlLWM2MzQxZjc2MmQwYgo+ICAtIGZvciB2MC4x
MS4xMCBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZS8y
ODg2ZGFlYi1mNTgzLTRjMzAtYmVkZS1iOGU2MDk2NWM4MzQKPiAgLSBmb3IgdjAuMTEuMTEgaHR0
cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L3JlbGVhc2UvN2YxYTAyNmQt
MjhhYS00ZDkyLWExZTAtYTFhNzVlYmUwYjNkCj4gCj4gVGhlIGNvbXBsZXRlIENoYW5nZUxvZzog
aHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2Jsb2I/ZmlsZT1DaGFu
Z2VMb2cubWQKPiAKPiBTaWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVv
bmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+CgpUaGFua3MsIEkndmUgYXBwbGllZCwgYWZ0ZXIg
Y2hhbmdpbmcgb25lIHRoaW5nLgoKPiArc2hhMjU2ICBkMmM4MWRiNzE2YTMzZDAwN2NjNzU3MDJl
Y2YzYzQ1Y2ZiN2MzM2EyMjYxZmJhY2NlZDY5NDUyMDRlY2UxYjY3ICBsaWJtZGJ4LWFtYWxnYW1h
dGVkLTAuMTEuMTEudGFyLnh6Cj4gK3NoYTI1NiAgZDQ5OGYyZWJiZmQ5Njk1MmZiZjdhYzIxYTk2
NWQ0MmY2YTk4MGQxZjRmM2NmN2FlYWU4NTgwZDU0ODU1YjY1MSAgbGlibWRieC1hbWFsZ2FtYXRl
ZC0wLjEyLjEudGFyLnh6Cj4gK3NoYTI1NiAgZTA0ZGIzOTZmMTBhMWM1NTBiMTJhMTgxZjg4OTIw
YThmMmI0ZDYyNGI2YjhmNjc0Mjk0YTQ2MjBiNWNhNzA3OSAgbGlibWRieC1hbWFsZ2FtYXRlZC0w
LjExLjEwLnRhci54ego+ICtzaGEyNTYgIGFhMWQyNmZlN2UxYTQxYjY3YzY2MjYyNzQyZmI5ZmQ4
ZThkOTY4NmEzNDNmMGVmNjkzYTViOTc5YjBlYWRhZDIgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4x
MS45LnRhci54ego+ICBzaGEyNTYgIDA2MDExZjM2MTQ4MWVlN2FkYzIxMTFlNDhiN2IxMjEzODQy
OTRlMGI2YjhmMTBjNzVlNzg4NjYyOTI5N2IyNzkgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMS44
LnRhci54ego+ICBzaGEyNTYgIDNhOWZiNmE0Y2Q5NDFlNjQ2NTk3MjM1NTE4NzE0MzczZmRhMWNh
NmQ0YzVlMjM2NjlhZmU3MGVhODdjMjA5NDAgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMS43LnRh
ci54egoKVGhlcmUgaXMgbm8gbmVlZCB0byBoYXZlIGFsbCB0aG9zZSBoYXNoZXMuIFdlIG9ubHkg
bmVlZCB0aGUgaGFzaCBvZiB0aGUKY3VycmVudGx5IHBhY2thZ2VkIHZlcnNpb24uIFNvIEkgZGlk
IGEgcHJlbGltaW5hcnkgcGF0Y2ggdG8gZHJvcCB0aGUKMC4xMS43IGhhc2ggKHdoaWNoIHNob3Vs
ZCBoYXZlIGJlZW4gZHJvcHBlZCBieSB0aGUgYnVtcCB0byAwLjExLjgpLCBhbmQKdGhlbiBJIGFw
cGxpZWQgeW91ciBwYXRjaCwga2VlcGluZyBvbmx5IG9ubHkgdGhlIDAuMTEuMTEgcGF0Y2guCgpC
ZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBD
RU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJh
aW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
