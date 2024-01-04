Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED645C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 22:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1EE61419;
	Thu,  4 Jan 2024 22:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1EE61419
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8LixTM4B9Ye; Thu,  4 Jan 2024 22:33:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8CD661401;
	Thu,  4 Jan 2024 22:33:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8CD661401
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4433E1BF3E8
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAAEF42CE9
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAEF42CE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-SEm-9Qiz-U for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 22:33:36 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3313B42CD5
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 22:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3313B42CD5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1ED60002;
 Thu,  4 Jan 2024 22:33:30 +0000 (UTC)
Date: Thu, 4 Jan 2024 23:33:30 +0100
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240104233330.2d64b4e0@windsurf>
In-Reply-To: <20240103142831.901515-1-flavio.tapajos@newtesc.com.br>
References: <20240103142831.901515-1-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704407613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4uCZQLWAq2Obz+AFueRSojaufw0lF+2ge5yDfC7eSY=;
 b=hNO0YiAV13TPvKMj6RQyeQ84ceRFWdsQ2USdGW3HGj4FX8ZWNuRQE+2hLcAac0y8KnRNtM
 FIE9pWjE7lTvdHuQ6ppp1rJvTuW3+HPH2w86qSMEhaPk5mVUY/bd++UGinP462FO1W1hws
 ADKkIyVgUbe5yhjFSuzYsGrdZvxo/xwleKofov62AtGFO0J6hxPTMCpHxn6u41qPHCRfY2
 KXhuEAA56Vb6mXddJlz/O/r3XRqVLN6DSmxU+FWjJR3bLUGFRmElB549+TkYlU506OWggV
 aVa5ZBtNpmiFQoAdltjVxZQGrCM5M1NnduNoJ3DUd+txNsug8RCqI4MSDAkH5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hNO0YiAV
Subject: Re: [Buildroot] [PATCH 1/2] package/python-sqlalchemy: bump version
 to 2.0.25
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmzDoXZpbywKClRoYW5rcyBhIGxvdCBmb3IgeW91ciBwYXRjaCwgSSBoYXZlIGFwcGxp
ZWQgaXQsIGJ1dCBhZnRlciBmaXhpbmcgYSBmZXcKc21hbGwgdGhpbmdzLiBTZWUgYmVsb3chCgpP
biBXZWQsICAzIEphbiAyMDI0IDExOjI4OjMwIC0wMzAwCkZsw6F2aW8gVGFwYWrDs3MgPGZsYXZp
by50YXBham9zQG5ld3Rlc2MuY29tLmJyPiB3cm90ZToKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLXNxbGFsY2hlbXkvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tc3FsYWxjaGVteS9D
b25maWcuaW4KPiBpbmRleCBmN2VjM2E2YWQ0Li5mMDVmZWU3YWIxIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9weXRob24t
c3FsYWxjaGVteS9Db25maWcuaW4KPiBAQCAtMSw1ICsxLDYgQEAKPiAgY29uZmlnIEJSMl9QQUNL
QUdFX1BZVEhPTl9TUUxBTENIRU1ZCj4gIAlib29sICJweXRob24tc3FsYWxjaGVteSIKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fVFlQSU5HX0VYVEVOU0lPTlMKClRoaXMgYSBydW50aW1l
IGRlcGVuZGVuY3kgb25seSwgd2UgZG9uJ3QgbmVlZCBpdCBhdCBidWlsZC10aW1lLiBXZSBsaWtl
CnRvIGRvY3VtZW50IHN1Y2ggZGVwZW5kZW5jaWVzIGxpa2UgdGhpczoKCglzZWxlY3QgQlIyX1BB
Q0tBR0VfUFlUSE9OX1RZUElOR19FWFRFTlNJT05TICMgcnVudGltZQoKd2hpY2ggaGVscHMgZG9j
dW1lbnQgdGhhdCBpdCBpcyBub3JtYWwgZm9yIHRoaXMgZGVwZW5kZW5jeSB0byBiZSBpbgpDb25m
aWcuaW4sIGJ1dCBub3QgaW4gdGhlIC5tayBmaWxlLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoIGIvcGFja2FnZS9weXRob24t
c3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoCj4gaW5kZXggOWY0NzlkOGY3Yi4uNmE4
OTRiZWUyNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1z
cWxhbGNoZW15Lmhhc2gKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1z
cWxhbGNoZW15Lmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9zcWxhbGNoZW15L2pzb24KPiAtbWQ1ICA1MjMxOGI4M2U4OTMx
YzVmNWE0NTlmNTRmZTRiZTNlOCAgU1FMQWxjaGVteS0xLjQuNDIudGFyLmd6Cj4gLXNoYTI1NiAg
MTc3ZTQxOTE0YzQ3NmVkMWUxYjc3ZmQwNTk2NmVhODhjMDk0MDUzZTE3YTg1MzAzYzRjZTAwN2Y4
OGVmZjM2MyAgU1FMQWxjaGVteS0xLjQuNDIudGFyLmd6Cj4gK3NoYTI1NiBhMmM2OWE3NjY0ZmIy
ZDU0Yjg2ODJkZDc3NGMzYjU0ZjY3Zjg0ZmExMjNjZjg0ZGRhMmE1ZjQwZGNhYTA0ZTA4ICBTUUxB
bGNoZW15LTIuMC4yNS50YXIuZ3oKPiArbWQ1IDdhYmZjMjk3MmQ3ZTE2MzE1YzhiNzQ5MmVhMGUw
ZmRiIFNRTEFsY2hlbXktMi4wLjI1LnRhci5negoKSGVyZSB5b3UgY2hhbmdlZCB0aGUgb3JkZXJp
bmcgb2YgdGhlIHR3byBsaW5lcywgd2hpY2ggYWRkcyBhIGJpdCBvZgoibm9pc2UiIGFuZCBpdCBu
b3QgcmVhbGx5IG5lZWRlZC4gWW91IGFsc28gYnJva2UgdGhlIHNwYWNpbmcgb2YgdGhlCmRpZmZl
cmVudCBmaWVsZHM6IHdlIHdhbnQgdHdvIHNwYWNlcyBiZXR3ZWVuIGVhY2ggZmllbGQgKHllcyB0
aGF0J3MgYQpwdXJlIGNvbnZlbnRpb24sIGJ1dCBpdCBhbGxvd3MgdGhpbmdzIHRvIGJlIGNvbnNp
c3RlbnQgYmV0d2VlbgpwYWNrYWdlcykuIElmIHlvdSBydW4gIm1ha2UgY2hlY2stcGFja2FnZSIs
IG9yICIuL3V0aWxzL2NoZWNrLXBhY2thZ2UKcGFja2FnZS9weXRob24tc3FsYWxjaGVteS8qIiwg
aXQgY2hlY2tzIHN1Y2ggbWlub3IgY29kaW5nIHN0eWxlIGlzc3Vlcy4KCj4gICMgTG9jYWxseSBj
b21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAgODU5ZGVkMjVkYTM0YzFlYjczZTZl
NzM2ZGY0YzVmOGNlM2VkMmVkNTI5MDY2MzE3NmYwNmU3NzIwZDljOWEyMCAgTElDRU5TRQoKVGhl
IGZpbmFsIGlzc3VlIHdhcyByZWxhdGVkIHRvIHRoZSBMSUNFTlNFIGZpbGU6IGl0IGhhcyBjaGFu
Z2VkIGJldHdlZW4KdGhlIG9sZCB2ZXJzaW9uIG9mIHNxbGFsY2hlbXkgYW5kIHRoaXMgbmV3IHZl
cnNpb24sIHNvIHRoZSBoYXNoIHdhcyBubwpsb25nZXIgY29ycmVjdC4gU28gSSBoYXZlIHVwZGF0
ZWQgdGhlIGhhc2gsIGJ1dCBtb3JlIGltcG9ydGFudGx5LCBJCmhhdmUgZG9jdW1lbnRlZCBpbiB0
aGUgY29tbWl0IGxvZyB3aHkgdGhlIGhhc2ggY2hhbmdlZC4KCldpdGggYWxsIHRob3NlIGNoYW5n
ZXMsIHRoZSBmaW5hbCBjb21taXQgbG9va3MgbGlrZSB0aGlzOgoKICBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMGYyZjA5MDg5MjkxNGUzYjA0ZmYy
MTdkMWVhMTBjY2VhZmM3MDUxNQoKVGhhbmtzIGFnYWluIGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEK
ClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
