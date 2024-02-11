Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63A3C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DFCF840E8;
	Sun, 11 Feb 2024 21:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7W1c_a8LtF8I; Sun, 11 Feb 2024 21:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 782808410A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782808410A;
	Sun, 11 Feb 2024 21:58:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E24271BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC084032B
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ie0aQA22a1ln for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84B434012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B434012F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84B434012F
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:57:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9C19113F89A;
 Sun, 11 Feb 2024 22:57:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 22:57:51 +0100
Date: Sun, 11 Feb 2024 22:57:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZclC3_dSvLTp6Ras@landeda>
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <Zck6_sR8fspWF37e@landeda>
 <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4ppD06TSGnYUUBSzB_sV6vErb2ozyMuGr1QjyLtu_pvPA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707688676;
 bh=JqNRivQKGlHZsRL/AVtg9fI1GccQRky4U5Mkd2ZurYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LQ6mP2dgWAUzUNrumgfAMGcS70VnW8CL0dkomlsefVJetqUssmj6pTc9uBqdwknH5
 9aHFnSnRJOyPf5ADGXJPfEBHNCXeohSdxh9+mIo9FHcT0xOeQPQuMxf58u6ZHeHBFD
 aQLnZJz1mIt4DL7W38edc1JTAca/bRbAVdjv2WhR0Dpm/OYCB28ca3hEOSCv8v8yR+
 JRJdZjIi75XiXy7kjffu9+v2+Jl9c4lO2ivYk4T7iZN2xYl14BCHsdaKj0xYqKSpeh
 XM5C6Hdm0U1ry9BpKN18F62Xd2vr+oWY56ICCB/YV85JiUg9UVSS60lfDgJkychmiH
 5lsPaMEgUQqLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LQ6mP2dg
Subject: Re: [Buildroot] [PATCH 1/2] package/python-uvloop: add support for
 cython3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDItMTEgMTQ6MzkgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIEZlYiAxMSwgMjAyNCBhdCAyOjI04oCvUE0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4gT24gMjAyNC0wMi0wOSAx
MDo1NiAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgc3Bha2UgdGh1c2x5Ogo+ID4gPiBBZGQgcGF0Y2hl
cyBmcm9tIHBlbmRpbmcgdXBzdHJlYW0gcHVsbCByZXF1ZXN0IHdoaWNoIGFkZCBjeXRob24zCj4g
PiA+IGNvbXBhdGliaWxpdHkuCj4gPiBXZSBhcmUgYSBsaXR0bGUgYml0IGNhdXRpb3VzIGF0IGFw
cGx5aW5nIHJhbmRvbSBwYXRjaGVzIHRoYXQgaGF2ZSBub3QKPiA+IHlldCBiZWVuIGF0IGxlYXN0
IHJldmlld2QgYnkgdXBzdHJlYW0uIEluIHRoaXMgY2FzZSwgdGhlcmUgaGFzIG5vdCBiZWVuCj4g
PiBhbnkgdXBzdHJlYW0gYWN0aXZpdHkgc2luY2UgdGhlIGxhc3QgcmVsZWFzZSwgYW5kIG5vdCBt
dWMgYmVmb3JlIHRoYXQKPiA+IGVpdGhlci4uLgo+IFdlbGwgdGhlc2UgcGF0Y2hlcyBhcmUgYmVp
bmcgdXNlZCBieSBnZW50b28gc28gdGhleSBhcmUgbm90IGVudGlyZWx5Cj4gdW50ZXN0ZWQgaW4g
dGhlIHJlYWwgd29ybGQuCgpJdCdzIG5vdCB0aGF0IHRoZXkgYXJlIHRlc3RlZCBvciBub3QuIEl0
IGlzIGFib3V0IHdoZXRoZXIgdGhleSdsbCBoYXZlIGEKY2hhbmNlIHRvIGJlIGFjY2VwdGVkIHVw
c3RyZWFtLCBvciB3aGV0aGVyIHdlJ2xsIGhhdmUgdG8gY2FycnkgYW5kCm1haW50YWluIHRoZW0g
Zm9yZXZlciBpbiBCdWlsZHJvb3QuCgpNYXliZSBpdCdzIHRpbWUgdGhhdCBzb21lb25lIHBpbmdz
IHVwc3RyZWFtIGFib3V0IHRoYXQgUFI/Cgo+ID4gV2UgaGF2ZSBubyBpbi10cmVlIHVzZXIgb2Yg
dXZsb29wLCBzbyBJIHdvbmRlciB3aGV0aGVyIGl0IG1ha2VzIHNuc2UgdG8KPiA+IGtlZXAgaXQs
IGVzcGNpYWxseSBzaW5jZSBpdCBtYXUgYmUgYmxvY2tpbmcgdGhlIGJ1bXBzIG9mIG90aGVyIHBh
Y2thZ2VzCj4gPiAobGlrZSBjeXRob24gMy54IGJlaW5nIHJlcXVpcmVkIGJ5IHdoYXRzLWl0cy1u
YW1lKS4KPiBUaGF0J3Mgbm90IGVudGlyZWx5IHRydWUsIGl0J3MgYSBjb21tb24gb3B0aW9uYWwg
ZGVwZW5kZW5jeSBmb3IgcGFja2FnZXMKPiBsaWtlIHB5dGhvbi11dmljb3JuIGZvciBleGFtcGxl
LgoKICAgICQgZ2l0IGdyZXAgLWkgLUUgcHl0aG9uLnV2bG9vcAoKd291bGQgdHVybiBvbmx5IHB5
dGhvbi11dmxvb3AgaXRzZWxmLCBhbmQgaXRzIHJ1bnRpbWUgdGVzdC4gSWYgaXQKaXMgb25seSBv
cHRpb25hbCwgYW5kIHByZXZlbnRzIHVzIGZyb20gdXBkYXRpbmcgdW5sZXNzIHdlIGFwcGx5Cm5v
bi11cHN0cmVhbWFibGUgcGF0Y2hlcywgdGhlbiBJJ2QgYXJndWUgd2Ugc2hvdWxkIGRyb3AgaXQu
CgpbLS1TTklQLS1dCj4gSSdsbCBmaXggYW5kIHJlc2VuZC4KClRoYW5rcy4KClJlZ2FyZHMsCllh
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
