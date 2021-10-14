Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979F1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 08:18:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D6C61108
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 08:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7D6C61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E9C40734;
	Thu, 14 Oct 2021 08:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufQxaRBajEwG; Thu, 14 Oct 2021 08:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BB4406D9;
	Thu, 14 Oct 2021 08:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 025F51BF59D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 08:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5195406D9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 08:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWsfkDdqpRXa for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 08:18:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87154406C3
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 08:18:03 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0AF6D4000F;
 Thu, 14 Oct 2021 08:17:59 +0000 (UTC)
Date: Thu, 14 Oct 2021 10:17:57 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211014101757.37aa72ee@bootlin.com>
In-Reply-To: <471e1df6-225d-04b3-49e1-b68edac32fa6@mind.be>
References: <20211004124316.355770-1-herve.codina@bootlin.com>
 <20211004124316.355770-3-herve.codina@bootlin.com>
 <471e1df6-225d-04b3-49e1-b68edac32fa6@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/libdbi-drivers: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBXZWQsIDEzIE9jdCAyMDIxIDIwOjExOjEyICswMjAwCkFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cgo+ID4gK0Zyb20gYmM5NjY2NTZkODU5OGE2ZDg3
YzkwMWE2N2VjZGI5MWM0MzZmNDkzOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ICtGcm9t
OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KPiA+ICtEYXRlOiBXZWQs
IDI5IFNlcCAyMDIxIDE1OjA4OjMzICswMjAwCj4gPiArU3ViamVjdDogW1BBVENIXSBidWlsZDog
VXNlIE1ZU1FMX0NPTkZJRyB2YXJpYWJsZSBpbnN0ZWFkIG9mCj4gPiArICdteXNxbF9jb25maWcn
Cj4gPiArCj4gPiArVGhlIE1ZU1FMX0NPTkZJRyB2YXJpYWJsZSBpcyB1c2VkIHRvIGNoZWNrICdt
eXNxbF9jb25maWcnIHByb2cuCj4gPiArVGhpcyB2YXJpYWJsZSBjYW4gYmUgb3ZlcnJpZGUgYnkg
dGhlIHVzZXIgYnV0IHdhcyBub3QgdXNlZCBmb3IKPiA+ICtyZXRyaWV2aW5nIE1ZU1FMX0lOQ0xV
REUsIE1ZU1FMX0xJQlMsIC4uLgo+ID4gKwo+ID4gK1RoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSBo
YXJkY29kZWQgdXNhZ2Ugb2YgJ215c3FsX2NvbmZpZycgYnkKPiA+ICt0aGUgdXNlIG9mIE1ZU1FM
X0NPTkZJRyB2YXJpYWJsZS4KPiA+ICsKPiA+ICtUaGlzIGxlYWQgdG8gJ01ZU1FMX0NPTkZJRz0v
c29tZS93aGVyZS9teXNxbF9jb25maWcgLi9jb25maWd1cmUnCj4gPiArY29tbWFuZCB0byB3b3Jr
IHByb3Blcmx5Lgo+ID4gKwo+ID4gK1NpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVydmUu
Y29kaW5hQGJvb3RsaW4uY29tPiAgCj4gCj4gICBQbGVhc2Ugc2VuZCB0aGUgcGF0Y2ggdXBzdHJl
YW0gdG8gdGhlIG1haWxpbmcgbGlzdCBbMV0uIE5vcm1hbGx5LCBJJ2QgYWxzbyAKPiB3YW50IGFu
IHVwc3RyZWFtIGxpbmsgaGVyZSwgYnV0IEkndmUgYWxyZWFkeSBhcHBsaWVkLgo+IAo+IAo+ICAg
UmVnYXJkcywKPiAgIEFybm91dAo+IAo+IFsxXSBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9q
ZWN0cy9saWJkYmktZHJpdmVycy9saXN0cy9saWJkYmktZHJpdmVycy1kZXZlbAoKRG9uZToKaHR0
cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcC9saWJkYmktZHJpdmVycy9tYWlsbWFuL2xpYmRiaS1kcml2
ZXJzLWRldmVsL3RocmVhZC8yMDIxMTAxNDA3MTcxMy4xNzAyMzk4LTEtaGVydmUuY29kaW5hJTQw
Ym9vdGxpbi5jb20vCgpCZXN0IHJlZ2FyZHMsCkhlcnbDqQoKLS0gCkhlcnbDqSBDb2RpbmEsIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
