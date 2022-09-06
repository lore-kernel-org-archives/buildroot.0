Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8334C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 08:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CF1C6108C;
	Tue,  6 Sep 2022 08:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CF1C6108C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ek3JFAzaHI76; Tue,  6 Sep 2022 08:40:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95C336108B;
	Tue,  6 Sep 2022 08:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95C336108B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4221BF28F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48E35417B1
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48E35417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pm39K_qg8Fy2 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 08:40:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE101417B6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE101417B6
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 08:40:05 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 878C41C000F;
 Tue,  6 Sep 2022 08:40:01 +0000 (UTC)
Date: Tue, 6 Sep 2022 10:39:59 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220906103959.6a22e057@kmaincent-XPS-13-7390>
In-Reply-To: <20220906082438.GQ1490660@scaer>
References: <20220906081425.854318-1-kory.maincent@bootlin.com>
 <20220906082438.GQ1490660@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662453603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AN01hbDhEwdER1TaqOrYTm9U01onPwFsT53gj2k9x+w=;
 b=dTa5E7pO0v8P3o3HvZ+XRZoQ5WA7UFxcyvwu0WLkEHSsvDXJy7lj90oUlOopwQXha24yg3
 w1aID83V/sEF9l1Ky2FMKtskRFjHvGGVe1WGswTjDXUeAkMWfmUzxmleXfny5mpAtgcVu5
 yiiFEH/estQSA+PbYhlqP61bPa4yHlGALx3qR/e+C5b2NhqievlMmoyoWg+4IhJqcmIpbB
 vEK9rCqAyRQnovdOAiic7RtMSrirMSGM9PLIWXnFQBdiLUWwUBK93xQ2QxKvFupGd/kpev
 +8K7SPoo9N0c7Xw0uuNcaV7egP7aOAy1069p4X79asEc3+eAThhD4Hz/UyD5hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dTa5E7pO
Subject: Re: [Buildroot] [PATCH] package/python-pillow: remove
 host-python-pillow support
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCA2IFNlcCAyMDIyIDEwOjI0OjM4ICswMjAwCiJZYW5uIEUuIE1PUklOIiA8eWFubi5t
b3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgoKPiBLw7ZyeSwgQWxsLAo+IAo+IE9uIDIwMjItMDkt
MDYgMTA6MTQgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNwYWtlIHRodXNseToKPiA+IEZyb206IEtv
cnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gPiAKPiA+IGhvc3QtcHl0
aG9uLXBpbGxvdyB3YXMgbmVlZGVkIHRvIGJ1aWxkIG9wdGVlLW9zIGZyb20gU1RNaWNyb2VsZWNy
b25pY3MKPiA+IGR1cmluZyBpdHMgcmMgdmVyc2lvbnMgYnV0IGlzIGlzIG5vdCBuZWVkZWQgYW55
bW9yZSBpbiB0aGUgcmVsZWFzZS4KPiA+IEl0IGlzIHRoZW4gdXNlbGVzcyB0byBrZWVwIHRoaXMg
c3VwcG9ydC4gIAo+IAo+IEVyciwgZGlkIHlvdSBmb3JnZXQgdG8gcmVtb3ZlIGl0IGZyb20gb3B0
ZWUtb3M/CgpEb2gsIFRoYXQncyB0cnVlIEkgZGlkIGl0IHRvIHF1aWNrbHkuIEkgd2lsbCBmaXgg
dGhhdCB3aXRoIG5ldyBwYXRjaGVzLgpTb3JyeSBmb3IgaXQuCgpSZWdhcmRzLAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
