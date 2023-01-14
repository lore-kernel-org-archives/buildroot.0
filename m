Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8A8C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 14:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A3F821A9;
	Sat, 14 Jan 2023 14:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A3F821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1cluocXnzp2; Sat, 14 Jan 2023 14:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D1D821AF;
	Sat, 14 Jan 2023 14:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D1D821AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0AE1BF316
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 14:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED9CE60B5D
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 14:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED9CE60B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9dw3ZO1GVAR for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 14:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D586076C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3D586076C
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 14:17:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 652F51C0003;
 Sat, 14 Jan 2023 14:17:31 +0000 (UTC)
Date: Sat, 14 Jan 2023 15:17:29 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230114151729.57f75a70@windsurf>
In-Reply-To: <20230114135817.GA2692@scaer>
References: <20221103224539.692322-1-thomas.petazzoni@bootlin.com>
 <20221103224539.692322-2-thomas.petazzoni@bootlin.com>
 <20230114135817.GA2692@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1673705852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7d0N2JMAeYZbrP63mOafsnifxgndxt4EAyvVI9j2/8E=;
 b=Vg6VvujrRGZ5lL0lm/E7bccmK5PDxsrzUIZ/gaGPbs9j371lZHFsRc8pRXifgf7B/IGj4k
 BiYgZNNJqKSeX3A6qqndyxz/5uiV5O3LzQmNwmcxxKZL8SXMmiS4B5mU3CTdqB+Ndl6uLT
 gCOgCRUAXiFYRExvfKgf4TjWMaSUqxoYBbXa8fsOxRw3TRjt1IA7kQbhfbQoJtHC/dLGJs
 J6PAo49XkZqrekyynTeHdY308EpBR+flwgOxrFsZLRgmmQSZ065Gl+WYo+joNEDYQXOlPH
 4n65eZdEQTIka//l0mvwmpbbkfymJ7luQ/mIhelKykY5x7EqVUTHTQ5BjPAyVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Vg6Vvujr
Subject: Re: [Buildroot] [PATCH next 2/2] package/pkg-cargo: move CARGO_HOME
 into DL_DIR
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
Cc: Moritz Bitsch <moritz@h6t.eu>, James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAxNCBKYW4gMjAyMyAxNDo1ODoxNyArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gVW5mb3J0dW5hdGVseSwgdGhpcyBjYXVzZXMg
YnJlYWthZ2Ugd2hlbiB0aGVyZSBhcmUgcGFyYWxsZWwgZG93bmxvYWRzCj4gKHNlZSBiZWxvdyBm
b3IgZXhjZXB0OyBmdWxsIGxvZyBhcyBhdHRhY2htZW50KS4KClRoYW5rcyBmb3IgdGhlIHJlcG9y
dC4KCj4gCj4gU28sIHRoZXJlIGFyZSB0d28gc29sdXRpb25zOgo+IAo+ICAxLiByZXZlcnQgdG8g
YSBwZXItcGFja2FnZSBjYXJnbyBob21lLCBsb3NpbmcgdGhlIGJlbmVmaXQgb2YgYSBzaGFyZWQK
PiAgICAgY2FjaGUsIGJ1dCB0cml2aWFsIHRvIGltcGxlbWVudAo+IAo+ICAyLiBhZGQgbG9ja2lu
ZyBvdXJzZWx2ZXMgaW4gdGhlIHBvc3QtcHJvY2VzcyBzY3JpcHRzLCBzbyB0aGF0IHRoZXJlIGFy
ZQo+ICAgICBuZXZlciB0d28gImNhcmdvIHZlbmRvciIgcnVubmluZyBpbiBwYXJhbGxlbCwgd2hp
Y2ggaXMgc2xpZ2h0bHkgbW9yZQo+ICAgICBpbnZvbHZlZC4KCklzIHRoYXQgcmVhbGx5IHRoYXQg
aW52b2x2ZWQ/Cgo+ICAzLiB0ZWxsIHVwc3RyZWFtIHRoYXQgdGhleSBib3JrZWQgdGhlaXIgbG9j
a2luZz8KCldlIHNob3VsZCBvYnZpb3VzbHkgdGVsbCB0aGVtLgoKPiA+Pj4gZHVzdCAwLjguMSBE
b3dubG9hZGluZyAgCj4gd2dldCAtLXBhc3NpdmUtZnRwIC1uZCAtdCAzIC1PICcvaG9tZS95bW9y
aW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC8uZHVzdC0wLjguMS50YXIuZ3oueWJEZXZa
L291dHB1dCcgJ2h0dHBzOi8vZ2l0aHViLmNvbS9ib290YW5keS9kdXN0L2FyY2hpdmUvdjAuOC4x
L2R1c3QtMC44LjEudGFyLmd6Jwo+IFstLVNOSVAtLV0KPiAyMDIzLTAxLTE0IDE0OjMwOjE1ICgx
LjQyIE1CL3MpIC0g4oCYL2hvbWUveW1vcmluL2Rldi9idWlsZHJvb3QvTy9tYXN0ZXIvYnVpbGQv
LmR1c3QtMC44LjEudGFyLmd6LnliRGV2Wi9vdXRwdXTigJkgc2F2ZWQgWzg5MDIzLzg5MDIzXQo+
IAo+ICAgICBCbG9ja2luZyB3YWl0aW5nIGZvciBmaWxlIGxvY2sgb24gcGFja2FnZSBjYWNoZQo+
ICAgICBCbG9ja2luZyB3YWl0aW5nIGZvciBmaWxlIGxvY2sgb24gcGFja2FnZSBjYWNoZQoKU28g
dGhleSBkbyBoYXZlIGxvY2tpbmcgYnV0IGl0IGRvZXNuJ3Qgd29yaz8KClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
