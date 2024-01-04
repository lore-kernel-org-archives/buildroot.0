Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED8AC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 22:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB9B86143C;
	Thu,  4 Jan 2024 22:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB9B86143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v45JH4WXCcAN; Thu,  4 Jan 2024 22:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54CA661419;
	Thu,  4 Jan 2024 22:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54CA661419
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 753D91BF3E8
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40E6D61419
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E6D61419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3dLWpqmSDCR for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 22:37:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 464FE61401
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 22:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 464FE61401
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3203F240002;
 Thu,  4 Jan 2024 22:37:29 +0000 (UTC)
Date: Thu, 4 Jan 2024 23:37:28 +0100
To: =?UTF-8?B?S8O2cnk=?= Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20240104233728.2a705e39@windsurf>
In-Reply-To: <20231121102632.74304-1-kory.maincent@bootlin.com>
References: <20231121102632.74304-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704407849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZWMIW0Ie9+T3lIMAp0MxBHcF1tPNfiUGvu6LepiWNo=;
 b=hvrECQ53L5AS1vI4uEFWe9m2gI2+gmHUFxKsit9Uhr4x/p6DigqjJaAUPnI3E6Sq7K2wkp
 RxR1IzaGDt5sNdJ58eECGa/Z7sLYpOGAF1n6x2qX2T2ly4vnqCIC0gGaI76DcXm+Usv37a
 XZfNLVCeh/DX7syW51X9JyhFkY+ju/h5i+zHQ974BXZkzP2aIvkR3rOiDhFc/jvLkcJDHk
 9sV2FGnp4lipy/FGlOME2ptJyB9DZRR3GUJNtFcq+F9m4LAL+wMsfoQUFhYfOUZ3R8a3oS
 0eCs3o6r/Bg4TObqGFf9BKIKYVPw4xchtITaNsA6kvxuicNeJfWdcQu99GjVlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hvrECQ53
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: bump version to
 6.4.13
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
 Jens Kleintje <scooby22@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMSBOb3YgMjAyMyAxMToyNjozMSArMDEwMApLw7ZyeSBNYWluY2VudCB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEZyb206IEtvcnkgTWFp
bmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gCj4gVXBkYXRlIHRvIHRoZSBsYXRl
c3QgdmVyc2lvbiBvZiB0aGUgZ2NuYW5vLWJpbmFyaWVzIGJsb2JzLCB3aGljaCBhcmUKPiBjb21w
YXRpYmxlIHdpdGggdGhlIGxhc3QgdjYuMS1zdG0zMm1wLXIxIGtlcm5lbCBmcm9tIHRoZQo+IFNU
TWljcm9lbGVjdHJvbmljcyBCU1AuCj4gCj4gVGhlIGxvY2F0aW9uIG9mIHRoZSBkcml2ZXIgaGFz
IGNoYW5nZWQgaXQgaXMgbm93IGluIHRoZQo+IGdjbmFuby1kcml2ZXItc3RtMzJtcCBkaXJlY3Rv
cnkgaW5zdGVhZCBvZiBhbiBhcmNoaXZlLgo+IAo+IFRoZSBWRVJTSU9OIGFuZCBQUkVGSVggdGVt
cG9yYXJ5IHZhcmlhYmxlIGluIHBrZ2NvbmZpZyBmaWxlIGNhbWUgYmFjawo+IHRoZXJlZm9yZSB0
aGUgc2VkIHJlcGxhY2VtZW50IGFsc28gY2FtZSBiYWNrLgo+IAo+IFRoZSBFVUxBIGxpY2Vuc2Ug
ZmlsZSBoYXMgY2hhbmdlZCBkdWUgdG8gY29weXJpZ2h0IHllYXIgdXBkYXRlLCBzbyBpdHMKPiBo
YXNoIGhhcyBjaGFuZ2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnku
bWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvZ2NuYW5vLWJpbmFyaWVzL2dj
bmFuby1iaW5hcmllcy5oYXNoIHwgIDQgKystLQo+ICBwYWNrYWdlL2djbmFuby1iaW5hcmllcy9n
Y25hbm8tYmluYXJpZXMubWsgICB8IDE4ICsrKysrKysrKysrLS0tLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
