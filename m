Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2F4C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD66A6076F;
	Sat, 19 Apr 2025 14:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMPKC0wWB6v7; Sat, 19 Apr 2025 14:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D780606BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D780606BA;
	Sat, 19 Apr 2025 14:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CFDA22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 885C44056C
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpymLDRwLhpE for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:03:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7978D404D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7978D404D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7978D404D1
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:03:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 39147439CF;
 Sat, 19 Apr 2025 14:03:01 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:03:00 +0200
To: =?UTF-8?B?R2HDq2w=?= PORTAY <gael.portay+rtone@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250419160300.41c99b25@windsurf>
In-Reply-To: <20250415112505.1841541-1-gael.portay+rtone@gmail.com>
References: <20250415112505.1841541-1-gael.portay+rtone@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehgrggvlhdrphhorhhtrgihodhrthhonhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtt
 hhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745071381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Y0s4lI1yCScJc6LG28tXEvmlRnVIl4tjhwCemwj+Is=;
 b=ILOTSYd2azVajgsgNldcIkYYGSHLnzT2MPafU7Uhben1f0F4MULmWVosnKsMIDhphg9QbP
 E/zNDYJm1J12v4GhSacXz3HTV2IFJm8+wgAxm2OTZjgDC+qLi6NfeIe0WZXe8DE3Pazjx6
 /WdxtW1MmP+c3/T9i8VhR6ar8I0ix4hdTy6OkArTZFh0ZpqUYFaVMV9bHbw9M/nLE3KOgm
 m7sCKajigFi7l/XU0rl+R+g0jnCoBYdub0yb2GoahWtcqG8uf/7A2J2o66jnshD4/g7baY
 b/ZrTx/7m7CU2oDTbn2t3rKiyJNzH28kJhvcSBgZzJPXG0+RNoI/PKnyegHx7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ILOTSYd2
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/gen-bootlin-toolchains:
 allows armv8-a CPU to use armv7-a toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNSBBcHIgMjAyNSAxMzoyNTowNSArMDIwMApHYcOrbCBQT1JUQVkgPGdhZWwucG9y
dGF5K3J0b25lQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFRoZSBBUk1WNy1BIHRvb2xjaGFpbnMgYXJl
IGNhcGFibGUgdG8gY29tcGlsZSBiaW5hcmllcyBmb3IgQVJNdjgtQSBDUFUKPiBpbiBBQXJjaDMy
IGV4ZWN1dGlvbiBzdGF0ZS4KPiAKPiBUaGlzIGFkZHMgdGhlIEJSMl9BUk1fQ1BVX0FSTVY4QSBv
cHRpb24gaW4gdGhlICdjb25kaXRpb25zJyB0byBhbGxvdwo+IEFSTVY4LUEgQ1BVIHN1Y2ggYXMg
Q29ydGV4LUE1MyBvciBDb3J0ZXgtQTcyIHRvIHVzZSBBUk1WNy1BIHRvb2xjaGFpbnMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20+
CgpUaGFua3MsIGFwcGxpZWQhCgo+IEluIGFuIGF0dGVtcHQgdG8gbW92ZSB0aGUgUmFzcGJlcnJ5
IGRlZmNvbmZpZ3MgdG8gdGhlIEJvb3RsaW4gZXh0ZXJuYWwKPiB0b29sY2hhaW4gKGdsaWJjLXN0
YWJsZSksIEkgZmlndXJlZCBvdXQgdGhhdCB0aGUgQVJNNjQgQ1BVcyBpbiAzMi1iaXRzCj4gaGF2
ZSBubyBCb290bGluIHRvb2xjaGFpbiBhdmFpbGFibGUgYmVjYXVzZSBvZiBhIGxhY2sgZm9yIHRo
ZSBsaWtld2lzZQo+ICdjb25kaXRpb25zJzogQlIyX0FSTV9DUFVfQVJNVjdBIHx8IEJSMl9BUk1f
Q1BVX0FSTVY4QQo+IAo+IEkgYW0gYSBsaXR0bGUgYml0IGNvbmNlcm5lZCBhYm91dCB0aGUgY2hh
bmdlIHByb3Bvc2UgaW4gdGhpcyBwYXRjaCBhcwo+IHRoZSAnY29uZGl0aW9ucycgY291bGQgYmUg
dXNlZCB0byBnZW5lcmF0ZSB0aGUgdGVzdCBpZiBubyAndGVzdF9vcHRpb25zJwo+IGlzIGRlZmlu
ZWQsIGFuZCB0aGF0IGNhbm5vdCBzcGxpdCB0aGUgZm9sbG93aW5nICdjb25kaXRpb25zJyBpbnRv
IHNpbmdsZQo+IG9wdGlvbiBwaWVjZXM6Cj4gCj4gCShCUjJfQVJNX0NQVV9BUk1WN0EgJiYgQlIy
X0FSTV9FQUJJSEYpIHx8IEJSMl9BUk1fQ1BVX0FSTVY4QQo+IAo+IFRoaXMgaXMgdGhlIHBhcnQg
b2YgY29kZSB0aGF0IHdvdWxkIG5vdCB3b3JrIGlmICd0ZXN0X29wdGlvbnMnIGlzIHVuc2V0Ogo+
IAo+IAlpZiAndGVzdF9vcHRpb25zJyBpbiBhcmNoZXNbc2VsZi5hcmNoXToKPiAJICAgIHRlc3Rf
b3B0aW9ucyA9IGFyY2hlc1tzZWxmLmFyY2hdWyd0ZXN0X29wdGlvbnMnXQo+IAllbHNlOgo+IAkg
ICAgdGVzdF9vcHRpb25zID0gYXJjaGVzW3NlbGYuYXJjaF1bJ2NvbmRpdGlvbnMnXQo+IAlmb3Ig
b3B0IGluIHRlc3Rfb3B0aW9uczoKPiAJICAgIGlmIG9wdC5zdGFydHN3aXRoKCIhIik6Cj4gCSAg
ICAgICAgZi53cml0ZSgiICAgICAgICAjICVzIGlzIG5vdCBzZXRcbiIgJSBvcHRbMTpdKQo+IAkg
ICAgZWxzZToKPiAJICAgICAgICBmLndyaXRlKCIgICAgICAgICVzPXlcbiIgJSBvcHQpCj4gCj4g
SG93ZXZlciwgdGhpcyBraW5kIG9mICJjb21wbGV4IiAnY29uZGl0aW9ucycgd2l0aCBzdWNoIENQ
VSBmZWF0dXJlCj4gb3B0aW9ucyByZXF1aXJlcyB0byBnZXQgb3ZlcnJpZGVuIGJ5IHRoZSAndGVz
dF9vcHRpb25zJywgcmlnaHQ/CgpJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLCBidXQgSSBiZWxp
ZXZlIHlvdSdyZSByaWdodCB0aGF0IHRob3NlCmNvbXBsZXggY2FzZXMgc2ltcGx5IF9tdXN0XyBo
YXZlIHRlc3RfY29uZGl0aW9ucyBkZWZpbmVkLiBJIHRob3VnaHQgYQpiaXQgYWJvdXQgdGhpcywg
YW5kIGRpZG4ndCBzZWUgYSByZWFzb25hYmx5IHNpbXBsZSBzb2x1dGlvbiBvdGhlciB0aGFuCndo
YXQgeW91IGhhdmUgcHJvcG9zZWQuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
