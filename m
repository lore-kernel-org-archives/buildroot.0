Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D60FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:07:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF3F60E52
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FF3F60E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D86096064E;
	Fri, 12 Nov 2021 13:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chPx8lU4HBbK; Fri, 12 Nov 2021 13:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C046060D;
	Fri, 12 Nov 2021 13:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5270E1BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 421D781C04
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hr2JfnFYlm7g for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:07:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4608181BF5
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:07:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B17F119F576;
 Fri, 12 Nov 2021 14:07:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636722468;
 bh=1gnQnGP9EZ+/0bivcUlrjLTJhJ3V5W1mB5WnNXZ+OO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sf8m4TLAihhZiqcxKESE07gYH6HK3OnsyIBbv5ZmqYPMwnpB0WMOCAufHt52YhR9B
 siRYF6QKYFeLrmeYMQg8oTOAfv4dOIRV4gkkv9QNJjRODG+QMiZPJZ+fz41T6zeaKG
 cME1YOS8EeVqed4ZdbQ8d1dBIinm5Ap5GZjs0IWpAc1U8fuU2Y3+wl76vOVt8L2Hts
 vcxa7qF/ouUtpEPPQc1c4uJ4ineHUXZgC5b1TzKBQsqdPi+/D4muIgFuR6xroCWNCx
 iH/W3XtGtZLexa1agsLakd0XGXFA6I8OXWvrkL82AjA6AyDI1/vWblg1htZyXSQb0c
 DLC7y75FRnHQA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 14:07:42 +0100
Date: Fri, 12 Nov 2021 14:07:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211112130742.GL2609@scaer>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112110007.787836-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/6] package/luvi: don't use LUAJIT_VERSION
 for the luajit installation path
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
Cc: =?utf-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpJIGFnYWluIGhvdCAic2VuZCIgdG9vIGZhc3Q7IHNlZSBhIGNvbXBsZW1l
bnQgYmVsb3cuLi4KCk9uIDIwMjEtMTEtMTIgMTI6MDAgKzAxMDAsIFJvbWFpbiBOYW91ciBzcGFr
ZSB0aHVzbHk6Cj4gTHVhaml0IHBhY2thZ2UgaGFzIGJlZW4gcmVjZW50bHkgdXBkYXRlZCB0byB0
aGUgbGF0ZXN0IGNvbW1pdCBpbiB0aGUKPiBtYXN0ZXIgYnJhbmNoIFsxXS4gU2luY2UgdGhlbiBM
VUFKSVRfVkVSU0lPTiBkb2Vzbid0IGNvbnRhaW4gdGhlIGx1YWppdAo+IHZlcnNpb24gYW55bW9y
ZSBidXQgYSBjb21taXQgaGFzaDoKPiAKPiBMVUFKSVRfVkVSU0lPTiA9IDA1ZjE5ODRlMWE4NjJl
NGIzZDNjM2IzNzBjNzczNDkyZTJlZGY4NGEKPiAKPiBVc2UgcGtnLWNvbmZpZyAtLXZhcmlhYmxl
PXZlcnNpb24gbHVhaml0IGluIGx1dmkgcGFja2FnZSB0byBzZXQKPiBMVUFfUEFUSCBjb3JyZWN0
bHkuCj4gCj4gRml4ZXM6Cj4gbHVhaml0OiB1bmtub3duIGx1YUpJVCBjb21tYW5kIG9yIGppdC4q
IG1vZHVsZXMgbm90IGluc3RhbGxlZAo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvMTcxMDU1MjYwNQo+IAo+IFsxXSA5NDUwYjUzYzhlMDZmMWI1
YTc1ODQwYjgyYzBmNDY2M2E1ZDc1YzQ1Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IENjOiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVz
ZUBlbWJlZGRlZC5yb2Nrcz4KPiBUZXN0ZWQtYnk6IErDtnJnIEtyYXVzZSA8am9lcmcua3JhdXNl
QGVtYmVkZGVkLnJvY2tzPgo+IEFja2VkLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBl
cnJhZEBnYWR6Lm9yZz4KPiAtLS0KPiBUaGUgVGVzdEx1dmkgZG9lc24ndCB3b3JrIHlldCBkdWUg
dG8gbWlzc2luZyBybmcgc3VwcG9ydCBvbiBRZW11IGFybXY3IHRhcmdldAo+IHVzZWQgdG8gcnVu
IHRoZSB0ZXN0LiBsdXZpIC12IGlzIHN0dWNrIGR1ZSB0byBnZXRyYW5kb20oKS4KPiAtLS0KPiAg
cGFja2FnZS9sdXZpL2x1dmkubWsgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2
aS9sdXZpLm1rIGIvcGFja2FnZS9sdXZpL2x1dmkubWsKPiBpbmRleCAzODZkYWFmYzMxLi5lZjU3
NzdjYWM4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbHV2aS9sdXZpLm1rCj4gKysrIGIvcGFja2Fn
ZS9sdXZpL2x1dmkubWsKPiBAQCAtOSw3ICs5LDcgQEAgTFVWSV9TT1VSQ0UgPSBsdXZpLXNyYy12
JChMVVZJX1ZFUlNJT04pLnRhci5nego+ICBMVVZJX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20v
bHV2aXQvbHV2aS9yZWxlYXNlcy9kb3dubG9hZC92JChMVVZJX1ZFUlNJT04pCj4gIExVVklfTElD
RU5TRSA9IEFwYWNoZS0yLjAKPiAgTFVWSV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKPiAt
TFVWSV9ERVBFTkRFTkNJRVMgPSBsaWJ1diBsdWFqaXQgbHV2IGhvc3QtbHVhaml0Cj4gK0xVVklf
REVQRU5ERU5DSUVTID0gbGlidXYgbHVhaml0IGx1diBob3N0LWx1YWppdCBob3N0LXBrZ2NvbmYK
PiAgCj4gICMgRGlzcGF0Y2ggYWxsIGFyY2hpdGVjdHVyZXMgb2YgTHVhSklUCj4gIGlmZXEgKCQo
QlIyX2kzODYpLHkpCj4gQEAgLTMwLDEyICszMCwxNiBAQCBlbHNlCj4gIExVVklfVEFSR0VUX0FS
Q0ggPSAkKEJSMl9BUkNIKQo+ICBlbmRpZgo+ICAKPiArIyBMVUFKSVRfVkVSU0lPTiBhbmQgdGhl
IGx1YWppdCBpbnN0YWxsYXRpb24gcGF0aCBtYXkgbm90IHVzZSB0aGUKPiArIyBzYW1lIHZhbHVl
LiBVc2UgdGhlIHZhbHVlIGZyb20gbHVhaml0LnBjIGZpbGUuCj4gK0xVVklfTFVBSklUX1ZFUlNJ
T04gPSAkKHNoZWxsICQoUEtHX0NPTkZJR19IT1NUX0JJTkFSWSkgLS12YXJpYWJsZT12ZXJzaW9u
IGx1YWppdCkKClNob3VsZG4ndCB0aGF0IHZhcmlhYmxlIGJlIHNldCBpbiBsdWFqaXQubWssIGFu
ZCB0aGF0IGFsbCBwYWNrYWdlcyB0aGF0Cm5lZWQgaXQgdXNlIGl0PwoKSW5kZWVkIHRoZSBsdWFq
aXQgdmVyc2lvbiBzdHJnaW4gaXMgc2VtYW50aWNhbGx5IHRoZSByZXNwb25zaWJpbGl0eSBvZgps
dWFqaXQsIHNvIGl0IHNob3VsZCBiZSBzZXQgaW4gdGhlcmUuCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKPiAgIyBCdW5kbGVkIGx1YSBiaW5kaW5ncyBoYXZlIHRvIGJlIGxpbmtlZCBzdGF0aWNh
bGx5IGludG8gdGhlIGx1dmkgZXhlY3V0YWJsZQo+ICBMVVZJX0NPTkZfT1BUUyA9IFwKPiAgCS1E
QlVJTERfU0hBUkVEX0xJQlM9T0ZGIFwKPiAgCS1EV2l0aFNoYXJlZExpYmx1dj1PTiBcCj4gIAkt
RFRBUkdFVF9BUkNIPSQoTFVWSV9UQVJHRVRfQVJDSCkgXAo+IC0JLURMVUFfUEFUSD0kKEhPU1Rf
RElSKS9zaGFyZS9sdWFqaXQtJChMVUFKSVRfVkVSU0lPTikvPy5sdWEKPiArCS1ETFVBX1BBVEg9
JChIT1NUX0RJUikvc2hhcmUvbHVhaml0LSQoTFVWSV9MVUFKSVRfVkVSU0lPTikvPy5sdWEKPiAg
Cj4gICMgQWRkICJyZXgiIG1vZHVsZSAoUENSRSB2aWEgYnVuZGxlZCBscmV4bGliKQo+ICBpZmVx
ICgkKEJSMl9QQUNLQUdFX1BDUkUpLHkpCj4gLS0gCj4gMi4zMS4xCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1
NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUv
ICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8
IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
