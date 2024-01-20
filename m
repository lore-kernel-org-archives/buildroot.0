Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BBC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 08:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3929984659;
	Sat, 20 Jan 2024 08:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3929984659
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9VPt_Rn9QqRC; Sat, 20 Jan 2024 08:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905FA84651;
	Sat, 20 Jan 2024 08:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905FA84651
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84AE91BF5AD
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 08:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8384036A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 08:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C8384036A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZujx7_D3RF0 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 08:57:54 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F03240004
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 08:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F03240004
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0F98813F89A;
 Sat, 20 Jan 2024 09:57:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 09:57:46 +0100
Date: Sat, 20 Jan 2024 09:57:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZauLCj2SEEeSQIv7@landeda>
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
 <ZarX-o1aELjzYnys@landeda> <CYJDQOY1OLS2.2VW25BFSDZOVP@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CYJDQOY1OLS2.2VW25BFSDZOVP@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705741072;
 bh=Co4xSLjfTk8DcaYQFEh04bPLOrTz01vV0KIo8S5vgmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tbL+v0roScYZ3/srtpZXcHf5Tswd27Eiigs/taenT9A1J86PRbJFlCk4uktypIzZG
 YA8S8dw8SPZzEdHm34tJ6mMdSgEVioi1JBB9GGsNf44yqIs6Ikh3rs8KqLnAE0srpE
 7S5JPgV3AJW8oaJDoUnbN6mxdp/0ueSZvGKj4jNo8BVkKb190eyVgcGd0DgX5aCfNG
 sAFIUNdeZQW0GTL5beici7tVHZD4BLkA9WRw7yoTJelU0GAgqvJmv9a772JNrB4ZUI
 42m+4M9gllnBbb4i+0suVQ+up7hC4bW8HQDWyoyCSK7QJzFYbuWxVJYRqLqZnsPlEA
 1kJZKHN9ZHrCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tbL+v0ro
Subject: Re: [Buildroot] [PATCH v2 0/2] Add support for Pi5
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjQtMDEtMjAgMDk6MTAgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gT24gRnJpIEphbiAxOSwgMjAyNCBhdCA5OjEzIFBNIENFVCwgWWFubiBFLiBN
T1JJTiB3cm90ZToKPiA+IE9uIDIwMjMtMTItMTEgMTY6NTkgKzAxMDAsIEdhw6tsIFBPUlRBWSBz
cGFrZSB0aHVzbHk6Cj4gPiA+IFRoZSBmaXJzdCBwYXRjaCBlbmFibGVzIE1NVSAxNksgcGFnZS1z
aXplIG9uIEFSTTY0IGFzIHRoZSBSYXNwYmVycnkgUGkgNQo+ID4gPiBzdXBwb3J0cyAxNksgcGFn
ZS1zaXplWzFdLgo+ID4gU28sIHVubGVzcyAxNksgaXMgYSByZXF1aXJlbWVudCwgSSB0aGluayB1
c2luZyA0SyBwYWdlcyB3b3VsZCBiZSBiZXR0ZXIuCj4gU28geW91IGFyZSBzdWdnZXN0aW5nIHRv
IGhhdmUgYSByYXNwYmVycnlwaTVfZGVmY29uZmlnIHVzZXMgYSA0ayBwYWdlCj4gc2l6ZSBpbiBh
IGZpcnN0IHBsYWNlIChhcyBiY20yNzEyIHdvcmtzIHdpdGggNGsgdG9vKS4KClllcy4KCj4gQW5k
IHRvIGhhdmUgcHJvYmFibHkgYSByYXNwYmVycnlwaTUtMTZrX2RlZmNvbmZpZyB0aGF0IHdpbGwg
dXNlIGEgMTZrCj4gcGFnZSBzaXplIGxhdGVyIG9uY2UgQlIgaGF2ZSBlbm91Z2ggYml0cyB0byBm
aWx0ZXItb3V0IGV4dGVybmFsCj4gdG9vbGNoYWlucyB0aGF0IGRvIG5vdCBzdXBwb3J0IGZvciAx
NmsgcGFnZSBzaXplPwoKT3IganVzdCByZXZlcnQgdGhlIHJwaTUgZGVmY29uZmlnIHRvIDE2SyBw
YWdlcywgYmVjYXVzZSB0aGVuIHdlJ2QgYmUKcHJvdGVjdGVkIGFnYWluc3QgYSBtaXMtY29uZmln
dXJhdGlvbiwgc28gYWxsIHdvdWxkIGVuZCB3ZWxsLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
