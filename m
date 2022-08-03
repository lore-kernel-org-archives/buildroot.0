Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF667C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E11F403F5;
	Wed,  3 Aug 2022 21:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E11F403F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLdjzcyf8kJO; Wed,  3 Aug 2022 21:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4244037A;
	Wed,  3 Aug 2022 21:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F4244037A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC1D71BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99E47607F9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99E47607F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-_sdjCThFs1 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:51:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3791C60594
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3791C60594
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:51:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19834240003;
 Wed,  3 Aug 2022 21:51:51 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:51:51 +0200
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20220803235151.2a1d840b@windsurf>
In-Reply-To: <20220310121229.18284-1-zajec5@gmail.com>
References: <20220310121229.18284-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659563512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dqv17LJ0lzlzJD0/wipCOvF6craHderrDNCmoKju4c0=;
 b=S63A21GACwhQCFlxDG5MWMlXKBMxxitADY707Y46CIc3BV3hEzjG+P4nZ2OuK2Rf8J0U9Y
 TxA1kRbdrCoUt6rD4vY+n3VUhe5xsc6+6kuc4pgPBlpEvKeIonm/q1BGD4PzXKPW0/4pI2
 3XeTkEma7yBgvO+cBoByZQKzikgmVvSeDhAqy1t64takvnPpXJSvgPG6WSo+7snZDhazt3
 1UBwQQWlyzX7YsvGF2uaf5hjxAiJaTNoVrVuQrOPs6ZKWDc/wEHrl51C/JggVwAcBJtYfT
 QVYI1feJ8gjLHyv7z2q+6eP8IL2jdCvzHzWrdSHgUbm9OW2AvI7zbKPi0vEIsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=S63A21GA
Subject: Re: [Buildroot] [PATCH V2] board/broadcom: add support for
 Northstar platform devices
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMCBNYXIgMjAyMiAxMzoxMjoyOSArMDEwMApSYWZhxYIgTWnFgmVja2kgPHphamVj
NUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Cj4gCj4gQnJvYWRjb20gTm9ydGhzdGFyIGZhbWlseSBvZiBTb0NzIGlzIG1vc3QgY29t
bW9ubHkgdXNlZCBmb3IgaG9tZQo+IHJvdXRlcnMuIEl0J3MgYW4gQVJNIHBsYXRmb3JtIHdpdGgg
Q29ydGV4LUE5IENQVShzKS4KPiAKPiBBbGwga25vd24gTm9ydGhzdGFyIGRldmljZXMgY29tZSB3
aXRoIENGRSBib290bG9hZGVyIHdoaWNoIGFsbW9zdCBhbHdheXMKPiBleHBlY3RzIGEgVFJYIGZp
cm13YXJlIGZvcm1hdCAod2l0aCBleGNlcHRpb24gZm9yIEQtTGluaykuIFNvbWUgdmVuZG9ycwo+
IChsaWtlIEx1eHVsIGFuZCBOZXRnZWFyKSB3cmFwIFRSWCBpbiB0aGVpciBvd24gY29udGFpbmVy
cy4KPiAKPiBUaGlzIGJvYXJkIGNvZGUgcHJvdmlkZXM6Cj4gCj4gMS4gTWluaW1hbCBrZXJuZWwg
d2l0aCBzdXBwb3J0IGZvciBvbi1Tb0MgYmxvY2tzCj4gSXQgZW5hYmxlcyBMaW51eCBkcml2ZXJz
IGZvciBTb0MsIHdhdGNoZG9nLCBFdGhlcm5ldCwgc3dpdGNoLCBVU0IsCj4gUENJZSwgTEVEcyku
Cj4gCj4gMi4gUG9zdCBpbWFnZSBzY3JpcHQgYnVpbGRpbmcgZmlybXdhcmUgaW1hZ2VzCj4gSW4g
dXNlcyBCdWlsZHJvb3QgcGFja2FnZXMgdG9vbHMgKGx6bWFfYWxvbmUsIG90cngsIGx4bGZ3KSB0
byBidWlsZAo+IGJvb3Rsb2FkZXItY29tcGF0aWJsZSBpbWFnZXMgdGhhdCBjYW4gYmUgZmxhc2hl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gLS0tCj4gUHJldmlvdXMgYXR0ZW1wdDoKPiBbUEFUQ0hdIGJvYXJkL2Jyb2FkY29tOiBhZGQg
c3VwcG9ydCBmb3IgTm9ydGhzdGFyIHBsYXRmb3JtIGRldmljZXMKPiBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwODEwMTMxMjM2LjE4MDIy
LTEtemFqZWM1QGdtYWlsLmNvbS8KCkFwcGxpZWQgdG8gbWFzdGVyIGFmdGVyIHJlbmFtaW5nIG5z
IHRvIG5vcnRoc3RhcjoKYm9hcmQvYnJvYWRjb20vbm9ydGhzdGFyLCBjb25maWdzL2Jyb2FkY29t
X25vcnRoc3Rhcl9kZWZjb25maWcuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0
dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
