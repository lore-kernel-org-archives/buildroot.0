Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95500C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:15:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC577613C8
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 15:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC577613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D7C427A0;
	Mon,  4 Oct 2021 15:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khS6MR_OuNlD; Mon,  4 Oct 2021 15:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31FC4273E;
	Mon,  4 Oct 2021 15:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 525D51BF2FE
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 428D584BCA
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 15:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FY0MCPzB7Ev5 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 15:15:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB8784BC6
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 15:15:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 852F513F80A;
 Mon,  4 Oct 2021 17:15:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633360518;
 bh=Alff2y/vJZMPqNnGMdZ+r7W9uHBOj68QTN9Cd4ZUN+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uPms0uj190k66lAEktjypYBbbOHeCqR+pti6RsROC0xJZyUEN81sG8mQHzj3s9vsV
 Na64dsWwWiDBbKY4S10PIWBcwAoSQmPyvP3LwPKkUNbZeV/TrxqlY+UFnGkXiKP63V
 30h5rSxE6GAPgv89d4fKSXFI0oa4lV3yUe8380pOlVNGUdVq4tjdCe8laJgZ79g0Eb
 h0DseqD77PBknBzkRjeLH6IrTHkic3O8E4mQXBX/ahM7NOccyVApyHmcR9xKUmWyst
 FzClpFszH4FEvDXemBXuuasgN4WQkme9BP/iHvyz4rXxFNLs29xJ2gik48Hg+obWy2
 R4e11mL/vyqZQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Oct 2021 17:15:12 +0200
Date: Mon, 4 Oct 2021 17:15:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211004151512.GD1504958@scaer>
References: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
 <20211004090036.65722dda@windsurf>
 <CAJPV9MpbeTF4vGvOtP15bNGGLbt8StceDxYWs8LLebgyEr=gvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJPV9MpbeTF4vGvOtP15bNGGLbt8StceDxYWs8LLebgyEr=gvg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] system: add optional rsync with preserved
 permissions
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

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMTAtMDQgMTA6MDggKzAzMDAsIEpvc8OpIFBla2thcmluZW4g
c3Bha2UgdGh1c2x5Ogo+IE9uIE1vbiwgT2N0IDQsIDIwMjEgYXQgMTA6MDAgQU0gVGhvbWFzIFBl
dGF6em9uaSA8IFsxXXRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+ICAgT24g
TW9uLMKgIDQgT2N0IDIwMjEgMDk6NDE6NDMgKzAzMDAKPiAgIEpvc8OpIFBla2thcmluZW4gPCBb
Ml1qb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4gd3JvdGU6Cj4gCj4gICA+ICtjb25maWcgQlIy
X1JPT1RGU19PVkVSTEFZX1BSRVNFUlZFRF9QRVJNSVNTSU9OCj4gICA+ICvCoCDCoCDCoHN0cmlu
ZyAiUHJlc2VydmUgcGVybWlzc2lvbnMgb2Ygb3ZlcmxheSBkaXJlY3RvcmllcyIKPiAgID4gK8Kg
IMKgIMKgZGVwZW5kcyBvbiBCUjJfUk9PVEZTX09WRVJMQVkKPiAgID4gK8KgIMKgIMKgZGVmYXVs
dCAibiIKPiAgID4gK8KgIMKgIMKgaGVscAo+ICAgPiArwqAgwqAgwqAgwqBQcmVzZXJ2ZSBmaWxl
IHBlcm1pc3Npb25zIG9mIHNwZWNpZmllZCBvdmVybGF5Lgo+ICAgSm9zw6k6IGhhdmUgeW91IGNv
bnNpZGVyZWQgdXNpbmcgYSBwZXJtaXNzaW9uIHRhYmxlIHRvIGZpeHVwIHRoZQo+ICAgcGVybWlz
c2lvbnMgPwo+IAo+IE5ldmVyIGhlYXJkIG9mIGl0LAoKSXQncyBpcmdodCB0aGVyZSBpbiB0aGUg
bWFudWFsOgoKICAgIDkuNS4xLiBTZXR0aW5nIGZpbGUgcGVybWlzc2lvbnMgYW5kIG93bmVyc2hp
cCBhbmQgYWRkaW5nIGN1c3RvbSBkZXZpY2VzIG5vZGVzCiAgICBodHRwczovL2J1aWxkcm9vdC5v
cmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNyb290ZnMtY3VzdG9tCgogICAgQ2hhcHRl
ciAyNS4gTWFrZWRldiBzeW50YXggZG9jdW1lbnRhdGlvbgogICAgaHR0cHM6Ly9idWlsZHJvb3Qu
b3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjbWFrZWRldi1zeW50YXgKCjstKQoKPiBi
dXQgYWZ0ZXIgYSBxdWljayBjaGVjayBpdCBsb29rcyBsaWtlCj4gaXQgaXMgYSBiZXR0ZXIgYW5z
d2VyIHRvIG15IHByb2JsZW0sIHNpbmNlIEkgZm91bmQgdGhhdCwgZm9yCj4gZXhhbXBsZSwgaWYg
SSB3YW50IHRvIHByb3ZpZGUsIGFuIGF1dGhvcml6ZWRfa2V5cyBmaWxlIG93bmVkCj4gYnkgcm9v
dCwgd2l0aCA2MDAgcGVybWlzc2lvbnMsIHJzeW5jIGNvcGllcyB0aGUgZmlsZSB3aXRoIDY0NCwK
PiB3aGljaCBpcyBjbG9zZXIsIGJ1dCBub3QgcGVyZmVjdC4KCkdpdmVuIHlvdXIgZmVlZGJhY2ss
IGFuZCBUaG9tYXMnIGFuZCBteSBjb21tZW50cywgSSd2ZSB0aGVuIG1hcmtlZCB5b3VyCnBhdGNo
IGFzIHJlamVjdGVkIGluIFBhdGNod29yay4KClRoYW5rcyEKClJlZ2FyZHMsCllhbm4gRS4gTU9S
SU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFs
LVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwK
fCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAg
IHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4t
LS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8v
eW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAg
Y29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
