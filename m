Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BFCC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4D860E90
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 21:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E4D860E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30F09605EC;
	Sat, 24 Jul 2021 21:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qj5BT-HlXxDC; Sat, 24 Jul 2021 21:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81961605ED;
	Sat, 24 Jul 2021 21:36:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2E351BF2AA
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC91883376
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgXYWFXgVgic for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 21:36:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89ACD831CB
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 21:36:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6956A240002;
 Sat, 24 Jul 2021 21:36:29 +0000 (UTC)
Date: Sat, 24 Jul 2021 23:36:27 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210724233627.25e8ab13@windsurf>
In-Reply-To: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
References: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Fix restorecond startup for sysvinit builds
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gRnJpLCAyMyBKdWwgMjAyMSAxNTo0Nzo1NCArMDMwMApKb3PDqSBQZWtrYXJpbmVuIDxqb3Nl
LnBla2thcmluZW5AdW5pa2llLmNvbT4gd3JvdGU6Cgo+IEN1cnJlbnRseSByZXN0b3JlY29uZCBp
bml0IHNjcmlwdCBzb3VyY2VzIHRoZQo+IGZpbGUgL2V0Yy9yYy5kL2luaXQuZC9mdW5jdGlvbnMs
IHRoYXQgaW4gc29tZQo+IGluaXQgc3lzdGVtcywgbGlrZSBzeXN2aW5pdCwgbWF5IG5vdCBiZSBh
dmFpbGFibGUsCj4gaG93ZXZlciwgaXQgZG9lc24ndCBhY3R1YWxseSB1c2VzIGFueSBmdW5jdGlv
bgo+IGZyb20gaXQuCj4gCj4gQWxzbywgdGhlIGluaXQgc2NyaXB0IHVzZXMgZGFlbW9uLCB0aGF0
IGlzIG5vdAo+IG1hcmtlZCBhcyBhIGRlcGVuZGVuY3kuIFNvIHRoaXMgcGF0Y2hlcyBhZGRzIGl0
cwo+IGRlcGVuZGVuY3kgdG8gZ3VhcmFudGVlIGl0J3MgcHJlc2VudCBpbiB0aGUgYnVpbGQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtp
ZS5jb20+CgpUaGFua3MgZm9yIHRoaXMgcGF0Y2guIEhvd2V2ZXIsIGlmIHdlIGFyZSBnb2luZyB0
byB1c2Ugb3VyIG93biBpbml0CnNjcmlwdCBmb3IgcmVzdG9yZWNvbmQsIGl0IHNob3VsZCBmb2xs
b3cgb3VyICJtb2RlbCIgZm9yIGluaXQgc2NyaXB0cywKcGFja2FnZS9idXN5Ym94L1MwMXN5c2xv
Z2QuIFRoaXMgbWVhbnMgaXQgc2hvdWxkIHVzZSBzdGFydC1zdG9wLWRhZW1vbiwKaW5zdGVhZCBv
ZiBkYWVtb24sIGlmIHBvc3NpYmxlLgoKVGhhbmtzIGEgbG90IQoKVGhvbWFzCi0tIApUaG9tYXMg
UGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
