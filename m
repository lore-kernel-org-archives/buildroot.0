Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A616AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493E860ABD;
	Sun, 20 Nov 2022 09:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493E860ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtrjfCIedDz9; Sun, 20 Nov 2022 09:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F39F607FE;
	Sun, 20 Nov 2022 09:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F39F607FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9104C1BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7905B81EB4
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7905B81EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2boJ0aT_CGBq for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:22:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C40781D35
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C40781D35
 for <buildroot@busybox.net>; Sun, 20 Nov 2022 09:22:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0a9:eda8:8a8b:60c8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6F149B0053D;
 Sun, 20 Nov 2022 10:22:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Nov 2022 10:22:40 +0100
Date: Sun, 20 Nov 2022 10:22:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221120092240.GS2123054@scaer>
References: <20221118190014.1401088-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118190014.1401088-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668936162;
 bh=+Fh9li6r3S8/Fkun7UH6ge/Stll4NzSW3yIPXTQ187k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A9pB4d5YDRWyV6k3HP7TRNa97JWVfoVr1ceKCpYTmQAKx2EvXEbAWPiLuHRwpV7v4
 aGIImIVTpSEwjO+6go3j0t7iWlCDjd64M0i6EbVWluZeq61sU2T8ohWcguzXyBUQsz
 3zo3mNPt6QQIaAUoTcfXKBeHw/y8WPy3s/hMawY8bul/+y+RE+6wJMf0oV2jPky8UD
 lyJjWwqqFo5o2DfqQN8hpjPCzAnW9HBK/7C7NFyQoySnKz5becfUMtkK0hOgSHWZGV
 kTwtOP/0jjZszqbi1RLIsZI+1qILDsA7GxPToOsl1oItGevFqYV/FoHFPYXdsZBAjW
 JnbxxQpNAKrsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A9pB4d5Y
Subject: Re: [Buildroot] [PATCH] package/fakeroot: bump to version 1.30.1
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTExLTE4IDIwOjAwICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IHJlbW92ZSB1cHN0cmVhbSBwYXRjaAo+IAo+IHJlbW92ZSBta2Rp
ciBidWlsZC1hdXggKG5vIGxvbmdlciBuZWVkZWQsIGxpa2UgQVVUT1JFQ09ORikKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPiAt
LS0KWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lm1r
IGIvcGFja2FnZS9mYWtlcm9vdC9mYWtlcm9vdC5tawo+IGluZGV4IDNmYWRmMWMwZi4uNWI0ZmIy
NmEzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZmFrZXJvb3QvZmFrZXJvb3QubWsKPiArKysgYi9w
YWNrYWdlL2Zha2Vyb290L2Zha2Vyb290Lm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUZBS0VST09UX1ZFUlNJT04gPSAxLjI2Cj4gK0ZB
S0VST09UX1ZFUlNJT04gPSAxLjMwLjEKPiAgRkFLRVJPT1RfU09VUkNFID0gZmFrZXJvb3RfJChG
QUtFUk9PVF9WRVJTSU9OKS5vcmlnLnRhci5nego+IC1GQUtFUk9PVF9TSVRFID0gaHR0cHM6Ly9z
bmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjEwOTA3VDA5MjUxMlovcG9vbC9t
YWluL2YvZmFrZXJvb3QKPiArRkFLRVJPT1RfU0lURSA9IGh0dHBzOi8vZGViLmRlYmlhbi5vcmcv
ZGViaWFuL3Bvb2wvbWFpbi9mL2Zha2Vyb290CgpXZSBzdGlsbCB3YW50IHRvIHVzZSBzbmFwc2hv
dC5kZWJpYW4ub3JnLCBzbyB0aGF0IHdlIGNhbiBzdGlsbCByZXRyaWV2ZQp0aGF0IHRhcmJhbGwg
aW4gdGhlIGZ1dHVyZSAod2hlbiBubyB0aGVuLWN1cnJlbnQgZGViaWFuIHZlcnNpb24gdXNlIGl0
CmFueW1vcmUpLiBTbywgSSByZXZlcnRlZCB0byBzLmQubywgdG8gdGhlIGN1cnJlbnQgZGF0ZToK
ICAgIGh0dHBzOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlhbi8yMDIyMTEyMFQw
MzAyNThaL3Bvb2wvbWFpbi9mL2Zha2Vyb290CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIEhPU1RfRkFLRVJPT1RfREVQRU5ERU5DSUVTID0g
aG9zdC1hY2wKPiAgIyBGb3JjZSBjYXBhYmlsaXRpZXMgZGV0ZWN0aW9uIG9mZgo+IEBAIC0xOCw5
ICsxOCw0IEBAIEhPU1RfRkFLRVJPT1RfQ09ORl9FTlYgPSBcCj4gIEZBS0VST09UX0xJQ0VOU0Ug
PSBHUEwtMy4wKwo+ICBGQUtFUk9PVF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICAKPiAtZGVm
aW5lIEhPU1RfRkFLRVJPT1RfQlVJTERfQVVYCj4gLQlta2RpciAtcCAkKEBEKS9idWlsZC1hdXgK
PiAtZW5kZWYKPiAtSE9TVF9GQUtFUk9PVF9QT1NUX1BBVENIX0hPT0tTICs9IEhPU1RfRkFLRVJP
T1RfQlVJTERfQVVYCj4gLQo+ICAkKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKPiAt
LSAKPiAyLjM3LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1U
aW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cnwg
KzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8
ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0t
LS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3lt
b3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNv
bnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
