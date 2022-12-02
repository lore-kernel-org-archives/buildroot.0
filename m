Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D54C4708D
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 19:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FB9C404B5;
	Fri,  2 Dec 2022 19:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FB9C404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZySk2Fjtbetb; Fri,  2 Dec 2022 19:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426184019B;
	Fri,  2 Dec 2022 19:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 426184019B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D276B1BF319
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 19:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACC4160A84
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 19:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC4160A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJ_lxradg0ru for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 19:29:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A9D60A4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28A9D60A4F
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 19:29:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ba:9ce3:3496:4e04])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EFA8EB0051E;
 Fri,  2 Dec 2022 20:29:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 02 Dec 2022 20:29:38 +0100
Date: Fri, 2 Dec 2022 20:29:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Pesce Luca <Luca.Pesce@vimar.com>
Message-ID: <20221202192938.GA3302@scaer>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
 <20221201202558.GB978091@scaer>
 <AS8PR08MB6870CBA6B56FA36972D523AA81179@AS8PR08MB6870.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR08MB6870CBA6B56FA36972D523AA81179@AS8PR08MB6870.eurprd08.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670009382;
 bh=gNW/Gz/i9Y4ubq8N6B2vx92kfKHVhdkjurGgWMb8osQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QB9KZznH3JwdwUcGcAOCwjwZkIZeW3Nb5m96T5dphmPH/wN/ptadEWCSaD40DzRgR
 VoAItHo1F7yxH+E5bmmrk9e1sL+5YbAFgOcQZ59RcW+3a0VlugWKN/Vr+d6ZO4HXdW
 Zyg/HX7zANqN+4z8ZD26EH0tQqKUJaV9pnTJUXyNQ9fhItFr9XL72hPM5lINXMoV36
 MADAgIqyf8ItjsBbexoa14sps2r2Z/7mF2cuZGa5bU7nzT2JflXDJCkGX1r78bfnvz
 EdcFAEiT81oMHSflr+lsfU20kbQg26rWEWy9hxSbbfwGjRVlXIXERbaKCuLBDSuz2U
 FdaaY4ZkF60YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QB9KZznH
Subject: Re: [Buildroot] R: [PATCH] support/download/dl-wrapper: make the
 whole dl_dir writeable for the group
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

THVjYSwgQWxsLAoKT24gMjAyMi0xMi0wMiAxMzo0NyArMDAwMCwgUGVzY2UgTHVjYSBzcGFrZSB0
aHVzbHk6Cj4gPiBEYTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4g
PiBJbnZpYXRvOiBnaW92ZWTDrCAxIGRpY2VtYnJlIDIwMjIgMjE6MjUKPiA+IEE6IFBlc2NlIEx1
Y2EKPiA+IENjOiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gT2dnZXR0bzogUmU6IFtCdWls
ZHJvb3RdIFtQQVRDSF0gc3VwcG9ydC9kb3dubG9hZC9kbC13cmFwcGVyOiBtYWtlIHRoZSB3aG9s
ZSBkbF9kaXIgd3JpdGVhYmxlIGZvciB0aGUgZ3JvdXAKWy0tU05JUC0tXQo+ID4gPiArICAgICMg
TWFrZSB0aGUgd2hvbGUgZGxfZGlyIHdyaXRlYWJsZSBmb3IgdGhlIGdyb3VwLCBzbyBvdGhlciB1
c2VycyB3aXRoaW4KPiA+ID4gKyAgICAjIHRoZSBncm91cCBjYW4gZG93bmxvYWQgbmV3IHZlcnNp
b25zIGFuZCB1cGRhdGUgYW55IHZjcyBjYWNoZSBpbiBpdC4KPiA+ID4gKyAgICBjaG1vZCAtZiAt
UiBnK3cgIiR7ZGxfZGlyfSIKPiA+IEJ1dCB3aGF0IGlmIHRoZSB1c2VyIGluaXRpYWxseSBoYWQg
dW1hc2sgMDAyMiB0byBiZWdpbiB3aXRoPyBCeSBmb3JjaW5nCj4gPiB0aGUgZ3JvdXAgYXV0aG9y
aXphdGlvbiB3aXRoIHRoZSBjaG1vZCwgeW91IGFyZSBvdmVycmlkaW5nIHRoZSB1c2VyJ3MKPiA+
IHVtYXNrIHNldHRpbmdzLCB3aGljaCBpcyBub3QgZ29vZC4uLiBJIGZvciBvbmUgd291bGQgbm90
IHdhbnQgdG8gaGF2ZQo+ID4gZ3JvdXAtd3JpdGFibGUgZGlyZWN0b3JpZXMgKG9yIGZpbGVzKSBj
cmVhdGVkIHdoZW4gSSB3b3VsZCBoYXZlIG5vdAo+ID4gZXhwZWN0ZWQgaXQuCj4gWWVzLCBJIGNh
biBhZ3JlZSB3aXRoIHRoaXMuIEhvd2V2ZXIsIEJSIGFscmVhZHkgb3ZlcnJpZGVzIHRoZSB1c2Vy
J3MgdW1hc2ssCj4gYW5kLCBhdCBsZWFzdCBpbiBteSBjYXNlICh1bWFzaz0wMDAyKSwgdGhpcyBj
aGFuZ2VzIHRoZSB1c2VyJ3MgZGVmYXVsdCwKPiBkZW55aW5nIGcrdyBieSBkZXNpZ24uCgpZZXMs
IGJ1dCB0aGUgcmVhc29uIHdlIGRvIGVuZm9yY2UgYSBrbm93biB1bWFzaywgaXMgdG8gZ3VhcmFu
dGVlIHNvbWUKa2luZCBvZiByZXByb2R1Y2liaWxpdHkgaW4gdGhlIGdlbmVyYXRlZCB0YXJnZXQg
aW1hZ2UuIFNlZSBjb21taXQKYmVlNTc0NWNjYzIwIChNYWtlZmlsZTogZG9uJ3QgZGVwZW5kIG9u
IHRoZSB1bWFzaykgd2hpY2ggZXhwbGFpbnMsCmFsYmVpdCBvbmx5IGJyaWVmbHksIHdoeSB3ZSBk
byBpdDoKCiAgICBTb21lIHBhY2thZ2VzIGFuZCBCUiBpdHNlbGYgY3JlYXRlIGZpbGVzIGFuZCBk
aXJlY3RvcmllcyBvbiB0aGUgdGFyZ2V0CiAgICB3aXRoIGNwL21rZGlyL2V0YyB3aGljaCBkZXBl
bmQgb24gdGhlIHVtYXNrIGF0IHRoZSB0aW1lIG9mIGJ1aWxkaW5nLgoKRG9pbmcgdGhlIGZpeHVw
cyBpbiB0YXJnZXQgd2l0aCBhbiBleHBsaWNpdCBjaG1vZCBvciB3aGF0ZXZlciBpcyBub3QKcG9z
c2libGUuIEluZGVlZCwgc29tZSBwYWNrYWdlcyBhbHNvIGRvIHRoZWlyIG93biBjaG1vZCwgYW5k
IHdlIGhhdmUgbm8Kd2F5IHRvIGtub3cuCgpTbywgd2UgY2FuIG9ubHkgcmVzb3J0IHRvIHVzaW5n
IGEga25vd24gdW1hc2suIFdlIGNob3NlIDAwMjIgYmVjYXVzZSBpdAppcyBzYW5lIGJ5IGRlZmF1
bHQsIGFuZCB1c3VhbGx5LCBwYWNrYWdlcyB0aGF0IGluc3RhbGwgZmlsZXMgbGlrZQpleGVjdXRh
bGJlcywgd2lsbCB3YW50IHRob3NlIHRvIGJlIHdvcmxkLWV4ZWN1dGFibGUgKGEgc3lzdGVtIHdv
dWxkIG5vdApiZSB2ZXJ5IHVzZWZ1bCBpcyBvbmx5IHJvb3QgY291bGQgcnVuIHByb2dyYW1zKS4K
Cj4gPiBJbnN0ZWFkLCB3aGF0IGFib3V0IHNvbWV0aGluZyBsaWtlOgpbLS1TTklQLS1dCj4gWWVz
LCB0aGlzIGxvb2tzIGdvb2QgdG8gbWU6IHlvdSBob25vciB1c2VyJ3MgdW1hc2sgaW4gdGhlIHdo
b2xlIGRvd25sb2FkCj4gcGhhc2UsIGFuZCBrZWVwIHRoZSAwMDIyIGZvciBvdGhlciBmaWxlcyBj
cmVhdGVkIGJ5IEJSLiBTbyBhIGJldHRlciBhcHByb2FjaCwKPiBmb3Igc3VyZSEKCkNvdWxkIHlv
dSBoYW5kbGUgcmVmaW5pbmcgdGhpcyBjaGFuZ2UsIHRlc3QgaXQsIGFuZCB3aGVuL2lmIHRoYXQg
d29ya3MsCnNlbmQgaXQgYXMgYSBwcm9wZXIgcGF0Y2gsIHBsZWFzZT8KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJ
R04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBo
dHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwg
ICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
