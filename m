Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D485C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9B161AAA
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF9B161AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B783980DC2;
	Mon, 15 Nov 2021 15:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_u9n38GH8ER; Mon, 15 Nov 2021 15:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29EBA80D92;
	Mon, 15 Nov 2021 15:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0C341BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCFFC605D8
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CvOpVpQd4IPX for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:21:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A33D60594
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:21:49 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ACB1AFF811;
 Mon, 15 Nov 2021 15:21:46 +0000 (UTC)
Date: Mon, 15 Nov 2021 16:21:46 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20211115162146.0d584795@kmaincent-XPS-13-7390>
In-Reply-To: <20211115134703.tou5jvgya5h5tiwe@fedora>
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
 <20211115133000.72041-2-kory.maincent@bootlin.com>
 <20211115134703.tou5jvgya5h5tiwe@fedora>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUXVlbnRpbiBhbmQgVGhvbWFzLAoKT24gTW9uLCAxNSBOb3YgMjAyMSAxNDo0NzowMyAr
MDEwMApRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29t
PiB3cm90ZToKCj4gPiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50
QGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9wc3BsYXNoLy5Db25maWcuaW4uc3dw
IHwgQmluIDAgLT4gMTIyODggYnl0ZXMKPiA+ICBwYWNrYWdlL3BzcGxhc2gvQ29uZmlnLmluICAg
ICAgfCAgMTUgKysrKysrKysrKysrKysrCj4gPiAgcGFja2FnZS9wc3BsYXNoL3BzcGxhc2gubWsg
ICAgIHwgIDEyICsrKysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9u
cygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3BzcGxhc2gvLkNvbmZpZy5pbi5z
d3AKPiA+IEhjbVY/ZDAwMDAxCj4gPiAgIAo+IAo+IEdyZWV0aW5ncyBmZWxsb3cgdmltIHVzZXIg
OikgSSBhc3N1bWUgeW91IGRpZG4ndCB3YW50IHRoaXMgaW4geW91ciBwYXRjaAo+IDopCgp2aW0g
NCBsaWZlICEgOykKT29wcywgc29ycnkgZm9yIHRoaXMgY3JhcC4KCkvDtnJ5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
