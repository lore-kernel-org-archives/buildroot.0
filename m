Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CF4C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 13:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13B6260E69;
	Wed,  8 Jun 2022 13:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ov_EPThZiSxJ; Wed,  8 Jun 2022 13:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA7A60D69;
	Wed,  8 Jun 2022 13:51:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 331DC1BF3AE
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 13:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E80383051
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 13:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUCauue1Wi0w for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 13:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8CAF82F50
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 13:51:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id ACE9ED4275
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 13:46:16 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D9281BF20D;
 Wed,  8 Jun 2022 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654695971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFfo+h7tcicY4/azMAR9cXFrJDDVTy/TbHQKIrjXEjI=;
 b=H3tUSxEfA47Q5g1gVMyQlKG7Yfc65gH9CaBdtpWcRWNyBiZRd3n5MQ12JjERcvKG8c0+Nw
 yMawNCrmXpx4D0wmmuvEd/UDoBBi9egZTCy72wGXa+lwV9gN90gBF7D6ECgmWUxY3ZASrJ
 YhX1SR7sbb8UdJbIIuBF8akiSjEhJ3bV10oSrGZ3jcN7g0oDwdrHdtTxWgOavLQAcIlwW6
 sBYbLkTJCHTNe7HF3uEtU1/5PJh5SWihEiRsLgX2SEmdhzgykLhldlrNAWS1aqYvGXgGa3
 4SJG/UlX8NT7fbExUcA/A769W/5DfIPYvT7T3LfHj2C60Hu6D4hhQ9fLR7NSdQ==
Date: Wed, 8 Jun 2022 15:46:09 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220608154609.3fb671f0@kmaincent-XPS-13-7390>
In-Reply-To: <20220608153511.76266cac@windsurf>
References: <20220608132957.68895-1-kory.maincent@bootlin.com>
 <20220608153511.76266cac@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: bump version to
 4.3.7
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Cc: scooby22@web.de, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzCgpPbiBXZWQsIDggSnVuIDIwMjIgMTU6MzU6MTEgKzAyMDAKVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvLAo+
IAo+IENvbW1pdCB0aXRsZSBoYXMgYW4gaXNzdWUsIHlvdSdyZSBidW1waW5nIHRvIDYuNC43CgpE
b2gsIHlvdSBhcmUgcmlnaHQsIEkgZG9uJ3Qga25vdyBob3cgbXkgYnJhaW4gZGlkIHRoaXMuCgo+
IAo+IE9uIFdlZCwgIDggSnVuIDIwMjIgMTU6Mjk6NTcgKzAyMDAKPiBrb3J5Lm1haW5jZW50QGJv
b3RsaW4uY29tIHdyb3RlOgo+IAo+ID4gLUdDTkFOT19CSU5BUklFU19MSUJSQVJJRVMgPSBcCj4g
PiAtCWxpYmdibV92aXYgbGliRUdMIGxpYkdBTCBsaWJnYm0gbGliR0xFU3YxX0NNIFwKPiA+IC0J
bGliR0xFU3YyIGxpYkdMU0xDIGxpYk9wZW5WRyBsaWJWU0MKPiA+IC0KPiA+ICBHQ05BTk9fQklO
QVJJRVNfVVNFUkxBTkRfU1VCRElSID0KPiA+IGdjbmFuby11c2VybGFuZC1tdWx0aS0kKEdDTkFO
T19CSU5BUklFU19VU0VSTEFORF9WRVJTSU9OKSAKPiA+IC1HQ05BTk9fQklOQVJJRVNfUEtHX0NP
TkZJR1MgPSBlZ2wgZ2JtIGdsZXN2MV9jbSBnbGVzdjIgdmcKPiA+IC0KPiA+ICBkZWZpbmUgR0NO
QU5PX0JJTkFSSUVTX0lOU1RBTEwKPiA+IC0JJChmb3JlYWNoIGxpYiwkKEdDTkFOT19CSU5BUklF
U19MSUJSQVJJRVMpLCBcCj4gPiAtCQkkKElOU1RBTEwpIC1EIC1tIDA3NTUKPiA+ICQoQEQpLyQo
R0NOQU5PX0JJTkFSSUVTX1VTRVJMQU5EX1NVQkRJUikvdXNyL2xpYi8kKGxpYikuJChHQ05BTk9f
QklOQVJJRVNfTElCX1ZFUlNJT04pLm11bHRpLnJlbGVhc2Uuc28KPiA+IFwKPiA+IC0KPiA+ICQo
MSkvdXNyL2xpYi8kKGxpYikuJChHQ05BTk9fQklOQVJJRVNfTElCX1ZFUlNJT04pLm11bHRpLnJl
bGVhc2Uuc28gOyBcCj4gPiAtCQljcCAtYQo+ID4gJChARCkvJChHQ05BTk9fQklOQVJJRVNfVVNF
UkxBTkRfU1VCRElSKS91c3IvbGliLyQobGliKS5zbyogJCgxKS91c3IvbGliCj4gPiAtCSkKPiA+
ICsJY2QgJChARCkvJChHQ05BTk9fQklOQVJJRVNfVVNFUkxBTkRfU1VCRElSKS9yZWxlYXNlL2Ry
aXZlcnMvIDsgXAo+ID4gKwlmaW5kIC4gLXR5cGUgZiAtZXhlYyAkKElOU1RBTEwpIC1EIC1tIDA3
NTUge30gJCgxKS91c3IvbGliL3t9IFw7IDsKPiA+IFwKPiA+ICsJZmluZCAuIC10eXBlIGwgLWV4
ZWMgY3AgLWEge30gJCgxKS91c3IvbGliIFw7IDsgXCAgCj4gCj4gVGhlIDsgXCBhdCB0aGUgZW5k
IGlzIG5vdCBuZWVkZWQsIGl0IGlzIHRoZSBsYXN0IGxpbmUgb2YgdGhlIGNvbW1hbmQuCgpZZXMg
aW5kZWVkLgoKPiAKPiA+ICsJY3AgLWEgJChARCkvJChHQ05BTk9fQklOQVJJRVNfVVNFUkxBTkRf
U1VCRElSKS9yZWxlYXNlL2luY2x1ZGUvKgo+ID4gJCgxKS91c3IvaW5jbHVkZS8KPiA+ICsJbG4g
LXMgZ2JtL2dibS5oICQoMSkvdXNyL2luY2x1ZGUvZ2JtLmgKPiA+ICsJY2QgJChARCkvJChHQ05B
Tk9fQklOQVJJRVNfVVNFUkxBTkRfU1VCRElSKS9wa2djb25maWcvIDsgXAo+ID4gKwlmb3IgZmls
ZSBpbiAqIDsgZG8gXAo+ID4gKwkJc2VkIC1lICJzfCNQUkVGSVgjfC91c3J8IiAkJGZpbGUgPiAk
JGZpbGUudGVtcCA7IFwKPiA+ICsJCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkJGZpbGUudGVtcAo+
ID4gJCgxKS91c3IvbGliL3BrZ2NvbmZpZy8kJGZpbGUgOyBcCj4gPiArCQlybSAkJGZpbGUudGVt
cCA7IFwgIAo+IAo+IEknZCBzYXkgeW91IGNhbiBsZWF2ZSB0aGUgJCRmaWxlLnRtcCBhcm91bmQg
aW4gdGhlIGJ1aWxkIGRpcmVjdG9yeSwgaXQKPiB3aWxsIG5vdCBjYXVzZSBhbnkgcHJvYmxlbS4K
Ckl0IGRvZXMsIGluIHRoZSBjYXNlIHdlIGNhbGwgdGhlIHJlaW5zdGFsbCB0YXNrLCB0aGVzZSB0
ZW1wIGZpbGVzIHdpbGwgYmUgYWRkZWQKdG8gdGhlIGZvciBsb29wLgoKS8O2cnkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
