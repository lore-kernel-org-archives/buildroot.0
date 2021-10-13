Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:33:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D723E6113D
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D723E6113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB9860AD8;
	Wed, 13 Oct 2021 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U--4vKVFA4Ni; Wed, 13 Oct 2021 16:33:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7DEE60AD1;
	Wed, 13 Oct 2021 16:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1B971BF35E
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE04401F1
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zS4gpI2w_R1g for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:33:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 699434017B
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:33:34 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EFE6DC0010;
 Wed, 13 Oct 2021 16:33:30 +0000 (UTC)
Date: Wed, 13 Oct 2021 18:33:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211013183330.7374b348@bootlin.com>
In-Reply-To: <20211013162410.520492-1-yann.morin.1998@free.fr>
References: <20211013162410.520492-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/dtbocfg: add missing comment about
 kernel dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgRmFicmljZSwKCk9uIFdlZCwgMTMgT2N0IDIwMjEgMTg6MjQ6MTAgKzAyMDAKIllh
bm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+IENvbW1pdCBi
MDBiOWM4NjVkMjEgKHBhY2thZ2UvZHRib2NmZzogZGVwZW5kcyBvbiBrZXJuZWwpIGZvcmdvdCB0
byBhZGQgYQo+IGNvbW1lbnQgd2hlbiB0aGUga2VybmVsIGlzIG5vdCBlbmFibGVkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IENj
OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiBDYzogSGVy
dmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvZHRi
b2NmZy9Db25maWcuaW4gfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHRib2NmZy9Db25maWcuaW4gYi9wYWNrYWdlL2R0
Ym9jZmcvQ29uZmlnLmluCj4gaW5kZXggODYyZGMwY2NjNS4uMmIyYTg1MzhhMyAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2R0Ym9jZmcvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9kdGJvY2ZnL0Nv
bmZpZy5pbgo+IEBAIC03LDMgKzcsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRFRCT0NGRwo+ICAJ
ICBhcyBhIHVzZXJzcGFjZSBBUEkgb2YgRGV2aWNlIFRyZWUgT3ZlcmxheS4KPiAgCj4gIAkgIGh0
dHBzOi8vZ2l0aHViLmNvbS9pa3d6bS9kdGJvY2ZnCj4gKwo+ICtjb21tZW50ICJkdGJvY2ZnIG5l
ZWRzIGEga2VybmVsIHRvIGJlIGJ1aWx0Igo+ICsJZGVwZW5kcyBvbiAhQlIyX0xJTlVYX0tFUk5F
TAoKSSB0aGluayB0aGUgcmlnaHQgc2VudGVuY2UgaXMgImR0Ym9jZmcgbmVlZHMgYSBMaW51eCBr
ZXJuZWwgdG8gYmUgYnVpbHQiCihpZSBzL2Ega2VybmVsL2EgTGludXgga2VybmVsLykKCkJlc3Qg
cmVnYXJkcywKCkhlcnZlCgotLSAKSGVydsOpIENvZGluYSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
