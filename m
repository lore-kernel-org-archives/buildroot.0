Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3019BECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 08:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A750E40BB0;
	Tue,  6 Sep 2022 08:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A750E40BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YhpXW8xIpD1k; Tue,  6 Sep 2022 08:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0CE5404BF;
	Tue,  6 Sep 2022 08:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0CE5404BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471281BF28F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21A8040BB0
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21A8040BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccFngWJ3r_XP for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 08:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2DF404BF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE2DF404BF
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 08:24:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 69017B00563;
 Tue,  6 Sep 2022 10:24:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 10:24:38 +0200
Date: Tue, 6 Sep 2022 10:24:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20220906082438.GQ1490660@scaer>
References: <20220906081425.854318-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906081425.854318-1-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662452684;
 bh=GJj3r+vwRgS1kUiSMlWR6/K/s9Ke0LCZT/QAG3rg7QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b8c6m5Q+/u5b0aYA75lvZKIG9Rq+GKhd4iAGmEPgr5ZUEqk4FOV0DOkbcGsuQmXfJ
 F5DX3CPTRNnUhsg1fci94s12cLI1uDE99bw6I3UoVB3sLF19/DrdYEsSAoRh77+EFF
 gA53hXCnWIpAqht43oTmZnkcIhN3KyfByi3p6yxQ2ZydAt61ROBTqAWCZaLEvCQdML
 WI1gHC45IKxJCCDJXF7Uhtsl/nxBVkfo9xHE3yCObcJMt9AxgiKS8W4lX7rJ25PqNU
 jj8nJcnKn4dk3T5zDT7aQkbqCGH++Y7cM9S+EuPU1BhTlTmQrDnnjRpKe0IGg/Pf9Y
 oi1KVGdHzfWLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b8c6m5Q+
Subject: Re: [Buildroot] [PATCH] package/python-pillow: remove
 host-python-pillow support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjItMDktMDYgMTA6MTQgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHNw
YWtlIHRodXNseToKPiBGcm9tOiBLb3J5IE1haW5jZW50IDxrb3J5Lm1haW5jZW50QGJvb3RsaW4u
Y29tPgo+IAo+IGhvc3QtcHl0aG9uLXBpbGxvdyB3YXMgbmVlZGVkIHRvIGJ1aWxkIG9wdGVlLW9z
IGZyb20gU1RNaWNyb2VsZWNyb25pY3MKPiBkdXJpbmcgaXRzIHJjIHZlcnNpb25zIGJ1dCBpcyBp
cyBub3QgbmVlZGVkIGFueW1vcmUgaW4gdGhlIHJlbGVhc2UuCj4gSXQgaXMgdGhlbiB1c2VsZXNz
IHRvIGtlZXAgdGhpcyBzdXBwb3J0LgoKRXJyLCBkaWQgeW91IGZvcmdldCB0byByZW1vdmUgaXQg
ZnJvbSBvcHRlZS1vcz8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IFNpZ25lZC1vZmYtYnk6
IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5tayBiL3BhY2thZ2UvcHl0aG9uLXBpbGxvdy9w
eXRob24tcGlsbG93Lm1rCj4gaW5kZXggN2NmZjU0ZTllYS4uMzE3MjVhM2U0NiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3B5dGhvbi1waWxsb3cvcHl0aG9uLXBpbGxvdy5tawo+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLXBpbGxvdy9weXRob24tcGlsbG93Lm1rCj4gQEAgLTcxLDE4ICs3MSw0IEBAIGVs
c2UKPiAgUFlUSE9OX1BJTExPV19CVUlMRF9PUFRTICs9IC0tZGlzYWJsZS13ZWJwIC0tZGlzYWJs
ZS13ZWJwbXV4Cj4gIGVuZGlmCj4gIAo+IC1IT1NUX1BZVEhPTl9QSUxMT1dfREVQRU5ERU5DSUVT
ID0gaG9zdC1wa2djb25mCj4gLUhPU1RfUFlUSE9OX1BJTExPV19CVUlMRF9PUFRTID0gXAo+IC0J
YnVpbGRfZXh0IFwKPiAtCS0tZGlzYWJsZS1mcmVldHlwZSBcCj4gLQktLWRpc2FibGUtanBlZyBc
Cj4gLQktLWRpc2FibGUtbGNtcyBcCj4gLQktLWRpc2FibGUteGNiIFwKPiAtCS0tZGlzYWJsZS1q
cGVnMjAwMCBcCj4gLQktLWRpc2FibGUtdGlmZiBcCj4gLQktLWRpc2FibGUtd2VicCBcCj4gLQkt
LWRpc2FibGUtd2VicG11eAo+IC1IT1NUX1BZVEhPTl9QSUxMT1dfSU5TVEFMTF9PUFRTID0gJChI
T1NUX1BZVEhPTl9QSUxMT1dfQlVJTERfT1BUUykKPiAtCj4gICQoZXZhbCAkKHB5dGhvbi1wYWNr
YWdlKSkKPiAtJChldmFsICQoaG9zdC1weXRob24tcGFja2FnZSkpCj4gLS0gCj4gMi4yNS4xCj4g
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
