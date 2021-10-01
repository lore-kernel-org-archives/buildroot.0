Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BA7C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:40:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2130D61507
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2130D61507
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E76D6614E0;
	Fri,  1 Oct 2021 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1NazocLVVJo; Fri,  1 Oct 2021 14:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E77D614DC;
	Fri,  1 Oct 2021 14:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 060DC1BF424
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E93CD84456
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5YzjGyuYauI for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 14:40:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAC8184452
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 14:40:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B5CE61C0005;
 Fri,  1 Oct 2021 14:40:46 +0000 (UTC)
Date: Fri, 1 Oct 2021 16:40:45 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Tal Lubko <tallubko@yahoo.com>
Message-ID: <20211001164045.74dfe4d1@windsurf>
In-Reply-To: <212347867.858114.1633098903235@mail.yahoo.com>
References: <20211001015433.11176-1-tallubko.ref@yahoo.com>
 <20211001015433.11176-1-tallubko@yahoo.com>
 <212347867.858114.1633098903235@mail.yahoo.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/chipsec: new package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIDEgT2N0IDIwMjEgMTQ6MzU6MDMgKzAwMDAgKFVUQykKVGFsIEx1Ymtv
IDx0YWxsdWJrb0B5YWhvby5jb20+IHdyb3RlOgoKPiBJJ3ZlIHN1Ym1pdHRlZCBhIHBhdGNoIHdo
aWNoIGFkZHMgbmV3IHBhY2thZ2UgLSBjaGlwc2VjLCB3aGljaMKgaXMgYSBmcmFtZXdvcmsgZm9y
IGFuYWx5emluZyB0aGUgc2VjdXJpdHkgb2YgUEMgcGxhdGZvcm1zLgo+IEkgaGF2ZW4ndCBnb3Qg
YSByZXBseSBmb3IgdGhpcyBwYXRjaCBzbyBJJ3ZlIGdvdCBhIGZlZWxpbmcgSSd2ZSBkb25lIHNv
bWV0aGluZyB3cm9uZy5IYXZlIEk/CgpObywgeW91IGhhdmUgbm90LiBZb3UganVzdCBuZWVkIHRv
IGdpdmUgc29tZSB0aW1lIGZvciB0aGUgY29tbXVuaXR5IHRvCnJldmlldyB5b3VyIHBhdGNoLiBU
aGUgY3VycmVudCBiYWNrbG9nIG9mIHBhdGNoZXMgaXMgfjM5MCBwYXRjaGVzIHRvCnJldmlldywg
d2hpY2ggZXhwbGFpbnMgd2h5IG5vdCBhbGwgcGF0Y2hlcyByZWNlaXZlIGltbWVkaWF0ZSBhdHRl
bnRpb24uCgpBcyBsb25nIGFzIHlvdSBjYW4gc2VlIHlvdXIgcGF0Y2ggYXQKaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0LyBpdCBtZWFucyB0aGF0IGl0
Cmhhc24ndCBiZWVuIGZvcmdvdHRlbi4KCkluIGFueSBjYXNlLCB0aGFua3MgYSBsb3QgZm9yIHlv
dXIgY29udHJpYnV0aW9uIQoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6
b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
