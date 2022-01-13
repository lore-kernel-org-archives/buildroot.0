Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A1FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B3C40196;
	Thu, 13 Jan 2022 20:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcCpA1ldnOV3; Thu, 13 Jan 2022 20:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 498A14011B;
	Thu, 13 Jan 2022 20:40:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54C891BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43627415FB
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EojxWaDxgK3b for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:40:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D162408BE
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:40:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E5A40C000B;
 Thu, 13 Jan 2022 20:40:48 +0000 (UTC)
Date: Thu, 13 Jan 2022 21:40:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220113214048.172176b9@windsurf>
In-Reply-To: <20220110131624.3639727-1-arnout@mind.be>
References: <20220110131624.3639727-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: add checklist of upgrade
 caveats
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
Cc: Norbert Lange <nolange79@gmail.com>,
 =?UTF-8?B?SsOpcsOpbXk=?= ROSEN <jeremy.rosen@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAxMCBKYW4gMjAyMiAxNDoxNjoyNCArMDEwMAoiQXJub3V0IFZhbmRlY2FwcGVsbGUg
KEVzc2Vuc2l1bS9NaW5kKSIgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKCj4gQnVtcGluZyB0aGUg
dmVyc2lvbiBvZiBzeXN0ZW1kIGlzIGEgbGl0dGxlIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0aGUK
PiB1c3VhbCBwYWNrYWdlLCBhbmQgaXQncyBlYXN5IHRvIGZvcmdldCBzb21lIG9mIHRoZSB0aGlu
Z3MgdGhhdCBuZWVkIHRvCj4gYmUgZG9uZSAtIGFuZCB0aGlzIGhhcyBoYXBwZW5lZCBzZXZlcmFs
IHRpbWVzIGluIHRoZSBwYXN0Lgo+IAo+IEFkZCBhIGNoZWNrbGlzdCBvZiB0aGluZ3MgdG8gd29y
cnkgYWJvdXQgd2hlbiB1cGRhdGluZyBzeXN0ZW1kLgo+IAo+IE5vdGUgdGhhdCB0aGVyZSBhcmUg
bWFueSBvdGhlciBjb21wbGljYXRlZCBwYWNrYWdlcyB0aGF0IGFsc28gbmVlZCBhIGxvdAo+IG9m
IGF0dGVudGlvbiB3aGVuIHVwZ3JhZGluZy4gSG93ZXZlciwgc3lzdGVtZCBpcyBhIHJlYWxseSBj
cml0aWNhbAo+IHBhY2thZ2Ugc28gaXQncyBtb3JlIGltcG9ydGFudCB0aGF0IHdlIGdldCB0aGF0
IG9uZSByaWdodCB0aGFuLCBzYXksCj4gdmFsZ3JpbmQuCj4gCj4gQ2M6IE5vcmJlcnQgTGFuZ2Ug
PG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gQ2M6IErDqXLDqW15IFJPU0VOIDxqZXJlbXkucm9zZW5A
c21pbGUuZnI+Cj4gQ2M6IEFkYW0gRHVza2V0dCA8YWR1c2tldHRAZ21haWwuY29tPgo+IENjOiBK
YW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBBcm5vdXQgVmFuZGVjYXBwZWxsZSAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4K
PiAtLS0KPiAgcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgfCAxMiArKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCkFwcGxpZWQgdG8gbWFzdGVyIGFmdGVy
IHRha2luZyBpbnRvIGFjY291bnQgdGhlIGNvbW1lbnRzIGZyb20gQmFydWNoCmFuZCBOb3JiZXJ0
LgoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
