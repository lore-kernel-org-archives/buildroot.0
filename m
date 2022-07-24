Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16539C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBAF40B97;
	Sun, 24 Jul 2022 10:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBAF40B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQFYqh6H99d1; Sun, 24 Jul 2022 10:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82D5640359;
	Sun, 24 Jul 2022 10:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82D5640359
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE131BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75E7083E6C
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75E7083E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZ5GU_PkBm9y for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:54:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE1183E69
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CE1183E69
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:54:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B421D13F8B3;
 Sun, 24 Jul 2022 12:54:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 12:54:13 +0200
Date: Sun, 24 Jul 2022 12:54:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220724105413.GT2641@scaer>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
 <20220705134402.5914-2-david.gouarin@thalesgroup.com>
 <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr>
 <20220724075906.GO2641@scaer>
 <c85bf232-28ca-8d43-06ca-8e2d78db1581@smile.fr>
 <20220724084611.GP2641@scaer>
 <30f9fc02-781b-27ac-ecec-5f03680f8a7d@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30f9fc02-781b-27ac-ecec-5f03680f8a7d@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658660059;
 bh=06aeoZasZQBsws0mwoaIZCRSL9yjK5OZ/4ewVfo+8pE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g8Et8qRDpMkuoXlszzQc4nGN2T18jxfk12gxnrj1uFMHJ8N0wluCsdEJHn+oMajsd
 NLxy6pTeBhQsAleuU4cwYEh4HdSYc1TVyIIf8AtJIFUjj+fIMVJFleeBmBFBBoMVug
 4mx8yESnAsFn2SODqa0WKUNXzCNEve20sWaJw0I+GhQU1iNjJSy2ynOTOxiLyQy5hG
 xBbk1UaAO3n6qXdbDLw9iO48H34A67uNswFDvoBcSefVfAU8Ns6xX1DiXZx/P30q2Z
 VlqWx/+Bj1xIWfHTPupW0DR1ExB7K1UEDjCkQk4vlDipG/AhcajN7Wd0Sb/aplq2aO
 UU7FnAUCR+q6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g8Et8qRD
Subject: Re: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIyLTA3LTI0IDEwOjU1ICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDI0LzA3LzIwMjIgw6AgMTA6NDYsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiA+IE9uIDIwMjItMDctMjQgMTA6MTkgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0
aHVzbHk6ClstLVNOSVAtLV0KPiA+PiBJIGZvdW5kIGFub3RoZXIgY29tbWl0IGFkZGluZyB0aGUg
b2ZmZW5kaW5nIHdhZiBjaGVjazoKPiA+PiBodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9z
YW1iYS8tL2NvbW1pdC80MjBiYmIxZDkyZmQyYTI4NzI1YjUzZjQyNWJhM2QyMTQ4MzFiNjYwCj4g
Pj4gYmVjYXVzZSBpdCBkb2Vzbid0IHdvcmsgd2l0aG91dCBQWVRIT05IQVNIU0VFRC4KPiA+IEkg
YW0gbm90IHN1cmUgIml0IGRvZXNuJ3Qgd29yayB3aXRob3V0IFBZVEhPTkhBU0hTRUVEIi4KPiBJ
IG1lYW4sIEkgdHJpZWQgbG9jYWxseSBiZWNhdXNlIEkgd2FudGVkIHRvIGtub3cgOikKPiBUaGUg
YnVpbGQgc3RvcCB3aXRoIHRoaXMgZXJyb3IgbWVzc2FnZToKPiAiUFlUSE9OSEFTSFNFRUQ9MSBt
aXNzaW5nISBEb24ndCB1c2Ugd2FmIGRpcmVjdGx5LCB1c2UgLi9jb25maWd1cmUgYW5kIG1ha2Uh
IgoKT0ssIEkgd2FzIGxvb2tpbmcgYXQgdGhlIGdpdCByZXBvc2l0b3J5IGZvciB0YWxsb2MsIGFu
ZCBpdCBkb2VzIG5vdCBoYXZlCnRoYXQgdGVzdCBhdCBhbGwuIEl0IG5ldmVyIGhhZC4gT25seSB0
aGUgcmVsZWFzZSB0YXJiYWxsIGhhcy4gV2VpcmQuLi4KOi0oCgpNZWguIE11c3QgYmUgZXhvcGxh
aW5lZCBpbiB0aGUgY29tbWl0IGxvZy4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
