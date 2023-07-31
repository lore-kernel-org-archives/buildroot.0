Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A228C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7746610C5;
	Mon, 31 Jul 2023 20:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7746610C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5bMPVrxVhsK; Mon, 31 Jul 2023 20:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688EE60BCF;
	Mon, 31 Jul 2023 20:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 688EE60BCF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CE631BF954
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CED0760F1A
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CED0760F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-ZT8jWvTAEp for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:39:50 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2750607C0
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2750607C0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9f57:78c5:813c:6b41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 44BE5B005A1;
 Mon, 31 Jul 2023 22:39:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Jul 2023 22:39:41 +0200
Date: Mon, 31 Jul 2023 22:39:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230731203940.GD421096@scaer>
References: <20230729065616.961984-1-james.hilliard1@gmail.com>
 <20230731212049.10b538fd@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731212049.10b538fd@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690835987;
 bh=EE0E3YTdv26pOwAiehwdCytLMImjxebQe5/HJzfaZcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3Zcv6XesvTtHrWnw9sA+R1PrZBoHX/q3XBc8UMeeRzQEHnQKhzDl2LKI91nx6QBV
 gG2JyFVbktYj+Wo/YbH/JD8xOhnWWLQpC6/XNb3DV/un3AwggNuXm+SwiSXi0JF/d4
 ToBbSjD8FU16kw2iubgTPe6FC/N6Z+cMCI3752/D9EIDdR+hq8x6bVoaRN2R/SPPhV
 s0MDknaskKnZ21HkE4vc0Kd48gj/YcZHbYwxX7ul4eoL4egPZNz5RCVHPWZ6jF3O9G
 cW9PjfTp+p5Qc9SW0qvDdpZkmOzuOJKH49kenXgxGmk1E10F5YonomvMv6H3W2MdhY
 q2ZQ2pjMEkMoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G3Zcv6Xe
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump to version 254
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDctMzEgMjE6MjAgKzAyMDAsIFRob21hcyBQZXRhenpvbmkg
dmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gT24gU2F0LCAyOSBKdWwgMjAyMyAwMDo1Njox
NiAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90
ZToKPiA+ICBwYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5oYXNoIHwgIDQgKystLQo+ID4gIHBhY2th
Z2Uvc3lzdGVtZC9zeXN0ZW1kLm1rICAgfCAyOSArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0p
Cj4gSSBhbSBnZXR0aW5nIGJhY2sgdG8geW91IHJlZ2FyZGluZyB0aGlzIHZlcnNpb24gYnVtcC4g
RGlkIHlvdSBydW4gdGhlCj4gc3lzdGVtZCB0ZXN0IGNhc2VzIGluIHN1cHBvcnRpbmcvdGVzdGlu
ZyBhZnRlciBkb2luZyB0aGlzIHZlcnNpb24gYnVtcD8KPiAKPiBJbmRlZWQsIGl0IHNlZW1zIGxp
a2UgdGhlIHN5c3RlbWQgdGVzdCBjYXNlcyBhcmUgbm8gYnJva2VuLiBTZWUKPiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9waXBlbGluZXMvOTUwMTc1MDc3L2Zh
aWx1cmVzCj4gZm9yIHRoZSBmdWxsIGxpc3Qgb2YgZmFpbGVkIGNhc2VzIChhIG51bWJlciBhcmUg
bm90IHN5c3RlbWQgcmVsYXRlZCwKPiBhbmQgbm90IHJlbGV2YW50IGhlcmUsIGJ1dCBtYW55IGFy
ZSBzeXN0ZW1kIHJlbGF0ZWQpLgo+IAo+IEkgbG9va2VkIGF0IG9ubHkgb25lLCBhbmQgdGhlIGZh
aWx1cmUgaGFwcGVucyBhdCBydW50aW1lIGFuZCBnb2VzIGxpa2UKPiB0aGlzOgo+IAo+ICMgc3lz
dGVtY3RsIC0tbm8tcGFnZXIgLS1mYWlsZWQgLS1uby1sZWdlbmQKPiDil48gc3lzdGVtZC12Y29u
c29sZS1zZXR1cC5zZXJ2aWNlIGxvYWRlZCBmYWlsZWQgZmFpbGVkIFZpcnR1YWwgQ29uc29sZSBT
ZXR1cAoKICAgICMgam91cm5hbGN0bCAtdSBzeXN0ZW1kLXZjb25zb2xlLXNldHVwLnNlcnZpY2UK
ICAgIEp1bCAzMSAyMDoyMTowNCBidWlsZHJvb3Qgc3lzdGVtZC12Y29uc29sZS1zZXR1cFsxMjld
OiAvdXNyL2Jpbi9sb2Fka2V5cyBmYWlsZWQgd2l0aCBleGl0IHN0YXR1cyAxLgoKU28gaXQgbG9v
a3MgbGlrZSBpdCBuZWVkcyBrYmQgKGZvciBsb2Fka2V5cykuIHYyNTIgYWxyZWFkeSBkaWQsIHNv
IGl0CndvdWxkIGJlIGludGVyZXN0aW5nIHRvIGFsc28gdW5kZXJzdGFuZCB3aHkgaXQgZGlkIG5v
dCBmYWlsIHRoZW4sIHdoaWxlCml0IGZhaWxzIG5vdy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRp
bWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCAr
MzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwg
IF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1v
cmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29u
c3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
