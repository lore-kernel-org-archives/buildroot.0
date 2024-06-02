Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1279CC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 11:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE1B482B3E;
	Sun,  2 Jun 2024 11:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY8Ss5n1kqae; Sun,  2 Jun 2024 11:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B9FF83118
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B9FF83118;
	Sun,  2 Jun 2024 11:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE6291BF370
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 11:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA949401AF
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 11:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oTLBP1rzx3b for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 11:01:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A3ED4012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3ED4012D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A3ED4012D
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 11:01:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3198613F8B9;
 Sun,  2 Jun 2024 13:01:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Jun 2024 13:01:07 +0200
Date: Sun, 2 Jun 2024 13:01:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZlxQ8_lmWG0_XcZ3@landeda>
References: <20240531202219.2486947-1-james.hilliard1@gmail.com>
 <Zlt-hVkDH0Aq3G-X@landeda>
 <CADvTj4pvo2Sy1hFVbp=4hcxA1OjucbncqEyaSaX70JAv5b3puA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pvo2Sy1hFVbp=4hcxA1OjucbncqEyaSaX70JAv5b3puA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717326070;
 bh=K0F2F18dJ1RrfGG5x1NB9gfN5w6WJQJ1wW0WLTb5klE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YYmoYsMIzsIadGMUkn2mN/ARs2t8a2xqWw3YNO+omAOOgJCkS+BoVRHIbvQeF5iX+
 U8p512iJZSE8iqYya0HuOuEGMlPDTlbhPyHWUGqd4k2u2Tvejh3XqyM002xDv9WDb2
 T9rBcdJY1VY7P3hOstguEtbsmIrpw124FWe7hqQ/RVkCivw7qtPowTab7bF6Yw5MGU
 jf1xy5JHID64YQtsJzmaef3J0Rgo4xs3SZYehfLmvJRsB+CXTXNLsxqiy0IkWAB6e0
 Ox2mDE7iGP7gSljvZMaljkyFSCLSFlfP615oDtFIx/bxQ2Z4wpZFZ/pYFq5xhjeeoU
 SwMx1VXBk6FnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YYmoYsMI
Subject: Re: [Buildroot] [PATCH 1/1] package/vala: bump to version 0.56.17
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

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMDEgMTQ6MjIgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIEp1biAxLCAyMDI0IGF0IDI6MDPigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBPbiAyMDI0LTA1LTMxIDE0
OjIyIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiA+IEFkZCBuZXcgaG9z
dC1nb2JqZWN0LWludHJvc3BlY3Rpb24gZGVwZW5kZW5jeS4KPiA+IFNvLCB3aHkgaXMgdGhpcyBt
aW5vciB2ZXJzaW9uIGJ1bXAgbm93IHJlcXVpcmluZyBob3N0LUdPST8KPiBXZWxsIHRoZSByZXF1
aXJlbWVudCB3YXMgYWRkZWQgaGVyZSwgc28gaXQgc2VlbXMgdG8gb25seSBiZSB1c2VkCj4gZm9y
IGZpbmRpbmcgZ2lyZGlyOgo+IAo+IHZhbGE6IEZvbGxvdyB0aGUgbG9naWMgb2YgR0lyUGFyc2Vy
LmxvY2F0ZV9naXIoKSB0byBmaW5kIGdpciBmaWxlcwo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9y
Zy9HTk9NRS92YWxhLy0vY29tbWl0L2E5ZDM4MDcwY2U4NmQ3OTk0Yjk0OWY3Y2I0MjZmYmY2NzBh
OTUzZDgKCkJ1dCBvdXIgdmFsYS13cmFwcGVyIGFscmVhZHkgcGFzc2VzIHRoZSBwYXRoIHRvIGdp
cmRpcjoKCiAgICAkIGNhdCBwYWNrYWdlL3ZhbGEvdmFsYS13cmFwcGVyCiAgICAjIS9iaW4vc2gg
JDAtQFZBTEFfVkVSU0lPTkAgLS12YXBpZGlyPSR7U1RBR0lOR19ESVJ9L3Vzci9zaGFyZS92YWxh
L3ZhcGkgLS1naXJkaXI9JHtTVEFHSU5HX0RJUn0vdXNyL3NoYXJlL2dpci0xLjAgIiRAIgoKSW4g
b3VyIHNpdHVhdGlvbiwgdGhlIGdpcmRpciB3aWxsIGFsd2F5cyBiZSAke1NUQUdJTkdfRElSfS91
c3Ivc2hhcmUvZ2lyLTEuMAphbmQgbmV2ZXIgYW55dGhpbmcgZWxzZS4KClNvIGFkZGluZyBob3N0
LUdPSSwgd2hpY2ggdGFrZXMgYSB3aGlsZSB0byBidWlsZCwgYXMgYSBkZXBlbmRlbmN5IGp1c3QK
dG8gZ2V0IHRoZSBjb250YW50IHZhbHVlIHdlIGFscmVhZHkga25vdywgc2VlbXMgYSBsaXR0bGUg
Yml0IG9mIGFuCm92ZXJoZWFkLCBubz8KCkNhbid0IHdlIGp1c3QgcGFzcyBHSV9HSVJESVIgaW4g
dGhlIGVudmlyb25tZW50LCBhcyBzdWdnZXN0ZWQgaW4gdGhlCmNvbW1pdCBsb2cgeW91IHBvaW50
IGF0IGFib3ZlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
