Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39901C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26DC6113E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A26DC6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F52608ED;
	Mon, 18 Oct 2021 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRsI-ojEtbuu; Mon, 18 Oct 2021 21:40:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A946078F;
	Mon, 18 Oct 2021 21:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 397551BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D6C404C4
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHsbx--pgXpI for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:40:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD545404C1
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:40:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A1B39240003;
 Mon, 18 Oct 2021 21:40:38 +0000 (UTC)
Date: Mon, 18 Oct 2021 23:40:37 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211018234037.3e1ec4cc@windsurf>
In-Reply-To: <41CC9CB4-4706-4071-B3A4-3268638ADFC8@benettiengineering.com>
References: <20211018214535.5743fd67@windsurf>
 <41CC9CB4-4706-4071-B3A4-3268638ADFC8@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino: fix mali
 not working because Linux version >= 4.20
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxOCBPY3QgMjAyMSAyMTo1OTo0MSArMDIwMApHaXVsaW8gQmVuZXR0aSA8Z2l1bGlv
LmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+IFRoZXkgaW5zdGVhZCBl
bmFibGUgc3BlY2lmaWNhbGx5IHN1bnhpLW1hbGktbWFpbmxpbmUqIGluIGxpbWUgYW5kCj4gbGlt
ZTIgZGVmY29uZmlncy4gU28gYXQgdGhlIG1vbWVudCBzdW54aS1tYWxpLW1haW5saW5lIGlzIGJ1
aWx0IGJ1dAo+IGl0IGNhbuKAmXQgd29yayBhbmQgaXQgZG9lc27igJl0IG1ha2Ugc2Vuc2UuIEFs
c28gdXAgdG8gTGludXggNC4yMCB0aGlzCj4gbmVpdGhlciB3b3JrZWQgYmVjYXVzZSBvZiBsYWNr
IG9mIGRvdWJsZSBidWZmZXIuIFNvIGJhc2ljYWxseSBoZXJlCj4gc3VueGktbWFsaS1tYWlubGlu
ZSBJ4oCZbSBwcmV0dHkgc3VyZSBuZXZlciB3b3JrZWQuCgpBYWgsIEkgaGFkbid0IHJlYWxpemVk
L3ZlcmlmaWVkIHRoYXQgdGhleSBlbmFibGVkIHN1bnhpLW1hbGktbWFpbmxpbmUqLgpJbiB0aGlz
IGNhc2UsIG9idmlvdXNseSB5b3VyIHBhdGNoIG1ha2VzIHNlbnNlLiBJJ3ZlIHN3aXRjaGVkIGl0
IGJhY2sKdG8gIk5ldyIgaW4gcGF0Y2h3b3JrLgoKVGhhbmtzIGZvciB0aGUgYWRkaXRpb25hbCBl
eHBsYW5hdGlvbiEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENF
TywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
