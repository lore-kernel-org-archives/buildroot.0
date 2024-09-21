Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88A4CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 08:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C80140105;
	Sat, 21 Sep 2024 08:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-CIz28tHsmD; Sat, 21 Sep 2024 08:18:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EEAC40245
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EEAC40245;
	Sat, 21 Sep 2024 08:18:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 570841BF3D8
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 08:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52A31846D0
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 08:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-fpnFgD8HoO for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 08:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3C49846C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C49846C7
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3C49846C7
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 08:18:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B94240002;
 Sat, 21 Sep 2024 08:18:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1srvJk-0004rH-2b;
 Sat, 21 Sep 2024 10:18:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240911171937.10842-1-ju.o@free.fr>
Date: Sat, 21 Sep 2024 10:18:12 +0200
In-Reply-To: <20240911171937.10842-1-ju.o@free.fr> (Julien Olivain's message
 of "Wed, 11 Sep 2024 19:19:37 +0200")
Message-ID: <87jzf5h12z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: needs host-python3
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
Cc: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkp1bGllbiIgPT0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoK
ID4gV2hlbiB0aGUgYnVpbGQgaG9zdCBkb2VzIG5vdCBoYXZlIGEgUHl0aG9uIGludGVycHJldGVy
IGluc3RhbGxlZCwKID4gaG9zdC1ncnViMiBpcyBmYWlsaW5nIHRvIGNvbmZpZ3VyZSBkdWUgdG8g
dGhpcyBtaXNzaW5nIGludGVycHJldGVyLgogPiBOb3RlIHRoYXQgaG9zdC1ncnViMiBpcyB0aGUg
Zmlyc3QgcGFja2FnZSB0byBmYWlsIGJlY2F1c2UgaXQgaXMgYQogPiBkZXBlbmRlbmN5IG9mIGdy
dWIyLiBUaGUgZ3J1YjIgdGFyZ2V0IHBhY2thZ2UgaGFzIHRoZSBzYW1lIGRlcGVuZGVuY3kKID4g
cmVxdWlyZW1lbnQuCgogPiBUaGUgaXNzdWUgY2FuIGJlIHF1aWNrbHkgcmVwcm9kdWNlZCBvbiBh
IGhvc3Qgd2l0aG91dCBQeXRob24gd2l0aCB0aGUKID4gY29tbWFuZHM6CgogPiAgICAgY2F0IDw8
RU9GID4uY29uZmlnCiA+ICAgICBCUjJfYWFyY2g2ND15CiA+ICAgICBCUjJfVEFSR0VUX0dSVUIy
PXkKID4gICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogPiAgICAgRU9GCiA+ICAgICBtYWtl
IG9sZGRlZmNvbmZpZwogPiAgICAgbWFrZSBncnViMgoKID4gZ3J1YjIgYXV0b3Rvb2xzIGNvbmZp
Z3VyZS5hYyBzZWFyY2ggZm9yIGEgUHl0aG9uIGludGVycHJldGVyIHNpbmNlCiA+IHVwc3RyZWFt
IGNvbW1pdCBbMV0gOGI0Njc4NDRlICJweXRob246IFVzZSBBTV9QQVRIX1BZVEhPTiB0byBkZXRl
cm1pbmUKID4gaW50ZXJwcmV0ZXIgZm9yIGdlbnRwbC5weSIsIGZpcnN0IGluY2x1ZGVkIGluIGdy
dWIgdjIuMDQgcmVsZWFzZWQKID4gb24gMjAxOS0wNy0wNC4gRm9yIHJlZmVyZW5jZSwgZ3J1YjIg
aGFzIGJlZW4gdXBkYXRlZCB0byB0aGF0IHZlcnNpb24KID4gaW4gY29tbWl0IFsyXSBlYTdlYzQx
YyAiYm9vdC9ncnViMjogYnVtcCB0byB2ZXJzb24gMi4wNCIuCgogPiBUaGlzIGNvbW1pdCBmaXhl
cyB0aGUgaXNzdWUgYnkgYWRkaW5nIHRoZSBob3N0LXB5dGhvbjMgZGVwZW5kZW5jeSB0bwogPiBo
b3N0LWdydWIyIGFuZCBncnViMi4KCiA+IEZpeGVzOgoKID4gICAgIGNoZWNraW5nIGZvciBhIFB5
dGhvbiBpbnRlcnByZXRlciB3aXRoIHZlcnNpb24gPj0gMi42Li4uIG5vbmUKID4gICAgIGNvbmZp
Z3VyZTogZXJyb3I6IG5vIHN1aXRhYmxlIFB5dGhvbiBpbnRlcnByZXRlciBmb3VuZAoKID4gWzFd
IGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvZ2l0d2ViLz9wPWdydWIuZ2l0O2E9Y29tbWl0
ZGlmZjtoPThiNDY3ODQ0ZTExMTcwMDc3YzhjYTcyN2MzOWQyYmQzNmVlYjVmMDgKID4gWzJdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lYTdlYzQx
Y2Y2NGU4NmE2OTJhYzQ1ZTBkMDEyYzZlODE5OWVmMTEwCgogPiBSZXBvcnRlZC1ieTogVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgogPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKR2l2ZW4gdGhhdCBpdCBhcHBhcmVudGx5IGRvZXNu
J3QgbmVlZCBhbnkgc3BlY2lhbCBweXRob24gbW9kdWxlcyBjb3VsZAp3ZSB1c2UgJChCUjJfUFlU
SE9OM19IT1NUX0RFUEVOREVOQ1kpIGluc3RlYWQgdG8gb25seSBidWlsZCBweXRob24zIGlmCm5v
dCBhdmFpbGFibGUgb24gdGhlIGhvc3QgLyBvbGRlciB0aGFuIDMuND8KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
