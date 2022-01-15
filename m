Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6B2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C3F040578;
	Sat, 15 Jan 2022 20:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5S_EATRHAb_C; Sat, 15 Jan 2022 20:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08FB440571;
	Sat, 15 Jan 2022 20:23:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12CE51BF3A6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F0BD81493
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQfZzBDAaCt0 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:23:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCFA581471
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:23:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EFA9B13F861;
 Sat, 15 Jan 2022 21:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642278186;
 bh=b/jjTI/w4qrMVZSkBmvz+uzqV7Wowj7AxkuZNmbROKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0+4tbuXSE4DceUm/ByWqRPcAf/JRMNNqYjkKvx3J/vdLJO13/A/qbbdatvkPO3Nd
 M2YsQZ3/WPuS6ziYCTSksUgpN6iS2jYA4aWLhqOnXq95+6DyDOr/Bmf/t+3BLoQM2A
 hSUvs1V3YyvenXsB6OksCK/A1o0Am5PwlelM6Wg7xfF+qzQKCBnF8Sud27vrGsICLn
 IiG83vpp12Cqg0zifTa2c87VHNaL/6/o6OjY7dqnI1JBgvra28+AKH/TEuuIaccu66
 9pc0UjHuGA3E04ise9ca1qyy7RbB/TZm3LEJ77SYfDRT2D+FeqXa1rwB/xVlEURiP1
 1muDekCLfborg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 21:23:03 +0100
Date: Sat, 15 Jan 2022 21:23:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220115202303.GA2216429@scaer>
References: <20220115143344.12319-1-romain.naour@gmail.com>
 <20220115143344.12319-2-romain.naour@gmail.com>
 <20220115160517.GQ1945846@scaer>
 <737f135e-b936-a21c-8775-349d7db7fb88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <737f135e-b936-a21c-8775-349d7db7fb88@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/boot-qemu-image.py:
 increase the timeout by 10
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

Um9tYWluLCBBbGwsCgpPbiAyMDIyLTAxLTE1IDIwOjI4ICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDE1LzAxLzIwMjIgw6AgMTc6MDUsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiA+IE9uIDIwMjItMDEtMTUgMTU6MzMgKzAxMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0
aHVzbHk6Cj4gPj4gQXMgZm9yIHRoZSBCdWlsZHJvb3QgdGVzdHN1aXRlLCBtdWx0aXBseSBldmVy
eSBlbXVsYXRvciB0aW1lb3V0IGJ5IDEwCj4gPj4gdG8gYXZvaWQgc3BvcmFkaWMgZmFpbHVyZXMg
aW4gZWxhc3RpYyBydW5uZXJzLgo+ID4+Cj4gPj4gcWVtdV9hcm1fdmV4cHJlc3NfdHpfZGVmY29u
ZmlnIHRlc3RlZCBsb2NhbGx5IHdpdGggc3VjZXNzLgo+ID4+Cj4gPj4gRml4ZXM6Cj4gPj4gaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xOTcwMDg0MDQ2
Cj4gPiBBcmUgeW91IHN1cmUgaW5jcmVhc2luZyB0aGUgdGltZW91dCB3aWxsIGZpeCB0aGlzIGZh
aWx1cmU/IFRoZQo+ID4gYnVpbGQtcnVuLmxvZyBjb250YWlucyBhbm90aGVyIGVycm9yOgpbLS1T
TklQLS1dCj4gPiAgICAgRVJST1I6IHJlc2VydmluZyBmZHQgbWVtb3J5IHJlZ2lvbiBmYWlsZWQg
KGFkZHI9N2ZlMDAwMDAgc2l6ZT0yMDAwMDApCj4gPiAgICAgICAgVXNpbmcgRGV2aWNlIFRyZWUg
aW4gcGxhY2UgYXQgNDAwMDAwMDAsIGVuZCA0MDAwNTFmNwo+ID4gU28sIHRvIG1lLCB0aGlzIGlz
IG5vdCBhIHRpbWVvdXQgaXNzdWUsIGJ1dCBhbiBhY3R1YWwgYm9vdCBpc3N1ZS4KPiAKPiBUaGUg
c3lzdGVtIHN0b3AgaW4gdGhlIG1pZGRsZSBvZiBvcHRlZSBzdGFydHVwCj4gb3B0ZWU6IGR5bmFt
aWMgc2hhcmVkIG1lbW9yeSBpcyBlbmFibGVkCgpJIHdhcyB2ZXJ5IGNvbmZ1c2VkIGJ5IHRoZSBh
Ym92ZS4gSW5kZWVkLCB0aGUgbG9nIGZpbGUgSSBkb3dubGFkZWQKZWFybGVyIHJlYWxseSBzdG9w
cGVkIGF0IHRoZSBlcnJvciBtZXNzYWdlIEkgcGFzdGVkLiBJIGFtIHN1cmUgb2YgdGhhdCwKYXMg
SSBzdGlsbCBoYWQgaXQgaW4gbXkgfi90bXAgZGlyZWN0b3J5LCBzbyBJIGNvdWxkIHJlYWxseSBk
b3VibGUtY2hlY2suCgpCdXQgbm93IEkgZG93bmxvYWRlZCBpdCBhZ2FpbiwgYW5kIGluZGVlZCwg
dGhlcmUgYXJlIG11Y2ggbW9yZSB0cmFjZXMsCnVwIHRvIHRoYXQgb3B0ZWUgaXNzdWUgeW91IHBv
aW50IGVkIGF0LgoKVGhpcyBpcyBhIHJlYWxseSB3ZWlyZCBzaXR1YXRpb24sIHRoYXQgdGhlIGRv
d25sb2FkIEkgaGFkIHdhcyBvbmx5CnBhcnRpYWwuLi4KCj4gQWxzbywgSSBnb3QgdGhlIHNhbWUg
ZXJyb3IgbWVzc2FnZSB3aGlsZSB0ZXN0aW5nIGxvY2FsbHkuCgpCdXQgdGVzdGluZyBsb2NhbGx5
IHNob3VsZCBub3QgaGF2ZSB0aGUgc2FtZSBpbXBhY3Qgb24gYm9vdCB0aW1lLCB3b3VsZAppdD8g
VGhlIGJvb3QgdGltZXMgb3V0IG9uIHRoZSBlbGVhc3RpYyBydW5uZXJzIGJlY2F1c2UgdGhleSBh
cmUgdG9vIHNsb3cKKGFuZCBtYW55IGNvbmd0YWluZXJzIGNvbnRlbmQgZm9yIHRoZSBDUFUgdGhl
cmUpLiBCdXQgbG9jYWxseSwgaXQgaXMKcmVhbGx5IHN1cnByaXNpbmcgdGhhdCB5b3UgaGl0IHRo
ZSBleGFjdCBzYW1lIHRpbWVvdXQgaXNzdWUsIGFuZCB0aGUKZXhhY3Qgc2FtZSBwb2ludCBpbiB0
aGUgYm9vdCBzZXF1ZW5jZS4uLgoKQW55d2F5LCBjYW4geW91IHJlc2VuZCB5b3VyIHBhdGNoLCBh
cyBJIG1hcmtlZCBpdCByZWplY3RlZCBpbiBwYXRjaHdvcmssCnBsZWFzZT8KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
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
