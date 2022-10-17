Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1584C43217
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 12:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101C4812AE;
	Mon, 17 Oct 2022 12:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101C4812AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tC6AbCZ9Wi4O; Mon, 17 Oct 2022 12:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F5FD81256;
	Mon, 17 Oct 2022 12:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5FD81256
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 489281BF3DE
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2886C81256
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 12:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2886C81256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxsPWBRRgbr9 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 12:18:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC68681063
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC68681063
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 12:18:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CB9F8E000F;
 Mon, 17 Oct 2022 12:18:44 +0000 (UTC)
Date: Mon, 17 Oct 2022 14:18:43 +0200
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20221017141843.0d7d2963@windsurf>
In-Reply-To: <K2AWJR.ZU8FSKYACOJE1@crapouillou.net>
References: <K2AWJR.ZU8FSKYACOJE1@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666009125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubBO32UQR/4+7rxSqiSEbgYDFi0VbLE5vAUqbbVCsPw=;
 b=ow/Wj48XwmFKMUwuLKd2xbCzzQkUqZFtD+8ucqGVahLsWzoewv+cyknhaSpgqib26HQvcO
 EfFTNoE4865prtsrXbi6UjmNIkzpnm/KwpOMS1bPrKQpW6ELRmxHq1B1ri64TbgHBftc6y
 o2FpkDX0Ns/j9BsFflnQoL+K4Mu2+8BRvhKIy2FrJyZIn3sEFks13/FfyUkiDKV8MIB5Tv
 zr1Yklr7CREl96OFRcJifEtXnCRIHsZph7lxub9bU6I+AK5S5pC+7TVWRyMCkJB5oeDa8I
 5CkIIq7nS5HJ5+4m3sYJE2WpeII29rAzrqtBN4KHSO0W3VFHWfVhO0nMjZdofQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ow/Wj48X
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-10-15
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGF1bCwKClRoaXMgaXMgaGFwcGVuaW5nIG9uIEphbWVzIGF1dG9idWlsZGVyLCB3aG8g
aGFzIGludHJvZHVjZWQgc29tZSBzcGVjaWFsCnJhbmRvbWl6YXRpb24gc3R1ZmYgdGhhdCB3b3Vs
ZCBvbmx5IGFwcGVhciB3aXRoIG1ha2UgNC40LiBJIGhhdmUgYWRkZWQKSmFtZXMgaW4gQ2Mgc28g
dGhhdCBoZSBjYW4gY29tbWVudCBhbmQgc2VlIGlmIGhlIGNhbiByZXByb2R1Y2UgYW5kCnByb3Zp
ZGUgbW9yZSBkZXRhaWxzLgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCgpPbiBNb24sIDE3IE9jdCAy
MDIyIDEyOjE4OjIwICswMTAwClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3
cm90ZToKCj4gSGkgVGhvbWFzLAo+IAo+IEkgY2FuJ3QgcmVwcm9kdWNlLCB3aXRoIHRoaXMgYnVp
bGQncyBkZWZjb25maWcgb24gbGF0ZXN0IG1hc3Rlci4gSXQgCj4ganVzdCBidWlsZHMgZmluZSBo
ZXJlLgo+IAo+IENoZWVycywKPiAtUGF1bAo+IAo+IAo+IExlIGRpbS4sIG9jdC4gMTYgMjAyMiBh
dCAwNTozODoxOSAtMDAwMCwgVGhvbWFzIFBldGF6em9uaSAKPiA8dGhvbWFzLnBldGF6em9uaUBi
b290bGluLmNvbT4gYSDDqWNyaXQgOgo+ID4gSGVsbG8sCj4gPiAKPiA+IEF1dG9idWlsZGVyIGZh
aWx1cmVzCj4gPiA9PT09PT09PT09PT09PT09PT09PQo+ID4gCj4gPiBCZWxvdyBpcyBhIGxpc3Qg
b2YgYnVpbGQgZmFpbHVyZXMgcmVwb3J0ZWQgYnkgdGhlIEJ1aWxkcm9vdCAKPiA+IGF1dG9idWls
ZGVycwo+ID4gaW4gcmVsYXRpb24gdG8gcGFja2FnZXMgb3IgQ1BVIGFyY2hpdGVjdHVyZXMgeW91
IGFyZSBpbiBjaGFyZ2Ugb2YuCj4gPiBQbGVhc2UgaGVscCB1cyBpbXByb3ZpbmcgdGhlIHF1YWxp
dHkgb2YgQnVpbGRyb290IGJ5IGludmVzdGlnYXRpbmcgCj4gPiB0aG9zZQo+ID4gYnVpbGQgZmFp
bHVyZXMgYW5kIHNlbmRpbmcgcGF0Y2hlcyB0byBmaXggdGhlbS4KPiA+IAo+ID4gUmVzdWx0cyBm
b3IgdGhlICdtYXN0ZXInIGJyYW5jaAo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gCj4gPiBCdWlsZCBmYWlsdXJlcyByZWxhdGVkIHRvIHlvdXIgcGFja2FnZXM6Cj4gPiAK
PiA+ICAgICBhcmNoICAgICB8ICAgICAgICAgICAgIHJlYXNvbiAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAKPiA+ICAgICAgICAgICAgICAgICB1cmwKPiA+IC0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiAgICAgYXJtICAgICAgfCAgICAgICAgICB1bXRwcmQtMS42LjIgICAgICAgICAgfCAK
PiA+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2M3Y2U5NzVkMzk4MTkw
ZmMxOTFjY2MwMzgxM2Y4ZWMwYjM0NjRjN2QKPiA+IAo+ID4gCj4gPiBUaGFua3MgZm9yIHlvdXIg
Y29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdCEKPiA+IAo+ID4gLS0KPiA+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldCAgCj4gCj4gCgoKCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25l
ciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
