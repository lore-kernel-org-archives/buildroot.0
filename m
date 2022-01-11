Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828C4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BD224016A;
	Tue, 11 Jan 2022 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiDpN5eBmSEb; Tue, 11 Jan 2022 21:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77D8740901;
	Tue, 11 Jan 2022 21:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9239C1BF427
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CA2240901
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVVe6LkgTmfc for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:09:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C64B4016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:09:36 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 53290C5558
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:59:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5FDCAE0003;
 Tue, 11 Jan 2022 20:59:00 +0000 (UTC)
Date: Tue, 11 Jan 2022 21:58:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220111215859.15821eda@windsurf>
In-Reply-To: <20220110162319.294088-1-yann.morin.1998@free.fr>
References: <20220110162319.294088-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/download: drop support for the
 'none' hash
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

T24gTW9uLCAxMCBKYW4gMjAyMiAxNzoyMzoxOSArMDEwMAoiWWFubiBFLiBNT1JJTiIgPHlhbm4u
bW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gQ29tbWl0IDFiYTg1YjdmODc0ZCAoc3VwcG9y
dC9kb3dubG9hZDogYWRkIGV4cGxpY2l0IG5vLWhhc2ggc3VwcG9ydCkKPiBpbnRyb2R1Y2VkIHRo
ZSAnbm9uZScgaGFzaCB0eXBlLCBpbiBhbiBhdHRlbXB0IHRvIG1ha2UgaGFzaCBmaWxlcwo+IG1h
bmRhdG9yeSwgYnV0IG5vdCBmYWlsaW5nIG9uIGFyY2hpdmVzIGxvY2FseSBnZW5lcmF0ZWQsIGxp
a2UgdGhvc2UKPiBmb3IgZ2l0IG9yIHN2biByZXBvc2l0b3JpZXMsIGVzcGVjaWFsbHkgZm9yIHRo
b3NlIHBhY2thZ2VzIHdoZXJlIGEKPiB2ZXJzaW9uIGNob2ljZSB3YXMgcHJlc2VudCwgd2hpY2gg
d291bGQgYWxsb3cgZm9yIGVpdGhlciByZW1vdGUKPiBhcmNoaXZlcyBmb3Igd2hpY2ggd2UnZCBo
YXZlIGEgaGFzaCBvciBWQ1MgdHJlZXMgZm9yIHdoaWNoIHdlIGNvdWxkCj4gbm90IGhhdmUgYSBo
YXNoIGZvciB0aGUgbG9jYWx5IGdlbmVyYXRlZCBhcmNoaXZlLgo+IAo+IEluZGVlZCwgYmFjayBp
biB0aGUgdGltZSwgd2UgZGlkIG5vdCBoYXZlIGEgbWVhbiB0byBnZW5lcmF0ZQo+IHJlcHJvZHVj
aWJsZSBhcmNoaXZlcywgc28gaGF2aW5nIGEgaGFzaCBmaWxlIHdpdGhvdXQgYSBoYXNoIGZvcgo+
IHRob3NlbCBvY2FsbHkgZ2VuZXJhdGVkIGFyY2hpdmVzIHdvdWxkIHRyaWdnZXIgYW4gZXJyb3Ig
aW4gdGhlCj4gaGFzaDAtY2hlY2tpbmcgbWFjaGluZXJ5Lgo+IAo+IEJ1dCBub3csIGxvdy1hbmQt
YmVob2xkLCB3ZSBkbyBrbm93IGhvdyB0byBnZW5lcmF0ZSB0aG9zZSBhcmNoaXZlcywKPiBhbmQg
d2UgaGF2ZSBhIG1lY2hhbmlzbSB0byBleHBsaWNpdGx5IGV4Y2x1ZGUgc29tZSBhcmNoaXZlcyBm
cm9tIGJlaW5nCj4gaGFzaC1jaGVja2VkIChlLmcuIHdoZW4gdGhlIHZlcmlzb24gc3RyaW5nIGl0
c2VsZiBjYW4gYmUgdXNlci1wcm92aWRlZCkuCj4gCj4gQXMgc3VjaCwgdGhlICdub25lJyBoYXNo
IHR5cGUgbm8gbG9uZ2VyIGhhcyBhbnkgcmFpc29uIGQnw6p0cmUsIHdlIGRvIG5vdAo+IHVzZSBp
dCBpbi10cmVlLCBhbmQgaXRzIHVzZSBpbiBhIGJyMi1leHRlcm5hbCB0cmVlIGlzIG1vc3QgcHJv
YmFibHkKPiBpbmV4aXN0ZW50IChhcyBpcyB0aGUgdXNlIG9mIGhhc2ggZmlsZXMgYWxvdGdldGhl
ciBtb3N0IHByb2JhYmx5KS4KPiAKPiBTbyB3ZSBzaW1wbHkgZHJvcCB0aGUgc3VwcG9ydCBmb3Ig
dGhhdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4KPiAtLS0KPiAgZG9jcy9tYW51YWwvYWRkaW5nLXBhY2thZ2VzLWRpcmVjdG9yeS50
eHQgfCA5ICstLS0tLS0tLQo+ICBzdXBwb3J0L2Rvd25sb2FkL2NoZWNrLWhhc2ggICAgICAgICAg
ICAgICB8IDQgLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxl
dGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB3aXRoIHRoZSBmaXggc3VnZ2VzdGVkIGJ5IFJp
Y2FyZG8uCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
