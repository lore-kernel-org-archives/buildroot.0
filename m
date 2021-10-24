Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE2CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:03:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A3E160E73
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A3E160E73
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C58E80F15;
	Sun, 24 Oct 2021 13:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuYakt18AaRU; Sun, 24 Oct 2021 13:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A82380F12;
	Sun, 24 Oct 2021 13:03:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEAEF1BF48C
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAFBD402C0
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xT3priJoYho for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:02:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C035340237
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:02:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B6F6F240006;
 Sun, 24 Oct 2021 13:02:56 +0000 (UTC)
Date: Sun, 24 Oct 2021 15:02:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211024150255.292cc135@windsurf>
In-Reply-To: <20211024052852.3999292-1-james.hilliard1@gmail.com>
References: <20211024052852.3999292-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-utils: only overwrite newer
 for per-package-rsync
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
Cc: Herve Codina <herve.codina@bootlin.com>, "Yann
 E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpPbiBTYXQsIDIzIE9jdCAyMDIxIDIzOjI4OjUyIC0wNjAwCkphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gQ3VycmVudGx5IGR1
cmluZyB0YXJnZXQtZmluYWxpemUgd2UgcnN5bmMgcGFja2FnZXMgaW4gc29ydGVkIG9yZGVyLAo+
IGhvd2V2ZXIgaWYgb25lIHJlYnVpbGRzIGEgcGFja2FnZSB0aGF0IGhhcyByZXZlcnNlIGRlcGVu
ZGVuY2llcwo+IHRoZSByZWJ1aWx0IHZlcnNpb24gbWF5IGdldCBvdmVyd3JpdHRlbiBieSB0aGUg
b2xkIHZlcnNpb24gZnJvbSB0aGUKPiByZXZlcnNlIGRlcGVuZGVuY3kgaWYgdGhlIHJldmVyc2Ug
ZGVwZW5kZW5jeSBnZXRzIHJlY3luZWQgYWZ0ZXIKPiB0aGUgcmVidWlsdCBwYWNrYWdlKGJhc2Vk
IG9uIGFscGhhYmV0aWNhbCBzb3J0aW5nKSBkdXJpbmcgdGhlCj4gdGFyZ2V0LWZpbmFsaXplIHN0
YWdlLgo+IAo+IFRvIHByZXZlbnQgdGhpcyBvbmx5IGNvcHkgZmlsZXMgbmV3ZXIgdGhhbiB0aGVp
ciB0YXJnZXRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPgoKVGhlcmUncyBhbiBlbnRpcmUgcGF0Y2ggc2VyaWVzIGZyb20gSGVy
dsOpIENvZGluYSBhdApodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMTA4MTcw
ODM5MzAuMzcxODcxMS0xLWhlcnZlLmNvZGluYUBib290bGluLmNvbS8KdG8gYWRkcmVzcyB0aGlz
IGlzc3VlLCBhbmQgaXQgaXMgbXVjaCBtb3JlIGludm9sdmVkLiBQYXJ0cyBvZiB0aGUKc2VyaWVz
IGhhdmUgYmVlbiBhcHBsaWVkLCBidXQgbm90IGFsbCBvZiBpdCwgYXMgdGhlcmUgYXJlIHNvbWUK
cmVtYWluaW5nIGlzc3Vlcy4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
