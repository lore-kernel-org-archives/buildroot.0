Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89978CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C82B822FB;
	Wed,  1 Oct 2025 14:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1yTv4CFQ9EW; Wed,  1 Oct 2025 14:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FC182B08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FC182B08;
	Wed,  1 Oct 2025 14:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 841FEE26
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7657961291
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxsWni0r29du for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF89260F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF89260F06
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF89260F06
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:11:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id AE67E1814B9; Wed,  1 Oct 2025 16:11:44 +0200 (CEST)
In-Reply-To: <PH3PPFC54E3486195A5EB083A4D386D83E1CBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
References: <PH3PPFC54E3486195A5EB083A4D386D83E1CBE6A@PH3PPFC54E34861.namprd19.prod.outlook.com>
Date: Wed, 01 Oct 2025 16:11:44 +0200
Cc: buildroot@buildroot.org
To: "Dylan" <ohitsdylan@outlook.com>
MIME-Version: 1.0
Message-ID: <36eaf2d2-2da7-f000-4851-c1129a701b13@heine.tech>
User-Agent: SOGoMail 5.12.3
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1759327904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UYm/WkMf/nIewRcZ0YRWfWSThgN6fBsik1+y6GWT9Jc=;
 b=MOTH3+AD65rLAjZC1l0UynthrOs3LkMLCckF2lhWUEoN1dkaAnlsDdH4gZ2XCymJ9rDMKT
 CpDB3HTlO30okeci79gbyiA27OnAuYt3Y+WH3Om9l0sfgHxF/+FQIhdVD1oXji/acl9QYP
 YjIIajCVAzPklqyezKJ3vOzmtIvB9rE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=MOTH3+AD
Subject: Re: [Buildroot] =?utf-8?q?Issue_Applying_Patches_to_Package?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRHlsYW4sCgpPbiBXZWRuZXNkYXksIE9jdG9iZXIgMDEsIDIwMjUgMTU6NTUgQ0VTVCwgRHls
YW4gPG9oaXRzZHlsYW5Ab3V0bG9vay5jb20+IHdyb3RlOgoKPiBIZWxsbywKPiAKPiBJIGFtIHRy
eWluZyB0byBwYXRjaCB0aGUgcHNwbGFzaCBwYWNrYWdlLiBJJ3ZlIGZvbGxvd2VkIHRoZSBCdWls
ZHJvb3QgCj4gZG9jdW1lbnRhdGlvbiBhbmQgc2V0IHVwIGEgZ2xvYmFsIHBhdGNoIGRpcmVjdG9y
eSB3aXRoIHRoZSBwYWNrYWdlIG5hbWUgCj4gYW5kIHRoZSBwYXRjaGVzIHdpdGhpbjoKPiAKPiAv
aG9tZS9keWxhbi9wcm9qZWN0X25hbWUvZXh0ZXJuYWwvYm9hcmQvbXlfYm9hcmQvcGF0Y2hlcwo+
IOKUlOKUgOKUgCBwc3BsYXNoCj4gIMKgIMKgIOKUnOKUgOKUgCAwMDAxLXBzcGxhc2gtY29uZmln
LnBhdGNoCj4gIMKgIMKgIOKUnOKUgOKUgCAwMDAyLXBzcGxhc2gtY29sb3JzLnBhdGNoCj4gIMKg
IMKgIOKUnOKUgOKUgCBwc3BsYXNoLWNvbG9ycy5oCj4gIMKgIMKgIOKUnOKUgOKUgCBwc3BsYXNo
LWNvbG9ycy5oLm9yaWcKPiAgwqAgwqAg4pSc4pSA4pSAIHBzcGxhc2gtY29uZmlnLmgKPiAgwqAg
wqAg4pSU4pSA4pSAIHBzcGxhc2gtY29uZmlnLmgub3JpZwo+IAoKSSBkb24ndCBzZWUgd2h5IHlv
dSBpbmNsdWRlIHRoZSAuaCBhbmQgLmgub3JpZyBmaWxlcyBpbnRvIHRoZSBwYXRjaCBkaXIuIFRo
ZSBjaGFuZ2VzIGFyZSBpbiB0aGUgLnBhdGNoIGZpbGVzCnNvIG9ubHkgdGhvc2UgZmlsZXMgYXJl
IHJlbGV2YW50LgoKPiBXaGVuIEJ1aWxkcm9vdCB0cmllcyB0byBwYXRjaCB0aGUgcHNwbGFzaCBw
YWNrYWdlLCBpdCByZXR1cm5zIGFuIGVycm9yIAo+IG1lc3NhZ2UsICJjYW4ndCBmaW5kIGZpbGUg
dG8gcGF0Y2ggYXQgaW5wdXQgbGluZSAzIi4KPiBJJ3ZlIGluY2x1ZGVkIHRoZSBvdXRwdXQgb2Yg
Im1ha2UgcHNwbGFzaC1wYXRjaCBWPTEiIGluIHRoZSBwYXN0ZWJpbiAKPiBoZXJlOiBodHRwczov
L3Bhc3RlLmFjay50Zi9jZTI2NzgKPiAKPiBJJ20gbm90IHN1cmUgd2hhdCBJJ20gZG9pbmcgd3Jv
bmcgaGVyZTsgaXQgc2VlbXMgdG8gbWUgdGhhdCBldmVyeXRoaW5nIAo+IGlzIHNldCB1cCBjb3Jy
ZWN0bHkuCj4gCj4gSSd2ZSBhdHRhY2hlZCB0aGUgcGF0Y2ggZmlsZXMgaGVyZSwgYXMgd2VsbC4K
ClRoZSBpc3N1ZSBpcyBpbiB5b3VyIHBhdGNoIGZpbGVzLiAKCi0tLSBwc3BsYXNoLWNvbmZpZy5o
Lm9yaWcgICAgICAgMjAyNS0wOS0wMyAxNTowMToyMS4yODI1MzE3NjYgLTA0MDAKKysrIHBzcGxh
c2gtY29uZmlnLmggICAgMjAyNS0wOS0wMyAxNToxMDoxOC40NDUxMTYwNjYgLTA0MDAKCnNob3Vs
ZCBiZQoKLS0tIHBzcGxhc2gtY29uZmlnLmggICAgICAgMjAyNS0wOS0wMyAxNTowMToyMS4yODI1
MzE3NjYgLTA0MDAKKysrIHBzcGxhc2gtY29uZmlnLmggICAgMjAyNS0wOS0wMyAxNToxMDoxOC40
NDUxMTYwNjYgLTA0MDAKCkkgYXNzdW1lIHlvdSBjcmVhdGVkIHRoaXMgZGlmZiBtYW51YWxseSBi
ZXR3ZWVuIHRoZSB0d28gZmlsZXMgYW5kIG5vdCBmcm9tIGEgZ2l0IGNvbW1pdC4KRm9yIHRoZSBw
YXRjaGluZyB3ZSB3YW50IHRvIGFwcGx5IHRoZSBjaGFuZ2UgdG8gb25lIGZpbGUgYW5kIG5vdCB0
byBhbm90aGVyIHNvIHRoZQp0d28gbGluZXMgbmVlZCB0byBiZSBpZGVudGljYWwuCgpSZWdhcmRz
LApNaWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
