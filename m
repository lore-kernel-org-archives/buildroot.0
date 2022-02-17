Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB49C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 688B2401E5;
	Thu, 17 Feb 2022 15:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pR1SLnUYxbil; Thu, 17 Feb 2022 15:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F2CB40175;
	Thu, 17 Feb 2022 15:21:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54F4F1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43BBE81266
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjyfun-sjscw for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:21:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 907EC80B67
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:21:02 +0000 (UTC)
Received: from smtpclient.apple ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPA
 id KiaanHOHeiF0aKiaanrcya; Thu, 17 Feb 2022 16:21:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645111260; bh=bdkmy958Uw1401n99rZZPTolMupFJKks/BX2NV5C/8k=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Q/Dn1iOadioIDOEgDBI+GYDH9Y8x2r2vo8KRtYz4xic5wk0y9jNsSnaXOg5hMP/mm
 NymtSVq8UVs8wgxyerYk1w1/g56g4qU2ccJNgk9jhuxPFXTr/YM/+1QSlHW0IlYZ7C
 Vytd4Ile6vjIVVzGYYN/UwVjVoBK/wgZpcd1ds2FZyI0k44+tt9gggKvcCo1UC5zY+
 DdbWFlLwSIWQ2wn3G6506fQHXw4dqjOR99AYpLYeyrU1bYw2YtBPPpLoAMggw/QUbh
 bPcxrFOKzXb/jDyjVWiex6KovgkU2DUU8GGb9dYIZii8ANkLLxkftKTkVU4cDeEHB5
 dL7rBBzFdy9Lg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 17 Feb 2022 16:20:59 +0100
Message-Id: <2B25121E-F5E4-4E61-BEA4-627E5689E813@benettiengineering.com>
References: <20220217151054.865073-2-marcus.hoffmann@othermo.de>
In-Reply-To: <20220217151054.865073-2-marcus.hoffmann@othermo.de>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfBw8q1ZiOIwWPxLFPhcq2l/uVjvqxBwFXJRNuXOi4s1mLwwQEgwhHTcrwH9VIY09hzYyUTVVNAcs+qs/Pii+utFEKsmwWuu9OsOizDKVnfFppXxedmFX
 8nE8/hcaZROQupEZWorBJH7H6YpfNJLjhqPEutPvuk7H8qGTEwKnjCzzlqY2hA1bU1/48NJJBMz1BqUBl4mF9Uxi79C7btIG1lQ2AMMhtr+ljxvt9so2thfZ
 VgBkgiFPjJKXZ3R23RHVxxg8ycQwSL4SFP7/aLYMh0w=
Subject: Re: [Buildroot] [PATCH 1/2]
 configs/friendlyarm_nanopi_r2s_defconfig: uboot needs openssl
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWFyY3VzLAoKPiBJbCBnaW9ybm8gMTcgZmViIDIwMjIsIGFsbGUgb3JlIDE2OjExLCBNYXJj
dXMgSG9mZm1hbm4gPG1hcmN1cy5ob2ZmbWFubkBvdGhlcm1vLmRlPiBoYSBzY3JpdHRvOgo+IAo+
IO+7v0ZpeGVzIHRoZSBmb2xsb3dpbmcgY29tcGlsZSBlcnJvcjoKPiAKPiBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gaW5jbHVkZS9ib290bS5oOjEwLAo+ICAgICAgICAgICAgICAgICBmcm9tIHRvb2xz
L2ltYWdlLWhvc3QuYzoxMjoKPiBpbmNsdWRlL2ltYWdlLmg6MTE3ODoxMjogZmF0YWwgZXJyb3I6
IG9wZW5zc2wvZXZwLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAxMTc4IHwgIyAgaW5j
bHVkZSA8b3BlbnNzbC9ldnAuaD4KPiAgICAgIHwgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4K
PiBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2Zm
bWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVybW8uZGU+Cj4gLS0tCj4gY29uZmlncy9mcmllbmRs
eWFybV9uYW5vcGlfcjJzX2RlZmNvbmZpZyB8IDEgKwo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2ZyaWVuZGx5YXJtX25hbm9waV9yMnNf
ZGVmY29uZmlnIGIvY29uZmlncy9mcmllbmRseWFybV9uYW5vcGlfcjJzX2RlZmNvbmZpZwo+IGlu
ZGV4IDgxOGM4NDdmNGIuLmNlMjUyYTVkNzYgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9mcmllbmRs
eWFybV9uYW5vcGlfcjJzX2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvZnJpZW5kbHlhcm1fbmFu
b3BpX3Iyc19kZWZjb25maWcKPiBAQCAtMzAsNiArMzAsNyBAQCBCUjJfVEFSR0VUX1VCT09UX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIxLjEwIgo+IEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVG
Q09ORklHPSJuYW5vcGktcjJzLXJrMzMyOCIKPiBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15
Cj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVD15Cj4gK0JSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfT1BFTlNTTD15Cj4gQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMT15Cj4gQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMV9FTEY9eQo+IEJSMl9UQVJHRVRfVUJPT1RfRk9S
TUFUX0NVU1RPTT15CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgaGF2ZSB5b3UgdmVyaWZpZWQg
aXTigJlzIGVub3VnaCBieSBidWlsZGluZyBpdCB1c2luZyB1dGlscy9kb2NrZXItcnVuPwoKQmVz
dCByZWdhcmRzCkdpdWxpbwoKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
