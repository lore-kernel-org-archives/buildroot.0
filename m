Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D1CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0213B40897;
	Wed, 29 Dec 2021 08:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KzxCOR5BB2L; Wed, 29 Dec 2021 08:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0064089F;
	Wed, 29 Dec 2021 08:50:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 878CC1BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83388400C7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rApOTjEIJAu7 for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:50:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2572940022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:50:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7DF6940005;
 Wed, 29 Dec 2021 08:50:49 +0000 (UTC)
Date: Wed, 29 Dec 2021 09:50:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20211229095040.43a2bb32@windsurf>
In-Reply-To: <f7dc4424-a38a-c448-4436-f1e06b86ffb9@kaod.org>
References: <20211112160413.2736382-1-clg@kaod.org>
 <20211228221430.7e8cb844@windsurf>
 <f7dc4424-a38a-c448-4436-f1e06b86ffb9@kaod.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ8OpZHJpYywKCk9uIFR1ZSwgMjggRGVjIDIwMjEgMjM6NTA6MjkgKzAxMDAKQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cgo+IExldCdzIHRyeSBkaWZmZXJlbnRs
eSwKPiAKPiBPbiB0aGVzZSBzeXN0ZW1zLCB0aGUgRlcgaXMgY29tcGFyYWJsZSB0byBVLUJvb3Qg
YXMgaXQgbG9hZHMga2VybmVsIGFuZAo+IGluaXRyYW1mcyBpbWFnZXMgZnJvbSBmbGFzaC4gVGhl
IGluaXRyYW1mcyBpcyBhIGJ1aWxkcm9vdCBlbnZpcm9ubWVudAo+IHdoaWNoIGluY2x1ZGVzIHRo
ZSBwZXRpdGJvb3QgWypdIGJvb3QgbG9hZGVyLiBUaGlzIHNlY29uZCBib290IGxvYWRlcgo+IGRv
ZXMgdGhlIGRldmljZSBkaXNjb3ZlcnkgYW5kIGtleGVjcyBhIG5ldyBMaW51eCBpbWFnZSBmcm9t
IGRpc2sgb3IKPiBuZXR3b3JrLgo+IAo+IFdoYXQgd2UgY2FyZSBhYm91dCBoZXJlIGlzIG9ubHkg
dGhlIGZpcnN0IGxldmVsIHdoaWNoIHVzZXMgdGhlIGJ1aWxkcm9vdAo+IGltYWdlLiBwZXRpdGJv
b3QgaXMgYW5vdGhlciB0b3BpYy4KPiAKPiBBcyBmb3IgUUVNVSwgaXQgaW1wbGVtZW50cyAzIG1h
Y2hpbmVzIFBPV0VSOCwgUE9XRVI5IGFuZCBQb3dlcjEwCj4gcHJvY2Vzc29ycyB0aGF0IHdlIHVz
ZSBmb3IgZGV2IGFuZCB0ZXN0cy4gSSBoYXZlIGNob3NlbiBpbiB0aGUgUUVNVQo+IHNjcmlwdCB0
byBib290IGRpcmVjdGx5IGZyb20gYSBudm1lIGRpc2sgYmVjYXVzZSBpdCBpcyBzaW1wbGUgZW5v
dWdoCj4gYnV0IHVzaW5nIGEgcmFtZnMgd291bGQgYmUgY2xvc2VyIHRvIHJlYWxpdHkuCj4gCj4g
VGhlIGh5cGVydmlzb3IgcGFydCBpcyBzaW1wbHkgYSBmZWF0dXJlIG9mIHRoaXMgTGludXggUFBD
IHBsYXRmb3JtLAo+IHRoYXQgaXMgY2FsbGVkIFBvd2VyTlYuCj4gCj4gWypdIGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuLXBvd2VyL3BldGl0Ym9vdC8KClRoYW5rcyBmb3IgdGhlIGFkZGl0aW9uYWwg
ZXhwbGFuYXRpb25zIQoKPiA+IENvdWxkIHlvdSBjbGFyaWZ5PyAgCj4gCj4gYmVjYXVzZSB0aGUg
c2FtZSBpbWFnZSBjYW4gYmUgdXNlZCBmb3IgdGhlIFFFTVUgbWFjaGluZSBpbXBsZW1lbnRpbmcK
PiB0aGUgUE9XRVI4IHByb2Nlc3Nvciwgd2hpY2ggYWxzbyB3b3JrcyBmb3IgUE9XRVI5IGFuZCBQ
b3dlcjEwLgoKU28gd2h5IGRvbid0IHdlIHRlc3QgaXQgd2l0aCAtTSBwb3dlcm52OCA/CgpCZXN0
IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5p
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
