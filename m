Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A1DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 07:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3840040886;
	Mon, 14 Mar 2022 07:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6NH0uJ0Y91q; Mon, 14 Mar 2022 07:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39C7A403D0;
	Mon, 14 Mar 2022 07:48:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 336541BF28C
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 07:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22D90403D0
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 07:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAghCasX3rKG for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 07:48:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83D0740345
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 07:48:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 1BE73C959B
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 07:40:16 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68B84C0007;
 Mon, 14 Mar 2022 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647243610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZF3kt959bwGozSz7q2eE7SSK4Gdta0bTPGb/ZNvD3/Q=;
 b=R/ae/XqyxnxKhTZ19jy9UjnOYqFgRxQZd3G2pOdeyCcZ58vSrn8FYoYFjEcspfi9YF1PxF
 x8G9SwxbdhvpZt6+/qexGmmumnvlX/tFdbilIe739vbyaC1OHaHVW0irbWLUi1mSKUCMsw
 vCBYstLSdVHrQQlzODYBsQXGobkS9DTcS1XliXBm6d/5Ar0og91Q2/POgjXFXpBLzc01CE
 p73pfpW8S8lMPnN1/qOAfGPJo0NKk7i8L1dzMXh/xpvVGdMg5wyxooB5tVuhelteLMFbfL
 8/EfTae5bqtVKGB18z1usI2fdP+qtsno6w0/gxBtCJvI+WaQAehRV9eK6CIH9A==
Date: Mon, 14 Mar 2022 08:38:47 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220314083847.6149edde@fixe.home>
In-Reply-To: <20220312203627.GM283544@scaer>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
 <20220312203627.GM283544@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 0/7] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgU2F0LCAxMiBNYXIgMjAyMiAyMTozNjoyNyArMDEwMCwKIllhbm4gRS4gTU9SSU4iIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgoKPiBDbMOpbWVudCwgQWxsLAo+IAo+IE9u
IDIwMjItMDMtMTEgMTM6MzYgKzAxMDAsIENsw6ltZW50IEzDqWdlciB2aWEgYnVpbGRyb290IHNw
YWtlIHRodXNseToKPiA+IE5ld2VyIHZlcnNpb25zIG9mIG9wdGVlLW9zICg+PSAzLjE2LjApIHVz
ZXMgcHl0aG9uLWNyeXB0b2dyYXBoeSBpbnN0ZWFkCj4gPiBvZiBweXRob24tcHljcnlwdG9kb21l
eCB0byBidWlsZC4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIGJ1aWxkCj4gPiBob3N0LXB5
dGhvbi1jcnlwdG9ncmFwaHkgYW5kIHVzZXMgaXQgaW4gb3B0ZWUtb3MgcGFja2FnZSB0byBidWls
ZCB0aGUKPiA+IDMuMTYuMCB2ZXJzaW9uLiBBbHNvIGJ1bXAgb3B0ZWUtY2xpZW50LCBvcHRlZS1i
ZW5jaG1hcmssIG9wdGVlLWV4YW1wbGVzCj4gPiBhbmQgb3B0ZWUtdGVzdCB3aGljaCBuZWVkcyB0
byBiZSBhbGlnbmVkIHdpdGggb3B0ZWUtb3MgdmVyc2lvbi4gIAo+IAo+IEZvbGxvd2luZyB0aGUg
aW1wb3J0YW50IHJldmlldyBmcm9tIFRob21hcyBvbiBwYXRjaCAxLCBJJ3ZlIG1hcmtlZCB0aGlz
Cj4gc2VyaWVzIGFzIGNoYW5nZXMgcmVxdWVzdGVkIGluIFBhdGNod29yay4KPiAKPiBQbGVhc2Us
IGNhbiB5b3UgYWRkIG1lIGluIENjIG9mIHBhdGNoIDEgaW4gYSBmdXR1cmUgcmVzcGluIChJIHRv
byBtYXkKPiBoYXZlIHRvIGRlYWwgd2l0aCBweXRob24tY3J5cHRvZ3JhcGh5IG9uIHRoZSBob3N0
IGluIHNob3J0IG9yZGVyKS4KCk9rLCBJJ2xsIGRvIHNvICEKClRoYW5rcywKCkNsw6ltZW50Cgo+
IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPiA+IC0tLS0KPiA+IENoYW5nZXMgaW4g
djM6Cj4gPiAtIEZpeCBhdXRob3JzaGlwIGZvciBjb21taXRzIHRoYXQgd2VyZSBjb3BpZWQgZnJv
bSBFdGllbm5lIG9uZXMuCj4gPiAtIEZpeCBwYWNrYWdlIFVSTCBmb3Igb3B0ZWUtb3MKPiA+IC0g
QWRkZWQgQWNrZWQtYnkgRXRpZW5uZSBDYXJyaWVyZQo+ID4gCj4gPiBDaGFuZ2VzIGluIHYyOgo+
ID4gLSBCdW1wIG9wdGVlLWNsaWVudCwgb3B0ZWUtYmVuY2htYXJrLCBvcHRlZS1leGFtcGxlcyBh
bmQgb3B0ZWUtdGVzdAo+ID4gCj4gPiBDbMOpbWVudCBMw6lnZXIgKDcpOgo+ID4gICBwYWNrYWdl
L3B5dGhvbi1jcnlwdG9ncmFwaHk6IGVuYWJsZSBob3N0IHBhY2thZ2UKPiA+ICAgYm9vdC9vcHRl
ZS1vczogYWRkIHN1cHBvcnQgdG8gYnVpbGQgd2l0aCBweXRob24tY3J5cHRvZ3JhcGh5Cj4gPiAg
IGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKPiA+ICAgcGFja2FnZS9vcHRl
ZS10ZXN0OiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gPiAgIHBhY2thZ2Uvb3B0ZWUtZXhhbXBs
ZXM6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKPiA+ICAgcGFja2FnZS9vcHRlZS1jbGllbnQ6IGJ1
bXAgdG8gdmVyc2lvbiAzLjE2LjAKPiA+ICAgcGFja2FnZS9vcHRlZS1iZW5jaG1hcms6IGJ1bXAg
dG8gdmVyc2lvbiAzLjE2LjAKPiA+IAo+ID4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKystLQo+ID4gIGJvb3Qvb3B0ZWUt
b3Mvb3B0ZWUtb3MuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQo+ID4gIGJv
b3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysr
KysrLQo+ID4gIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5oYXNoICAg
ICAgIHwgIDQgKystLQo+ID4gIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFy
ay5tayAgICAgICAgIHwgIDIgKy0KPiA+ICBwYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGll
bnQuaGFzaCAgICAgICAgICAgICB8ICA0ICsrLS0KPiA+ICBwYWNrYWdlL29wdGVlLWNsaWVudC9v
cHRlZS1jbGllbnQubWsgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgcGFja2FnZS9vcHRlZS1l
eGFtcGxlcy9vcHRlZS1leGFtcGxlcy5oYXNoICAgICAgICAgfCAgNCArKy0tCj4gPiAgcGFja2Fn
ZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFtcGxlcy5tayAgICAgICAgICAgfCAgMiArLQo+ID4g
IHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhhc2ggICAgICAgICAgICAgICAgIHwgIDQg
KystLQo+ID4gIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lm1rICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPiA+ICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0
b2dyYXBoeS5tayB8ICA3ICsrKysrKysKPiA+ICAxMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QgIAo+IAoKCgot
LSAKQ2zDqW1lbnQgTMOpZ2VyLApFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyIGF0
IEJvb3RsaW4KaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
