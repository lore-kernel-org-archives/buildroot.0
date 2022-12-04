Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F37DC4708D
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 13:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9E5281852;
	Sun,  4 Dec 2022 13:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9E5281852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6H1EaoscZAx; Sun,  4 Dec 2022 13:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBD081831;
	Sun,  4 Dec 2022 13:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FBD081831
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 656D91BF239
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F8540354
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 13:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F8540354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WU8WYUNiswF5 for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 13:05:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2571740012
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2571740012
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 13:05:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1ED69C0006;
 Sun,  4 Dec 2022 13:05:35 +0000 (UTC)
Date: Sun, 4 Dec 2022 14:05:34 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20221204140534.5f6d0539@windsurf>
In-Reply-To: <20221201183337.1588407-2-vincent.stehle@arm.com>
References: <20221201183337.1588407-1-vincent.stehle@arm.com>
 <20221201183337.1588407-2-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670159136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5FDf3uIQHpmF3uhDTxOfBJ/SBdptZVmDTE7aypa2ws=;
 b=C6unQXAmtuvIgjba6zNh3ermDBY/dTwZhpBZJVzc03tkQod3qxpLoz8peKTP8TNuIl6T8L
 g+JEZPPdJjzr7LzDalI09VAqhg2h9ei1XZcoYuVeHI3nwbF47nQ81ztk9umlFQzQaEvAmk
 uZado2T22wh4S7Fy28jkPBtLTJDJ8hxanQXf+ZJWgzdnj2hS8QPxxct3LOrfSz9CEkP5P2
 Gnh4xiWF663AbDh4+PbfpPCtDjMaHv81Sfk/Lv2MSZQOIv7jakMnSTqphRTaiN4QqY65jO
 kMRKSwae/16bA/pPpI8eDYF6O6DOcqwHbcMVtdrz7wF4RwDX1wa6VT8+U34eZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C6unQXAm
Subject: Re: [Buildroot] [PATCH 1/3 next] package/edk2-platforms: bump in
 sync with edk2-stable202208
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

T24gVGh1LCAgMSBEZWMgMjAyMiAxOTozMzozNSArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBCdW1wIHRoZSBlZGsyLXBsYXRmb3JtcyBjb21t
aXQgdG8gdGhlIG9uZSBjb3JyZXNwb25kaW5nIHRvIHZlcnNpb24KPiBlZGsyLXN0YWJsZTIwMjIw
OCBvZiBlZGsyLCBiYXNlZCBvbiB0aGUgdGltZXN0YW1wcy4KPiAKPiBOb3RlOiB0aGUgTWFydmVs
bCBBcm1hZGEgRGV2aWNldHJlZSBmaWxlcyBoYXZlIGJlZW4gbW92ZWQgb3V0IG9mCj4gZWRrMi1w
bGF0Zm9ybXMgYnkgY29tbWl0IDRiNTNkYTZiMTJhOCAoIk1hcnZlbGwvQXJtYWRhN2s4azogUmVt
b3ZlIGRldmljZQo+IHRyZWUgc291cmNlcyBmcm9tIGVkazItcGxhdGZvcm1zIikgYW5kIHRoZXkg
YXJlIG5vdyBpbiBlZGsyLW5vbi1vc2kuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IENjOiBEaWNrIE9sc3NvbiA8aGlAc2Vuemls
bGEuaW8+Cj4gLS0tCgpBcHBsaWVkIHRvIG5leHQsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
