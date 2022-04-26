Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABC7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 22:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 641E583E86;
	Tue, 26 Apr 2022 22:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2OuuwBiUZBZL; Tue, 26 Apr 2022 22:02:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84DA383E96;
	Tue, 26 Apr 2022 22:02:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B50D1BF3A6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3880F418AB
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U0ygm0fcbHEs for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 22:02:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA40041858
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 22:02:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D3B1AC0003;
 Tue, 26 Apr 2022 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651010522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiVH55tDW6RE6+iocuC1JAGaEuVLGl+uqeKuC1QHxZo=;
 b=T3d+azhhyj/ZUeKnpgRKMp2vNd3pRqhhQuMDK4q19AYMoz25Hs+DUbkArQKO5K9dzWg8mA
 t90vQlJKypH1aaCWSysQUJ/yfgmfsMrv0H6/W5cWKLgzDPtPACK4CKlWL3/AfTuHdHhXup
 M0i3ofpTuabQ3i6cQntN5LVItUt8Ek4DFMZt58+ZTXP/WBfHVgoDZyTtpcWfVUuJ+3lzen
 8ZS5GrYX+Dg1gAYb6nD5nAdvNNPHcQj68WNcA65NYrXDKj/0JW2ReODclqDy3jbuURomtw
 Q7zDKdEO9WaD+hXQxWfXpNzvZ1yBB16tMLLxWVgmoH+VDvCI02vAPBnDcD7VoA==
Date: Wed, 27 Apr 2022 00:01:59 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220427000159.58749c28@windsurf>
In-Reply-To: <87bkwn21vp.fsf@tarshish>
References: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
 <87bkwn21vp.fsf@tarshish>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 diffutils
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
Cc: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUdWUsIDI2IEFwciAyMDIyIDIwOjE2OjEyICswMzAwCkJhcnVjaCBTaWFjaCB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEhpIEpvc8Op
LAo+IAo+IE9uIFR1ZSwgQXByIDI2IDIwMjIsIEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyB3cm90
ZToKPiA+IFBhdGNoIHRpdGxlOiBkb2NzL21hbnVhbC9wcmVyZXF1aXNpdGUudHh0OiBhZGQgZGlm
ZnV0aWxzICAKPiAKPiBObyBuZWVkIGZvciB0aGlzIGxpbmUgaW4gdGhlIGNvbW1pdCBsb2cgYm9k
eS4gVGhlIGVtYWlsIHN1YmplY3QgbGluZQo+IGFwcGVhcnMgYXMgaGVhZCBsaW5lIG9mIHRoZSBn
aXQgY29tbWl0IG9uY2UgYXBwbGllZC4KClllcC4KCj4gPiBUaGUgY29tbWFuZCBgY21wYCBpcyB1
c2VkIGJ5IGBwYWNrYWdlL3BrZy1nZW5lcmljLm1rYCBhdCBjb21taXQKPiA+IDg2MjNjYzVkZWI1
LiBUaGlzIGNvbW1hbmQgaXMgcHJvdmlkZWQgYnkgYGRpZmZ1dGlsc2AuICAKPiAKPiBBY3R1YWxs
eSwgd2UgaGF2ZSBob3N0LWRpZmZ1dGlscywgc28gd2UgY2FuIGJ1aWxkIGNtcCBpZiB0aGUgaG9z
dCBkb2VzCj4gbm90IGhhdmUgaXQgaW5zdGFsbGVkLiBBbGwgd2UgbmVlZCBpcyBzdXBwb3J0IGFk
ZGVkIHVuZGVyCj4gc3VwcG9ydC9kZXBlbmRlbmNpZXMvIGxpa2UgYSBmZXcgb3RoZXIgdXRpbGl0
aWVzLgoKWWVzLCBidXQgd2UncmUgbm90IGdvaW5nIHRvIGJ1aWxkIGhvc3QtZGlmZnV0aWxzIGlm
IGNtcCBpcyBtaXNzaW5nLgpJdCdzIG5vdCBkb25lIGluIG91ciBjdXJyZW50IGltcGxlbWVudGF0
aW9uLCBhbmQgSSBkb24ndCB0aGluayB3ZSB3YW50CnRvIGRvIHRoYXQuIFNvIGl0IHNlZW1zIGxp
a2UgZGlmZnV0aWxzIGlzIGluZGVlZCBhIGhhcmQgcmVxdWlyZW1lbnQuCgo+IFdlIGFsc28gZG9u
J3QgbGlzdCBmaW5kdXRpbHMgYXMgcHJlcmVxdWlzaXRlLCBldmVuIHRob3VnaCB3ZSByZWx5Cj4g
aGVhdmlseSBvbiB0aGUgJ2ZpbmQnIHV0aWxpdHkuCgpTbyBwZXJoYXBzIHdlIHNob3VsZCBsaXN0
IGZpbmR1dGlscyBhcyB3ZWxsIGluIG91ciBoYXJkIHJlcXVpcmVtZW50cz8KCkpvc8OpIEx1aXM6
IHByYWN0aWNhbGx5IHNwZWFraW5nLCB3aXRoIHdoaWNoIGRpc3RyaWJ1dGlvbiBoYXZlIHlvdSBi
ZWVuCmFibGUgdG8gZ2V0IGEgc3lzdGVtIHdpdGhvdXQgZGlmZnV0aWxzL2ZpbmR1dGlscyBpbnN0
YWxsZWQgYnkgZGVmYXVsdD8KClRoYW5rcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
