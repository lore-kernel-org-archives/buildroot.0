Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 09:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D32780BFB;
	Wed, 19 Jan 2022 09:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1HkFGLsrXut; Wed, 19 Jan 2022 09:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7E0080C0D;
	Wed, 19 Jan 2022 09:05:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5260F1BF956
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 09:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F9FD80C0D
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 09:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CO1K6ImES363 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 09:05:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBC9B80BFB
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 09:05:23 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id A6u2nm1TPiF0aA6u3nhLjI; Wed, 19 Jan 2022 10:05:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642583121; bh=Ui0oTVwhR8JwXeV9NVgYnIv3o04rnRPopwuAoOIvRUM=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=VmyQ8dTi0jfKA1nQlaUkbS8tS+xNVpDW2yrY6FREzxOzVEVOe0gQkq/GhgiNXlb7+
 a85F/akeIKXJAdrFOh5azEWit12xNjKudCqoE4k3vLJP544V9/ZfRRCvQiZ3Arn3/S
 buG2Zoia94ooz1yTXM5R7HRpyp7dmYYuAcQr3X5wX8sX+76ktI+m3KMAZNEXtsMtdk
 1XfAWVnEPDwApL6l+V0rkotPT6tEWfsogziNHkU9yiRAPuyfW0EkgOLcxPJnFAbWlH
 sqtYlrZANePgf/sqz5bkPSPLNAsaEGnyYJvgyPXvlRARUXuVLcQtmo2ri1OyuVWCPp
 Vx53g2Z696qLA==
To: Michael Walle <michael@walle.cc>
References: <CAEyMn7aOFtdpXrmU3bLe03jgkmiVLrYCQvePkbLLv_+5ZOiN4Q@mail.gmail.com>
 <966BF669-674E-4A71-82E3-FF7A2B520659@benettiengineering.com>
 <dd5e7e1636872e562e0a1005d4a8def4@walle.cc>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <98e95df3-0fc6-406a-bbb1-b47d99a75141@benettiengineering.com>
Date: Wed, 19 Jan 2022 10:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <dd5e7e1636872e562e0a1005d4a8def4@walle.cc>
Content-Language: en-US
X-CMAE-Envelope: MS4wfM8ojrMe0YLaIZFWIQRU5mCUhEP9+H8V/+asWvRnXlTDuZHF9rZLDmIHEaWpvbszUsWXf1yZj1MHpMnSVwXiaoHULWX3krr3ZOjsgsjqXKzgGLRWug+S
 nWz4WnpsIhNYcTXENUxnbcyAYF6GhZHdlsEiDaYUxNmmHJrnXG+OkOE5Xn447KO9CB0E3SUix26/6eLf8noeuPWH5wFTnYCw4aIb4wg9yY3mlcAjQKQZDnIL
 +AVtLPjPuqqtRWXY84wuDHADEc0gcAvM1qGP2ww7UPLjS3WsFd+sNkVz9rN0/SzFpSpdoz568AGyICUaeSGYh4fOFs+3nuhU/MqQJCXplS9H4hjd0NNbbT9C
 PNLkx6YDN2NCmXUY+6NpHYxRdsDSK2T8ETUeuA7H22SUMoxQIgebA2xGkPEgPp/VA7K5teEx
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbCwKCk9uIDE5LzAxLzIyIDEwOjAxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IFtw
bGVhc2UgZG9uJ3QgdXNlIGh0bWwgbWFpbHNdCgpJIGtub3csIHNvbWV0aW1lcyBJIHdyaXRlIGZy
b20gbW9iaWxlIGFuZCBJIGNhbid0IHVzZSBwbGFpbi10ZXh0IDotLwoKPiBBbSAyMDIyLTAxLTE4
IDIxOjQwLCBzY2hyaWViIEdpdWxpbyBCZW5ldHRpOgo+IAo+PiBBZnRlciBmb2xsb3dpbmcgdGhl
IGRpc2N1c3Npb24gaW4gSVJDIGJldHdlZW4gWWFubiBhbmQgTWljaGFlbCBJIGFtCj4+IHN1cmUg
dGhhdCB0aGlzIHNldHRpbmcgY2Fubm90IGJlIHVzZWQgZm9yIHRoZSBhYXJjaDY0L2NvcnRleC1B
NTMgQ1BVLgo+PiBUaGUgc2V0dGluZ3MgQlIyX0FSTV9DUFVfSEFTX0ZQVSwgQlIyX0FSTV9DUFVf
SEFTX1ZGUFYyLAo+PiBCUjJfQVJNX0NQVV9IQVNfVkZQVjMsIEJSMl9BUk1fQ1BVX0hBU19WRlBW
NCBhbmQKPj4gQlIyX0FSTV9DUFVfSEFTX0ZQX0FSTVY4IGFyZSBzZXQgaW1wbGljaXRseS4KPj4K
Pj4gWWVzLCBJIHdhcyB3cm9uZyBhbmQgeW91IHBvaW50IHRoYXQgZnB1IHN0cmF0ZWd5IGZhbGxz
IGJhY2sgdG8KPj4gQlIyX0FSTV9GUFVfRlBfQVJNVjggYW5kIGl04oCZcyBvay4KPj4gQnV0IGku
TVg4TU0gc3VwcG9ydHMgTkVPTiB0b28sIHNvIEkgd291bGQgZ28gZm9yIHNldHRpbmcKPj4gQlIy
X0FSTV9GUFVfTkVPTl9GUF9BUk1WOCwKPj4gYmVjYXVzZSBhcyBwb2ludGVkIGhlcmVbMV0gdGhl
IGFybXY4IG5lb24gbm93IHN1cHBvcnRzIElFRUUgNzU0Cj4+IGZsb2F0aW5nIHBvaW50IHN0YW5k
YXJkLgo+Pgo+PiBCVVQgSeKAmXZlIGZvdW5kIHRoYXQgZ2NjWzJdIHBvaW50cyB0aGF0Ogo+PiDi
gJjigJnigJkKPj4KPj4gSWYgdGhlIHNlbGVjdGVkIGZsb2F0aW5nLXBvaW50IGhhcmR3YXJlIGlu
Y2x1ZGVzIHRoZSBORU9OIGV4dGVuc2lvbgo+PiAoZS5nLiAtbWZwdT1uZW9uKSwgbm90ZSB0aGF0
IGZsb2F0aW5nLXBvaW50IG9wZXJhdGlvbnMgYXJlIG5vdAo+PiBnZW5lcmF0ZWQgYnkgR0ND4oCZ
cyBhdXRvLXZlY3Rvcml6YXRpb24gcGFzcyB1bmxlc3MKPj4gLWZ1bnNhZmUtbWF0aC1vcHRpbWl6
YXRpb25zIGlzIGFsc28gc3BlY2lmaWVkLiBUaGlzIGlzIGJlY2F1c2UgTkVPTgo+PiBoYXJkd2Fy
ZSBkb2VzIG5vdCBmdWxseSBpbXBsZW1lbnQgdGhlIElFRUUgNzU0IHN0YW5kYXJkIGZvcgo+PiBm
bG9hdGluZy1wb2ludCBhcml0aG1ldGljIChpbiBwYXJ0aWN1bGFyIGRlbm9ybWFsIHZhbHVlcyBh
cmUgdHJlYXRlZAo+PiBhcyB6ZXJvKSwgc28gdGhlIHVzZSBvZiBORU9OIGluc3RydWN0aW9ucyBt
YXkgbGVhZCB0byBhIGxvc3Mgb2YKPj4gcHJlY2lzaW9uLgo+PiDigJjigJnigJkKPiAKPiBUaGF0
IGlzIGZvciBhYXJjaDMyIG1vZGUuIGFhcmNoNjQgZG9lc24ndCBoYXZlIHRoZSAtbWZwdSBzd2l0
Y2guCj4gSW5zdGVhZCB0aGUgRlBVIHN1cHBvcnQgaXMgZWl0aGVyIGRlcml2ZWQgYXV0b21hdGlj
YWxseSBvcgo+IHRocm91Z2ggbW9kaWZpZXJzIG9mIHRoZSAtbWNwdSBzd2l0Y2guCgpUaGFuayB5
b3UgZm9yIHRoZSBleHBsYW5hdGlvbiwgaW5kZWVkIGFzIHRhbGtlZCBpbiBJUkMgSSd2ZSBmb3Vu
ZCB0aGF0IAp1bmRlciBhcm12OC1hIHRoZXJlIGFyZSBvbmx5IG9wdGlvbnMgZm9yICtzaW1kIG9y
ICtjcnlwdG8uIFRoaXMgZXhwbGFpbnMgCmV2ZXJ5dGhpbmcgdG8gbWUuCgpLaW5kIHJlZ2FyZHMh
Ci0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
