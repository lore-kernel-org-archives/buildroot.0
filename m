Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B35CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 20:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EADD417E8;
	Wed,  3 Apr 2024 20:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3SBImEFEXOO; Wed,  3 Apr 2024 20:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 506E141807
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506E141807;
	Wed,  3 Apr 2024 20:31:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0171BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A0D882230
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 20:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-dl0r9yjjPS for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 20:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11C7E82110
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C7E82110
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11C7E82110
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 20:31:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 82DBB13F86A;
 Wed,  3 Apr 2024 22:31:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 22:31:21 +0200
Date: Wed, 3 Apr 2024 22:31:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zg28mdv0kQfZCBO2@landeda>
References: <20240403084033.512286-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403084033.512286-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712176284;
 bh=1smsf010j2sT3aO1GiCWLo1utqx5awEeXb5/DlH80hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=si41MQ7l9Lo9LTcMud0axc4Vu09/rcqpquUWq6T6GrOOT/FOAHt6wPyr7KHRN2Ml8
 Mhlcd42Y0wAFKoQT6iDONjspHUBZ1TLIBmYjFsR7uTodZq6eIuHvCrUytFrSJYRpKu
 25cVNhr2xtCGwRwYTPmDRQRsN5xpv979/kCJiweArcFAs2Um+KGjPGrzwzYCq7cBPV
 DrM44nqKLvKSd+y27zsJ5egNjNtID//tO5d7OLYjFxw2bn6gcZWbHs9nTpOsew8xUb
 4I4KdVZChhocltXmRsOooDfIJTbzpjZYVNg3xLL1AggjORcuf3smr75yJxt6CcaQGf
 4Yifw4cWL6uvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=si41MQ7l
Subject: Re: [Buildroot] [PATCH 1/5] package/gnupg2: bump to version 2.4.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDI0LTA0LTAzIDEwOjQwICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKV2hvbGUgc2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFu
a3MhCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9nbnVwZzIvZ251
cGcyLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9nbnVwZzIvZ251cGcyLm1rICAgfCAyICstCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2dudXBnMi9nbnVwZzIuaGFzaCBiL3BhY2thZ2UvZ251cGcyL2du
dXBnMi5oYXNoCj4gaW5kZXggYzgyMWFmYjU1Li44YmI2NGM5ZWQgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9nbnVwZzIvZ251cGcyLmhhc2gKPiArKysgYi9wYWNrYWdlL2dudXBnMi9nbnVwZzIuaGFz
aAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIEZyb20gaHR0cHM6Ly93d3cuZ251cGcub3JnL2Rvd25s
b2FkL2ludGVncml0eV9jaGVjay5odG1sCj4gLXNoYTEgIDIyOGIzOTg0MzI1ZmRlZWJjNWUzZjJk
MTY1YzY0MTlhNWViYzI4ZGUgIGdudXBnLTIuNC40LnRhci5iejIKPiAtc2hhMjU2ICA2N2ViZTAx
NmNhOTBmYTc2ODhjZTY3YTM4N2ViZDgyYzYyNjFlOTU4OTdkYjdiMjNkZjI0ZmYzMzViZTg1YmM2
ICBnbnVwZy0yLjQuNC50YXIuYnoyCj4gK3NoYTEgIGFlMDkzNWVhZDI5YTJkZmEzNGQ2YjQ4ZDcw
ODA4NjUyYmMzY2E3M2IgIGdudXBnLTIuNC41LnRhci5iejIKPiArc2hhMjU2ICBmNjhmN2Q3NWQw
NmNiMTYzNWMzMzZkMzRkODQ0YWY5NzQzNmMzZjY0ZWExNGJjYjdjODY5NzgyZjk2ZjQ0Mjc3ICBn
bnVwZy0yLjQuNS50YXIuYnoyCj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgYmMy
ZDY2NjRmNjI3NmZhMGE3MmQ1NzYzM2IzYWU2OGRjN2RjYjY3N2I3MTAxOGJmMDhjOGU5M2U1MDlm
MTM1NyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dudXBnMi9nbnVwZzIubWsgYi9w
YWNrYWdlL2dudXBnMi9nbnVwZzIubWsKPiBpbmRleCA5ODZkYTQ3OTAuLjM5YjBhMDY2ZiAxMDA2
NDQKPiAtLS0gYS9wYWNrYWdlL2dudXBnMi9nbnVwZzIubWsKPiArKysgYi9wYWNrYWdlL2dudXBn
Mi9nbnVwZzIubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKPiAtR05VUEcyX1ZFUlNJT04gPSAyLjQuNAo+ICtHTlVQRzJfVkVSU0lPTiA9IDIu
NC41Cj4gIEdOVVBHMl9TT1VSQ0UgPSBnbnVwZy0kKEdOVVBHMl9WRVJTSU9OKS50YXIuYnoyCj4g
IEdOVVBHMl9TSVRFID0gaHR0cHM6Ly9nbnVwZy5vcmcvZnRwL2djcnlwdC9nbnVwZwo+ICBHTlVQ
RzJfTElDRU5TRSA9IEdQTC0zLjArCj4gLS0gCj4gMi40MC4xCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
