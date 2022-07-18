Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFC2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 12:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D90B240AED;
	Mon, 18 Jul 2022 12:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90B240AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ab7RjQUE1kZZ; Mon, 18 Jul 2022 12:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E82D440B07;
	Mon, 18 Jul 2022 12:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E82D440B07
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A604E1BF317
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 728EF81379
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 728EF81379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOPa-tX89t4S for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 12:14:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0A98134A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F0A98134A
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 12:14:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1E115240012;
 Mon, 18 Jul 2022 12:14:53 +0000 (UTC)
Date: Mon, 18 Jul 2022 14:14:53 +0200
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>
Message-ID: <20220718141453.23c89337@windsurf>
In-Reply-To: <20220708142150.234611-1-bernd.kuhls@t-online.de>
References: <20220708142150.234611-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658146495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KY6xgXfqFELNC4dmO8v3o7DeNt8x7SqDPrPkM54zPc=;
 b=i1Df46GjyAs2mMEt63wQ5ERNZfTq3V1fgdAIXF6tb1KI5hsCY1znQoND107XmjXWn45tHk
 EVat5K+iMmtogOVT3gDbgBu14xCk/zYpVHmVQhrg1zaYpP5FMUtbCl6ohdBsM7FIcIEQnv
 HTyqc5XTN8DJPeRy04yOK6VaLvc1MPU7S46G2x56vPI1+78ey51GzWKkZAM4hwK55xP/Tb
 MyQZGvm842hy6t5Qkbk0L/waiwiECCaR4BnuPfy1LYvIOIACuVfxcbmrAPNqtO/sCHotiN
 +Fh4cqD6wM5AOKt7tv2rQAFMwL1JV21qGQTjMryPbm2WOV8ZfFCckZjJ6KccOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i1Df46Gj
Subject: Re: [Buildroot] [PATCH 1/1] package/pixman: fix powerpc64le build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZXQncyBhZGQgc29tZSBQb3dlclBDIGZvbGtzIGludG8gdGhlIGxvb3AuIEpvZWws
IEPDqWRyaWMsIGNvdWxkIHlvdQpoYXZlIGEgbG9vayBhdCB0aGUgYmVsb3cgcGF0Y2gsIGFuZCBo
b3cgdG8gaGFuZGxlIFZNWCBzdXBwb3J0IGluIHRoZQpwaXhtYW4gcGFja2FnZT8KCkl0IGZlZWxz
IGEgYml0IHVuZm9ydHVuYXRlIHRvIHVuY29uZGl0aW9uYWxseSBkaXNhYmxlIFZNWCBzdXBwb3J0
Ogp0aGVyZSBpcyBzb21lIGxvZ2ljIGluIHRoZSBwaXhtYW4gY29uZmlndXJlIHNjcmlwdCB0byBk
ZXRlY3QgdGhlCmF2YWlsYWJpbGl0eSBvZiBWTVgsIGJ1dCBhcHBhcmVudGx5IHRoaXMgbG9naWMg
YXNzdW1lcyBpdCB3b3JrcyBvbgpwb3dlcnBjNjRsZSwgZXZlbiB0aG91Z2ggYXQgYnVpbGQgdGlt
ZSBpdCBicmVha3MuCgpDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgYW5kIGdpdmUgdXMgeW91ciBhZHZp
Y2U/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMgUGV0YXp6b25pCgpPbiBGcmksICA4IEp1bCAyMDIy
IDE2OjIxOjUwICswMjAwCkJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4gd3Jv
dGU6Cgo+IERpc2FibGUgdm14IHN1cHBvcnQgdG8gZml4IGJ1aWxkIGVycm9yOgo+IAo+IHBpeG1h
bi12bXguYzoyNjg6NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdMT0FEX1ZFQ1RPUicK
PiAgIDI2OCB8ICAgICBMT0FEX1ZFQ1RPUiAoc3JjKTsKPiAgICAgICB8ICAgICBefn5+fn5+fn5+
fgo+IHBpeG1hbi12bXguYzoyNjg6NTogZXJyb3I6IGNhbm5vdCBjb252ZXJ0IGEgdmFsdWUgb2Yg
dHlwZSAnaW50JyB0bwo+ICB2ZWN0b3IgdHlwZSAnX192ZWN0b3IoNCkgdW5zaWduZWQgaW50JyB3
aGljaCBoYXMgZGlmZmVyZW50IHNpemUKPiAKPiBGaXhlczoKPiBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy9mZGE4ODY3NjhmY2UyNWNjZDliNTJiNjM1ZmY1YjEzZGE3YmEy
ZDBjLwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGlu
ZS5kZT4KPiAtLS0KPiAgcGFja2FnZS9waXhtYW4vcGl4bWFuLm1rIHwgMyArKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKPiBp
bmRleCA2NDMwMmZhNDlhLi4wZjAwYTIwY2Q4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGl4bWFu
L3BpeG1hbi5tawo+ICsrKyBiL3BhY2thZ2UvcGl4bWFuL3BpeG1hbi5tawo+IEBAIC0yMSw3ICsy
MSw4IEBAIFBJWE1BTl9BVVRPUkVDT05GID0gWUVTCj4gICMgZG9uJ3QgYnVpbGQgZ3RrIGJhc2Vk
IGRlbW9zCj4gIFBJWE1BTl9DT05GX09QVFMgPSBcCj4gIAktLWRpc2FibGUtZ3RrIFwKPiAtCS0t
ZGlzYWJsZS1sb29uZ3Nvbi1tbWkKPiArCS0tZGlzYWJsZS1sb29uZ3Nvbi1tbWkgXAo+ICsJLS1k
aXNhYmxlLXZteAo+ICAKPiAgIyBUaGUgQVJNIFNJTUQgY29kZSBmcm9tIHBpeG1hbiByZXF1aXJl
cyBhIHJlY2VudCBlbm91Z2ggQVJNIGNvcmUsIGJ1dAo+ICAjIHRoZXJlIGlzIGEgcnVudGltZSBD
UFUgY2hlY2sgdGhhdCBtYWtlcyBzdXJlIGl0IGRvZXNuJ3QgZ2V0IHVzZWQgaWYKCgoKLS0gClRo
b21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
