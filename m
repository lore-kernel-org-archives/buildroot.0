Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BF9740C3D;
	Wed,  6 Jul 2022 21:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BF9740C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNtpEJv_sNgo; Wed,  6 Jul 2022 21:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CADF40134;
	Wed,  6 Jul 2022 21:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CADF40134
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E40E1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3496D41822
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3496D41822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBrX1M9oMVnH for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:38:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AEB417D9
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0AEB417D9
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:38:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9FC9C20000A;
 Wed,  6 Jul 2022 21:38:08 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:38:07 +0200
To: =?UTF-8?B?S8O2cnk=?= Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20220706233807.00b64640@windsurf>
In-Reply-To: <20220629075600.1506639-1-kory.maincent@bootlin.com>
References: <20220629075600.1506639-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657143488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AORP5/YRLQ+1edl7170EURhDger8an17gYcliuGK9dE=;
 b=R5X2vTg8GZF9itPQIh9T2p7luDQ57LMjnWrsYGD6Ef95Ytlh50vf3a6j6b65u3QRIkzW21
 l7XvFeoNZGCdsN+uosMPJ6vUZOOwxmunILyXVLy9Ee6KAxS7cnVathvHid8yu1XuKWKPtk
 /787DgMef+l8WAW62dEdZS26QUrqKggaegr3aZ4vnU49C8OYnxto1HF8mZajXud2RCN7iG
 jGtJ6lX/KP4JGxXOB6KW1J2B/a3A4ovW7HxHQRITarXjXGQMN3elaAeFMmuHbR32N+Z42V
 v60aBCMYn/fo43wUDJDh+nJ1NvDx7z2HOQKT6ZWV4h49aVREwMQlevBBimhLaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R5X2vTg8
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: Add optee-os custom
 tarball handler
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
Cc: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyOSBKdW4gMjAyMiAwOTo1NTo1OSArMDIwMApLw7ZyeSBNYWluY2VudCB2aWEgYnVp
bGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IEZyb206IEtvcnkgTWFp
bmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gCj4gQWRkIGEgaGFuZGxlciB0byBt
YWtlIHN1cmUgdGhhdCBhIHJhbmRvbSBjb25maWd1cmF0aW9uIHdpdGggZW1wdHkgdGFyYmFsbAo+
IGxvY2F0aW9uIGRvZXNuJ3QgZmFpbC4gSXQgcmV2ZXJ0cyB0byBCUjJfVEFSR0VUX09QVEVFX09T
X0xBVEVTVCBpbiB0aGF0Cj4gY2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLb3J5IE1haW5jZW50
IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPgo+IC0tLQo+ICB1dGlscy9nZW5yYW5kY29uZmln
IHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCkFwcGxpZWQg
dG8gbWFzdGVyIHdpdGggYSBzbGlnaHRseSB0d2Vha2VkIGNvbW1pdCBtZXNzYWdlLiBUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
