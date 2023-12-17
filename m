Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571B5C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 21:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 121F781E2A;
	Sun, 17 Dec 2023 21:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 121F781E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hLM37dkEa_Lv; Sun, 17 Dec 2023 21:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E4B981E21;
	Sun, 17 Dec 2023 21:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E4B981E21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84F8C1BF37F
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5343760A84
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 21:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5343760A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UOY3jI3sQdj for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 21:40:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05B2360A5D
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 21:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B2360A5D
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9B4160004;
 Sun, 17 Dec 2023 21:40:03 +0000 (UTC)
Date: Sun, 17 Dec 2023 22:40:01 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20231217224001.2ca4d289@windsurf>
In-Reply-To: <20231212135634.225795-1-thomas@devoogdt.com>
References: <20231212135634.225795-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702849204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQxqpxbqRLhffWusOnwQsGvuWqHm0r0PQiyd0hrdCg0=;
 b=MDQx2ic3wlB6Lpo2wXCRh/R34YjXzKHTtiQRmwN49VdsPywBIWS4syMM7F729TTfmiUnWW
 fhotQVTHXWZavpcUuKRDxY7DviEURvTS5D/dgAyxQjv3XdYlQTx+2JzOQvPz60rxPqXdYc
 x21/1DXmDV6CsZfq2NDLi7laCGWWaTsxSPSEh0tVQW8D9BPhFi8s4pgK5uGdOA30hFus74
 7kfM9ZbEM2fQMdolLeT7aoHAVN7+LOOuADMqlpJNDANEw+Tf/LVPVCWWHy0Ja/P9V/A7zL
 3Vcmm7buDH4R68UhCnVWktXx02f3H+8MWjTXj00uTpvhB5Dh1jp+01Tt+kcsRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MDQx2ic3
Subject: Re: [Buildroot] [PATCH v1] package/mesa3d: add compile patch for
 linux < 3.5
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxMiBEZWMgMjAyMyAxNDo1NjozNCArMDEwMApUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvMDAw
NS11dGlsLW9zX3NhbWVfZmlsZV9kZXNjcmlwdGlvbi1maXgtdW5rbm93bi1saW51eC0zLjUtLnBh
dGNoIGIvcGFja2FnZS9tZXNhM2QvMDAwNS11dGlsLW9zX3NhbWVfZmlsZV9kZXNjcmlwdGlvbi1m
aXgtdW5rbm93bi1saW51eC0zLjUtLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwLi5kNjZhNTBhYWY1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uv
bWVzYTNkLzAwMDUtdXRpbC1vc19zYW1lX2ZpbGVfZGVzY3JpcHRpb24tZml4LXVua25vd24tbGlu
dXgtMy41LS5wYXRjaAo+IEBAIC0wLDAgKzEsNzAgQEAKPiArRnJvbSBiNjA5NzRmYWM4YTJmNGM4
NWNiYjJjYTc4OGZjNGVjM2U4MTk5OGY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9t
OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gK0RhdGU6IFR1
ZSwgMTcgQXVnIDIwMjEgMTE6NTQ6NDkgKzAyMDAKPiArU3ViamVjdDogW1BBVENIXSB1dGlsOiBv
c19zYW1lX2ZpbGVfZGVzY3JpcHRpb246IGZpeCB1bmtub3duIGxpbnV4IDwgMy41Cj4gKyBzeXNj
YWxsIFNZU19rY21wCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4g
Kwo+ICtodHRwczovL21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW4yL2tjbXAuMi5odG1sCj4g
Kwo+ICtUaGUga2NtcCgpIHN5c3RlbSBjYWxsIGZpcnN0IGFwcGVhcmVkIGluIExpbnV4IDMuNS4K
PiArCj4gK0J1dCB3YXMgcHJvYmFibHkgYWxzbyBub3Qgc3VwcG9ydGVkIGJ5IGFsbCBtYWpvciBw
bGF0Zm9ybXMKPiArYXQgdGhhdCB0aW1lLiBTbyBmYWxsYmFjayB0byB0aGUgY2hlY2sgdGhhdCBp
cyBkb25lIGZvciB3aW5kb3dzLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0
IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29tPgo+ICtBY2tlZC1ieTogWW9uZ2dhbmcgTHVvIDxs
dW95b25nZ2FuZ0BnbWFpbC5jb20+Cj4gK0Fja2VkLWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56
ZXJAcmVkaGF0LmNvbT4KPiArUGFydC1vZjogPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8xODUxNz4KPiArKGNoZXJyeSBwaWNrZWQgZnJv
bSBjb21taXQgM2VmNTE0OTgyNDQxY2U0OTZhYTEyNzYxMWVkZDI2Yjk4NjdmNGI5NSkKPiArVXBz
dHJlYW06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9y
ZXF1ZXN0cy8xODUxNwoKSSd2ZSBzaW1wbGlmaWVkIHRob3NlIDMgbGluZXMgdG8ganVzdDoKClVw
c3RyZWFtOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0
LzNlZjUxNDk4MjQ0MWNlNDk2YWExMjc2MTFlZGQyNmI5ODY3ZjRiOTUKCkFuZCBhcHBsaWVkLiBU
aGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
