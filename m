Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90B9C54EE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 09:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43558832D8;
	Mon, 19 Sep 2022 09:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43558832D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EiYNGl9X9CvS; Mon, 19 Sep 2022 09:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72324831AE;
	Mon, 19 Sep 2022 09:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72324831AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA26E1BF3F9
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 09:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E2F541A40
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 09:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2F541A40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDNrB3afmgFp for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 09:46:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA63F4067F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA63F4067F
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 09:46:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CA84240007;
 Mon, 19 Sep 2022 09:46:18 +0000 (UTC)
Date: Mon, 19 Sep 2022 11:46:17 +0200
To: Ignacy =?UTF-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220919114617.67d80b53@windsurf>
In-Reply-To: <20220919091607.a3n36rn44ct3iwuq@zenon.in.qult.net>
References: <20220913093235.wdaiq5lsy3mbcc6u@zenon.in.qult.net>
 <20220917151755.6dfaeb1b@windsurf>
 <20220919091607.a3n36rn44ct3iwuq@zenon.in.qult.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663580779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cy4eSdRov63tsO9q9YL2Ouobi3tTt+wI+91byvydWcM=;
 b=hJuPjvsAVliRupt+caAzRT/fHFIqp4ZQHbZkAuSLvyedl9Zg4DM9oCj2WVe2x6q8q5+Liv
 6MKKh3a/2TCajZies2uhowKtQxDkqMdQPQO9DNIOUBaOwwCrGT8LXL1E/j8xKcVtqZIkQ9
 o+x02qNo+a6h4O00TGWQzybQzT0V1Bi23PiGfVHGGrRqF77sm4REFSOPt/jrIvIm2EB7pm
 Zjm3UxqioWXXwPSt1uhaYyjXcybugnLbY9YsedwbRTBtHNoxSZwyYX8Qbs+bp83UyX6SXq
 AQArrd5W9kXyLx2x/w68RXRhj8W225wFZz4VOz7EoKiZcMrlNKSSjDFaHy9w6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hJuPjvsA
Subject: Re: [Buildroot] [PATCH v3] package/chartjs: bump to version 3.9.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSWduYWN5LAoKT24gTW9uLCAxOSBTZXAgMjAyMiAxMToxNjowNyArMDIwMApJZ25hY3kg
R2F3xJlkemtpIDxpZ25hY3kuZ2F3ZWR6a2lAZ3JlZW4tY29tbXVuaWNhdGlvbnMuZnI+IHdyb3Rl
OgoKPiBZZXMsIHRoaXMgZG93bmxvYWRzIGFuZCBidWlsZHMgYWRkaXRpb25hbCBzdHVmZi4gIEkn
bSBhYm91dCB0byBzZW5kIGEKPiB2NCB3aXRoIGEgcGFja2FnZS1sb2NrLmpzb24gZmlsZSB3aGlj
aCBtYWtlcyB0aGUgZGVwZW5kZW5jaWVzIHN0aWNrIHRvCj4gcHJlY2lzZSB2ZXJzaW9ucywgaW4g
b3JkZXIgdG8gbWFrZSB0aGUgYnVpbGRzIHJlcHJvZHVjaWJsZSAodGhlCj4gcGFja2FnZS1sb2Nr
Lmpzb24gZmlsZSBpcyBsb2NhbGx5IGdlbmVyYXRlZCwgc2luY2UgaXQgaXMgbm90IHByb3ZpZGVk
Cj4gdXBzdHJlYW0pLgo+IAo+IFRoZXJlIGFyZSBhbHJlYWR5IG9uZ29pbmcgZGlzY3Vzc2lvbnMg
YWJvdXQgdGhlIHdheSBzZXZlcmFsIG5ldyBqYXZhc2NyaXB0Cj4gcGFja2FnZXMgKGZvcmdlLCBv
cGVubGF5ZXJzLCB2dWUuanMpIGFyZSB0byBiZSBidWlsdC4gIFNpbmNlCj4gcmV0cmlldmluZyBy
ZWFkeS10by11c2UgZmlsZXMgZnJvbSByZWdpc3RyeS5ucG1qcy5vcmcgaXMgbm90IGFuCj4gb3B0
aW9uLCB0aGVzZSBoYXZlIHRvIGJlIGJ1aWx0IHVzaW5nIGhvc3Qtbm9kZWpzLgo+IAo+IEZvciBt
ZSwgYm90aCB3YXlzIGRvIHRoZSBqb2IsIHBsZWFzZSB0ZWxsIG1lIHdoaWNoIG9uZSB0byB1c2Ug
YW5kIEknbGwKPiBiZSBoYXBweSB3aXRoIGl0LgoKV2UgZGlzY3Vzc2VkIHRoaXMgcGFja2FnZSAo
YW5kIGFub3RoZXIgSlMgbGlicmFyeSB3aXRoIHRoZSBzYW1lIGlzc3VlKQpkdXJpbmcgdGhlIEJ1
aWxkcm9vdCBEZXZlbG9wZXJzIE1lZXRpbmcgdGhpcyB3ZWVrLWVuZC4KClRoZSBjb25zZW5zdXMg
aXMgdGhhdCBmb3Igbm93IHdlIHByZWZlciB0byBjb250aW51ZSB1c2luZyB0aGUKcHJlLWdlbmVy
YXRlZCBKUyBmaWxlcy4gSW5kZWVkLCBidWlsZGluZyBob3N0LW5vZGVqcyBpcyBzdXBlciBsb25n
LCBhbmQKdmVyeSBhbm5veWluZyBqdXN0IHRvIGdldCBhIHNtYWxsIEpTIGxpYnJhcnkgYnVpbHQu
CgpMb25nZXIgdGVybSwgd2hhdCB3ZSB3b3VsZCBsaWtlIGlzOgoKIC0gQmUgYWJsZSB0byB1c2Ug
YSBwcmUtY29tcGlsZWQgTm9kZUpTIGZvciB0aGUgaG9zdCBpbnN0ZWFkIG9mCiAgIGJ1aWxkaW5n
IG91ciBvd24gaG9zdC1ub2RlanMuIFRoaXMgaXMgd2hhdCB3ZSBhbHJlYWR5IGRvIGZvciBSdXN0
LgoKIC0gSW1wbGVtZW50IHZlbmRvcmluZyBzdXBwb3J0IGZvciBOb2RlSlMgcGFja2FnZXMsIGxp
a2Ugd2UgaGF2ZSBkb25lCiAgIGZvciBHbyBhbmQgUnVzdC4gVmVuZG9yaW5nIHN1cHBvcnQgbWVh
bnMgdGhhdCB0aGUgIm5wbSBpbnN0YWxsIiBwYXJ0CiAgIHRoYXQgZG93bmxvYWRzIHRoZSBkZXBl
bmRlbmNpZXMgd291bGQgYmUgZG9uZSBkdXJpbmcgdGhlIGRvd25sb2FkCiAgIHN0ZXAsIGFuZCBh
bGwgZGVwZW5kZW5jaWVzIHdvdWxkIGJlIGludGVncmF0ZWQgaW5zaWRlIHRoZSBwYWNrYWdlCiAg
IHRhcmJhbGwgaW4gRExfRElSLgoKU28gZm9yIHlvdXIgbmV4dCByZXZpc2lvbiBvZiB0aGUgcGF0
Y2gsIHlvdSBjYW4gc3dpdGNoIGJhY2sgdG8gdXNpbmcKdGhlIHByZS1nZW5lcmF0ZWQgSlMgZmls
ZXMuIFRoZW4gaWYgeW91IGFyZSBicmF2ZSBhbmQgd2FudCB0byBnaXZlIGEKdHJ5IGF0IGltcGxl
bWVudGluZyB0aGUgdHdvIHBvaW50cyBtZW50aW9uZWQgYWJvdmUsIGl0IHdvdWxkIGJlIGFtYXpp
bmchCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
