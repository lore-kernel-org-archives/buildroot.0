Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22695C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:56:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F2160E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72F2160E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F9660715;
	Sun, 25 Jul 2021 19:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzbDYczTfdJH; Sun, 25 Jul 2021 19:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D1D606CB;
	Sun, 25 Jul 2021 19:56:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C22061BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8FE940212
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-upWgA6JSzs for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:55:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA95440209
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 19:55:56 +0000 (UTC)
Received: from smtpclient.apple ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPA
 id 7kE5mMWJ6GRi47kE6mTquh; Sun, 25 Jul 2021 21:55:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627242954; bh=EuEidjDCCfg1MWT2R+pbCD18FT4EndNrpLeQBpNFtb4=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=TwCUDl6GtKL8PWN87EFimzQXv3Mnrop+jcbO9Ea7Fsflt98cLQmE6WUZRQNc5K621
 SF0jf9Rq1lnnd0R2jM6AjRnVg4kAeILSaqXhZmBCWmSxL+jAgYaK5+HxkkLXxzR4HE
 7SwlgMuaZDMTuBwyUCxsdLzJrdxidSjmonAaoJK4++KAiek1aoPocfy2jT6pAkVq3H
 jVhew5SWxo1dT/R/3/z82ruNDBMHj0qzjsfVGvW++kr1+eyV0vQ7Y/BOLdm8Avmt54
 AQIxT/f7bdsbMeVrZf0cBbU4goZItm4xzYhgMuAurIV/B8V/36pnnXT42gXGoG4e1w
 /AT1rJlk74iAw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 25 Jul 2021 21:55:53 +0200
Message-Id: <9E170EEE-7976-42E3-AD7E-62B4715BAC00@benettiengineering.com>
References: <YP29mbZnR6ENTNsC@pevik>
In-Reply-To: <YP29mbZnR6ENTNsC@pevik>
To: Petr Vorel <petr.vorel@gmail.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4xfEx1eFQvdeTEZcvNerUFrvykJ7StmJJu8+iK6Qdaw7jER6jERI8m6FtU1srdGyQnbpCn7xQZr3th4Y5j8ZTeJyj8zGkPCRxYQ9xbAlKopE6C1zNGferT
 EKOxgvcCKQXa9A50oEjNfJMcOk+bs8aHE/Y/HkHKyXTsta0sYJ2x2UGkHgA+rpiPXG/EcludNkEkYULkhSoHVvsbywa85iY3W/DK4H+SpPNdpkUCjOOBVq6s
 A1e7D9sJ0XbmDMsmEasGNg==
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix time_t on 64-bits
 platforms build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgUGV0ciwKCj4gSWwgZ2lvcm5vIDI1IGx1ZyAyMDIxLCBhbGxlIG9yZSAyMTozOCwgUGV0ciBW
b3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlv
LAo+IAo+PiBQbGVhc2UgZHJvcCB0aGlzIHBhdGNoIHNpbmNlIEnigJltIGdvaW5nIGFub3RoZXIg
dXBzdHJlYW0gcGF0Y2guCj4gWWVwLCBJIGZpcnN0IHNlbnQgbXkgcGF0Y2hlcyB1cHN0cmVhbS4g
SSBzaG91bGQgaGF2ZSBDYyB5b3UsIEknbGwgdHJ5IHRvCj4gcmVtZW1iZXIgZm9yIG5leHQgdGlt
ZS4KCkFoIHRoZXnigJlyZSB5b3VycywgSSBkaWRu4oCZdCBoYXZlIHRvIHRpbWUgdG8gY2hlY2su
Cgo+IAo+IEFsc28gZmVlbCBmcmVlIHRvIGJhY2twb3J0IHRoZW0gdG8gQnVpbGRyb290IGFuZCBw
bGVhc2UgQ2MgbWUgKHNvIHdlIGRvbid0IHNlbnQKPiB0aGUgc2FtZSBwYXRjaCBib3RoKS4KClN1
cmUsIGdvb2QgaWRlYSwgdGhhbmsgeW91LgoKSeKAmW0gZ29pbmcgdG8gYmFja3BvcnQgdGhlbSB0
byBidWlsZHJvb3QgdGhlbi4KCkJlc3QgcmVnYXJkcwpHaXVsaW8gQmVuZXR0aQoKPiAKPiBLaW5k
IHJlZ2FyZHMsCj4gUGV0cgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5l
dAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gu
bmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
