Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B030EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB4060ABE;
	Sat,  1 Jul 2023 14:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBB4060ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXkWeGGzoQ3y; Sat,  1 Jul 2023 14:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1153C60806;
	Sat,  1 Jul 2023 14:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1153C60806
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAF081BF349
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF39F416AB
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF39F416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glHsaI2pZANF for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:19:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CCCD415D3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CCCD415D3
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:19:02 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30BF9FF805;
 Sat,  1 Jul 2023 14:18:59 +0000 (UTC)
Date: Sat, 1 Jul 2023 16:18:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230701161858.453d600a@windsurf>
In-Reply-To: <20230628061632.32715-1-bernd@kuhls.net>
References: <20230628061632.32715-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688221139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGG1RFxB4huzz4QhDCOHv9ZQvpExC1JvSy9who6E+Pc=;
 b=eZbEIvsTbswNUJtPT/bj+ioUfOgJw7aE46vsBsKueCytyU4y+GevWoZSRl0qgI8tYBjcmN
 AXBLqLjEBap/tluUizW4vs6lF0EPEv+WkbSUdvATxIaa6JPbdgCgIr9Q5Uglru6AV+87i0
 E7Rvz1LiFhpSj0a0iMCQipejN44/hyrI0NmKpqppZ6Fh0u2KryGM0ISS9GgCaGs0FjPRcO
 nH/s9+n04HFgr7pgBXKhS7ZIEps+fbdPuR24Csp1sRwpgM/Mjg3BqwZWEQaaJdoR8JbtzY
 NLoSMETB/gHmv9b6NyF/l7im29tOdVYYCYCYxARzl3CP6dR2mp1sT9Snk1gQeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eZbEIvsT
Subject: Re: [Buildroot] [PATCH 1/1] package/flac: bump version to 1.4.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyOCBKdW4gMjAyMyAwODoxNjozMiArMDIwMApCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKCj4gQ2hhbmdlbG9nOiBodHRwczovL3hpcGgub3JnL2ZsYWMvY2hhbmdl
bG9nLmh0bWwKPiAKPiBVcGRhdGVkIGxpY2Vuc2UgaGFzaCBkdWUgdG8gY29weXJpZ2h0IHllYXIg
YnVtcDoKPiBodHRwczovL2dpdGh1Yi5jb20veGlwaC9mbGFjL2NvbW1pdC9lMDBkOWI4ODFmM2Zi
OGExODE2OTlhZGE5NjZlOTA5YWI2ZDY4OWMwCj4gCj4gUmVtb3ZlZCBhbGwgUG93ZXJQQy1yZWxh
dGVkIGNvbmZpZ3VyZSBvcHRpb25zLCBxdW90aW5nIGNoYW5nZWxvZzoKPiAiQWxsIFBvd2VyUEMt
c3BlY2lmaWMgY29kZSBoYXMgYmVlbiByZW1vdmVkLCBhcyBpdCB0dXJuZWQgb3V0IHRob3NlCj4g
IGltcHJvdmVtZW50cyBkaWRu4oCZdCBhY3R1YWxseSBpbXByb3ZlIGFueXRoaW5nIgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4gIHBhY2th
Z2UvZmxhYy9mbGFjLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9mbGFjL2ZsYWMubWsgICB8IDQg
Ky0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
