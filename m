Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B599DC54FB3
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 14:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3B9407F2;
	Mon,  2 Jun 2025 14:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7AHjwxSqKdx; Mon,  2 Jun 2025 14:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B2D407C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B2D407C7;
	Mon,  2 Jun 2025 14:49:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADE061F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 14:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F75882050
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 14:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2Ed5_Mzc1fc for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 14:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9257581FC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9257581FC2
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9257581FC2
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 14:49:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D4E743A40;
 Mon,  2 Jun 2025 14:49:19 +0000 (UTC)
Date: Mon, 2 Jun 2025 16:49:17 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250602164917.5f7d59a1@kmaincent-XPS-13-7390>
In-Reply-To: <20250528184617.1f4b9130@windsurf>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
 <20250528-fix_license_toolchain-v1-3-34295630709b@bootlin.com>
 <20250528184617.1f4b9130@windsurf>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeelheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnv
 ggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748875759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2auOZB4yOOXmZQQfwCamN7UbAZrabjsX4sxbNEjQwRs=;
 b=QJXDGBrweHoFc/wHm6DUklI2FbY1iW6LiuZePKWcEKm7GobkxDdCKq7SiEQ5PxqhGIzrOQ
 z6IUiftqTqreKIo7kC98Rb+/wtvuhgSG2g3Q3kvAN5wy03PWmaUcLz/MxrqBiXSkBcrsNm
 WR9xhVb158aAHN0aQp5F7H6g0Bwo3Yd+pCRMak7bgDnBHcurCUSYWGQR72CUBxWydKWL5O
 0Q6eO0XKPYl/JqNpVqEBgPMuQ+3RZL7WSNb3GyU6E5QAfQtBsA0SQ0W8hyYVjQMI0zJde0
 J6OZzCZ9fuu4r2CY3vGk0zU8THz53QJk+IyslPe4vd1D6eicoOsCHf3Q8J1y4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QJXDGBrw
Subject: Re: [Buildroot] [PATCH 3/5] toolchain-external-linaro*: Add support
 for license file description
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

TGUgV2VkLCAyOCBNYXkgMjAyNSAxODo0NjoxNyArMDIwMCwKVGhvbWFzIFBldGF6em9uaSA8dGhv
bWFzLnBldGF6em9uaUBib290bGluLmNvbT4gYSDDqWNyaXQgOgoKPiBPbiBXZWQsIDI4IE1heSAy
MDI1IDE2OjU4OjAwICswMjAwCj4gS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGlu
LmNvbT4gd3JvdGU6CgouLi4KIAo+ID4gMjMxYTRmZjJmM2RjMGYwMTA5MWYzY2EwNzIwZGJjZjEz
NzQ0NDFhNWM5ZmM4MmE0OTAzZDhiMDdlODVkZDhmYQo+ID4gc2hhcmUvaW5mby9tcGMuaW5mbyAr
c2hhMjU2Cj4gPiA5ZDEyNTYzOGZlMGNiMTdiOTg0MzRhZjllZDUyNjMwZmQ0NDM2NTNkODdhODhk
MWU1YmU0MmM5MmFiY2EzNTVmCj4gPiBzaGFyZS9pbmZvL21wZnIuaW5mbyArc2hhMjU2Cj4gPiA4
M2ExMTBkY2MzNjMxMzljNjUyZWVmMGE2ZDgwNjFlOTFkZjNkMGU1NmUzY2I0NmIxNzJlYTZjNjE2
MzgzNjRlCj4gPiBzaGFyZS9pbmZvL3N0YWJzLmluZm8gIAo+IAo+IEkgZ3Vlc3MgdGhvc2UgaW5m
byBmaWxlcyBhcmUgdGhlIGZ1bGwgZG9jdW1lbnRhdGlvbiBvZiBnZGIsIGdjYywgYXMsCj4gZXRj
LiA/IFRoZXkgd2lsbCBjaGFuZ2UgdmVyeSBvZnRlbiwgY29tcGxldGVseSB1bnJlbGF0ZWQgdG8g
dGhlIGxpY2Vuc2UKPiBjaGFuZ2VzLCBubz8KCk1heWJlIGJ1dCB0aGVzZSBhcmUgdGhlIG9ubHkg
ZmlsZSByZWxhdGVkIHRvIGxpY2Vuc2VzIEkgaGF2ZSBmb3VuZCBvbiB0aGVzZQp0b29sY2hhaW5z
LgoKPiA+ICtUT09MQ0hBSU5fRVhURVJOQUxfTElOQVJPX0FBUkNINjRfQkVfTElDRU5TRSA9IG11
bHRpcGxlICAKPiAKPiBJJ20gd29uZGVyaW5nIGlmIHN0YXRpbmcgIm11bHRpcGxlIiByZWFsbHkg
aGVscHMuIFNob3VsZG4ndCB3ZSBhY3R1YWxseQo+IGxpc3QgdGhlIGxpY2Vuc2VzPwoKWW91ciBj
YWxsLCBpZiBzbyBJIHdpbGwgZG8gdGhlIHNhbWUgZm9yIGFsbCBleHRlcm5hbCB0b29sY2hhaW5z
LgogCj4gVGhlIGNvbmNlcm4gSSBoYXZlIGlzIHRoYXQgYSB0b29sY2hhaW4tZXh0ZXJuYWwgcGFj
a2FnZSBpcyByZWFsbHkganVzdAo+IGEgdGFyZ2V0IHBhY2thZ2UsIHNvIHdlIGNhbid0IGRpc3Rp
bmd1aXNoIGVhc2lseSB3aGF0IGdvZXMgb24gdGhlCj4gdGFyZ2V0IHZzLiB3aGF0IHN0YXlzIG9u
IHRoZSBob3N0IGFuZCB0aGF0J3MgcXVpdGUgaW1wb3J0YW50Cj4gbGljZW5zZS13aXNlLiBUaGlz
IGlzIEJUVyB3aHkgd2UgaW50cm9kdWNlZCB0aGUgZ2NjLXJ1bnRpbWUgcGFja2FnZQo+IHdoZW4g
QnVpbGRyb290IGlzIGJ1aWxkaW5nIHRoZSB0b29sY2hhaW4sIGl0IGFsbG93cyB0byBjbGFyaWZ5
IHRoZQo+IGxpY2Vuc2luZyBvZiBob3N0IHBhY2thZ2VzIChob3N0LWdjYywgaG9zdC1iaW51dGls
cywgaG9zdC1nZGIpIHZzLiB0aGUKPiBsaWNlbnNpbmcgb2Ygd2hhdCBnb2VzIGludG8gdGhlIHRh
cmdldCAoZ2NjLXJ1bnRpbWUpLgo+IAo+IFNob3VsZCB3ZSBtYWtlIGV4dGVybmFsIHRvb2xjaGFp
biBwYWNrYWdlcyBob3N0IHBhY2thZ2VzLCBhbmQgaGF2ZSBhCj4gc2luZ2xlIHRhcmdldCBwYWNr
YWdlIGxpa2UgdG9vbGNoYWluLWV4dGVybmFsLXJ1bnRpbWUgdGhhdCB0YWtlcyBjYXJlCj4gb2Yg
Y29weWluZyB0aGluZ3Mgb3ZlciB0byBzdGFnaW5nL3RhcmdldCA/IChCdXQgdGhlbiBpZiB0aGUg
bGljZW5zaW5nCj4gaXMgZGlmZmVyZW50IHBlciB0b29sY2hhaW4gdGhhdCdzIGFubm95aW5nKS4g
T3Igc2hvdWxkIGVhY2ggZXh0ZXJuYWwKPiB0b29sY2hhaW4gcGFja2FnZSBiZSBib3RoIGEgdGFy
Z2V0IGFuZCBhIGhvc3QgcGFja2FnZSA/Cj4gCj4gTWFueSBxdWVzdGlvbnMgZm9yIHdoaWNoIEkg
ZG9uJ3QgaGF2ZSBpbW1lZGlhdGUgYW5zd2VycyBJIG11c3QgYWRtaXQuCgpJIGRvbid0IHJlYWxs
eSBoYXZlIG9waW5pb24gb24gdGhpcywgdGhpcyBpcyBtb3JlIEJ1aWxkcm9vdCBkZXNpZ24gcG9s
aWN5LiBJCndpbGwgbGV0IHlvdSwgbWFpbnRhaW5lcnMsIGRlY2lkZSB0aGUgaW5zdHJ1Y3Rpb25z
LiAKClJlZ2FyZHMsCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
