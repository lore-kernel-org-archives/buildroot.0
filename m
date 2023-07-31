Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923D1C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4682F40BD2;
	Mon, 31 Jul 2023 22:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4682F40BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jANGHKXs3pUe; Mon, 31 Jul 2023 22:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B14D40514;
	Mon, 31 Jul 2023 22:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B14D40514
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5FB1BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F0181E09
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F0181E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWzGbKVMGrmZ for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:20:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6BE181762
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6BE181762
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF9461BF203;
 Mon, 31 Jul 2023 22:20:42 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:20:41 +0200
To: Martin =?UTF-8?B?QsO2aA==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230801002041.4649d93d@windsurf>
In-Reply-To: <20230223201511.217372-1-contact@martb.dev>
References: <20230223201511.217372-1-contact@martb.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690842043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4g1IchDpAidjtPdWPLVGRy3ARTlbHO7W/9osqE8oVE=;
 b=JR8wOQzwv9phLch7hkuwZE87h8sstSRiCjPdq4eJrVm657qNSv0Gx+RXmtF/jmxSEaPpNh
 sxOdhyw887SfI/LqIyKw7JvUu6VIheDxRCN+RuygJg3q8QuvlCIPkW+zUFvboKcfiT/mDU
 TvfQgyrb6TNR2v8xTkED+P1zMv0/VEEJGCM8bmr5faDflYeSHr71/B0ifuRNal2kgfs+rX
 X8tt2oESwY9FmrTGDJqJCvW9tqUS3Yt3xyMtIS/h4O3wKB0zV4IE7FkrrUe8uko/nC3DQc
 hHh/SCu4AGibV6rcNcFJ+l9WS7d5IfbQOERgGtdtjzAiHgsPjDHEEJCwhLAaBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JR8wOQzw
Subject: Re: [Buildroot] [PATCH 1/2] package/gnuradio: bump to 3.10.5.1
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Martin =?UTF-8?B?QsO2aA==?= <contact@martb.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKT24gVGh1LCAyMyBGZWIgMjAyMyAyMToxNToxMCArMDEwMApNYXJ0aW4g
QsO2aCB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IFNp
Z25lZC1vZmYtYnk6IE1hcnRpbiBCw7ZoIDxjb250YWN0QG1hcnRiLmRldj4KPiAtLS0KPiAgLi4u
Zy1taXNzaW5nLXZlY3Rvci1pbi1ibG9ja2ludGVybGVhdmVyLnBhdGNoIHwgNDIgLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAuLi5ybGVhdmluZy5oLWFkZC1taXNzaW5nLWNzdGRkZWYtaGVhZGUucGF0
Y2ggfCAzMyAtLS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9nbnVyYWRpby9nbnVyYWRpby5oYXNo
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgcGFja2FnZS9nbnVyYWRpby9nbnVyYWRpby5tayAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDc3IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nbnVyYWRp
by8wMDAxLWJsb2Nrcy1JbmNsdWRpbmctbWlzc2luZy12ZWN0b3ItaW4tYmxvY2tpbnRlcmxlYXZl
ci5wYXRjaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nbnVyYWRpby8wMDAyLWJsb2Nr
cy1ibG9ja2ludGVybGVhdmluZy5oLWFkZC1taXNzaW5nLWNzdGRkZWYtaGVhZGUucGF0Y2gKClRo
YW5rcyBmb3IgeW91ciBjb250cmlidXRpb24uIEhvd2V2ZXIsIGEgbmV3ZXIgdmVyc2lvbiBidW1w
IHdhcwpwcm9wb3NlZCBhbmQgYXBwbGllZCwgc2VlOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMTBmNDBhNmIwYzU4YTEwZjAwZDZhOWI0NGZjNzZh
ZWE3NTZlNjAzNi4KU28gSSd2ZSBtYXJrZWQgdGhpcyBwYXRjaCBhcyBTdXBlcnNlZGVkLgoKQmVz
dCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
