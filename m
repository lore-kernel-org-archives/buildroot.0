Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8682C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6382C81420;
	Sun, 12 Feb 2023 20:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6382C81420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwMl7msaWp9F; Sun, 12 Feb 2023 20:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8CB581415;
	Sun, 12 Feb 2023 20:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8CB581415
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 792C71BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6026181415
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6026181415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gF5g5eAcI_RW for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:49:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA018140D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA018140D
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:49:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B0F065FFAA;
 Sun, 12 Feb 2023 21:49:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:49:52 +0100
Date: Sun, 12 Feb 2023 21:49:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Message-ID: <20230212204952.GW2796@scaer>
References: <20230211224755.13044-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211224755.13044-1-francois.dugast.foss@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676234994;
 bh=6KxsF16YzUvnXLn6ame/doJl0pd6iB5T1Uxr7zpC814=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XKaOQCg9yLZJWX3IySHbAI8yG/d3T8TvffApFOC4gYnUCrV+JBigNuR1mIqEENy+6
 95aidilroKqL7RjpQu3a7C+DgHwhtJkhb20b2cv7BpqISY+mWDM8eHaJf3pLZofP/h
 Uw2z/4PapZ6eDHpwH/MSMRa8/zbNIodZIPD+0GPSBQS+Jxzfdu3ACbG2oNM0y9dfND
 h14zFVN0Yieki8d/sObvMbKdwTS7KFYEz2dxFUOj0/BER/osLQ1bv8Yq07oO7bEMgb
 PO5i1izCQcsKlpyqnC7+n3d431U+2c1DNgb6dNXhAffSl7JWSf4ck+QlH9rt9cFAox
 6F8u/NJnNcInQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XKaOQCg9
Subject: Re: [Buildroot] [PATCH 1/1] board/visionfive2: add link to
 documentation
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTAyLTExIDIzOjQ3ICswMTAwLCBGcmFuY29pcyBEdWdh
c3Qgc3Bha2UgdGh1c2x5Ogo+IEFkZCBhIGxpbmsgdG8gUlZzcGFjZSBEb2N1bWVudGF0aW9uIENl
bnRlciwgd2hpY2ggZGlkIG5vdCBleGlzdAo+IHdoZW4gcmVhZG1lLnR4dCB3YXMgZmlyc3Qgc3Vi
bWl0dGVkLiBJdCBwcm92aWRlcyBkYXRhc2hlZXQsIHF1aWNrCj4gc3RhcnQsIHNjaGVtYXRpY3Ms
IGFuZCBzbyBvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lz
LmR1Z2FzdC5mb3NzQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgYm9hcmQvdmlzaW9uZml2ZTIvcmVhZG1lLnR4
dCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9ib2FyZC92aXNpb25maXZlMi9yZWFkbWUudHh0IGIvYm9hcmQvdmlzaW9uZml2ZTIvcmVh
ZG1lLnR4dAo+IGluZGV4IDJkYTk4ZjM4NDcuLjE5MjRjYmMxMmIgMTAwNjQ0Cj4gLS0tIGEvYm9h
cmQvdmlzaW9uZml2ZTIvcmVhZG1lLnR4dAo+ICsrKyBiL2JvYXJkL3Zpc2lvbmZpdmUyL3JlYWRt
ZS50eHQKPiBAQCAtNCw2ICs0LDggQEAgU3RhcmZpdmUgVmlzaW9uRml2ZTIKPiAgVGhlIFZpc2lv
bkZpdmUyIGlzIGEgbG93LWNvc3QgUklTQy1WIDY0LWJpdCBiYXNlZCBwbGF0Zm9ybSwgcG93ZXJl
ZCBieSBhCj4gIFN0YXJmaXZlIEpINzExMCBwcm9jZXNzb3IuCj4gIAo+ICtodHRwczovL2RvYy1l
bi5ydnNwYWNlLm9yZy9Eb2NfQ2VudGVyL3Zpc2lvbmZpdmVfMi5odG1sCj4gKwo+ICBIb3cgdG8g
YnVpbGQKPiAgPT09PT09PT09PT09Cj4gIAo+IC0tIAo+IDIuMzAuMgo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklC
Qk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMg
NTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxl
LyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8g
fCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
