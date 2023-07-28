Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A727DEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 497D3611C6;
	Fri, 28 Jul 2023 20:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 497D3611C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tr0pvjlk6vDq; Fri, 28 Jul 2023 20:36:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BECD60DF4;
	Fri, 28 Jul 2023 20:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BECD60DF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84B671BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33FE960DF4
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:35:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33FE960DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xLu7JRoEniAk for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:35:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE66560D4D
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE66560D4D
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFC9C60002;
 Fri, 28 Jul 2023 20:35:53 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:35:52 +0200
To: Koen Martens <kmartens@sonologic.se>
Message-ID: <20230728223552.36535b1f@windsurf>
In-Reply-To: <eee5a213-c0d0-c400-227e-fe3df1c941a4@sonologic.se>
References: <eee5a213-c0d0-c400-227e-fe3df1c941a4@sonologic.se>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690576554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMBX+oH5+ZC9FhP6uY/tC4NW8wam118rCGmFNF59Clo=;
 b=Lpq7Q+yJyNDqp36QcrOUPnmb2t5C/A4IyDPXqtbHj5afndxZIIDLg4t5PH7tsxwkekR9YX
 t1DdKNRvA0CLfdD9jZAVNNOa4CnZg0EMuzIsWmR2VE7sHLPmGzrPYJ4/aZHWhMemMk9kTB
 TPHl3JFIaAX8M8HC5odfWDx+Wv7lY5miGROG3Auf4wwQTLYBjtZBkenpKRzGIR3Vz2TniX
 s9Qkg93NopBjPnZuJYwv0n1SDNA0N1RB6TnxLAYdfHC+JOKpIV8DxE20uubb4+tgnxSBBT
 fGxWO6cD2Hfg3gA7QpTwsNsAwulEWxgpNWPlwWXDagiKniWoiKcY3GKvEXeyQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lpq7Q+yJ
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump version to
 0.10.4
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

SGVsbG8gS29lbiwKCk9uIE1vbiwgMjQgSnVsIDIwMjMgMTQ6NDI6MDggKzAyMDAKS29lbiBNYXJ0
ZW5zIDxrbWFydGVuc0Bzb25vbG9naWMuc2U+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBLb2Vu
IE1hcnRlbnMgPGdtY0Bzb25vbG9naWMubmw+Cj4gLS0tCj4gIMKgcGFja2FnZS9jYXBucHJvdG8v
Y2FwbnByb3RvLmhhc2ggfCAyICstCj4gIMKgcGFja2FnZS9jYXBucHJvdG8vY2FwbnByb3RvLm1r
wqDCoCB8IDIgKy0KPiAgwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCllvdXIgcGF0Y2ggd2FzIGxpbmUtd3JhcHBlZCwgc28gaXQgY291bGRuJ3QgYmUg
YXBwbGllZCBhcy1pcy4gQ291bGQgeW91CnRyeSB0byB1c2UgImdpdCBzZW5kLWVtYWlsIiBmb3Ig
eW91ciBuZXh0IHBhdGNoZXM/CgpBcyB0aGUgcGF0Y2ggd2FzIHRyaXZpYWwsIEkgZml4ZWQgdGhp
bmdzIHVwIG1hbnVhbGx5IGFuZCBhcHBsaWVkLCBidXQKaXQgd291bGQgYmUgYW5ub3lpbmcgdG8g
ZG8gb24gYSBtb3JlIGNvbXBsaWNhdGVkIHBhdGNoLgoKVGhhbmtzIGZvciB5b3VyIGNvbnRyaWJ1
dGlvbiEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
