Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44EFCD37AC
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 20:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8776841989;
	Fri, 15 Sep 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8776841989
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0g81MluouQIu; Fri, 15 Sep 2023 20:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96E5340949;
	Fri, 15 Sep 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96E5340949
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9A3D1BF39E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB7D0423EB
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7D0423EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkvMIa2EJ4Z6 for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 20:51:56 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 412404217E
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412404217E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6C3762003CA;
 Fri, 15 Sep 2023 22:51:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 22:51:51 +0200
Date: Fri, 15 Sep 2023 22:51:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230915205151.GB2571@scaer>
References: <20230915193344.1434907-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915193344.1434907-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694811113;
 bh=YuRa3wWv2TAKHzj/j7SGvb6mVGY6O8/jIxZkGOcBXMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vZjdWLEIilKlqgxcK3S45hKbXRZnaNOBtEGd/hkr3XQXIfyxmjtl8vQYU21EFjsNG
 tPV9Kj+xsqskErJzAG67+MFLKSMEShN9FitbDUaQfos5TWII8s28a0xzQU9ji58SiJ
 fHV80p4ysMkrI58Njb8oREFOLC+1ln93oNNlWHb+zC+Nc35GdMYhqqp8XsrXhXQzKC
 74yrKbtJNFnZNxiWpcFg6hI6Oq+Hp24u+osn8VvBWv5dJtSil/jd3kfTTOkrm5ifqy
 F/6tf1+pr33dbaN72p8xxcehTQTeYt4uw044sH5uloVmPJ8jGZNpNh781dmQxlT++t
 O8nlFlvyfsWsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vZjdWLEI
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: fix some x86 32bit
 builds
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

SnVsaWVuLCBBbGwsCgpPbiAyMDIzLTA5LTE1IDIxOjMzICswMjAwLCBKdWxpZW4gT2xpdmFpbiBz
cGFrZSB0aHVzbHk6Cj4gT3BlbkJMQVMgTWFrZWZpbGUgbm9ybWFsbHkgbmVlZHMgdG8gZXhwbGlj
aXRseSBkZWZpbmUgdGhlIENQVQo+IGFyY2hpdGVjdHVyZSBzaXplICgzMiBvciA2NGJpdCkgaW4g
dGhlIEJJTkFSWSBtYWNyby4gU2VlIFsxXS4KPiAKPiBXaGVuIGFuIGFyY2hpdGVjdHVyZSBzdXBw
b3J0cyBib3RoIDY0IGFuZCAzMmJpdCwgdGhlIDMyYml0IHN1cHBvcnQKPiBpcyBzb21ldGltZXMg
aW1wbGVtZW50ZWQgaW4gT3BlbkJMQVMgYnkgb3ZlcnJpZGluZyBhIGZhbGxiYWNrIHRvIGFuCj4g
YW50ZXJpb3IgYXJjaGl0ZWN0dXJlLiBGb3IgZXhhbXBsZSwgaWYgdGhlIGJ1aWxkIHRhcmdldCBh
cmNoaXRlY3R1cmUKPiBpcyB4ODYgSGFzd2VsbCAzMmJpdCwgT3BlbkJMQVMgYnVpbGQgd2lsbCBv
dmVycmlkZSB0aGUgYXJjaCB0bwo+IE5laGFsZW0uIFNlZSBbMl0uCj4gCj4gSWYgdGhlIEJJTkFS
WSBtYWNybyBpcyB1bmRlZmluZWQsIHRoZSAzMmJpdCBmYWxsYmFjayB3aWxsIG5vdCBoYXBwZW4s
Cj4gc29tZXRpbWVzIGxlYWRpbmcgdG8gYSBsaW5rIGZhaWx1cmUsIHdpdGggb3V0cHV0Ogo+IAo+
ICAgICBpNjg2LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2FyOiBzdHJtbV9rZXJuZWxfTE4ubzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IAo+IFRoaXMgY29tbWl0IGZpeGVzIHRob3NlIGlz
c3VlcyBieSBleHBsaWNpdGx5IGRlZmluaW5nIHRoZSBCSU5BUlkKPiBtYWNyby4gVGhpcyBpc3N1
ZSBoYXMgYWxzbyBiZWVuIGRpc2N1c3NlZCB1cHN0cmVhbSBpbiBbM10gYW5kIFs0XS4KPiAKPiBO
b3RlOiB0aGlzIGlzc3VlIHdhcyBub3QgaW50cm9kdWNlZCByZWNlbnRseSAoWzNdIGRhdGVzIGJh
Y2sgZnJvbSAyMDE1KSwKPiBhbmQgd2FzIGFsc28gc2VlIGluIHByZXZpb3VzIHBhY2thZ2UgdmVy
c2lvbiwgZm9yIGV4YW1wbGUgaW4gWzVdLgo+IAo+IEZpeGVzOgo+IGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm5ldC9yZXN1bHRzL2UxZS9lMWUyMDM0YTc4Nzk5YWJlMWJkMjhiMDM2ZmE2Zjdk
MTMzMjJlNDJmCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS94aWFueWkvT3BlbkJMQVMvYmxv
Yi92MC4zLjI0L01ha2VmaWxlLnJ1bGUjTDUwCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS94aWFu
eWkvT3BlbkJMQVMvYmxvYi92MC4zLjI0L01ha2VmaWxlLnN5c3RlbSNMMTEzCj4gWzNdIGh0dHBz
Oi8vZ2l0aHViLmNvbS94aWFueWkvT3BlbkJMQVMvaXNzdWVzLzY1Nwo+IFs0XSBodHRwczovL2dp
dGh1Yi5jb20veGlhbnlpL09wZW5CTEFTL2lzc3Vlcy8xMTA2Cj4gWzVdIGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzVjZC81Y2RjY2QxMDZiMWRlMjc1YWM3NWMzOTc4M2U1
MzYxMDdhMzE2NTFmCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4KClRoYW5rcyAqYSBsb3QqIGZvciB0aGlzIHZlcnkgZGV0YWlsZWQgYW5kIGNvbnZpbmNp
bmcgZXhwbGFuYXRpb24sIHdpdGgKYXBwcm9wcmlhdGUgcmVmZXJlbmNlcy4gVGhhdCdzIGV4YWN0
bHkgdGhlIGtpbmQgb2YgaW5mb3JtYXRpb24gdGhhdAppbmNyZWFzZXMgY29uZmlkZW5jZSBpbiBh
IHBhdGNoISDwn5GNCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCj4gLS0tCj4gUGF0Y2ggdGVzdGVkIG9uIGJyYW5jaCBtYXN0ZXIgYXQgY29tbWl0
IDM1NTdhN2Igd2l0aCBjb21tYW5kczoKPiAKPiAgICAgbWFrZSBjaGVjay1wYWNrYWdlCj4gICAg
IC4uLgo+ICAgICAwIHdhcm5pbmdzIGdlbmVyYXRlZAo+IAo+ICAgICB1dGlscy90ZXN0LXBrZyAt
YSAtcCBvcGVuYmxhcwo+ICAgICAuLi4KPiAgICAgNDUgYnVpbGRzLCAyNSBza2lwcGVkLCAwIGJ1
aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZhaWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCj4gCj4g
ICAgIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAo+ICAgICAgICAgLWQgZGwgLW8gb3V0cHV0
X2ZvbGRlciBcCj4gICAgICAgICB0ZXN0cy5wYWNrYWdlLnRlc3Rfb3BlbmJsYXMKPiAgICAgLi4u
Cj4gICAgIE9LCj4gLS0tCj4gIHBhY2thZ2Uvb3BlbmJsYXMvb3BlbmJsYXMubWsgfCA2ICsrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvb3BlbmJsYXMvb3BlbmJsYXMubWsgYi9wYWNrYWdlL29wZW5ibGFzL29wZW5ibGFzLm1r
Cj4gaW5kZXggMGQwZThlNTZkZC4uYWFjZmM3NGI1MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL29w
ZW5ibGFzL29wZW5ibGFzLm1rCj4gKysrIGIvcGFja2FnZS9vcGVuYmxhcy9vcGVuYmxhcy5tawo+
IEBAIC00OSw2ICs0OSwxMiBAQCBpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiAgT1BFTkJM
QVNfTUFLRV9PUFRTICs9IE5PX1NIQVJFRD0xCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9B
UkNIX0lTXzY0KSx5KQo+ICtPUEVOQkxBU19NQUtFX09QVFMgKz0gQklOQVJZPTY0Cj4gK2Vsc2UK
PiArT1BFTkJMQVNfTUFLRV9PUFRTICs9IEJJTkFSWT0zMgo+ICtlbmRpZgo+ICsKPiAgIyBiaW51
dGlscyB2ZXJzaW9uIDw9IDIuMjMuMiBoYXMgYSBidWcKPiAgIyAoaHR0cHM6Ly9zb3VyY2V3YXJl
Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTQ4ODcpIHdoZXJlCj4gICMgd2hpdGVzcGFj
ZXMgaW4gQVJNIHJlZ2lzdGVyIHNwZWNpZmljYXRpb25zIHN1Y2ggYXMgWyByMSwgIzEyIF0gb3Ig
Wwo+IC0tIAo+IDIuNDEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
