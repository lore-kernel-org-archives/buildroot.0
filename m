Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65203C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 20:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86334031D;
	Fri, 11 Mar 2022 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZI8YX8ocSsS; Fri, 11 Mar 2022 20:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6FB540179;
	Fri, 11 Mar 2022 20:46:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B33EB1C115D
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A23B5419D5
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 20:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6QVxEvoCWRV for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 20:46:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94529419D1
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 20:46:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4308340002;
 Fri, 11 Mar 2022 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647031576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+kWP0tca2gydVGsZHDLDhcCfMbAtjOjf17pIKC+mI8=;
 b=CATFATx8m7zpS1/48yaXAIjkTMGVHy20eWcBKO8lb939F9bs2VaxHaC7WzJuvRpNGAuNbl
 LnwRpsr5lqe8wBe95h+DWh87hJu/nAc+MPQ4wq3t6o9PpyKgCCIrxb3Z6cubHP4J4EDbrm
 EtpG4k/76JK20S0ZvduvBfV1IL7vtxtpnPvmFSf+rP6BlkygycP64fGCoW7cJSFbyuFzVM
 FSk3cGmY+aSiRnvXxe3B+UinYD7Rw9/U9/s6YfzWmd0elAfdHKkBHCQ/lfLaUEpRS6SMKG
 UuuyCsvFjWHk4FYJovhifJygvd6udGbZDkt3nrj/cjYJ47/QStgivsmT1er5yw==
Date: Fri, 11 Mar 2022 21:46:15 +0100
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220311214615.6f6ab65c@windsurf>
In-Reply-To: <20220311123636.13415-3-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220311123636.13415-3-clement.leger@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/7] boot/optee-os: add support to build
 with python-cryptography
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpPbiBGcmksIDExIE1hciAyMDIyIDEzOjM2OjMxICswMTAwCkNsw6lt
ZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4gd3JvdGU6Cgo+IE5ld2VyIHZl
cnNpb24gb2Ygb3B0ZWUtb3MgKD49IDMuMTYpIHVzZXMgcHl0aG9uLWNyeXB0b2dyYXBoeSBpbnN0
ZWFkIG9mCj4gcHl0aG9uLXB5Y3J5cHRvZG9tZXggaW4gcHl0aG9uIHNjcmlwdHMuIEFkZCBzdXBw
b3J0IHRvIGJ1aWxkIHRoZXNlCj4gbmV3ZXIgdmVyc2lvbnMgYnkgYWRkaW5nIGEgbmV3Cj4gQlIy
X1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZIG9wdGlvbiB3aGljaCB3
aWxsCj4gc2VsZWN0IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSBkZXBlbmRlbmN5IHdoZW4gYnVp
bGRpbmcgb3B0ZWUtb3MuCj4gCj4gQWNrZWQtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUu
Y2FycmllcmVAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmlu
ICAgfCA4ICsrKysrKysrCj4gIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsgfCA3ICsrKysrKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluIGIvYm9vdC9vcHRlZS1vcy9Db25m
aWcuaW4KPiBpbmRleCAwOTc0NTc4NDg0Li5mODQyNmY5YWIyIDEwMDY0NAo+IC0tLSBhL2Jvb3Qv
b3B0ZWUtb3MvQ29uZmlnLmluCj4gKysrIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KPiBAQCAt
NDgsNiArNDgsMTQgQEAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVkVS
U0lPTgo+ICAKPiAgZW5kaWYKPiAgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX05FRURT
X1BZVEhPTl9DUllQVE9HUkFQSFkKPiArCWJvb2wgIm9wdGVlLW9zIG5lZWRzIGhvc3QtcHl0aG9u
LWNyeXB0b2dyYXBoeSB0byBidWlsZCIKCkp1c3Q6CgoJYm9vbCAib3B0ZWUtb3MgbmVlZHMgaG9z
dC1weXRob24tY3J5cHRvZ3JhcGh5IgoKeW91IGFsc28gbmVlZCB0byBhZGQgc29tZSBkZXBlbmRl
bmNpZXMsIGJlY2F1c2UgcnVzdCBpcyBub3Qgc3VwcG9ydGVkCm9uIGFsbCBob3N0IGFyY2hpdGVj
dHVyZXMsIHNvIHlvdSBuZWVkOgoKCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19B
UkNIX1NVUFBPUlRTCgo+IC1PUFRFRV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9z
dC1weXRob24zIGhvc3QtcHl0aG9uLXB5Y3J5cHRvZG9tZXggaG9zdC1weXRob24tcHllbGZ0b29s
cwo+ICtPUFRFRV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1weXRob24zIGhv
c3QtcHl0aG9uLXB5ZWxmdG9vbHMKPiAraWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX05FRURT
X1BZVEhPTl9DUllQVE9HUkFQSFkpLHkpCj4gK09QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBob3N0
LXB5dGhvbi1jcnlwdG9ncmFwaHkKPiArZWxzZQo+ICtPUFRFRV9PU19ERVBFTkRFTkNJRVMgKz0g
aG9zdC1weXRob24tcHljcnlwdG9kb21leAo+ICtlbmRpZgoKU2VtYW50aWNhbGx5IHNwZWFraW5n
LCBpdCdzIGEgYml0IG9kZCB0aGF0IGVuYWJsaW5nCkJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNf
UFlUSE9OX0NSWVBUT0dSQVBIWSBkcm9wcyB0aGUKaG9zdC1weXRob24tcHljcnlwdG9kb21leCBk
ZXBlbmRlbmN5LiBCdXQgSSBndWVzcyB0aGlzIGlzIHdoYXQgbWFrZXMKdGhlIG1vc3Qgc2Vuc2Ug
aW4gdGhhdCBzaXR1YXRpb24uCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
