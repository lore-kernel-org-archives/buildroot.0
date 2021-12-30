Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FECC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AAFD41515;
	Thu, 30 Dec 2021 14:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0vdXPUbT1QG; Thu, 30 Dec 2021 14:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8058041505;
	Thu, 30 Dec 2021 14:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 892DA1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77FDB81831
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNqYabtkKLzI for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:14:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31356813E9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:14:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 767AF240009;
 Thu, 30 Dec 2021 14:14:29 +0000 (UTC)
Date: Thu, 30 Dec 2021 15:14:28 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20211230151428.1a49b1bf@windsurf>
In-Reply-To: <20200306071440.30433-5-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
 <20200306071440.30433-5-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/7] package/mali-bifrost-driver: new package
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
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWlxdcOobCwKCk9uIEZyaSwgIDYgTWFyIDIwMjAgMDg6MTQ6MzcgKzAxMDAKTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+ICtNQUxJX0JJRlJP
U1RfRFJJVkVSX1ZFUlNJT04gPSB2MC4xCj4gK01BTElfQklGUk9TVF9EUklWRVJfU0lURSA9ICQo
Y2FsbCBnaXRodWIsYm9vdGxpbixtYWxpLWJpZnJvc3QsJChNQUxJX0JJRlJPU1RfRFJJVkVSX1ZF
UlNJT04pKQo+ICtNQUxJX0JJRlJPU1RfRFJJVkVSX0RFUEVOREVOQ0lFUyA9IGxpbnV4Cj4gK01B
TElfQklGUk9TVF9EUklWRVJfTElDRU5TRSA9IEdQTC0yLjAKPiArTUFMSV9CSUZST1NUX0RSSVZF
Ul9MSUNFTlNFX0ZJTEUgPSBMSUNFTlNFCj4gK01BTElfQklGUk9TVF9EUklWRVJfTU9EVUxFX1NV
QkRJUlMgPSByOHAwL2RyaXZlcnMvZ3B1L2FybS9taWRnYXJkCgpUaGVyZSBpcyBzb21ldGhpbmcg
cmVhbGx5IG9kZCBoZXJlOiB3aHkgaXMgdGhpcyBwYWNrYWdlIG5hbWVkCm1hbGktYml0ZnJvc3Qt
ZHJpdmVyIGlmIHRoZSBzdWJkaXJlY3RvcnkgeW91J3JlIGJ1aWxkaW5nIGlzCnI4cDAvZHJpdmVy
cy9ncHUvYXJtL21pZGdhcmQgPyBiaXRmcm9zdCBhbmQgbWlkZ2FyZCBhcmUgdHdvIGRpZmZlcmVu
dApnZW5lcmF0aW9ucyBvZiB0aGUgQVJNIE1hbGkgR1BVLCBhdCBsZWFzdCBhY2NvcmRpbmcgdG8K
aHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvTWFsaV8oR1BVKS4KCkNvdWxkIHlvdSBjbGFy
aWZ5ICh5b3Ugb3Igc29tZWJvZHkgZWxzZSwgZm9yIHRoYXQgbWF0dGVyKSA/CgpUaGFua3MhCgpU
aG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
