Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DA0C77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 10:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE30B41CF0;
	Sun, 14 May 2023 10:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE30B41CF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1Ii7D3rA7tv; Sun, 14 May 2023 10:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F39B40169;
	Sun, 14 May 2023 10:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F39B40169
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D28041BF37C
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 10:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C87426F7
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 10:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C87426F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKCMalywmZUR for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 10:45:59 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72A942641
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D72A942641
 for <buildroot@buildroot.org>; Sun, 14 May 2023 10:45:58 +0000 (UTC)
Received: from smtpclient.apple ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPA
 id y97qpERfNJCZXy97rpff5g; Sun, 14 May 2023 12:38:51 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 14 May 2023 12:38:50 +0200
Message-Id: <AAA23910-5471-4C45-8C13-94BE5B749DA5@benettiengineering.com>
References: <CAB1t1CwQrZhwtgZKhioCySMUG-sst7_491YGHrXccwyDLGLzLA@mail.gmail.com>
In-Reply-To: <CAB1t1CwQrZhwtgZKhioCySMUG-sst7_491YGHrXccwyDLGLzLA@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-Mailer: iPhone Mail (20E252)
X-CMAE-Envelope: MS4xfGbtLt1JvAN7W3at5+A1jDeZH6Nm713AZp3wQtJVrmMizGkrNR7jlf8GBBYAOwGutWsIzI0zcfcXDFToFvO81WYpumlRBeImYVThluy6dOmHcrOVOmKA
 OkyxqOLvUP1JvpOpwDuLoL6XOtrBorQZCEb8SVKE9UmesBSCoT3lEOp56YKMDQl703JCYdIpPf0w1phjD2zb6P3GOQVfgrErPOa7XRZqftn+bgrrMnG3YL1Z
 MwwgKKc9VJHq4TiGo18pLA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1684060731; bh=u18gI9C9hqfVcY6qnEADOnjCw3lDNiY3c2qiBHcVFPA=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=NoVxolCMCZQ5OzfLKSRTgv6Ji9uOMllYzVAoYsgkiZA8DwZxlFxZBPbl8JEGia1lH
 ppe+V0xzwjim7Lap2YNrJfAUc57zGsS/jb61QWgOeuDcxjsMfHg5gf5yrkCsrZF1xk
 cMO6AZ5rPNJm9n7YaI76fa4UsQvOmSdp/1tfPlEEqKtTUl5IY/V9IeMgW4a/qsfNbx
 mFTPaYP8Atapx5p7D7j6BXV/83F+dCPA9zTrs+oNRrrrEv+Ct28e4qL1U+Fe5xGO69
 fEgrgIII9UqWDqbuq/znXgdP+TwqjJFq/y4eq85NCOe1enJmpxgG4mpP/EHldaP3Dy
 B8R2NAeNpIAJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NoVxolCM
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix host build failure
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

SGkgUGV0ciwKCj4gSWwgZ2lvcm5vIDE0IG1hZyAyMDIzLCBhbGxlIG9yZSAxMjozNSwgUGV0ciBW
b3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gCj4g77u/SGkgR2l1bGlv
LAo+IAo+PiBPbiBTdW4sIDE0IE1heSAyMDIzIGF0IDEyOjIwLCBHaXVsaW8gQmVuZXR0aQo+PiA8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4+IAo+PiBQYWNr
YWdlIG5mcy11dGlscyByZXF1aXJlcyBsaWJldmVudCBhbmQgc3FsaXRlIHNvIGxldCdzIGFkZCB0
aGVzZSB0d28KPj4gcGFja2FnZXMgYXMgZGVwZW5kZW5jaWVzIGZvciBob3N0IHBhY2thZ2UgdG9v
Lgo+PiAKPj4gRml4ZXM6Cj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
LzVlMWFjOTdlNDAyM2Y5MDJkZmZhMDY2Yzg5NWFhNmY2MDA1ZDU0MWMvCj4gCj4gRml4ZXM6IGY5
ZGM0YmFiOWYgKCJwYWNrYWdlL25mcy11dGlsczogYnVtcCB0byB2ZXJzaW9uIDIuNi4zIikKPiBS
ZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CgpUaGFuayB5b3Us
Cgo+IAo+IEknbSBzb3JyeSBmb3Igbm90IHNwb3R0aW5nIHRoaXMgaW4gZjlkYzRiYWI5ZiByZXZp
ZXcuCj4gVGhlIGVycm9yIGlzIGFib3V0IG1pc3NpbmcgbGliZXZlbnQsIEkgc3VwcG9zZSBpdCdk
IGZhaWwgZm9yIG1pc3NpbmcKPiBzcWxpdGUgaWYgd2UgYWRkIG9ubHkgaG9zdC1saWJldmVudC4K
CkV4YWN0bHksIGluZGVlZCBJ4oCZdmUgYWRkZWQgaG9zdC1zcWxpdGUgdG9vIHNpbmNlIEnigJl2
ZSB0cmllZCB0byBidWlsZCB3aXRoIG9ubHkgaG9zdC1saWJldmVudCBhbmQgaXQgZmFpbHMgYmVj
YXVzZSBvZiBtaXNzaW5nIGhvc3Qtc3FsaXRlLgoKS2luZCByZWdhcmRzCkdpdWxpbwoKPiAKPiBL
aW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAo+PiAKPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0
dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+PiBwYWNr
YWdlL25mcy11dGlscy9uZnMtdXRpbHMubWsgfCAyICstCj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmZz
LXV0aWxzL25mcy11dGlscy5tayBiL3BhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tawo+PiBp
bmRleCAyZjJlMjAwYmI1Li4zYzg1YmUwNTU4IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL25mcy11
dGlscy9uZnMtdXRpbHMubWsKPj4gKysrIGIvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1r
Cj4+IEBAIC0yMiw3ICsyMiw3IEBAIE5GU19VVElMU19DT05GX09QVFMgPSBcCj4+ICAgICAgICAt
LXdpdGgtc3RhdGVkaXI9L3J1bi9uZnMgXAo+PiAgICAgICAgLS13aXRoLXJwY2dlbj0kKEhPU1Rf
RElSKS9iaW4vcnBjZ2VuCj4+IAo+PiAtSE9TVF9ORlNfVVRJTFNfREVQRU5ERU5DSUVTID0gaG9z
dC1wa2djb25mIGhvc3QtbGlidGlycGMKPj4gK0hPU1RfTkZTX1VUSUxTX0RFUEVOREVOQ0lFUyA9
IGhvc3QtcGtnY29uZiBob3N0LWxpYnRpcnBjIGhvc3QtbGliZXZlbnQgaG9zdC1zcWxpdGUKPj4g
Cj4+IEhPU1RfTkZTX1VUSUxTX0NPTkZfT1BUUyA9IFwKPj4gICAgICAgIC0tZW5hYmxlLXRpcnBj
IFwKPj4gLS0KPj4gMi4zNC4xCj4+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
