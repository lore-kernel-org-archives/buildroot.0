Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EACBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10590405CA;
	Sun,  5 Dec 2021 11:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EdB3VhjEvzl; Sun,  5 Dec 2021 11:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ECF6405AD;
	Sun,  5 Dec 2021 11:35:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A90861BF27E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99005606B8
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xpzDFbJtEV-m for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:35:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15986605CA
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:35:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9E460200002;
 Sun,  5 Dec 2021 11:35:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtpna-00009w-J4; Sun, 05 Dec 2021 12:35:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211205100942.1324791-1-yann.morin.1998@free.fr>
Date: Sun, 05 Dec 2021 12:35:18 +0100
In-Reply-To: <20211205100942.1324791-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 5 Dec 2021 11:09:42 +0100")
Message-ID: <871r2r9te1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_bios_defconfig: fix image
 generation after grub2 rework
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
Cc: =?utf-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IENvbW1pdCA4MmQxZThjNjI4Y2MgKGJvb3QvZ3J1YjI6IHVzZSBub25lIHBsYXRm
b3JtIHdoZW4gYnVpbGRpbmcgZm9yCiA+IGhvc3QpIGNoYW5nZWQgaG9zdC1ncnViMiB0byBvbmx5
IGluc3RhbGwgdGhlIHRvb2xzLCBub3QgdGhlIGFjdHVhbAogPiBib290bG9hZGVyIG9yIGl0cyBt
b2R1bGVzLCBhcyB0aGV5IGFyZSBvZiBubyB1c2Ugb24gdGhlIGhvc3QuCgogPiBJdCBzbyBoYXBl
bm5lZCB0aGF0LCB3aGVuIG5vdCBpc250cnVjdGVkIHRvIGJ1aWx0IGZvciBhIHNwZWNpZmljCiA+
IHBsYXRmb3JtLCB0aGUgZ3J1YjIgYnVpbGRzeXN0ZW0gd291bGQgZGVmYXVsdCB0byBidWlsZCB0
aGUgbGVnYWN5IGJpb3MKID4gcGxhdGZvcm0gKGF0IGxlYXN0IHdoZW4gdGhlIGJ1aWxkIGhhcHBl
bnMgb24gYW4geDg2IG9yIHg4Nl82NCBob3N0KS4KCiA+IEhvd2V2ZXIsIGJlY2F1c2UgdGhlIGhv
c3QgaXMgbW9yZSBvZnRlbiB0aGFuIG5vdCBhbiB4ODYgb3IgeDg2XzY0LCB3aGVuCiA+IHRoZSB0
YXJnZXQgd2FzIGFsc28gYW4geDY4IG9yIHg4Nl82NCwgdGhlIG1vZHVsZXMgYnVpbHQgZm9yIHRo
ZSBob3N0CiA+IGNvdWxkIGJlIHJlLXVzZWQgZm9yIHRoZSB0YXJnZXQsIGFuZCB0aGlzIGlzIHdo
YXQgd2FzIGRvbmUgZm9yIG91cgogPiBwY194ODZfNjRfYmlvc19kZWZjb25maWcuCgogPiBCdXQg
bm93IHRoYXQgd2UgZXhwbGljaXRseSB0ZWxsIHRoZSBncnViMiBidWlsZHN5c3RlbSB0byBub3Qg
YnVpbGQgYW55CiA+IHBsYXRmb3JtIHdoZW4gd2UgYnVpbGQgaG9zdC1ncnViMiwgd2Ugbm8gbG9u
Z2VyIGhhdmUgYWNjZXNzIHRvIHRoZSBncnViMgogPiBtb2R1bGVzIGZyb20gdGhlIGhvc3QgZGly
ZWN0b3J5LCBhZG4gdGhlIGJ1aWxkIGZhaWxzIHdoZW4gYXNzZW1ibGluZyB0aGUKID4gZmluYWwg
aW1hZ2UuCgogPiBXZSBmaXggdGhhdCBpbiB0d28gd2F5LgoKID4gRmlyc3QsIHdlIGVuc3VyZSB0
aGF0IGluZGl2aWR1YWwgbW9kdWxlcyBmcm9tIHRoZSB0YXJnZXQgZ3J1YjIgZ2V0CiA+IGluc3Rh
bGxlZCBpbiB0YXJnZXQvOyB3ZSBjYW4gb25seSBkbyB0aGF0aWYgdGhlIHRhcmdldCBncnViMiB0
b29scyBhcmUKID4gYWxzbyBpbnN0YWxsZWQsIHNvIHdlIGVuYWJsZSB0aGF0IGluIHRoZSBjb25m
aWd1cmF0aW9uLgoKID4gU2Vjb25kLCB3ZSBmaXggdGhlIHBvc3QtYnVpbGQgc2NyaXB0IHRvIGxv
b2sgaW4gdGFyZ2V0LyByYXRoZXIgdGhhbiBpbgogPiBob3N0Ly4KCiA+IEFsbCB0aGF0LCBqdXN0
IGZvciB0aGUgNTEyLWJ5dGUgYm9vdC5pbWcgYm9vdHN0cmFwLCB3aGljaCBwdWxscyBpbiBhbGwK
ID4gdGhlIG90aGVyIG1vZHVsZXMgKDQuM01pQiksIHRoZSB0b29scyAoOC44TWlCKS4uLiBCdXQg
d2UgYXJlIG5vdCBnb2luZwogPiB0byBjaGVycnktcGljayBpbmRpdmlkdWFsIG1vZHVsZXM7IHRo
aXMgaXMgZXJyb3IgcHJvbmUgYW5kCiA+IHVubWFpbnRhaW5hYmxlLi4uCgogPiBSZXBvcnRlZC1i
eTogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+CiA+IFNpZ25lZC1vZmYtYnk6IFlh
bm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgogPiBDYzogS8O2cnkgTWFpbmNl
bnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
