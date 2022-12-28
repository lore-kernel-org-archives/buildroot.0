Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C51C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 20:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99A3C4013E;
	Wed, 28 Dec 2022 20:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99A3C4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opTI7P2YhXfn; Wed, 28 Dec 2022 20:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93BAB4015C;
	Wed, 28 Dec 2022 20:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BAB4015C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EA041BF2F2
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D0160BBD
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D0160BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebXegB_XhxOm for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 20:24:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9936D605DB
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9936D605DB
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 20:24:55 +0000 (UTC)
Received: from smtpclient.apple ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPA
 id AcyrpM8ZVHEBgAcyrpbhP2; Wed, 28 Dec 2022 21:24:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 28 Dec 2022 21:24:50 +0100
Message-Id: <AFA960D5-A645-4350-B2C1-33C5E8B092D8@benettiengineering.com>
References: <87bknn4941.fsf@tarshish>
In-Reply-To: <87bknn4941.fsf@tarshish>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailer: iPhone Mail (20C65)
X-CMAE-Envelope: MS4xfLBAv65qMjqcX0+KKHcOeGkyCh9+3rzVMJZ2eO9+gRbyGS8SSn0v116uNHReKlaUIoccGR4Rp7rRJetOxA+U2GEXtmTwpEQg9zdtUfb1LRtszP4xMiYV
 ebfa8KgHyAko6B5uUIElF7vY1GHUeCBnKWgQP9XpcKm3MEYcH91+nUHdddMrK8BP0gPvi8Sdd5C6GM4ZNDoNCeJSBXKuo470OO/l628oTR47UcrHuAGdkiOy
 wg7ErWYI3sepXuoAG2hh2w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672259093; bh=nn9aClbGSqfGG8rM4r3iyr/z8AJZVpkpL/PpQnglzYk=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=oEC3aibTKOcR0zk9ZQaV4YHc2QMODCPbL49jMLdt8Q4z2tlq3NQ6YgiubFVgx1+Tb
 +xkx0k5f8pUvFa6YHPw9QVlydFixevNs0PivhANunrUUQ6Lx9wTvqihssDBGnkmgYT
 czIZ9DI6Ea7iPYsSi20OqNr0n9wT5P8Wd2xE4vKGbEwGMb74YO6d5RmH0RURjKSY/8
 6SWe43In8nvs039PSN0ozc1b/wZWgCyQnLiS/qEyg260J2JsiUXV1RUYFfDSgiceeC
 hq3cgmy2CPOo4tptrHCM+LGFsLcc/qZ2UG3teb587vQpB8m+HrPYfw+zu5a5SOgelQ
 TYVvpdzaImwvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=oEC3aibT
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop package/ucl entry
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

Cj4gSWwgZ2lvcm5vIDI4IGRpYyAyMDIyLCBhbGxlIG9yZSAyMDozMywgQmFydWNoIFNpYWNoIDxi
YXJ1Y2hAdGtvcy5jby5pbD4gaGEgc2NyaXR0bzoKPiAKPiDvu79IaSBHaXVsaW8sCj4gCj4+IE9u
IFdlZCwgRGVjIDI4IDIwMjIsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBQYWNrYWdlIHVjbCBo
YXMgYmVlbiBkcm9wcGVkIHdpdGggY29tbWl0Cj4+IDg1YzVhZjQ2YWQ2YzE4ODQxNTc2YzBmN2Fi
ZTI0MWE2MTdhNDRjYjcKPj4gc28gbGV0J3MgZHJvcCBpdCBmcm9tIERFVkVMT1BFUlMgc2luY2Ug
d2hlbiBjYWxsaW5nIHV0aWxzL2dldC1kZXZlbG9wZXJzCj4+IGl0IHRocm93czoKPj4gV0FSTklO
RzogJ3BhY2thZ2UvdWNsLycgZG9lc24ndCBtYXRjaCBhbnkgZmlsZQo+IAo+IFRoaXMgZHVwbGlj
YXRlcwo+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRj
aC8yMDIyMTIyODA4MzkxOC4zNzYyLTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20vCgpPb3Bz
LCBJIGhhdmVu4oCZdCBjaGVja2VkLCBzb3JyeSBmb3IgdGhlIG5vaXNlIHRoZW4uCgpUaGFuayB5
b3UKCkdpdWxpbwoKPiAKPiBiYXJ1Y2gKPiAKPj4gRml4ZXM6IDg1YzVhZjQ2YWQgKCJwYWNrYWdl
L3VjbDogZHJvcCBwYWNrYWdlIikKPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdp
dWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+PiBERVZFTE9QRVJT
IHwgMSAtCj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPj4gaW5kZXggN2QxOWJhZTdhNi4uOTk4YmFjOTM1
ZSAxMDA2NDQKPj4gLS0tIGEvREVWRUxPUEVSUwo+PiArKysgYi9ERVZFTE9QRVJTCj4+IEBAIC0x
MDkxLDcgKzEwOTEsNiBAQCBGOiAgICBwYWNrYWdlL2xpYnNvZGl1bS8KPj4gRjogICAgcGFja2Fn
ZS9waHAtYW1xcC8KPj4gRjogICAgcGFja2FnZS9weXRob24tY2hlcnJ5cHkvCj4+IEY6ICAgIHBh
Y2thZ2Uvc2FuZS1iYWNrZW5kcy8KPj4gLUY6ICAgIHBhY2thZ2UvdWNsLwo+PiBGOiAgICBwYWNr
YWdlL3VweC8KPj4gRjogICAgcGFja2FnZS96eGluZy1jcHAvCj4gCj4gCj4gLS0gCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4uIC5+ICAgVGsg
T3BlbiBTeXN0ZW1zCj4gPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9Cj4gICAtIGJhcnVjaEB0a29zLmNvLmls
IC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRrb3MuY28uaWwgLQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
