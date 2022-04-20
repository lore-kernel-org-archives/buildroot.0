Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B5CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24F614058E;
	Wed, 20 Apr 2022 20:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAvAdlbdP3mC; Wed, 20 Apr 2022 20:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C27740584;
	Wed, 20 Apr 2022 20:57:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B58E31BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1D4F4160B
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnfKQCa6CctJ for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:57:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DCC4415C7
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:57:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 41A7D5FF67;
 Wed, 20 Apr 2022 22:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650488233;
 bh=bljvGyLtD97jxCYM4RzGrZ256fjCMEKd7oxiN/rjlqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oV60dYqCnn68rep34qXxza+H1hQtXEKnXsbwqqnBtDy6ZVTVqxfX+3yTg4hlZGztQ
 +KgHcN6FppkodjgP2QpyGTrQTE3ouSSJcrGEc7R2dl9AtjPvnE4GY5PJnDeivCmjMS
 VkSD8v+UgIspH0muyzG2/VXgMR4IognS0VGzZkjv5L/Q2s7MekaIolD7Q/4hQJSsfY
 Dp5zkb0wRapHr9s/yr5V+gK69UtkJvMDX7FiXBiL6XRFSJJt+yrjROWywomWs3mhpT
 ATwdKgL/djYZU/25Bvhx9JuQr4zdpoyYtVhuab0Cg2o44ETQvYuOchNZ915TdRU2Lr
 ObIZIuQ6fO0cQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Apr 2022 22:57:08 +0200
Date: Wed, 20 Apr 2022 22:57:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Message-ID: <20220420205708.GI2730@scaer>
References: <20220310152048.633340-1-theo.lebrun@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220310152048.633340-1-theo.lebrun@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/ragel: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGjDqW8sIEFsbCwKCk9uIDIwMjItMDMtMTAgMTY6MjAgKzAxMDAsIFRow6lvIExlYnJ1biB2aWEg
YnVpbGRyb290IHNwYWtlIHRodXNseToKPiBUaGlzIGlzIGFuIGhvc3Qtb25seSBwYWNrYWdlIHRo
YXQgZG9lcyBwcmVwcm9jZXNzaW5nIHRvIC5ybCBmaWxlcyB0bwo+IHR1cm4gdGhlbSBpbnRvIC5j
IG9yIC5jcHAgZmlsZXMuCj4gCj4gSW5pdGlhbGx5IGFkZGVkIHRvIHN1cHBvcnQgcGFja2FnZS9y
b2MuCj4gCj4gU2VlIGh0dHBzOi8vd3d3LmNvbG0ubmV0L29wZW4tc291cmNlL3JhZ2VsLyBmb3Ig
dGhlIHByb2plY3QncyBob21lIHBhZ2U6Cj4gCj4gUmFnZWwgY29tcGlsZXMgZXhlY3V0YWJsZSBm
aW5pdGUgc3RhdGUgbWFjaGluZXMgZnJvbSByZWd1bGFyIGxhbmd1YWdlcy4KPiBSYWdlbCB0YXJn
ZXRzIEMsIEMrKyBhbmQgQVNNLiBSYWdlbCBzdGF0ZSBtYWNoaW5lcyBjYW4gbm90IG9ubHkKPiBy
ZWNvZ25pemUgYnl0ZSBzZXF1ZW5jZXMgYXMgcmVndWxhciBleHByZXNzaW9uIG1hY2hpbmVzIGRv
LCBidXQgY2FuCj4gYWxzbyBleGVjdXRlIGNvZGUgYXQgYXJiaXRyYXJ5IHBvaW50cyBpbiB0aGUg
cmVjb2duaXRpb24gb2YgYSByZWd1bGFyCj4gbGFuZ3VhZ2UuIENvZGUgZW1iZWRkaW5nIGlzIGRv
bmUgdXNpbmcgaW5saW5lIG9wZXJhdG9ycyB0aGF0IGRvIG5vdAo+IGRpc3J1cHQgdGhlIHJlZ3Vs
YXIgbGFuZ3VhZ2Ugc3ludGF4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhl
by5sZWJydW5AYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvcmFnZWwvcmFnZWwuaGFzaCB8
ICAzICsrKwo+ICBwYWNrYWdlL3JhZ2VsL3JhZ2VsLm1rICAgfCAxOCArKysrKysrKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3JhZ2VsL3JhZ2VsLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvcmFnZWwvcmFnZWwubWsKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yYWdlbC9yYWdlbC5o
YXNoIGIvcGFja2FnZS9yYWdlbC9yYWdlbC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwLi4zMzJmNTg3NDMyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2th
Z2UvcmFnZWwvcmFnZWwuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgY29tcHV0
ZWQ6Cj4gK3NoYTI1NiAgNWYxNTZlZGI2NWQyMGI4NTZkNjM4ZGQ5ZWUyZGZiNDMyODU5MTRkOWFh
MmI2ZWM3NzlkYWMwMjcwY2Q1NmMzZiAgcmFnZWwtNi4xMC50YXIuZ3oKPiArc2hhMjU2ICAwNWE4
Nzk3NWFjY2I1MzkzOTlkMGM4YTRmNDQwMmFjMjdhNjc2MmZiMWU0ZjMxZDA0ZDQ1NWE4YmVlM2Uz
NjkzICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmFnZWwvcmFnZWwubWsgYi9wYWNr
YWdlL3JhZ2VsL3JhZ2VsLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi40NzZhZmY1ZGE0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcmFnZWwvcmFn
ZWwubWsKPiBAQCAtMCwwICsxLDE4IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMK
PiArIyByYWdlbAo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtSQUdFTF9W
RVJTSU9OID0gNi4xMAo+ICtSQUdFTF9TSVRFID0gaHR0cHM6Ly93d3cuY29sbS5uZXQvZmlsZXMv
cmFnZWwvCj4gK1JBR0VMX0xJQ0VOU0UgPSBHUEwtMi4wCj4gK1JBR0VMX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HCj4gK1JBR0VMX0NPTkZfT1BUUyA9IFwKPiArCS0tZGlzYWJsZS1zaWxlbnQtcnVs
ZXMgXAo+ICsJLS1kaXNhYmxlLW1hbnVhbCBcCj4gKwktLWRpc2FibGUtZGVwZW5kZW5jeS10cmFj
a2luZwo+ICtSQUdFTF9ERVBFTkRFTkNJRVMgPQo+ICtIT1NUX1JBR0VMX0RFUEVOREVOQ0lFUyA9
CgpVc2VsZXNzIHNldHRpbmcgb2YgZW1wdHkgdmFyaWFibGVzLiBCZXNpZGVzLCBSQUdFTF9ERVBF
TkRFTkNJRVMgaXMgbm90CmV2ZW4gbmVlZGVkIGFzIHRoaXMgaXMgYSBob3N0LW9ubHkgcGFja2Fn
ZS4KCkFwcGxpZWQgdG8gbWFzdGVyIGFmdGVyIGRyb3BwaW5nIHRob3NlIHR3byB2YXJpYWJsZXMs
IHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICskKGV2YWwgJChob3N0LWF1dG90
b29scy1wYWNrYWdlKSkKPiAtLSAKPiAyLjM1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
