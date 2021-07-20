Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA89C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:43:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6309B610CC
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6309B610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB87826FB;
	Tue, 20 Jul 2021 21:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOP4L1EmIZX5; Tue, 20 Jul 2021 21:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 889A5826A8;
	Tue, 20 Jul 2021 21:43:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 806171BF9BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B73040309
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQYhWqgOPAuH for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:41:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD0440273
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:41:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8FFE4240004;
 Tue, 20 Jul 2021 21:41:01 +0000 (UTC)
Date: Tue, 20 Jul 2021 23:40:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <20210720234059.4dac4c16@windsurf>
In-Reply-To: <20210630234717.21742-4-raphael.melotte@mind.be>
References: <20210630234717.21742-1-raphael.melotte@mind.be>
 <20210630234717.21742-4-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] package/python-pymupdf: bump to version
 1.18.14
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720214059.XHiF056HqBthMLR2NDsjiiKfr-6zx4C4uY-Qn1mbu-E@z>

T24gVGh1LCAgMSBKdWwgMjAyMSAwMTo0NzoxNiArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSA8cmFw
aGFlbC5tZWxvdHRlQG1pbmQuYmU+IHdyb3RlOgoKPiBSZWNlbnQgdGFyYmFsbHMgZnJvbSBQeVBJ
IHVzZSBzZXR1cHRvb2xzIGluc3RlYWQgb2YgZGlzdHV0aWxzLCBzbwo+IGNoYW5nZSBgUFlUSE9O
X1BZTVVQREZfU0VUVVBfVFlQRWAuCj4gCj4gVGhleSBhbHNvIGluY2x1ZGUgYSBsaWNlbnNlIGZp
bGUsIHNvIGluY2x1ZGUgaXQgYW5kIGEgaGFzaCBmb3IgaXQuCj4gCj4gVGhpcyB2ZXJzaW9uIGFs
c28gaGFzIGEgbmV3IGRlcGVuZGVuY3k6IGZyZWV0eXBlMi4KPiAKPiBQWVRIT05fUFlNVVBERl9S
RU1PVkVfUEFUSFMgaXMgdXBkYXRlZCB0byB0YWtlIHRoZSBuZXcgZGVwZW5kZW5jeSBpbnRvCj4g
YWNjb3VudCwgYnV0IGFsc28gdGhlIHNlZCBjb21tYW5kIGFyZSBjaGFuZ2VkIHRvIGRlbGV0ZSBp
bmNsdWRlIGxpbmVzCj4gaW5zdGVhZCBvZiB0dXJuaW5nIHRoZW0gaW50byBlbXB0eSBzdHJpbmdz
LiBJbmRlZWQsIGVtcHR5IGluY2x1ZGUKPiBzdHJpbmdzIGxlYWQgdG8gdXNpbmcgbXVsdGlwbGUg
YC1JYCBmbGFncyB3aGljaCB3ZXJlIG5vdCBmb2xsb3dlZCBieQo+IGFueXRoaW5nLiBEZXBlbmRp
bmcgb24gdGhlIG51bWJlciBvZiBlbXB0eSBpbmNsdWRlIHN0cmluZ3MgKGJlY2F1c2UKPiB0d28g
c3VjY2Vzc2l2ZSBgLUlgICJjYW5jZWwiIGVhY2ggb3RoZXIgb3V0KSwgaXQgd291bGQgaGF2ZSBm
YWlsZWQgdG8KPiBjb21waWxlLgo+IAo+IEFsc28sIGl0IHR1cm5zIG91dCB0aGUgcGF0Y2ggdmVy
c2lvbiBvZiBweXRob24tcHltdXBkZiBkb2Vzbid0IGhhdmUgdG8KPiBtYXRjaCBtdXBkZidzIHZl
cnNpb24gKGUuZy4gcHl0aG9uLXB5bXVwZGYgMS4xOC4xNCBpcyBjb21wYXRpYmxlIHdpdGgKPiBt
dXBkZiAxLjE4LiopIHNvIHdoaWxlIGF0IGl0LCByZW1vdmUgdGhlIHdvcmQgImV4YWN0bHkiIGZy
b20gdGhlCj4gY29tbWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8
cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4gLS0tCj4gIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYv
Q29uZmlnLmluICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9weXRob24tcHltdXBkZi9weXRo
b24tcHltdXBkZi5oYXNoIHwgIDYgKysrKy0tCj4gIHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0
aG9uLXB5bXVwZGYubWsgICB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
