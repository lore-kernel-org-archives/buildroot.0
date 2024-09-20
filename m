Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F477C78853
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 14:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9DF42AF0;
	Fri, 20 Sep 2024 14:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYPjtk_IG7rV; Fri, 20 Sep 2024 14:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E4242C09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E4242C09;
	Fri, 20 Sep 2024 14:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF48F1BF39E
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 14:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC2C404B0
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 14:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S0zRDUYbNz34 for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 14:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14C2740135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C2740135
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14C2740135
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 14:53:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DDBA60005;
 Fri, 20 Sep 2024 14:53:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srf0h-00H4JV-1s;
 Fri, 20 Sep 2024 16:53:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240911190900.982461-1-yann.morin.1998@free.fr>
Date: Fri, 20 Sep 2024 16:53:27 +0200
In-Reply-To: <20240911190900.982461-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 11 Sep 2024 21:09:00 +0200")
Message-ID: <871q1eidg8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IENvbW1pdCBhODdhYmNmNmRhNjUgKE1ha2VmaWxlOiBydW4gUFBEIGFuZCBSUEFU
SCBmaXh1cCBpbiBob3N0LWZpYWxpemUpCiA+IChzaWMpIG1vdmVkIHRoZSBmaXh1cHMgcGV2aW91
c2x5IGRvbmUgaW4gcHJlcGFyZS1zZGssIHRvIGhvc3QtZmluYWxpemUuCgogPiBUaGlzIGV4cG9z
ZWQgYSBidWcgaW4gZml4LXJwYXRoLCB3aGVuIFJQQVRIIGNvbnRhaW5zIG11bHRpcGxlIGVudHJp
ZXMsCiA+IGxpa2U6ICAvUFBEL2hvc3QtZm9vL2hvc3QvbGliOi9QUEQvaG9zdC1mb28vaG9zdC9s
aWIvZm9vCgogPiBJbiB0aGF0IHNpdHVhdGlvbiwgd2Ugd2FudCB0byBnZXQgcmlkIG9mIC9QUEQv
aG9zdC1mb28gYW5kIHJlcGxhY2UgaXQKID4gd2l0aCB0aGUgZmluYWxlIEhPU1RfRElSLCBzbyB3
ZSBtYW5nbGUgdGhlIFJQQVRIIHdpdGggYSBzZWQgZXhwcmVzc2lvbi4KCiA+IEhvd2V2ZXIsIHRo
YXQgc2VkIGV4cHJlc3Npb24gb25seSBldmVyIHJlcGxhY2VzIHRoZSBmaXJzdCBtYXRjaCwgYXMg
aXQKID4gaXMgbWlzc2luZyB0aGUgJ2cnIG9wdGlvbi4gVGh1cywgdGhlIHNlY29uZCAoYW5kIGZv
bGxvd2luZykgcGFydHMgb2YKID4gUlBBVEggYXJlIHN0aWxsIHJlZmVycmluZyB0byB0aGUgUFBE
LCBhbmQgdGh1cyBwYXRjaGVsZiBkb2VzIG5vdCBmaW5kIGl0CiA+IHJlbGF0aXZlIHRvIHRoZSBm
aW5hbCBIT1NUX0RJUiwgYW1kIHJvcHMgaXQuIFRoaXMgZXZlbnR1YWxseSBsZWFkIHRvIGEKID4g
ZmluYWwgUlBBVEggc2V0IGFzICRPUklHSU4vLi4vbGliIGluc3RlYWQgb2YgdGhlIGV4cGVjdGVk
CiA+ICRPUklHSU4vLi4vbGliOiRPUklHSU4vLi4vbGliL2ZvbwoKID4gVGhpcyBpcyB0aGUgY2Fz
ZSBmb3IgaG9zdC1zeXN0ZW1kLCB3aGljaCBpbnN0YWxscyBzb21lIG9mIGl0cyBsaWJyYXJpZXMK
ID4gaW4gJFBSRUZJWC9saWIvc3lzdGVtZC8gYW5kIGFkZHMgYW4gUlBBVEggc2V0IGFwcHJvcHJp
YXRlbHkgdG8KID4gL1BQRC9ob3N0LXN5c3RlbWQvaG9zdC9saWI6L1BQRC9ob3N0LXN5c3RlbWQv
aG9zdC9saWIvc3lzdGVtZCBhbmQgdGhhdAogPiBnZXRzIGluY29ycmVjdGx5IG1hbmdsZWQuCgog
PiBGaXhlczogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vaXNz
dWVzLzM5CgogPiBBbHNvIGZpeCBhIHR5cG8gaW4gdGhlIGNvbW1lbnQganVzdCBhYm92ZS4KCiA+
IFJlcG9ydGVkLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gQGpsc2FsdmFkb3IKID4gU2ln
bmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CgpDb21t
aXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
