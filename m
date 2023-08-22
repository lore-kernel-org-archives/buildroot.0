Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE1BEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE0B81F6E;
	Tue, 22 Aug 2023 10:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AE0B81F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pSwiUzD-HROW; Tue, 22 Aug 2023 10:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E96A81A50;
	Tue, 22 Aug 2023 10:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E96A81A50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 298F01BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4989415A6
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4989415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frFdca2puCH4 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:40:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21C0A415D4
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21C0A415D4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78BF1FF808;
 Tue, 22 Aug 2023 10:40:50 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:40:49 +0200
To: =?UTF-8?B?RnJhbsOnb2lz?= Perrad <francois.perrad@gadz.org>
Message-ID: <20230822124049.10bd9b45@windsurf>
In-Reply-To: <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-11-dannenberg@ti.com>
 <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692700851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhWfrRd8UJCvG9JAcY79duCNqyMxnyzj2LeqJcJfqtU=;
 b=b+/eEdwVgXc27KEj/DkZEnb462rnJOGP4+ofSdQiXamlMhludwTautK/ly6UQOaugKUKjL
 NLhZr+c60XKTGocaDu8P6JJGb2bUg5Wyp55IBOe1sza2k+KJyDG5uGMR1t7ndAHdEx6d0u
 +0aPbcZDBxNDTu4Fjfx3pd7vZQKKOM2LvXY85gRvjxsDp8UnWa5N4S6wvINGt4mZCOXPMg
 z73kxrUKNlsGNDi2BiL7YfAXvLtU6RDTbc2MaN35cjxc1L1OA56nJNGaVxb4MyYSlfIUog
 bDCN6WhItbUcjob8CeYbGKMzPdPGbXe8hFIKP4H0YMQzfZSfaH55MolWuuWemA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b+/eEdwV
Subject: Re: [Buildroot] [PATCH v9 10/11] package/ti-rogue-um: new package
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
Cc: Andreas Dannenberg <dannenberg@ti.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyMyBKdW4gMjAyMyAwOTozMDozOSArMDIwMApGcmFuw6dvaXMgUGVycmFkIDxmcmFu
Y29pcy5wZXJyYWRAZ2Fkei5vcmc+IHdyb3RlOgoKPiA+ICsjIHRpLXJvZ3VlLXVtIGlzIGEgZWds
L2dsZXMgcHJvdmlkZXIgb25seSBpZiBsaWJkcm0gaXMgaW5zdGFsbGVkCj4gPiArVElfUk9HVUVf
VU1fREVQRU5ERU5DSUVTID0gbGliZHJtIHdheWxhbmQKPiAKPiB1c2VsZXNzIGJ1aWx0IGRlcGVu
ZGVuY2llcyAobm90aGluZyBpcyBidWlsdCwgYmxvYnMgYXJlIGNvcGllZCksIHJ1bnRpbWUKPiBk
ZXBlbmRlbmNpZXMgaW4gQ29uZmlnLmluIGFyZSBlbm91Z2guCgpJIGhhdmVuJ3QgY2hlY2tlZCBp
biBkZXRhaWwsIGJ1dCB0aGVzZSBtYXkgaW4gZmFjdCBiZSBidWlsZApkZXBlbmRlbmNpZXMsIGFu
ZCBvZnRlbiBhcmUuIElmIHRoZSB0aS1yb2d1ZS11bSBwYWNrYWdlIGNvbnNpc3RzIG9mCmNsb3Nl
ZC1zb3VyY2UgdXNlci1zcGFjZSBsaWJyYXJpZXMgdGhhdCBhcmUgbGlua2VkIGFnYWluc3QgbGli
ZHJtIG9yCmxpYndheWxhbmQsIHRoZW4gbGliZHJtIGFuZCB3YXlsYW5kIGluZGVlZCBuZWVkIHRv
IGJlIGJ1aWxkCmRlcGVuZGVuY2llcyBvZiB0aS1yb2d1ZS11bS4gWW91J3JlIGdvaW5nIHRvIGFz
ayBtZTogYnV0IHdoeSwgaWYKdGktcm9ndWUtdW0gY29tZXMgYXMgcHJlLWNvbXBpbGVkIGJpbmFy
eSBibG9icz8KCkJlY2F1c2UgdGhpbmdzIHRoYXQgYXJlIGdvaW5nIHRvIGxpbmsgYWdhaW5zdCB0
aS1yb2d1ZS11bSB3aWxsIGZhaWwuCgpUeXBpY2FsbHk6CgpxdDUgLT4gbGliZ2xlcyAtPiB0aS1y
b2d1ZS11bQoKV2hlbiBRdDUgd2lsbCBsaW5rIGFnYWluc3QgbGliT3BlbkdMRVMuc28gcHJvdmlk
ZWQgYnkgdGktcm9ndWUtdW0sIGlmCmxpYmRybS5zbyBhbmQgbGlid2F5bGFuZC5zbyBhcmUgbm90
IGF2YWlsYWJsZSwgdGhhdCBsaW5rIHN0YWdlIHdpbGwKZmFpbC4KClNvIGxpYmRybSBhbmQgd2F5
bGFuZCBhcmUgbm90IGp1c3QgcnVudGltZSBkZXBlbmRlbmNpZXMuIFRoZXkgYXJlCmJ1aWxkLXRp
bWUgZGVwZW5kZW5jaWVzLgoKV2UgaGF2ZSB0aGUgc2FtZSBzaXR1YXRpb24gd2l0aCBhIG51bWJl
ciBvZiBvdGhlciBjbG9zZWQtc291cmNlIE9wZW5HTAppbXBsZW1lbnRhdGlvbnMgcGFja2FnZWQg
aW4gQnVpbGRyb290IChsb29rIGF0IGdjbmFuby1iaW5hcmllcyBmb3IKZXhhbXBsZSkuCgpCZXN0
IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
