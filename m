Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0433D0E6D9
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 09:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D95F80C69;
	Mon, 21 Oct 2024 09:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMcwluunvlVc; Mon, 21 Oct 2024 09:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB3480C6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AB3480C6C;
	Mon, 21 Oct 2024 09:48:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C1D127D7
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 09:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6957E605F5
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 09:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESwjdtge9h6k for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 09:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CADA6605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CADA6605BB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CADA6605BB
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 09:47:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23B9220002;
 Mon, 21 Oct 2024 09:47:53 +0000 (UTC)
Date: Mon, 21 Oct 2024 11:47:52 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kory Maincent via
 buildroot <buildroot@buildroot.org>, Asaf Kahlon <asafka7@gmail.com>, James
 Hilliard <james.hilliard1@gmail.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Mauro Condarelli <mc5686@mclink.it>
Message-ID: <20241021114752.63157838@kmaincent-XPS-13-7390>
In-Reply-To: <b951fb45-97ef-47c3-aee5-15d23c558461@mind.be>
References: <20241014142923.246809-1-kory.maincent@bootlin.com>
 <20241014142923.246809-4-kory.maincent@bootlin.com>
 <20241017154643.442837bf@windsurf>
 <b951fb45-97ef-47c3-aee5-15d23c558461@mind.be>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729504073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2uUZx/lXC4uPvlbW7YgW0jst1qK66xhEYyGomE28Ak=;
 b=BogEM418Cx3U0tZNMwfV3RlikXojRYlVvuLF5JtvnznyyokFA7sxKdEPO0uUE/N+pgEu7I
 I52VkSPGb0nebBl45UPC5DbZiGAvQcLIWjtUjFNTWGGX+WMjt4QzhuGfsLc0QqzS0mOBnf
 hgAKZfK2KHeDTiIxyZ0JEgBOt8pHz9urlmSiP35f2nQlsX18VX/wzm4kkkL1eSmOdWiHP6
 Wyh5hRv2cxqEGSfCwHlUMqvVTccc6TfMYPTLhi5EW8TbcEYo2iD+cTOqfdC8bSqMhavW1v
 TMln7H7zZAgROprLPmOk7KoivhoeA7OEYDIlH2DEKIQJGVjD5BThPaX/ra5FPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BogEM418
Subject: Re: [Buildroot] [PATCH v6 3/3] boot: Add support for
 TrustedFirmware-M package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNyBPY3QgMjAyNCAxNjowNToyOCArMDIwMApBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKPiBPbiAxNy8xMC8yMDI0IDE1OjQ2LCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+ID4gSGVsbG8gS8O2cnksCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIG5l
dyBpdGVyYXRpb24uCj4gPiAKPiA+IE9uIE1vbiwgMTQgT2N0IDIwMjQgMTQ6Mjk6MjIgKzAwMDAK
PiA+IEtvcnkgTWFpbmNlbnQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+
IHdyb3RlOgo+ID4gICAKPiA+PiBDaGFuZ2VzIGluIHY1Ogo+ID4+IC0gVXNlIEVYVFJBX0RPV05M
T0FEIGluc3RlYWQgb2Ygc3VicGFja2FnZXMgZm9yIDNyZCBwYXJ0aWVzLiAgCj4gPiAKPiA+IEkg
ZGlkbid0IGZvbGxvdyB0aGUgY29udmVyc2F0aW9uLiBXaGF0IHdhcyB0aGUgcmVhc29uaW5nIHRv
IHN3aXRjaAo+ID4gImJhY2siIGZyb20gc3ViLXBhY2thZ2VzIHRvIEVYVFJBX0RPV05MT0FEUyA/
Cj4gPiAKPiA+IEluIHBhcnRpY3VsYXIsIEkgcmVtZW1iZXIgaW4gb3VyIGVhcmxpZXIgY29udmVy
c2F0aW9uLCB3ZSBoYWQgZmlndXJlZAo+ID4gb3V0IHRoYXQgRVhUUkFfRE9XTkxPQURTIHdvdWxk
IG5vdCB3b3JrIGJlY2F1c2Ugb25lIG9mIHRoZSBwYWNrYWdlcyB3YXMKPiA+IHVzaW5nIGdpdCBz
dWItbW9kdWxlcywgYW5kIHRoZXJlZm9yZSB0aGUgR2l0aHViIGF1dG8tZ2VuZXJhdGVkIHRhcmJh
bGwKPiA+IHdhcyBub3Qgc3VmZmljaWVudC4gIAo+IAo+ICAgVGhlIHJlYXNvbmluZyB3YXMgdGhh
dCBpdCdzIG11Y2ggc2ltcGxlciB0aGFuIHN1Yi1wYWNrYWdlcyAtIGluIHBhcnRpY3VsYXIgCj4g
YmVjYXVzZSB0aGUgc3ViLXBhY2thZ2VzIGFyZSB1Z2x5LCB0aGUgc3VwZXItcGFja2FnZSBoYXMg
dG8gdHJhaXBzZSBpbiB0aGUgCj4gc3ViLXBhY2thZ2VzIHNvdXJjZSBkaXJlY3RvcnkgdG8gYmUg
YWJsZSB0byBkbyBpdHMgdGhpbmcuCj4gCj4gICBUaGVyZSB3YXMgaW5kZWVkIG9uZSBvZiB0aGUg
c3ViLXBhY2thZ2VzIHRoYXQgaGFkIHRvIGJlIGtlcHQgYmVjYXVzZSBvZiB0aGUgCj4gc3VibW9k
dWxlcywgYnV0IGFwcGFyZW50bHkgdGhpcyBpcyBubyBsb25nZXIgdGhlIGNhc2UuCj4gCj4gCj4g
Cj4gPj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RGX01fTUJFRFRMU19UQVJCQUxMX0xPQ0FUSU9OCj4g
Pj4gKwlzdHJpbmcgIlVSTCBvZiBjdXN0b20gbWJlZHRscyB0YXJiYWxsIiBcCj4gPj4gKwkJaWYg
IUJSMl9UQVJHRVRfVEZfTV9MQVRFU1RfVkVSU0lPTgo+ID4+ICsJZGVmYXVsdAo+ID4+ICJodHRw
czovL2dpdGh1Yi5jb20vTWJlZC1UTFMvbWJlZHRscy9yZWxlYXNlcy9kb3dubG9hZC92My42LjAv
bWJlZHRscy0zLjYuMC50YXIuYnoyIgo+ID4+ICAKPiA+IAo+ID4gSXMgaXQgbm93IHBvc3NpYmxl
IGJlY2F1c2UgdGhleSBwcm92aWRlIHJlbGVhc2UgdGFyYmFsbHMsIHRoYXQgaW5jbHVkZQo+ID4g
YWxsIHN1Yi1tb2R1bGVzPwo+ID4gICAKPiA+PiArY29uZmlnIEJSMl9UQVJHRVRfVEZfTV9NQ1VC
T09UX1RBUkJBTExfTE9DQVRJT04KPiA+PiArCXN0cmluZyAiVVJMIG9mIG1jdWJvb3QgdGFyYmFs
bCIgXAo+ID4+ICsJCWlmICFCUjJfVEFSR0VUX1RGX01fTEFURVNUX1ZFUlNJT04KPiA+PiArCWRl
ZmF1bHQgIiQoY2FsbAo+ID4+IGdpdGh1YixtY3UtdG9vbHMsbWN1Ym9vdCx2Mi4xLjApL21jdWJv
b3QtdjIuMS4wLnRhci5neiIgKwo+ID4+ICtjb25maWcgQlIyX1RBUkdFVF9URl9NX0NNU0lTX1RB
UkJBTExfTE9DQVRJT04KPiA+PiArCXN0cmluZyAiVVJMIG9mIGNtc2lzIHRhcmJhbGwiIFwKPiA+
PiArCQlpZiAhQlIyX1RBUkdFVF9URl9NX0xBVEVTVF9WRVJTSU9OCj4gPj4gKwlkZWZhdWx0ICIk
KGNhbGwKPiA+PiBnaXRodWIsYXJtLXNvZnR3YXJlLGNtc2lzXzYsZDBjNDYwYzE2OSkvY21zaXMt
ZDBjNDYwYzE2OS50YXIuZ3oiICsKPiA+PiArY29uZmlnIEJSMl9UQVJHRVRfVEZfTV9RQ0JPUl9U
QVJCQUxMX0xPQ0FUSU9OCj4gPj4gKwlzdHJpbmcgIlVSTCBvZiBxY2JvciB0YXJiYWxsIiBcCj4g
Pj4gKwkJaWYgIUJSMl9UQVJHRVRfVEZfTV9MQVRFU1RfVkVSU0lPTgo+ID4+ICsJZGVmYXVsdCAi
JChjYWxsCj4gPj4gZ2l0aHViLGxhdXJlbmNlbHVuZGJsYWRlLHFjYm9yLHYxLjIpL3FjYm9yLXYx
LjIudGFyLmd6IiAgCj4gPiAKPiA+IE15IGNvbmNlcm4gd2l0aCB0aGlzIGlzIHRoYXQgd2UncmUg
dHJ5aW5nIHRvIG1vdmUgYXdheSBmcm9tCj4gPiBhdXRvLWdlbmVyYXRlZCBHaXRodWIgdGFyYmFs
bHMsICAKPiAKPiAgIFllYWgsIG15IGZlZWRiYWNrIHdhcyBmcm9tIGJlZm9yZSB3ZSBkZWNpZGVk
IHRoYXQuLi4KPiAKPiAKPiA+IGFuZCB0aGlzIGFkZHMgYSBjYXNlIHdoZXJlIGl0IHdvdWxkIGJl
Cj4gPiBkaWZmaWN1bHQgdG8gc3dpdGNoIGF3YXkgZnJvbSB0aG9zZSBhdXRvLWdlbmVyYXRlZCB0
YXJiYWxscyBhbmQgdXNlIGEKPiA+IHByb3BlciBHaXQgY2xvbmU6IHRoaXMgd291bGQgcmVxdWly
ZSBzdWItcGFja2FnZXMsIGxpa2UgeW91IGRpZAo+ID4gcHJldmlvdXNseS4gIAo+IAo+ICAgSSB3
b3VsZCByZWFsbHkgcHJlZmVyIGEgc29sdXRpb24gd2hlcmUgaXQgaXMgcG9zc2libGUgdG8gc3Bl
Y2lmeSBhbGwgdGhlIAo+IGluZm9ybWF0aW9uIG5lZWRlZCB0byBiZSBhYmxlIHRvIGRvIHRoZSBk
b3dubG9hZCBpbiBhIHNpbmdsZSBVUkwgKCopLiBUaGF0Cj4gd2F5LCB3ZSBjYW4gYWxzbyB1c2Ug
Z2l0IGFuZCBjYXJnbyBmb3IgRVhUUkFfRE9XTkxPQURTLiBTbyBzb21ldGhpbmcgbGlrZSAKPiBn
aXQraHR0cHM6Ly9naXRodWIuY29tL2xhdXJlbmNlbHVuZGJsYWRlL3FjYm9yQHYxLjIKPiAKPiAg
IEFuZCB0aGF0IG1pZ2h0IGV2ZW4gYWxsb3cgdXMgdG8gYXZvaWQgYSBtYXNzIGNvbnZlcnNpb24g
YXdheSBmcm9tIHRoZQo+IGdpdGh1YiBtYWNybyBhbmQgaW5zdGVhZCBlbmNvZGUgZXZlcnl0aGlu
ZyB0aGVyZS4KPiAKPiAgICgqKSBTaG91bGQgcHJvYmFibHkgYmUgY2FsbGVkIHNvbWV0aGluZyBl
bHNlIHRoYW4gVVJMLCBiZWNhdXNlIHRoaXMgbm8KPiBsb25nZXIgbG9va3MgbGlrZSBhIHJlYWwg
VVJMLiBkbHNwZWM/CgpJZiB3ZSBkb24ndCB1c2UgdGFyYmFsbCBmb3IgZXh0cmEgZG93bmxvYWQs
IGNvdWxkbid0IHdlIGRlY3JlYXNlIHRoZSBnaXQgY2xvbmUKdGltZSB1c2luZyAtLXNpbmdsZS1i
cmFuY2ggYW5kL29yIC0tZGVwdGggMT8KClJlZ2FyZHMsCi0tIApLw7ZyeSBNYWluY2VudCwgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
