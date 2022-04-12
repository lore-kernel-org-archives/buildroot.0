Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE8AB40B52;
	Tue, 12 Apr 2022 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2h4lVJBDdaD; Tue, 12 Apr 2022 19:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470C540B47;
	Tue, 12 Apr 2022 19:54:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31BF11BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FBBE82F2D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1t2b8I9T-_0F for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:54:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4304082F0F
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 19:54:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3302813F814;
 Tue, 12 Apr 2022 21:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793273;
 bh=t0yfQ2m6IBroYKVFB9Qogb/ezyKS6xUIWEDOsJKNEwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WiapAP2+kDrK9+B7EKVGJ2N5gvPztSZxPOqSXWzkb4cAd47jR/r2KHj/oWSVNLH4J
 SbphvND17mZcX7roqCkD+ZTmTOo5XvqOSux+3lLEXnwoFcEHGkGoyCMAGs6hT1P0GV
 CocsVSKyG0eZNW6C4jROWP8uGmerLkZ2kHuTPxmvxrMs3ElV9zE7wy8Yn9lxNuRzQM
 +wqHBNurXcbyqskCDHKva0asV7jql7Vhljy50qJEI5uVeCHvFH89nCf/wUPNXz6ZSn
 DsQT8TtsYHw3jd8beLA26mmycNNHlQmXOOBZyEI1JDRqCe6/cwxN2zTBEs9aAdG3QW
 R6mqNW9B8hGtA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:54:30 +0200
Date: Tue, 12 Apr 2022 21:54:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220412195430.GF4029883@scaer>
References: <20220412180139.2709625-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412180139.2709625-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libepoxy: bump to version 1.5.10
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDIwOjAxICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2xpYmVwb3h5L2xpYmVwb3h5Lmhhc2gg
fCA0ICsrLS0KPiAgcGFja2FnZS9saWJlcG94eS9saWJlcG94eS5tayAgIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJlcG94eS9saWJlcG94eS5oYXNoIGIvcGFja2FnZS9saWJlcG94eS9s
aWJlcG94eS5oYXNoCj4gaW5kZXggMzc2OTIwYzNjLi5iZjZjNTJmOTkgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9saWJlcG94eS9saWJlcG94eS5oYXNoCj4gKysrIGIvcGFja2FnZS9saWJlcG94eS9s
aWJlcG94eS5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gLSMgRnJvbSBodHRwOi8vZnRwLmdub21l
Lm9yZy9wdWIvZ25vbWUvc291cmNlcy9saWJlcG94eS8xLjUvbGliZXBveHktMS41Ljkuc2hhMjU2
c3VtCj4gLXNoYTI1NiAgZDE2OGExOWE2ZWRmZGQ5OTc3ZmVmMTMwOGNjZjUxNjA3OTg1NmE0Mjc1
Y2Y4NzZkZTY4OGZiNzkyN2UzNjVlNCAgbGliZXBveHktMS41LjkudGFyLnh6Cj4gKyMgRnJvbSBo
dHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNlcy9saWJlcG94eS8xLjUvbGliZXBv
eHktMS41LjEwLnNoYTI1NnN1bQo+ICtzaGEyNTYgIDA3MmNkYTRiNTlkZDA5OGJiYThjMjM2M2E2
MjQ3Mjk5ZGIxZmE4OTQxMWRjMjIxYzhiODFiOGVlODE5MmU2MjMgIGxpYmVwb3h5LTEuNS4xMC50
YXIueHoKPiAgCj4gICMgSGFzaGVzIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEyNTYgIDhkNTE0
NDY2NmY5YzRkZjliYmQ2OWI4OTAwMDg2ZDU5NzkyNTkxNTJhMTA2MDQyMWNkY2MwZmI5MDYxYTFj
MTIgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJlcG94eS9saWJlcG94eS5tayBi
L3BhY2thZ2UvbGliZXBveHkvbGliZXBveHkubWsKPiBpbmRleCA1YTcxZmU1OTkuLjJhZjJlMmY2
ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmVwb3h5L2xpYmVwb3h5Lm1rCj4gKysrIGIvcGFj
a2FnZS9saWJlcG94eS9saWJlcG94eS5tawo+IEBAIC01LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ICAKPiAgTElCRVBPWFlfVkVSU0lPTl9NQUpPUiA9IDEuNQo+IC1MSUJF
UE9YWV9WRVJTSU9OID0gJChMSUJFUE9YWV9WRVJTSU9OX01BSk9SKS45Cj4gK0xJQkVQT1hZX1ZF
UlNJT04gPSAkKExJQkVQT1hZX1ZFUlNJT05fTUFKT1IpLjEwCj4gIExJQkVQT1hZX1NJVEUgPSBo
dHRwOi8vZnRwLmdub21lLm9yZy9wdWIvZ25vbWUvc291cmNlcy9saWJlcG94eS8kKExJQkVQT1hZ
X1ZFUlNJT05fTUFKT1IpCj4gIExJQkVQT1hZX1NPVVJDRSA9IGxpYmVwb3h5LSQoTElCRVBPWFlf
VkVSU0lPTikudGFyLnh6Cj4gIExJQkVQT1hZX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IC0tIAo+
IDIuMzIuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
