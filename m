Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFD2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4893B40239;
	Sun, 30 Jan 2022 17:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jyf-qMc1xRx6; Sun, 30 Jan 2022 17:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AC4E40160;
	Sun, 30 Jan 2022 17:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAD2E1BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9924A402B2
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAQ5-B0ynwMt for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:18:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2BE0402C3
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:18:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9250A240007;
 Sun, 30 Jan 2022 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643563111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMi9n5qeehrRSRD9wQbsLpHob0OMe9ahmMExoBg4YQU=;
 b=e5859G4+f0nMnDNzI8h1Cxqvy/0OQ2wijqEd3gZvN77OWVUbFrEZmE5Bb7dt838AGepw6x
 +IbpgS070NyDvhBKUD8zLPMYg/otSuD5AlaSCyjyICJcoF6DXXmKld74Crk5zcXYYKRBlJ
 GuCE8ddtd9tY942eSBOKrk2p/+qtNfl7zabrsimCddtaNt44da/nXpywiPUw7nBYFzgndx
 e4ScVXa7ePjr8HWDDZuK44b0xjRxDpx/CRKeIzevQXGd49n9MYOgqegA9kauQkQQCLb53H
 PNBFAMYq6iUJjX8WefVudsIjCH3A2p8Rn+AWnLFainZGQElNHprVZx7syEYAjA==
Date: Sun, 30 Jan 2022 18:18:30 +0100
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20220130181830.3170d14f@windsurf>
In-Reply-To: <20220129111731.736265-1-peron.clem@gmail.com>
References: <20220129111731.736265-1-peron.clem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/beelink_gs1: increase rootfs
 size to 120M
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyOSBKYW4gMjAyMiAxMjoxNzozMCArMDEwMApDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPiB3cm90ZToKCj4gRm9yIHRoZSBtb21lbnQgQmVlbGluayBHUzEgdXNl
IGEgZGVmYXVsdCByb290ZnMgc2l6ZSBvZiA2ME0sCj4gd2hpY2ggaXMgYSBiaXQgbG93IGlmIHlv
dSB3YW50IHRvIGFkZCBzb21lIHBhY2thZ2VzIGxpa2UgYQo+IGdyYXBoaWMgc3RhY2suCj4gCj4g
SW5jcmVhc2UgdGhlIHJvb3RmcyBzaXplIHRvIDEyME0uCj4gCj4gUmV2aWV3ZWQtYnk6IEdpdWxp
byBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Cj4gLS0tCj4g
IGNvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKSSBoYXZlIG5vdCBhcHBsaWVkIHRoaXMgb25lLiBJbmRlZWQsIGFueSBk
ZWZjb25maWcgdGhhdCB1c2VzIHRoZQpkZWZhdWx0IHJvb3RmcyBzaXplIG9mIDYwTSB3b3VsZCBo
YXZlIHRoZSBwcm9ibGVtIG9mICJpZiBJIGFkZCBtb3JlCnBhY2thZ2VzLCBpdCBkb2Vzbid0IGZp
dCBpbiB0aGUgaW1hZ2UiLiBUaGUgZGVmY29uZmlncyBhcmUgbWVhbnQgdG8gYmUKbWluaW1hbCwg
c28gaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIGluY3JlYXNlIHRoZSBzaXplIHRvIDEyME0gdG8K
YWNjb21tb2RhdGUgc29tZSBwb3NzaWJsZSBwYWNrYWdlIGFkZGl0aW9ucy4gTWF5YmUgZXZlbiAx
MjBNIGlzIG5vdApnb2luZyB0byBiZSBlbm91Z2ggZGVwZW5kaW5nIG9uIGhvdyBtYW55IHBhY2th
Z2VzIHlvdSBhZGQgKGFuZCBob3cKbGFyZ2UgdGhleSBhcmUpLgoKU28gSSd2ZSBtYXJrZWQgdGhp
cyBwYXRjaCBhcyBSZWplY3RlZC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290
bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
