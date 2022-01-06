Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E96AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 08:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF8F54091A;
	Thu,  6 Jan 2022 08:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-005R7WX_4D; Thu,  6 Jan 2022 08:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0394840242;
	Thu,  6 Jan 2022 08:41:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21E351BF422
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F4E40242
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 08:41:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cjih0yHhVTPk for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 08:41:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC96140139
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 08:41:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 894E624000C;
 Thu,  6 Jan 2022 08:41:00 +0000 (UTC)
Date: Thu, 6 Jan 2022 09:40:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20220106094059.750a7141@windsurf>
In-Reply-To: <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/7] package/aexpect: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zw6ksCgpPbiBGcmksIDEwIERlYyAyMDIxIDE2OjEyOjA3ICswMjAwCkpvc8OpIFBl
a2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiB3cm90ZToKCj4gQWRkIHBhY2th
Z2UgdG8gYXZvY2FkbyBmcmFtZXdvcmsncyBhZXhwZWN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpv
c8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+IC0tLQo+ICBERVZF
TE9QRVJTICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAg
ICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2FleHBlY3QvQ29uZmlnLmluICAgIHwgMTIgKysrKysr
KysrKysrCj4gIHBhY2thZ2UvYWV4cGVjdC9hZXhwZWN0Lmhhc2ggfCAgNCArKysrCj4gIHBhY2th
Z2UvYWV4cGVjdC9hZXhwZWN0Lm1rICAgfCAxMyArKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hh
bmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hZXhw
ZWN0L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hZXhwZWN0L2FleHBl
Y3QuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hZXhwZWN0L2FleHBlY3QubWsK
ClNvIEkgaGF2ZSAiYXBwbGllZCIsIGJ1dCBJIHB1dCB0aGlzIGJldHdlZW4gcXVvdGVzIGJlY2F1
c2UgSSd2ZQpiYXNpY2FsbHkgcmVkb25lIGl0IGVudGlyZWx5LiBGaXJzdCBJJ3ZlIG5hbWVkIHRo
ZSBwYWNrYWdlCnB5dGhvbi1hZXhwZWN0IGJlY2F1c2UgcmVhbGx5IGFleHBlY3QgaXMgcHJpbWFy
aWx5IGEgUHl0aG9uIG1vZHVsZS4KSSd2ZSB1c2VkIHNjYW5weXBpIHRvIGdlbmVyYXRlIHRoZSBw
YWNrYWdlLiBBbHNvIGFkZGVkIGEgdGVzdCBjYXNlIGZvcgppdCwgbm90aWNlZCB0aGF0IHRoZSBw
YWNrYWdlIGRvZXNuJ3Qgd29yayB3aXRoIFB5dGhvbiAyIChzeW50YXggZXJyb3IKd2hlbiBieXRl
LWNvbXBpbGluZyksIHNvIEkgbWFkZSBpdCBQeXRob24gMyBvbmx5LgoKU2VlIHRoZSBmaW5hbCBj
b21taXQ6CgogIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290L2NvbW1pdC8/aWQ9
NjNiNzJhN2MxNWJjZDU2ZmUxNTcwZTNmN2VjZDQzOTkzYzBmZGU5MAoKQmVzdCByZWdhcmRzLAoK
VGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
