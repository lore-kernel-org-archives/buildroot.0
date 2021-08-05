Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C41C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:45:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEFE60E52
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9DEFE60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2A783AC1;
	Thu,  5 Aug 2021 19:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjRF-ERbnDqu; Thu,  5 Aug 2021 19:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93F183A72;
	Thu,  5 Aug 2021 19:45:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF611BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9CCC60A79
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4u4nnttVHoc0 for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:44:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2D360A73
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:44:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 62693FF805;
 Thu,  5 Aug 2021 19:44:17 +0000 (UTC)
Date: Thu, 5 Aug 2021 21:44:16 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@essensium.com>
Message-ID: <20210805214416.5c2dc2c9@windsurf>
In-Reply-To: <20200207150327.4335-1-raphael.melotte@essensium.com>
References: <20200207150327.4335-1-raphael.melotte@essensium.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydns: new package.
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUmFwaGHDq2wsCgpPbiBGcmksICA3IEZlYiAyMDIwIDE2OjAzOjI3ICswMTAwClJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAZXNzZW5zaXVtLmNvbT4gd3JvdGU6Cgo+IFB5
dGhvbiBETlMgbGlicmFyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8
cmFwaGFlbC5tZWxvdHRlQGVzc2Vuc2l1bS5jb20+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3B5dGhvbi1weWRucy9Db25maWcuaW4g
ICAgICAgICB8ICA3ICsrKysrKysKPiAgcGFja2FnZS9weXRob24tcHlkbnMvcHl0aG9uLXB5ZG5z
Lmhhc2ggfCAgNSArKysrKwo+ICBwYWNrYWdlL3B5dGhvbi1weWRucy9weXRob24tcHlkbnMubWsg
ICB8IDE0ICsrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcHlkbnMvQ29uZmlnLmluCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1weWRucy9weXRob24tcHlkbnMuaGFz
aAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tcHlkbnMvcHl0aG9uLXB5ZG5z
Lm1rCgpUaGFua3MgYSBsb3QgZm9yIHRoaXMgY29udHJpYnV0aW9uLCBidXQgdW5mb3J0dW5hdGVs
eSB0aGlzIHB5ZG5zIG1vZHVsZQpoYXMgbm90IGJlZW4gdXBkYXRlZCBvciBzZWVuIGEgcmVsZWFz
ZSBzaW5jZSAyMDEyLiBUaGlzIG1lYW5zIGl0IGhhcwpiYXNpY2FsbHkgbmV2ZXIgc2VlbiBhIHJl
bGVhc2Ugc2luY2UgUHl0aG9uIDMueCB3YXMgYSB0aGluZywgc28gaXQKZG9lc24ndCBtYWtlIGEg
bG90IG9mIHNlbnNlIHRvIGFkZCBzdWNoIGFuIHVubWFpbnRhaW5lZCBwaWVjZSBvZgpzb2Z0d2Fy
ZSB0byBCdWlsZHJvb3QuIFNvIHVuZm9ydHVuYXRlbHksIHdlIGFyZSBnb2luZyB0byByZWplY3Qg
dGhpcwpwYXRjaC4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Q1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
