Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B47EE4993
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 12:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898DE41686;
	Sat, 19 Aug 2023 12:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898DE41686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcoA-EsQYzAJ; Sat, 19 Aug 2023 12:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8334168C;
	Sat, 19 Aug 2023 12:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F8334168C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E61431BF318
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 12:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B946B4168C
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 12:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B946B4168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnDKZZSsFlzd for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 12:57:08 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 633B641686
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 12:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 633B641686
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5BEF2200406;
 Sat, 19 Aug 2023 14:57:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 19 Aug 2023 14:57:02 +0200
Date: Sat, 19 Aug 2023 14:57:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230819125702.GG1134940@scaer>
References: <20230818144231.976762-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818144231.976762-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692449825;
 bh=f/Ji3qwKK6XIqCwzTcT13XydxH91gaRfchytNT7sUfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGgH71qG6ib133YmCC4lG5YuZtjqKU2KbhMwRCyqSJlURR1l8pAO/BTSg9L3/HtxE
 tm5Sl0R5BtPF6+JeqDTxFt6MXedjNbpVcTWNUiScXideQOpYOzDzGjJudecLXbegA6
 +n7mJnFq0qzoGD3Ql4NO6PWTdXlarGNJS/rcfUVqbyKrRbL1YyQmr7vK+Ql1rGRLW9
 liUx0Na/CzAe2yc8J5IM8l701hCZuM2xeZnGdL1JF126Y4jf8OJ6ihZ6C5dFZKTmye
 YWBldnYdRwN6F2nOk659CvLKOoWFsyZhYWQNsBJMofWvzYgcL4GDUkNITd7p69u4yh
 +As/4bi9Zxkcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mGgH71qG
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/{gettext-gnu,
 libtextstyle}: bump to version 0.22
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQsIEFsbCwKCk9uIDIwMjMtMDgtMTggMTY6NDIgKzAyMDAsIEJlcm5kIEt1aGxzIHNwYWtl
IHRodXNseToKPiBSZWxlYXNlIG5vdGVzOgo+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZl
L2h0bWwvaW5mby1nbnUvMjAyMC0wNy9tc2cwMDAwOS5odG1sCj4gaHR0cHM6Ly9saXN0cy5nbnUu
b3JnL2FyY2hpdmUvaHRtbC9pbmZvLWdudS8yMDIzLTA2L21zZzAwMDAzLmh0bWwKPiAKPiBSZW1v
dmVkIHBhdGNoIDAwMDEsIHRoZSBwYXRjaGVkIGZpbGUgaXMgbm90IHByZXNlbnQgaW4gdGhpcyBy
ZWxlYXNlLgo+IFJlbW92ZWQgcGF0Y2ggMDAwMiB3aGljaCB3YXMgYXBwbGllZCB1cHN0cmVhbS4K
PiAKPiBMaW5rIGxpYnRleHRzdHlsZS5oYXNoIHRvIGdldHRleHQtZ251Lmhhc2guCj4gCj4gQWRk
ZWQgY29tbWVudHMgYWJvdXQgb3RoZXIgZmlsZXMgdG8gYmUgdXBkYXRlZCBkdXJpbmcgdmVyc2lv
biBidW1wcy4KPiAKPiBTaW5jZSB1cHN0cmVhbSBjb21taXQKPiBodHRwczovL2dpdGh1Yi5jb20v
YXV0b3Rvb2xzLW1pcnJvci9nZXR0ZXh0L2NvbW1pdC83ODVhODllNWRmOTk0YzJiMjQyZjA4MmQ2
MGRlODllMmQ1MjBhYTRhCj4gZ2V0dGV4dC1ydW50aW1lIGlzIGEgYnVpbGQtZGVwZW5kZW5jeSBm
b3IgZ2V0dGV4dC10b29scyBzbyB3ZSBhZGQgdGhlCj4gbmVlZGVkIEhPU1RfR0VUVEVYVF9HTlVf
UFJFX3tDT05GSUdVUkUsIEJVSUxEfV9IT09LUy4KClstLVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9nZXR0ZXh0LWdudS9nZXR0ZXh0LWdudS5tayBiL3BhY2thZ2UvZ2V0dGV4dC1nbnUv
Z2V0dGV4dC1nbnUubWsKPiBpbmRleCA5YTFlYWJkMGRmLi42NzA3NGU0MmJjIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvZ2V0dGV4dC1nbnUvZ2V0dGV4dC1nbnUubWsKPiArKysgYi9wYWNrYWdlL2dl
dHRleHQtZ251L2dldHRleHQtZ251Lm1rCj4gQEAgLTQsOCArNCw5IEBACj4gICMKPiAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLSMgUGxlYXNlIGtlZXAgaW4gc3luYyB3aXRoIHBhY2th
Z2UvbGlidGV4dHN0eWxlL2xpYnRleHRzdHlsZS5tawo+IC1HRVRURVhUX0dOVV9WRVJTSU9OID0g
MC4yMC4xCj4gKyMgUGxlYXNlIGtlZXAgaW4gc3luYyB3aXRoIHBhY2thZ2UvbGlidGV4dHN0eWxl
L2xpYnRleHRzdHlsZS5tayBhbmQKPiArIyBHRVRURVhUX1RJTllfQVJDSElWRV9WRVJTSU9OIGlu
IGdldHRleHQtdGlueS9nZXR0ZXh0LXRpbnkubWsKPiArR0VUVEVYVF9HTlVfVkVSU0lPTiA9IDAu
MjIKClNvIHdlIG5vdyBoYXZlIHRocmVlIGZpbGVzIHRoYXQgbXVzdCBiZSBrZXB0IGluIHN5bmMs
IGFuZCBleHBlcmllbmNlIGhhcwpzaG93biB0aGF0LCBldmVuIHRob3VnaCB3ZSBkbyBoYXZlIHN1
Y2ggY29tbWVudHMgYWJvdXQga2VlcGluZyB0aGluZ3MgaW4Kc3luYywgcGVvcGxlIGFjdHVhbHkg
ZG8gbm90IHJlYWQgdGhvc2UgY29tbWVudHMgYW5kIHdlIGhhdmUgc2VlbiBvbmUKcGFja2FnZSBi
ZWluZyBidW1wZWQgYnV0IG5vdCB0aGUgb3RoZXIgKG5vdCBqdXN0IGFib3V0IGdldHRleHQsIGJ1
dAptZXNhM2QsIGJsdWV6NSwgcHJvdG9idWYuLi4pCgpNYXliZSBpdCB3b3VkIG1ha2Ugc2Vuc2Ug
dG8gaW50cm9kdWNlIGEgc2hhcmVkIHZlcnNpb24gc3RyaW5nLCDDoC1sYSBxdDU7CgogICAgcGFj
a2FnZS9nZXR0ZXh0L2dldHRleHQubWsKICAgICAgICBHRVRURVhUX1ZFUlNJT04gPSAwLjIyCiAg
ICAgICAgaW5jbHVkZSAkKHdpbGRjYXJkIHBhY2thZ2UvZ2V0dGV4dC8qLyoubWspCgogICAgcGFj
a2FnZS9nZXR0ZXh0L2dldHRleHQtZ251L2dldHRlY3QtZ251Lm1rCiAgICAgICAgR0VUVEVYVF9H
TlVfVkVSU0lPTiA9ICQoR0VUVEVYVF9WRVJTSU9OKQoKICAgIHBhY2thZ2UvZ2V0dGV4dC9nZXR0
ZXh0LXRpbnkvZ2V0dGV4dC10aW55L21rCiAgICAgICAgJChTRUQpICdzLEBBUkNISVZFX1ZFUlNJ
T05ALCQoR0VUVEVYVF9WRVJTSU9OKSwnICQoQEQpL2dldHRleHRpemUKCiAgICBwYWNrYWdlL2dl
dHRleHQvbGlidGV4dHN0eWxlL2xpYnRleHRzdHlsZS5tawogICAgICAgIExJQlRFWFRTVFlMRV9W
RVJTSU9OID0gJChHRVRURVhUX1ZFUlNJT04pCgpCdXQgc2VlIGJlbG93Li4uLgoKWy0tU05JUC0t
XQo+ICsjIGdldHRleHQtdG9vbHMgZGVwZW5kcyBvbiBnZXR0ZXh0LXJ1bnRpbWUKPiArZGVmaW5l
IEhPU1RfR0VUVEVYVF9HTlVfQ09ORklHVVJFX1JVTlRJTUUKPiArCWNkICQoQEQpLyQoR0VUVEVY
VF9HTlVfU1VCRElSKTsgXAoKWW91J3JlIG1peGluZyB0aGUgdGFyZ2V0IF9TVUJESVIgd2l0aCBo
b3N0IGJ1aWxkOyB0aGF0J3Mgbm90IGNsZWFuLgoKSWYgd2UgY2FuJ3QgaGF2ZSBwcm9wZXIgc2Vw
YXJhdGlvbiBvZiB0aW9vbHMgYW5kIHJ1bnRpbWUgZm9yIHRoZSBob3N0CnZhcmlhbnQsIHRoZW4g
bGV0J3MganVzdCBzdG9wIHRoaXMgZGFuY2UgYW5kIGJ1aWxkIGhvc3QtZ2V0dGV4dCBhdCB0aGUK
cm9vdCBvZiB0aGUgcGFja2FnZSAoZS5nLiBsZXQncyBqdXN0IGRyb3AgSE9TVF9HRVRURUVYVF9H
TlVfU1VCRElSKS4KCkFuZCBzZWUgYmVsb3cuLi4KCj4gKwkJJChIT1NUX0NPTkZJR1VSRV9PUFRT
KSBcCj4gKwkJLi9jb25maWd1cmUgLS1wcmVmaXg9JChIT1NUX0RJUikgXAo+ICsJCSQoSE9TVF9H
RVRURVhUX0dOVV9DT05GX09QVFMpCj4gK2VuZGVmCj4gK0hPU1RfR0VUVEVYVF9HTlVfUFJFX0NP
TkZJR1VSRV9IT09LUyArPSBIT1NUX0dFVFRFWFRfR05VX0NPTkZJR1VSRV9SVU5USU1FCj4gKwo+
ICtkZWZpbmUgSE9TVF9HRVRURVhUX0dOVV9CVUlMRF9SVU5USU1FCj4gKwkkKEhPU1RfTUFLRV9F
TlYpICQoTUFLRSkgLUMgJChARCkvJChHRVRURVhUX0dOVV9TVUJESVIpIGluc3RhbGwKPiArZW5k
ZWYKPiArSE9TVF9HRVRURVhUX0dOVV9QUkVfQlVJTERfSE9PS1MgKz0gSE9TVF9HRVRURVhUX0dO
VV9CVUlMRF9SVU5USU1FCgpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kLCB0aGlzIGluc3RhbGxzIHN0
dWZmIGludG8gJChIT1NUX0RJUikgYXQKYnVpbGQgdGltZS4gVGhhdCBpcyBkZWZpbml0ZWx5IG5v
dCBjb3JyZWN0LgoKV2hhdCBoYXBwZW5zIHdoZW4gZ2V0dGV4dCBpcyBidWlsdCBhcyBhIHdob2xl
PyBDZXJ0YWlubHksIHRoZSBydW50aW1lCmxpYnJhcnkgaXMgbm90IGluc3RhbGxlZCBieSB0aGUg
dGltZSB0aGUgdG9vbHMgYXJlIGJ1aWx0LCBzbyB0aGUgZ2V0dGV4dApidWlsZHN5c3RlbSBoYXMg
cHJvdmlzaW5nIGZvciB1c2luZyBhcy15ZXQtdW5pbnN0YWxsZWQgbGlicmFyaWVzIHdoZW4KbGlu
a2luZyB0aGUgdG9vbHMuCgpUaGUgcmVhc29uIHRvIG9ubHkgYnVpbGQgZ2V0dGV4dC10b29scyBm
b3IgdGhlIGhvc3QgcGFja2FnZSwgd2FzIHRvIG5vdApzdWZmZXIgZnJvbSB0aGUgd2hvbGUgYnVp
bGQgdGltZS4gQnV0IGlmIHdlIG5vdyBuZWVkIHRvIGJ1aWxkIHRoZQpydW50aW1lLCB0aGVuIHRo
YXQgZ2FpbiBpbiBidWlsZHRpbWUgaXMgbm93IHZlcnkgbGltaXRlZC4KClNvLCBiYWNrIHRvIG15
IHBvcnBvc2FsIGFib3ZlOiBpZiB3ZSBuZWVkIHRoZSBydW50aW1lIGZvciB0aGUgdG9vbHMsCnRo
ZW4gbGV0J3MgYnVpbGQgdGhlIHdob2xlIHBhY2thZ2UuCgpBbmQgdGh1cyB3ZSBjYW4gZHJvcCBo
b3N0LWxpYnRleHRzdHlsZSB0b28uCgpUaG91Z2h0cz8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
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
