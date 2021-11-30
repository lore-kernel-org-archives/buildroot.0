Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21969C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 09:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC01681DCB;
	Tue, 30 Nov 2021 09:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1SHCScT84D_F; Tue, 30 Nov 2021 09:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2686081DAB;
	Tue, 30 Nov 2021 09:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AC7C1BF281
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 09:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8947581DAB
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 09:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_uc-TPzVLEq for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 09:21:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A435781D7C
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 09:21:36 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 540821C0006;
 Tue, 30 Nov 2021 09:21:32 +0000 (UTC)
Date: Tue, 30 Nov 2021 10:21:32 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Alexey Lukyanchuk <skif@skif-web.ru>
Message-ID: <20211130102132.1277c684@kmaincent-XPS-13-7390>
In-Reply-To: <ff892e05-06aa-1f08-e534-2a5cd656592b@skif-web.ru>
References: <20200309095540.15448-1-skif@skif-web.ru>
 <20211024084531.GM2400@scaer>
 <ff892e05-06aa-1f08-e534-2a5cd656592b@skif-web.ru>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: add '--memdisk' option to
 grub-makeimage
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleGV5LAoKT24gVGh1LCAyNSBOb3YgMjAyMSAxNTowMToxOSArMDMwMApBbGV4ZXkg
THVreWFuY2h1ayA8c2tpZkBza2lmLXdlYi5ydT4gd3JvdGU6Cgo+IFlhbm4sIEFsbCwKPiAKPiBJ
IGdvdCBzZXJpb3VzIHRyb3VibGUgd2l0aCBhcmNoIGNyZWF0aW9uLsKgIEJ1aWxkcm9vdCBjYW4g
dXNlIG9ubHkgc2ltcGxlIAo+IHRhciB3aXRob3V0IGNvbXByZXNzaW9uLiBTbywgd2UgY2FuIG5v
dCB1c2UgYnVpbGRyb290IGhlbHBlci4gTWF5IGJlIEkgCj4gY2FuIHdyaXRlIHNwZWNpYWwgZnVu
Y3Rpb24gZm8gaXQ/CgpBcmUgeW91IHN1cmUgYWJvdXQgdGhhdD8KVGhlIGhvc3QtdGFyIHBhY2th
Z2Ugc2VlbXMgdG8gYmUgYWJsZSB0byBjb21wcmVzcyBhbiBhcmNoaXZlLiAKCj4gCj4gQW5kIHdo
ZXJlIGRpZCB5b3UgZmluZCAidGFyZnMiIG1vZHVsZT8KClRoaXMgbW9kdWxlIGlzIGJ1aWxkIGxp
a2UgdGhlIG90aGVyIG1vZHVsZSBpbiB0aGUKYnVpbGQtJHR1cGxlL2dydWItY29yZS90YXIubW9k
dWxlCgo+IAo+ICJBbHNvLCB0aGlzIHJlcXVpcmVzIHRoYXQgYm90aCB0aGUgJ21lbWRpc2snIGFu
ZCAndGFyZnMnIG1vZHVsZXMgYmUgYnVpbHQKPiBpbnRvIHRoZSBncnViIGltYWdlLiBNYXliZSB3
ZSBzaG91bGQgdmFsaWRhdGUgdGhhdCB0aGV5IGFyZSBpbiB0aGUgbGlzdD8KPiBPciB0aGF0IHdl
IHNob3VsZCBqdXN0IGFwcGVuZCB0aGVtIGlmIG5vdD8iCgpNYXliZSBqdXN0IGVkaXQgdGhlIGRl
ZmF1bHQgbGlzdCBvZiBtb2R1bGUgc2VsZWN0ZWQ6CmRlZmF1bHQgIi4uLiBtZW1kaXNrIHRhciIg
aWYgQlIyX1RBUkdFVF9HUlVCMl9NRU1ESVNLCgpPciBhcHBlbmQgdGhlc2UgdHdvIG1vZHVsZXMg
dG8gdGhlIGxpc3Qgb2YgaW5zdGFsbGVkIG1vZHVsZXMgd2hlbiB0aGUgTUVNRElTSwpvcHRpb24g
aXMgc2VsZWN0ZWQuCgpSZWdhcmRzLAoKS8O2cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
