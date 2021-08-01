Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AE0C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 10:07:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54406054F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 10:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E54406054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925256072D;
	Sun,  1 Aug 2021 10:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttFli4lQx8ME; Sun,  1 Aug 2021 10:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9580606F3;
	Sun,  1 Aug 2021 10:07:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 138A01BF8B4
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 10:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D31415BF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LK2nvus345C5 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 10:07:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1E99404BD
 for <buildroot@busybox.net>; Sun,  1 Aug 2021 10:07:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id ED21A200003;
 Sun,  1 Aug 2021 10:06:35 +0000 (UTC)
Date: Sun, 1 Aug 2021 12:06:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20210801120634.245316d7@windsurf>
In-Reply-To: <20210801095734.3213451-1-francois.perrad@gadz.org>
References: <20210801095734.3213451-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lua-lunix: fix build with recent gcc
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

SGVsbG8gRnJhbsOnb2lzLAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ghIEhvd2V2ZXIsIHRoZXJlIGFy
ZSBhIGZldyBmb3JtYXR0aW5nIGlzc3Vlcywgc2VlCmJlbG93LgoKT24gU3VuLCAgMSBBdWcgMjAy
MSAxMTo1NzozNCArMDIwMApGcmFuY29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90
ZToKCj4gc2VlIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzc0OWExMWQ1
Mjg5YzZmZWMzYjJmMjM2YjkwNzNmYzFhYjczMGQwOTAvCgpUaGlzIHNob3VsZCBiZToKCkZpeGVz
OgoKICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy83NDlhMTFkNTI4OWM2
ZmVjM2IyZjIzNmI5MDczZmMxYWI3MzBkMDkwLwoKVGhlIGZhY3QgdGhhdCB0aGVyZSBpcyB0aGUg
IkZpeGVzIiB3b3JkIGVuc3VyZXMgdGhhdCBwYXRjaHdvcmsKaWRlbnRpZmllcyBpdCBhcyBhIHBh
dGNoIHRoYXQgZml4ZXMgc29tZXRoaW5nLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWEtbHVu
aXgvMDAwMy11c2UtbGludXgtc3lzY3RsLWluc3RlYWQtb2YtZGVwcmVjYXRlZC1zeXMtc3lzY3Rs
LnBhdGNoIGIvcGFja2FnZS9sdWEtbHVuaXgvMDAwMy11c2UtbGludXgtc3lzY3RsLWluc3RlYWQt
b2YtZGVwcmVjYXRlZC1zeXMtc3lzY3RsLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAuLmUyMzY5YmRmYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2x1YS1sdW5peC8wMDAzLXVzZS1saW51eC1zeXNjdGwtaW5zdGVhZC1vZi1kZXByZWNhdGVkLXN5
cy1zeXNjdGwucGF0Y2gKPiBAQCAtMCwwICsxLDMxIEBACj4gK0ZldGNoZWQgZnJvbSBodHRwczov
L2dpdGh1Yi5jb20vd2FoZXJuL2x1bml4L3B1bGwvMTgKClRoaXMgc2hvdWxkIGdvLi4uCgo+ICsK
PiArRnJvbSA5OWIwMmIwOGQzZjFhNTNlNThiNTU4YjlmMjI1MDIyNWU1NjlhNTUwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBUaWFnbyBTZWNvIDx0aWFnb0BzZWNvLndzPgo+ICtE
YXRlOiBTdW4sIDIwIEp1biAyMDIxIDExOjIwOjIzICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0g
dXNlIDxsaW51eC9zeXNjdGwuaD4gaW5zdGVhZCBvZiBkZXByZWN0YWVkIDxzeXMvc3lzY3RsLmg+
IGZvcgo+ICsgbGludXggc3lzdGVtcwo+ICsKCi4uLiBoZXJlLiBPdGhlcndpc2UgeW91IGJyZWFr
IHRoZSBwYXRjaCB3aGljaCBjYW5ub3QgYmUgYXBwbGllZCB3aXRoCiJnaXQgYW0iIGFueW1vcmUu
CgpBbHNvLCB5b3UgbmVlZCB0byBhZGQgeW91ciBTaWduZWQtb2ZmLWJ5IGxpbmUgaW4gdGhlIHBh
dGNoLiBOb3RlIHRoYXQKdGhpcyBwYXJ0aWN1bGFyIGlzc3VlIGlzIHJlcG9ydGVkIGJ5ICJtYWtl
IGNoZWNrLXBhY2thZ2UiLgoKQ291bGQgeW91IGFkanVzdCB0aG9zZSBtaW5vciBkZXRhaWxzIGFu
ZCBzZW5kIGFuIHVwZGF0ZWQgdmVyc2lvbj8KClRoYW5rcyBhIGxvdCEKClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
