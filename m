Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C4AC71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 16:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027E740568;
	Sat,  2 Sep 2023 16:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027E740568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w68qcqqxbUiy; Sat,  2 Sep 2023 16:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 501B340543;
	Sat,  2 Sep 2023 16:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 501B340543
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A46361BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 16:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70C4240124
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 16:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C4240124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4t5MlPezZag for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 16:04:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F4C0405C7
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 16:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4C0405C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3655260004;
 Sat,  2 Sep 2023 16:04:15 +0000 (UTC)
Date: Sat, 2 Sep 2023 18:04:14 +0200
To: Audun-Marius =?UTF-8?B?R2FuZ3N0w7g=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20230902180414.1511ee4e@windsurf>
In-Reply-To: <14204500.ZvbfcPJBoq@audun-yoga>
References: <14204500.ZvbfcPJBoq@audun-yoga>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693670655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6AUa+Y+MmLUFGqrWjeOjWZni/km3QpKNo0bZcujmZs=;
 b=ZrqXdkZqV/g+GpXwF57cf8zP/w4jTfQhfWDvKCMne7/qG1qpXnGtG/uuD6bZSk3fbHSWr7
 /9GB8LOW4iopou6PGt35xfrjSQUVii8IquSQBkTDhULoV5D5BoFc/X/WmXSOvZds2+7Ine
 r9yZs2Vso90r+jpGwTBdGGCi1NXHwxc0Ug501fdSXdQ+wAgZzJh/6PJejUOwyQRaUeANRf
 TF+Kyc5HmrlRs2hS9ahdMBLudmU0K5XLLPiT8UZoBYnuc+UZfTuWtE+YdejRZYIcl5gcux
 AhY20fn642R7ym1i2LmY3Qhx6IcdY1bX41+R0uImy1W20c3SRyUKcTUYjfvDvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZrqXdkZq
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: optionally
 include zfs graphdriver
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
Cc: Audun-Marius =?UTF-8?B?R2FuZ3N0w7g=?= <audun@gangsto.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXVkdW4tTWFyaXVzLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoISBTb3JyeSBmb3IgdGhl
IGRlbGF5IGluIGdldHRpbmcgYmFjayB0byB5b3UuIFNlZQpiZWxvdyBzb21lIGNvbW1lbnRzLgoK
T24gU2F0LCAxNSBKdWwgMjAyMyAxODoxNzozNiArMDgwMApBdWR1bi1NYXJpdXMgR2FuZ3N0w7gg
dmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBIZWxsbywK
PiAKPiBTaW5jZSB6ZnMgaXMgaW4gYnVpbGRyb290IG5vdywgSSB0aG91Z2h0IGl0IHdvdWxkIGJl
IGdvb2QgdG8gZW5hYmxlIHRoZSAKPiBncmFwaGRyaXZlciBpbiBkb2NrZXItZW5naW5lLgo+IAo+
IFRoYW5rIHlvdQoKVGhlIGNvbW1pdCBsb2cgc2hvdWxkbid0IGJlIGFuIGUtbWFpbCwgYnV0IGp1
c3QgYSBkZXNjcmlwdGlvbiBvZiB0aGUKY2hhbmdlLiBTbyBiYXNpY2FsbHkgbm8gIkhlbGxvIiwg
bm8gIlRoYW5rIHlvdSIsIGFuZCBubyBmaXJzdCBwZXJzb24Kc2VudGVuY2UuIFNvbWV0aGluZyBs
aWtlOgoKTm93IHRoYXQgWkZTIGlzIHBhY2thZ2VkIGluIEJ1aWxkcm9vdCwgdGhpcyBjb21taXQg
YWRkcyBhbiBvcHRpb24gdG8KZW5hYmxlIFpGUyBzdXBwb3J0IGluIGRvY2tlci1lbmdpbmUuCgo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tayBi
L3BhY2thZ2UvZG9ja2VyLWVuZ2luZS8KPiBkb2NrZXItZW5naW5lLm1rCj4gaW5kZXggZjkwNDc5
M2EuLjA2NDdhNTYwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXIt
ZW5naW5lLm1rCj4gKysrIGIvcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUubWsK
PiBAQCAtMjMsNyArMjMsNyBAQCBET0NLRVJfRU5HSU5FX0xERkxBR1MgPSBcCj4gICAgICAgICAt
WCAkKERPQ0tFUl9FTkdJTkVfR09NT0QpL2RvY2tlcnZlcnNpb24uSW5pdENvbW1pdElEPSIiIFwK
PiAgICAgICAgIC1YICQoRE9DS0VSX0VOR0lORV9HT01PRCkvZG9ja2VydmVyc2lvbi5WZXJzaW9u
PSIkCj4gKERPQ0tFUl9FTkdJTkVfVkVSU0lPTikiCj4gIAo+IC1ET0NLRVJfRU5HSU5FX1RBR1Mg
PSBjZ28gZXhjbHVkZV9ncmFwaGRyaXZlcl96ZnMKPiArRE9DS0VSX0VOR0lORV9UQUdTID0gY2dv
Cj4gIERPQ0tFUl9FTkdJTkVfQlVJTERfVEFSR0VUUyA9IGNtZC9kb2NrZXJkIGNtZC9kb2NrZXIt
cHJveHkKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCQVBQQVJNT1IpLHkpCj4gQEAgLTU2
LDYgKzU2LDEyIEBAIGVsc2UKPiAgRE9DS0VSX0VOR0lORV9UQUdTICs9IGV4Y2x1ZGVfZ3JhcGhk
cml2ZXJfdmZzCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0RPQ0tFUl9FTkdJ
TkVfRFJJVkVSX1pGUykseSkKCldoZXJlIGlzIHRoaXMgb3B0aW9uIGFkZGVkPyBJIHRoaW5rIHlv
dSBmb3Jnb3QgdG8gImdpdCBhZGQiIHlvdXIKY2hhbmdlcyBpbiB0aGUgQ29uZmlnLmluIGZpbGUu
CgpDb3VsZCB5b3UgZml4IHRob3NlIGlzc3VlcyBhbmQgc2VudCBhbiB1cGRhdGVkIHZlcnNpb24g
b2YgeW91ciBwYXRjaD8gCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
