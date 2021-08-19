Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0950C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:26:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E1360FE8
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9E1360FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A27D4011B;
	Thu, 19 Aug 2021 21:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tq3FWOwI6RcG; Thu, 19 Aug 2021 21:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1F524011D;
	Thu, 19 Aug 2021 21:26:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69CCD1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58BD442514
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpgVeVczojr9 for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:26:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3955407A4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:26:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 20817C0005;
 Thu, 19 Aug 2021 21:26:32 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:26:30 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20210819232630.57caadc9@windsurf>
In-Reply-To: <20210709094925.1605675-1-kory.maincent@bootlin.com>
References: <20210709094925.1605675-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] boot/arm-trusted-firmware: Update FIP
 image generation with BL33_CFG option
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gS8O2cnksCgpPbiBGcmksICA5IEp1bCAyMDIxIDExOjQ5OjI0ICswMjAwCktvcnkgTWFp
bmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBVcGRhdGUgdGhlIEZJ
UCBpbWFnZSBnZW5lcmF0aW9uIGJ5IGFkZGluZyB0aGUgQkwzM19DRkcgcGFyYW1ldGVyLgo+IFRo
aXMgaXMgbmVlZGVkIGZvciB0aGUgU1QgdmVyc2lvbiBvZiBBVEYuCj4gCj4gU2lnbmVkLW9mZi1i
eTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiAtLS0KPiAgYm9v
dC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9Db25maWcuaW4gICAgICAgICAgICAgICB8IDkgKysrKysr
KysrCj4gIGJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsg
fCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvQ29uZmlnLmluIGIvYm9vdC9hcm0tdHJ1
c3RlZC1maXJtd2FyZS9Db25maWcuaW4KPiBpbmRleCA3ZTQ2YTEwMjcwLi44MGY2MTYxNTk3IDEw
MDY0NAo+IC0tLSBhL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvQ29uZmlnLmluCj4gKysrIGIv
Ym9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9Db25maWcuaW4KPiBAQCAtMTMzLDYgKzEzMywxNSBA
QCBjb25maWcgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9VQk9PVF9CTDMzX0lNQUdF
Cj4gIAkgIE5hbWUgb2YgdGhlIFUtQm9vdCBCTDMzIGltYWdlIHRvIGluY2x1ZGUgaW4gQVRGLCBp
dCBtdXN0Cj4gIAkgIGhhdmUgYmVlbiBpbnN0YWxsZWQgdG8gQklOQVJJRVNfRElSIGJ5IHRoZSBV
LUJvb3QgcGFja2FnZS4KPiAgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX1VCT09UX0JMMzNfSU1BR0VfQ0ZHCj4gKwlzdHJpbmcgIlUtQm9vdCBCTDMzIGltYWdlIGRl
dmljZXRyZWUgbmFtZSIKPiArCWRlZmF1bHQgIiIKPiArCWhlbHAKPiArCSAgTmFtZSBvZiB0aGUg
VS1Cb290IEJMMzMgaW1hZ2UgZGV2aWNldHJlZSB0byBpbmNsdWRlIGluIEFURi4KPiArCSAgSXQg
bXVzdCBoYXZlIGJlZW4gaW5zdGFsbGVkIHRvIEJJTkFSSUVTX0RJUiBieSB0aGUgVS1Cb290Cj4g
KwkgIHBhY2thZ2UuCj4gKwkgIE5lZWRlZCBmb3IgdGhlIHN0bTMybXAxIHBsYXRmb3JtLgo+ICsK
PiAgZW5kaWYKPiAgCj4gIGNvbmZpZyBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0VE
SzJfQVNfQkwzMwo+IGRpZmYgLS1naXQgYS9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10
cnVzdGVkLWZpcm13YXJlLm1rIGIvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3Rl
ZC1maXJtd2FyZS5tawo+IGluZGV4IDFmMDhmNWRhYmIuLjlmYzhiNTFhODAgMTAwNjQ0Cj4gLS0t
IGEvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0tdHJ1c3RlZC1maXJtd2FyZS5tawo+ICsr
KyBiL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsKPiBA
QCAtOTIsNiArOTIsMTAgQEAgZW5kaWYKPiAgaWZlcSAoJChCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFX1VCT09UX0FTX0JMMzMpLHkpCj4gIEFSTV9UUlVTVEVEX0ZJUk1XQVJFX1VCT09U
X0JJTiA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1VC
T09UX0JMMzNfSU1BR0UpKQo+ICBBUk1fVFJVU1RFRF9GSVJNV0FSRV9NQUtFX09QVFMgKz0gQkwz
Mz0kKEJJTkFSSUVTX0RJUikvJChBUk1fVFJVU1RFRF9GSVJNV0FSRV9VQk9PVF9CSU4pCj4gK0FS
TV9UUlVTVEVEX0ZJUk1XQVJFX1VCT09UX0JJTl9DRkcgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9VQk9PVF9CTDMzX0lNQUdFX0NGRykpCj4gK2lmbmVx
ICgkKEFSTV9UUlVTVEVEX0ZJUk1XQVJFX1VCT09UX0JJTl9DRkcpLCkKPiArQVJNX1RSVVNURURf
RklSTVdBUkVfTUFLRV9PUFRTICs9IEJMMzNfQ0ZHPSQoQklOQVJJRVNfRElSKS8kKEFSTV9UUlVT
VEVEX0ZJUk1XQVJFX1VCT09UX0JJTl9DRkcpCj4gK2VuZGlmCgpXaGF0IEkgZG9uJ3QgbGlrZSBh
Ym91dCB0aGlzIGlzIHRoYXQgKGZvciBub3cpIHRoaXMgQkwzM19DRkcgdmFyaWFibGUKaXMgc3Bl
Y2lmaWMgdG8gdGhlIFNUIGZvcmsgb2YgVEYtQS4gSWYgd2Ugc3RhcnQgYWRkaW5nIHN1cHBvcnQg
Zm9yIGFsbAp0aGUgcmFuZG9tIHZhcmlhYmxlcyB0aGF0IHZlbmRvci1zcGVjaWZpYyBmb3JrcyBj
cmVhdGUsIGl0J3Mgc29vbiBnb2luZwp0byBiZSBhIG5pZ2h0bWFyZS4KCkluc3RlYWQgb2YgdGhp
cywgY291bGQgeW91IHRyeSB0byBhZGQgc29tZXRoaW5nIGxpa2U6CgpCUjJfVEFSR0VUX0FSTV9U
UlVTVEVEX0ZJUk1XQVJFX0FERElUSU9OQUxfVkFSSUFCTEVTPSJCTDMzX0NGRz0kKEJJTkFSSUVT
X0RJUikveW91ci1kdGIuZHRiIgoKYW5kIHNlZSBpZiB0aGF0IHdvcmtzID8KCkJlc3QgcmVnYXJk
cywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxp
bgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
