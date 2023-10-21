Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E929C001E0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 19:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC7D640131;
	Sat, 21 Oct 2023 19:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7D640131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AOxoqZFUFnZz; Sat, 21 Oct 2023 19:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62C7B403E7;
	Sat, 21 Oct 2023 19:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62C7B403E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58BC51BF3D2
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 19:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 319ED84CDC
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 19:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319ED84CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHCgaqEbCQ1v for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 19:25:39 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E68684CD3
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 19:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E68684CD3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2259B5FFAF;
 Sat, 21 Oct 2023 21:25:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Oct 2023 21:25:32 +0200
Date: Sat, 21 Oct 2023 21:25:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20231021192532.GC2607@scaer>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697576472.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697916336;
 bh=i++7PV+kTONkeqKJZ+JhmjgYLcVeKoKsRwjuMIZuyc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYFV/wg1gJjtW3JHOcWIFD9qPjSt4qpGxJKmvx1QTdhRhIixD4iAu76Mawq52I7QG
 aKUIpRsnqTOsfjCw8ElhJRlZJnSq3wkdY4J4r32HeP26hjX6QiKQV7wJmekwUmc6Eg
 Zcz79X2K5KnLqS4moB4J+fTzsa5t3nP985/+Hg1jYj1lyXVeMg/plTT1qQeaLhrGeK
 8RqD6BIN3aqrRQY3I2ZD9JnFpMdcdqG+hFJcwdHyyzrY1C8xaP1+WgsON6gBaGd84B
 glATqLropdnAZ3w60JzUTiK8Q6WPLXYXbyi6FgHbygUql6qF0r+Khi/84nRpXSfx1t
 8CBIdT5RH7Gww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sYFV/wg1
Subject: Re: [Buildroot] [PATCH 0/2] package/pkg-utils: fix regression in
 size and build time with PPD (branch yem/rsync-copy)
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gMjAyMy0xMC0xNyAyMzowMSArMDIwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVz
bHk6Cj4gVGhpcyBzbWFsbCBzZXJpZXMgaXMgYSBwcm9wb3NhbCB0byByZXZlcnQgdGhlIGh1Z2Ug
cmVncmVzc2lvbiBpbiBzaXplCj4gYW5kICh0byBhIGxlc3NlciBleHRlbmQpIGJ1aWxkIGR0aW1l
IGR1ZSB0byBub3QgaGFyZC1saW5raW5nIHNvdXJjZQo+IGZpbGVzIHdobiBwcmVwYXJpbmcgcGVy
LXBhY2thZ2UgZGlyZWN0b3JpZXMsIG9yIHdoZW4gYXNzZW1ibGluZyB0aGUKPiBmaW5hbCB0YXJn
ZXQraG9zdCBkaXJlY3Rvcmllcy4KPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4g
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+IFlhbm4gRS4gTU9SSU4gKDIpOgo+ICAgICAgIFJldmVydCAicGFja2FnZS9w
a2ctdXRpbHMubWs6IGJyZWFrIGhhcmRsaW5rcyBpbiBnbG9iYWwge1RBUkdFVCwgSE9TVH1fRElS
IG9uIHBlci1wYWNrYWdlIGJ1aWxkIgo+ICAgICAgIHBhY2thZ2UvcGtnLXV0aWxzOiB0ZWFjaCBw
ZXItcGFja2FnZS1yc3luYyB0byBjb3B5IG9yIGhhcmRsaW5rIGRlc3QKCkJvdGggcGF0Y2hlcyBh
cHBsaWVkLCBhZnRlciBmaXhpbmcgaXNzdWVzIG5vdGljZWQgYnkgSGVydsOpLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCj4gIE1ha2VmaWxlICAgICAgICAgICAgIHwgIDQgKystLQo+ICBwYWNr
YWdlL3BrZy11dGlscy5tayB8IDEzICsrKysrKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IC4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vl
ay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwK
PiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
