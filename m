Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A73C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:30:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6402D60E0C
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6402D60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32B7B4043B;
	Sun, 25 Jul 2021 21:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9wcovMqvVyQ; Sun, 25 Jul 2021 21:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C9A040435;
	Sun, 25 Jul 2021 21:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 751EB1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71C59402A0
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJv28rs6MNop for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:29:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76A3F40295
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:29:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DBD39240006;
 Sun, 25 Jul 2021 21:29:40 +0000 (UTC)
Date: Sun, 25 Jul 2021 23:29:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210725232940.139f23f5@windsurf>
In-Reply-To: <20210722212434.20346-1-ps.report@gmx.net>
References: <20210722212434.20346-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/qt5declarative: fix gcc-11
 compile failure
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gVGh1LCAyMiBKdWwgMjAyMSAyMzoyNDozNCArMDIwMApQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IHdyb3RlOgoKPiAtIGFkZCBwYXRjaCBmb3IgcXY0cmVnZXhwX3AgdG8gaW5j
bHVkZSBjKysgbGltaXRzIGluY2x1ZGUgKGluc3RlYWQgb2YgcGxhaW4KPiAgIGMgbGltaXQuaCkK
PiAKPiBGaXhlczoKPiAKPiAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBqc3J1bnRpbWUvcXY0cmVn
ZXhwX3AuaDo2MiwKPiAgICAgICAgICAgICAgICAgICAgZnJvbSBqc3J1bnRpbWUvcXY0cmVnZXhw
LmNwcDo0MDoKPiAgIC4uLzNyZHBhcnR5L21hc20veWFyci9ZYXJyLmg6NDY6NDQ6IGVycm9yOiDi
gJhudW1lcmljX2xpbWl0c+KAmSBpcyBub3QgYSBtZW1iZXIgb2Yg4oCYc3Rk4oCZCj4gICAgICA0
NiB8IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBvZmZzZXROb01hdGNoID0gc3RkOjpudW1lcmljX2xp
bWl0czx1bnNpZ25lZD46Om1heCgpOwo+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPiAgIC4uLzNyZHBhcnR5L21hc20v
eWFyci9ZYXJyLmg6NDY6NTk6IGVycm9yOiBleHBlY3RlZCBwcmltYXJ5LWV4cHJlc3Npb24gYmVm
b3JlIOKAmHVuc2lnbmVk4oCZCj4gICAgICA0NiB8IHN0YXRpYyBjb25zdCB1bnNpZ25lZCBvZmZz
ZXROb01hdGNoID0gc3RkOjpudW1lcmljX2xpbWl0czx1bnNpZ25lZD46Om1heCgpOwo+ICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn4KPiAKPiAtIGFkZCBwYXRjaCBmb3IgcXFtbHByb2ZpbGVyZXZlbnRfcCB0
byBpbmNsdWRlIGMrKyBsaW1pdHMgaW5jbHVkZQo+IAo+IEZpeGVzOgo+IAo+ICAgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIHFxbWxwcm9maWxlcnR5cGVkZXZlbnRfcC5oOjQzLAo+ICAgICAgICAgICAg
ICAgICAgICBmcm9tIHFxbWxwcm9maWxlcnR5cGVkZXZlbnQuY3BwOjQwOgo+ICAgcXFtbHByb2Zp
bGVyZXZlbnRfcC5oOiBJbiBtZW1iZXIgZnVuY3Rpb24g4oCYdm9pZCBRUW1sUHJvZmlsZXJFdmVu
dDo6YXNzaWduTnVtYmVycyhjb25zdCBDb250YWluZXImKeKAmToKPiAgIHFxbWxwcm9maWxlcmV2
ZW50X3AuaDozMTQ6NjU6IGVycm9yOiDigJhudW1lcmljX2xpbWl0c+KAmSBpcyBub3QgYSBtZW1i
ZXIgb2Yg4oCYc3Rk4oCZCj4gICAgIDMxNCB8ICAgICAgICAgICAgICAgICAgICAgc3RhdGljX2Nh
c3Q8cXVpbnQxNj4obnVtYmVycy5zaXplKCkpIDogc3RkOjpudW1lcmljX2xpbWl0czxxdWludDE2
Pjo6bWF4KCk7Cj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+ICAgcXFtbHByb2Zp
bGVyZXZlbnRfcC5oOjMxNDo4NzogZXJyb3I6IGV4cGVjdGVkIHByaW1hcnktZXhwcmVzc2lvbiBi
ZWZvcmUg4oCYPuKAmSB0b2tlbgo+ICAgICAzMTQgfCAgICAgICAgICAgICAgICAgICAgIHN0YXRp
Y19jYXN0PHF1aW50MTY+KG51bWJlcnMuc2l6ZSgpKSA6IHN0ZDo6bnVtZXJpY19saW1pdHM8cXVp
bnQxNj46Om1heCgpOwo+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiAgIHFxbWxwcm9maWxlcmV2ZW50X3AuaDozMTQ6OTA6IGVycm9yOiDigJg6Om1heOKAmSBoYXMg
bm90IGJlZW4gZGVjbGFyZWQ7IGRpZCB5b3UgbWVhbiDigJhzdGQ6Om1heOKAmT8KPiAgICAgMzE0
IHwgICAgICAgICAgICAgICAgICAgICBzdGF0aWNfY2FzdDxxdWludDE2PihudW1iZXJzLnNpemUo
KSkgOiBzdGQ6Om51bWVyaWNfbGltaXRzPHF1aW50MTY+OjptYXgoKTsKPiAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4KPiAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdGQ6Om1heAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFNl
aWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAtLS0KPiAgLi4ucy1jLWxpbWl0cy1pbmNsdWRl
LWluc3RlYWQtb2YtcGxhaW4tLnBhdGNoIHwgNDEgKysrKysrKysrKysrKysrKysKPiAgLi4udF9w
LW5lZWRzLWMtbGltaXRzLWlubGN1ZGUtZml4ZXMtZ2NjLnBhdGNoIHwgNDUgKysrKysrKysrKysr
KysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcXQ1L3F0NWRlY2xhcmF0aXZlLzAwMDItcXY0cmVnZXhwX3AtbmVl
ZHMtYy1saW1pdHMtaW5jbHVkZS1pbnN0ZWFkLW9mLXBsYWluLS5wYXRjaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9xdDUvcXQ1ZGVjbGFyYXRpdmUvMDAwMy1xcW1scHJvZmlsZXJldmVu
dF9wLW5lZWRzLWMtbGltaXRzLWlubGN1ZGUtZml4ZXMtZ2NjLnBhdGNoCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94
Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
