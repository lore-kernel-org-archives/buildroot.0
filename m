Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6829BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2072C60E6A;
	Wed, 13 Apr 2022 20:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r34FHoLnuxrP; Wed, 13 Apr 2022 20:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A33660E1D;
	Wed, 13 Apr 2022 20:36:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4BA71BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A06F140225
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:36:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tS1d3PtrW5xZ for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:36:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6358840218
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:36:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 16F50200002;
 Wed, 13 Apr 2022 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649882170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piXmFb/S5ep6HToch/H35BKYxeG/FufxgnjByx/e9nM=;
 b=FCR0bqQMWos6nmZtdZeRVoq/Lv5BDxhtHrfV+Guyx9Mfv0+RkFpkpOpdpYCzVb3Y6lW6CP
 ruhUR8x9EpEhzs5drR51S3KiusiSdwi4a/JzaGwqGsF7blBgv+SzDzx2h6Fz9wMe9m7Kyx
 POQN4KWsvZOiB8v4s8gqMFLOTwO7dqMmE3RRs15z1DNVJGbX0hPCMSPltebhvyVUHZTEEW
 VtSos4vbC1Mj4ACxCRVwEZBExPGMepIkgWHvw8H3NhPmnpU8nUSXDYCph9zayE8RDxRdy4
 GYETnl7mHoXoUruE6UKpo5jfq3pgmHjhZJhZaoqX+j8RxUL03v5B34icOSnm0Q==
Date: Wed, 13 Apr 2022 22:36:09 +0200
To: =?UTF-8?B?VGjDqW8=?= Lebrun via buildroot <buildroot@buildroot.org>
Message-ID: <20220413223609.083b51c5@windsurf>
In-Reply-To: <20220411130106.468304-1-theo.lebrun@bootlin.com>
References: <20220411130106.468304-1-theo.lebrun@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wireplumber: make dbus optional
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
Cc: =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxMSBBcHIgMjAyMiAxNTowMTowNiArMDIwMApUaMOpbyBMZWJydW4gdmlhIGJ1aWxk
cm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBU
aMOpbyBMZWJydW4gPHRoZW8ubGVicnVuQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBwYWNrYWdlL3dp
cmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rIHwgNiArKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKSSd2ZSBhcHBsaWVkIHRvIG1hc3RlciwgYnV0
IGFmdGVyIHNpZ25pZmljYW50bHkgZXhwYW5kaW5nIHRoZSBjb21taXQKbG9nLCBhbmQgY2hhbmdp
bmcgdGhlIGNvbW1pdCB0aXRsZS4gSW5kZWVkIHlvdXIgcGF0Y2ggaXMgYSBmaXggZm9yIGEKcmVh
bCBwcm9ibGVtOiB3aXJlcGx1bWJlciB3YXMgZGVwZW5kaW5nIG9uIGRidXMgYXQgdGhlIG1ha2Vm
aWxlIGxldmVsLApidXQgdGhpcyBkZXBlbmRlbmN5IHdhcyBub3QgY2FwdHVyZWQgYXQgdGhlIEtj
b25maWcgbGV2ZWwsIHdoaWNoIGlzCmJhZCwgYW5kIGNhdXNlcyBhIGJ1aWxkIGZhaWx1cmUuCgpU
aGFua3MgZm9yIHlvdXIgZml4IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
