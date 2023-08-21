Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889F1EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 13:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32835409CB;
	Mon, 21 Aug 2023 13:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32835409CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVFS-wdnFm6R; Mon, 21 Aug 2023 13:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B69409B4;
	Mon, 21 Aug 2023 13:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40B69409B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE371BF2F2
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC69E409B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 13:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC69E409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCb4QChKfyYl for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 13:40:22 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACE7440932
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 13:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE7440932
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA5FBE0006;
 Mon, 21 Aug 2023 13:40:19 +0000 (UTC)
Date: Mon, 21 Aug 2023 15:40:18 +0200
To: Clement Ramirez <ramirez.clement3@gmail.com>
Message-ID: <20230821154018.6a19f474@windsurf>
In-Reply-To: <20230817125236.985073-1-ramirez.clement3@gmail.com>
References: <20230817125236.985073-1-ramirez.clement3@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692625220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d0S3ow3JLOMgHj93OP8brQeDQfSjKbHj4gw50Q9mkPk=;
 b=od0gSvpQ7hB+3Qn7sEOjEBzjETWH2nP7zcLfMGi0kA6VpbYdO3kHVkc5bKvPnTWJoQHipn
 DltNX+kxHkQhiE5I4/RavmL6QYDI4MxfiR3DOel7R56VGUHot2DMpHHHTdKrW/9ncb39Nq
 uCGAm8qfdTpkFnyrkpy3WrsUlw0HeOeaGNALXfC/rbW6vPxC3hNYgKYRAk63p6W0Eu1v5Z
 XOk2JOHd/eq/ZU5p3Ph8soC/6AIQMJE34p7bNeXUJuKCvvw8RHNeY/UVBrGu07CkQKjqag
 A3PKgaQQRh3/DWLzHCRaDFSjFHAyd0LKkU2a0wqb+ZBj0svF6SU+s1ol463LAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=od0gSvpQ
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: security bump version to
 2.4.6
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2zDqW1lbnQhCgpPbiBUaHUsIDE3IEF1ZyAyMDIzIDE0OjUyOjM2ICswMjAwCkNsZW1l
bnQgUmFtaXJleiA8cmFtaXJlei5jbGVtZW50M0BnbWFpbC5jb20+IHdyb3RlOgoKPiBGaXhlcyBD
VkUtMjAyMy0zNDI0MSAoc2VlIFswXSBmb3IgZGV0YWlscykKPiAKPiBbMF0gaHR0cHM6Ly9naXRo
dWIuY29tL09wZW5QcmludGluZy9jdXBzL3JlbGVhc2VzL3RhZy92Mi40LjYKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDbGVtZW50IFJhbWlyZXogPHJhbWlyZXouY2xlbWVudDNAZ21haWwuY29tPgo+IC0t
LQo+ICBwYWNrYWdlL2N1cHMvY3Vwcy5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2N1cHMvY3Vwcy5t
ayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyIGFmdGVyIGV4dGVuZGluZyB0aGUgY29tbWl0IGxvZyB0
byBleHBsYWluIHRoYXQKYnVtcGluZyBmcm9tIDIuNC40IHRvIDIuNC42IGlzIE9LIGFzIHRoZXJl
IGFyZSB2ZXJ5IGZldyBjaGFuZ2VzIChhbmQKYWRkaW5nIHRoZSBsaXN0IG9mIGNvbW1pdHMpLiBJ
bmRlZWQgaWYgdGhlcmUgaGFkIGJlZW4gdG9vIG1hbnkgY2hhbmdlcywKYSBiYWNrcG9ydCBvZiB0
aGUgc2VjdXJpdHkgZml4IGNvdWxkIGhhdmUgYmVlbiBwcmVmZXJhYmxlLiBCdXQgaGVyZSwgYQpi
dW1wIGlzIGZpbmUuCgpUaGFua3MgYSBsb3QgZm9yIHRoaXMgY29udHJpYnV0aW9uIQoKVGhvbWFz
Ci0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
