Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBC6C4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6F4540363;
	Wed,  1 Nov 2023 16:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F4540363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4K4n951-qBY8; Wed,  1 Nov 2023 16:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 509EF431B2;
	Wed,  1 Nov 2023 16:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 509EF431B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0E481BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 802BB703AE
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 802BB703AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFR1CYxrB5U7 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:29:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25E2F7039C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25E2F7039C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70CC84000A;
 Wed,  1 Nov 2023 16:29:36 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:29:35 +0100
To: =?UTF-8?B?Q2zDqW1lbnQ=?= Ramirez <ramirez.clement3@gmail.com>
Message-ID: <20231101172935.4daa4d99@windsurf>
In-Reply-To: <CADRKr2oNM2btAby66VOSNCs2bJkheButc7R+5N7kB-Kc7YuWtg@mail.gmail.com>
References: <20231010070558.9791-1-ramirez.clement3@gmail.com>
 <874jiydiiq.fsf@tarshish>
 <CADRKr2ov7vayiQPreXt1Z5mhy848UJxztJ+seMmGk1t36ikRiw@mail.gmail.com>
 <87v8bec0pm.fsf@tarshish>
 <CADRKr2oNM2btAby66VOSNCs2bJkheButc7R+5N7kB-Kc7YuWtg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698856177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClCwojFcNRoN+9vHzQTnkyQwjY+k7/3oTxmk8AyzhAo=;
 b=TlZcpRaYLByVw0GUb4o9mgfwnK1YlJNe7IoZkQgJHyZTJ24F1LWuiIQbjFB4gxuNaIQP7Y
 Cy0WaNj8Z2xVRV1PxQ+TMTKv79AQnoTgBbPdR0R24vl3rhv5CPVApjmkFhdB+ybzZHjeBs
 numbiS1Y/jpEHnSfBtU91w1y85bDe7ns+au6P9UzDjrFxLzP2nKbZGe2OKirLeTnetr/aD
 Rw3jjOkbpFXYa2npH5B4omRxKp7iy2PtBXzZK2n/A+TjK0M31atr3mcLzMqbj5IP3wY3xe
 CzXlKNKVDElC2J/YoyMYFo19xjOoZUwqFSW1mKSLQD8LokxrbWR6/nmLW2S2LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TlZcpRaY
Subject: Re: [Buildroot] [PATCH] package/qemu: security bump version to 8.1.1
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQsCgpBbHdheXMgaGFwcHkgdG8gc2VlIHNvbWUgcGF0Y2hlcyBmcm9tIHlv
dSBvbiBCdWlsZHJvb3QhIDotKQoKT24gVHVlLCAxMCBPY3QgMjAyMyAxMToxNToxMyArMDIwMApD
bMOpbWVudCBSYW1pcmV6IDxyYW1pcmV6LmNsZW1lbnQzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEkg
d2lsbCB0cnkgdG8gZmluZCBhIHdheSB0byBhZGQgYW4gZW50cnkgaW4gdGhlIENQRSBkYXRhYmFz
ZSwgYW5kIGFkZCBhCj4gY29tbWVudCB0byBleHBsYWluIHdoeSB3ZSBhcmUgaWdub3JpbmcgdGhl
c2UgQ1ZFcy4KCkluIHRoZSBlbmQsIGRpZCB5b3Ugc2VuZCBhbiBlLW1haWwgdG8gdGhlIE5WRCBt
YWludGFpbmVycyBhYm91dCB0aGlzPwoKWW91IGFjdHVhbGx5IGRvbid0IG5lZWQgdG8gbG9vayBm
b3IgaG93IHRvIGFkZCBhbiBlbnRyeSBpbiB0aGUgQ1BFCmRhdGFiYXNlLiBKdXN0IGRyb3AgYW4g
ZS1tYWlsIHRvIHRoZSBOVkQgbWFpbnRhaW5lcnMsIGdpdmluZyBmb3IgZWFjaApDVkUgc29tZSBj
bGVhciBldmlkZW5jZSB0aGF0IHRoZXJlIHdlcmUgZml4ZWQgaW4gOC4xLjEsIGFuZCBhc2sgdGhl
bSB0bwp1cGRhdGUgdGhlIENWRSBlbnRyaWVzLiBUaGV5IHdpbGwgYXV0b21hdGljYWxseSB0YWtl
IGNhcmUgb2YgYWRkaW5nIHRoZQpDUEUgZW50cnksIGFuZCB1cGRhdGUgdGhlIENWRSBpbmZvcm1h
dGlvbi4KCkxldCBtZSBrbm93IGlmIHlvdSB3YW50IHNvbWUgaGVscCB0byBhY2hpZXZlIHRoaXMu
CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
