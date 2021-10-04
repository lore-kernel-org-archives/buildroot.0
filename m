Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F301CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 10:22:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053FF613B5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 10:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 053FF613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E7974039E;
	Mon,  4 Oct 2021 10:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68JnDpP2nQjU; Mon,  4 Oct 2021 10:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C40B640654;
	Mon,  4 Oct 2021 10:22:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB5861BF2CE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 10:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99E0B84BB3
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 10:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_66YidcDOPE for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 10:22:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B57884BB2
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 10:22:40 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0E913100002;
 Mon,  4 Oct 2021 10:22:37 +0000 (UTC)
Date: Mon, 4 Oct 2021 12:22:37 +0200
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20211004122237.122a8bcb@kmaincent-XPS-13-7390>
In-Reply-To: <20211003124900.GI1504958@scaer>
References: <20210923155726.87851-1-kory.maincent@bootlin.com>
 <20210923155726.87851-7-kory.maincent@bootlin.com>
 <20211003124900.GI1504958@scaer>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 6/7] boot/edk2: add support to i386
 architecture
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgCgpPbiBTdW4sIDMgT2N0IDIwMjEgMTQ6NDk6MDAgKzAyMDAKIllhbm4gRS4gTU9SSU4i
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cgo+ID4gK2NvbmZpZyBCUjJfVEFSR0VU
X0VESzJfUExBVEZPUk1fT1ZNRl9JMzg2Cj4gPiArCWJvb2wgImkzODYiCj4gPiArCWRlcGVuZHMg
b24gQlIyX2kzODYgfHwgQlIyX3g4Nl82NCAgCj4gCj4gQXMgdGhlcmUgd2FzIGEgYnVpbGQgZmFp
bHVyZSB3aXRoIEJSMl94ODZfNjQ9eSwgSSd2ZSBqdXN0IGRyb3BwZWQgdGhhdAo+IHBvc3NpYmls
aXR5OiBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9JMzg2IGlzIG9ubHkgYXZhaWxhYmxl
IGZvcgo+IEJSMl9pMzg2Lgo+IAo+IElmIHlvdSBoYXZlIHRoZSBvcHBvcnR1bml0eS9uZWVkIHRv
IGxvb2sgaW50byB0aGF0LCBhIGZ1cnRoZXIgcGF0Y2ggaXMKPiBtb3N0IHdlbGNvbWUhCgpGb3Vu
ZCEgVGhlIGlzc3VlIGlzIHRoYXQgRURLMl9BUkNIIGlzIGNvbmZpZ3VyZWQgZm9yIFg2NCBldmVu
IHdoZW4gd2Ugc2VsZWN0CnRoZSBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9JMzg2IGNv
bmZpZ3VyYXRpb24uCj4gPiAgZWxzZSBpZmVxICgkKEJSMl94ODZfNjQpLHkpCj4gPiAgRURLMl9B
UkNIID0gWDY0CgpJIHdpbGwgc2VuZCBhIHBhdGNoIHRvIGZpeCB0aGlzLgoKUmVnYXJkcywKCkvD
tnJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
