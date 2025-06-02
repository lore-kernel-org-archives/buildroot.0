Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34764C54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 15:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D327440577;
	Mon,  2 Jun 2025 15:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ_l7EqH1PCa; Mon,  2 Jun 2025 15:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1355D40A53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1355D40A53;
	Mon,  2 Jun 2025 15:02:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77BF51F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E45440AEB
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yibUk07BWoh2 for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 15:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3165340B36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3165340B36
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3165340B36
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 15:02:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 109AA43A44;
 Mon,  2 Jun 2025 15:02:32 +0000 (UTC)
Date: Mon, 2 Jun 2025 17:02:31 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250602170231.4378138d@kmaincent-XPS-13-7390>
In-Reply-To: <20250528184047.3564a9db@windsurf>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
 <20250528-fix_license_toolchain-v1-1-34295630709b@bootlin.com>
 <20250528184047.3564a9db@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeelkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnv
 ggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748876553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWqBV95/OoemclbwfDObySzVMrmlq3WqGTJ3h8WvSTw=;
 b=PQGQ1MQgsKqb4cHnWPnuN3Dlygk8mgitW/4XciLJrma13x67KbHgwmKsndBotL72RMJiNu
 Km0wMXSNFMsjd7NLdZ3AV1dJniB5iyeLw1wPji2TBwK+ROPXI1kb+3jgh70/Kvd5evemU0
 +VHKsWzVE1tt9aJvmjhWvkeCaXR8g3sOAkaJdsEG384dRQW93cWzhkHzQ0iFHlp2qnvBVx
 1sJN9VYwWCP1NsHmmyvNLCnX5y+w9HCX1DOu0nKjuNFyIMrGJMz4HlCK+/+FENeKVp95hw
 lyX/Vk+ggyxTUus4mBh6tWCTw7GbodHXNzwMauXByHCENgagA74fzz3NC2F5yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PQGQ1MQg
Subject: Re: [Buildroot] [PATCH 1/5] toolchain-external: Fix license file
 management after toolchain move
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgV2VkLCAyOCBNYXkgMjAyNSAxODo0MDo0NyArMDIwMCwKVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgoKPiBPbiBXZWQsIDI4IE1heSAy
MDI1IDE2OjU3OjU4ICswMjAwCj4gS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gCj4gPiBUaGUgdG9vbGNoYWluIG1vdmUgdG8gVE9PTENIQUlOX0VYVEVS
TkFMX0RPV05MT0FEX0lOU1RBTExfRElSIHdhcwo+ID4gcHJldmVudGluZyBsaWNlbnNlIGZpbGUg
bWFuYWdlbWVudCBmcm9tIHdvcmtpbmcgcHJvcGVybHkuIENvcHkgbGljZW5zZQo+ID4gZmlsZXMg
YmFjayB0byB0aGUgb3JpZ2luYWwgdG9vbGNoYWluIGRpcmVjdG9yeSB0byByZXNvbHZlIHRoaXMg
aXNzdWUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNl
bnRAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICB0b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFs
L3BrZy10b29sY2hhaW4tZXh0ZXJuYWwubWsgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFp
bi1leHRlcm5hbC9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rCj4gPiBiL3Rvb2xjaGFpbi90b29s
Y2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tayBpbmRleAo+ID4gYzA4YmYw
YTY1My4uMTNkMTk2YTFjOSAxMDA2NDQgLS0tCj4gPiBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0
ZXJuYWwvcGtnLXRvb2xjaGFpbi1leHRlcm5hbC5tayArKysKPiA+IGIvdG9vbGNoYWluL3Rvb2xj
aGFpbi1leHRlcm5hbC9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rIEBAIC0xMDYsNiArMTA2LDEx
Cj4gPiBAQCBkZWZpbmUgVE9PTENIQUlOX0VYVEVSTkFMX01PVkUgcm0gLXJmCj4gPiAkKFRPT0xD
SEFJTl9FWFRFUk5BTF9ET1dOTE9BRF9JTlNUQUxMX0RJUikgbWtkaXIgLXAKPiA+ICQoVE9PTENI
QUlOX0VYVEVSTkFMX0RPV05MT0FEX0lOU1RBTExfRElSKSBtdiAkKEBEKS8qCj4gPiAkKFRPT0xD
SEFJTl9FWFRFUk5BTF9ET1dOTE9BRF9JTlNUQUxMX0RJUikvCj4gPiArCSMgQ29weSBiYWNrIHRo
ZSBsaWNlbnNlIGZpbGVzIG5lZWRlZCBmb3IgbGVnYWwtaW5mbyBnZW5lcmF0aW9uCj4gPiArCSQo
Zm9yZWFjaCBmLCAkKCQoUEtHKV9MSUNFTlNFX0ZJTEVTKSwgXAo+ID4gKwkJW1sgLWQgJCQoZGly
bmFtZSAkKEBEKS8kKGYpKSBdXSB8fCBta2RpciAtcCAkJChkaXJuYW1lCj4gPiAkKEBEKS8kKGYp
KQo+ID4gKwkJY3AgJChUT09MQ0hBSU5fRVhURVJOQUxfRE9XTkxPQURfSU5TVEFMTF9ESVIpLyQo
ZikKPiA+ICQoQEQpLyQoZikKPiA+ICsJKSAgCj4gCj4gSSBhbSB3b25kZXJpbmcgaWYgdGhpcyBp
cyB0aGUgcmlnaHQgc29sdXRpb24uIFRoZSBmYWN0IHRoYXQgd2UgbW92ZQo+IGV2ZXJ5dGhpbmcg
ZnJvbSAkKEBEKSB0byAkKFRPT0xDSEFJTl9FWFRFUk5BTF9ET1dOTE9BRF9JTlNUQUxMX0RJUikg
aXMKPiBraW5kIG9mIHdlaXJkLiBGb3IgYWxsIHBhY2thZ2VzIHdlIGRvbid0ICJtb3ZlIiB0aGlu
Z3MgZnJvbSAkKEBEKSB0bwo+IHRoZSBpbnN0YWxsYXRpb24gbG9jYXRpb24sIHdlIHJhdGhlciBj
b3B5IHN0dWZmLgo+IAo+IFNob3VsZCB3ZSBkbyB0aGUgc2FtZSBoZXJlPyBNYXliZSB3aXRoIGhh
cmQgbGlua3Mgc28gdGhhdCB3ZSBkb24ndCBwYXkKPiB0aGUgZnVsbCBwcmljZSBvZiB0aGUgY29w
eT8KPiAKPiAJcnN5bmMgLWEgLS1oYXJkLWxpbmsKPiAtLWxpbmstZGVzdD0kKFRPT0xDSEFJTl9F
WFRFUk5BTF9ET1dOTE9BRF9JTlNUQUxMX0RJUikgJChARCkKPiAKPiBvciBzb21ldGhpbmcgbGlr
ZSB0aGlzPyBPZiBjb3Vyc2UsIHRoZW4gd2Ugc2hvdWxkIGNoYW5nZSB0aGUgbmFtZSBvZgo+IHRo
ZSBtYWNybyA6LSkKCllvdXIgY2FsbC4gSWYgeW91IHByZWZlciBJIHdpbGwgdXNlIHJzeW5jLgoK
UmVnYXJkcywKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBr
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
