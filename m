Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C08C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 21:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA20601FC
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 21:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABA20601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DBC240365;
	Sat, 23 Oct 2021 21:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSkZSEVTBlOP; Sat, 23 Oct 2021 21:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CE9E4034E;
	Sat, 23 Oct 2021 21:57:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2BD31BF5E0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 21:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E217B81A65
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 21:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hAv50wW3kC5 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 21:57:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A857E81A64
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 21:57:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cf8:eeb7:8c5b:1909])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C6B897802D1;
 Sat, 23 Oct 2021 23:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635026234;
 bh=N7c5MIoF6umFTu3vm0qk5Wg/ErfKDtaDtrzH9Edq0vU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R6LJ7UuXN2J8PkdwC7Due12evjcFOSYnwDovKZ9FQ1zjt5klrIzwFOBvTEqmMShHp
 tGn7poc7FlenottUTKFvr4KVVytTJebt8MZJhsuowiHwWKwnqO1uH8UFFl/b+D2bav
 yJETHXBblFKXrpaT7FrsLpb4H3x/hogNOL9UsCaHCivSUytSSgLt1FYsuNWZFep/Yh
 00rH22NSGiK5HJ2VXxEJSSgICV2JHYV5XbH5Iww+egzhTs+6ftJqmF+P8f1KfCWi5O
 GiWGwWB2B/L8BquXhHwG4Kc1Qd7+RkLT8ptLgdKEaspuhuNSuGIomKmNRYMUfVX5UH
 Q+Pm5JQh56rTw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Oct 2021 23:57:05 +0200
Date: Sat, 23 Oct 2021 23:57:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brian Murphy <brm@robotize.com>
Message-ID: <20211023215705.GK2400@scaer>
References: <20211015105914.9428-1-brm@robotize.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015105914.9428-1-brm@robotize.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: fix dependency on host-gawk
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnJpYW4sIEFsbCwKCitLw7ZyeSB3aG8gZGlkIHJlY2VudCBjaGFuZ2VzIGluIGdydWIyCgpPbiAy
MDIxLTEwLTE1IDEyOjU5ICswMjAwLCBCcmlhbiBNdXJwaHkgc3Bha2UgdGh1c2x5Ogo+IFNpZ25l
ZC1vZmYtYnk6IEJyaWFuIE11cnBoeSA8YnJtQHJvYm90aXplLmNvbT4KCkNvdWxkIHlvdSBnaXZl
IGEgYml0IG1vcmUgZGV0YWlscyBhYm91dCB0aGUgcmVhc29uIHdoeSBob3N0LWdhd2sgaXMKbmVl
ZGVkPyBJJ3ZlIGp1c3QgYmVlbiBhYmxlIHRvIGNvbXBsZXRlIGEgZ3J1YjIgYnVpbGQgd2l0aCBt
YXdrIGFzIG15CnN5c3RlbSBhd2suIGdydWIyJ3MgY29uZmlndXJlIGV2ZW4gZGV0ZWN0cyB0aGF0
IHNpdHVhdGlvbjsKCiAgICBjaGVja2luZyBmb3IgZ2F3ay4uLiBubwogICAgY2hlY2tpbmcgZm9y
IG1hd2suLi4gbWF3awoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIGJvb3QvZ3J1
YjIvZ3J1YjIubWsgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L2dydWIyL2dydWIyLm1rIGIvYm9vdC9n
cnViMi9ncnViMi5tawo+IGluZGV4IGUwMWViYjJlZGIuLjc3YmYyNmI3MzkgMTAwNjQ0Cj4gLS0t
IGEvYm9vdC9ncnViMi9ncnViMi5tawo+ICsrKyBiL2Jvb3QvZ3J1YjIvZ3J1YjIubWsKPiBAQCAt
MTAsNyArMTAsNyBAQCBHUlVCMl9TT1VSQ0UgPSBncnViLSQoR1JVQjJfVkVSU0lPTikudGFyLnh6
Cj4gIEdSVUIyX0xJQ0VOU0UgPSBHUEwtMy4wKwo+ICBHUlVCMl9MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORwo+ICBHUlVCMl9ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWdy
dWIyCj4gLUhPU1RfR1JVQjJfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LWZsZXgKPiAr
SE9TVF9HUlVCMl9ERVBFTkRFTkNJRVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LWdhd2sK
PiAgR1JVQjJfSU5TVEFMTF9JTUFHRVMgPSBZRVMKPiAgCj4gICMgMDAwMS1idWlsZC1GaXgtR1JV
Qi1pMzg2LXBjLWJ1aWxkLXdpdGgtVWJ1bnR1LWdjYy5wYXRjaCBhbmQgMjAyMS8wMy8wMgo+IC0t
IAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
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
