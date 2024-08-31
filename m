Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F937CD3422
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9AD6406EA;
	Sat, 31 Aug 2024 19:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLie3xUMppGR; Sat, 31 Aug 2024 19:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 791CF406FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 791CF406FA;
	Sat, 31 Aug 2024 19:17:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 417711BF2FF
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B76040247
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j81LTMUFnLtf for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C65254022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C65254022F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C65254022F
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:17:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ABB4913F88F;
 Sat, 31 Aug 2024 21:17:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Aug 2024 21:17:28 +0200
Date: Sat, 31 Aug 2024 21:17:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZtNsSCX-cYqK5A6q@landeda>
References: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
 <20240831182545.6d9897ab@windsurf>
 <CABGWkvrX6uycmERpb4RaQuUYz0vRaFzLDNxrW95DTadaKJHCVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvrX6uycmERpb4RaQuUYz0vRaFzLDNxrW95DTadaKJHCVg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725131852;
 bh=gliYbQK/ZRMIicSRWTG1iv/x2KDfco+rUcX59GajjTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jT5M+3+JQ2FZZg0o5nmnWBNitvm7WgVAEgVvIQZ/7tZJltJLDiyEfREU5dG/GJLB2
 H+gZexEr6kPQu0d3IqU3wAvL2bxAn1cKPQFytdAhRWnMtohmVsDgkwp3jAqXdmzDul
 r0IECtrbI6gfQqqxYHFimxqN4N6BHuzCyzZDa0HAMHTo7xyu5Im7aX+z8gfwc/9ZLn
 Fji+MiEP+zlSa9/BHN/aiR3tvWuhfMnHyHVwwm+whmOZ+0jygOUdwTGcWWWjL9BEUS
 njJlINyFeWrx4Qv4MRmZj0mXg/ne9ETiqfVMylak8mSJ5tvf9pf6CeZcHrwpb8rGJn
 IzuwwfkP6NnZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jT5M+3+J
Subject: Re: [Buildroot] [PATCH v2 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjQtMDgtMzEgMjA6MzYgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIEF1ZyAzMSwgMjAyNCBhdCA2OjI14oCvUE0gVGhvbWFzIFBl
dGF6em9uaQo+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+IE9uIFNh
dCwgMzEgQXVnIDIwMjQgMTY6NTQ6NDkgKzAyMDAKPiA+IERhcmlvIEJpbmFjY2hpIDxkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6ClstLVNOSVAtLV0KPiA+ID4gLUJB
QkVMRF9TSVRFID0gaHR0cDovL3d3dy5wcHMudW5pdi1wYXJpcy1kaWRlcm90LmZyL35qY2gvc29m
dHdhcmUvZmlsZXMKPiA+ID4gK0JBQkVMRF9TSVRFID0gJChjYWxsIGdpdGh1YixqZWNoLGJhYmVs
ZCxyZWZzL3RhZ3MpCj4gPiBUaGlzIGxvb2tzIG9kZC4gSXNuJ3QgdGhlIHZlcnNpb24gbmVlZGVk
IHNvbWV3aGVyZT8KPiBJdCBzZWVtZWQgc3RyYW5nZSB0byBtZSBhcyB3ZWxsLiBJbmRlZWQsIEkg
ZG9uJ3Qgc2VlIG90aGVyIHNpbWlsYXIKPiBfU0lURSBzZXR0aW5ncyBpbiBCdWlsZHJvb3QuCj4g
QnV0IGlmIEkgZ28gdG8gdGhlIEdpdEh1YiBVUkwsIHRoZXNlIGFyZSB0aGUgdGFyYmFsbCBhZGRy
ZXNzZXM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2plY2gvYmFiZWxkL2FyY2hpdmUvcmVmcy90YWdz
L2JhYmVsZC0xLjkuMi50YXIuZ3oKPiAuLi4KPiBodHRwczovL2dpdGh1Yi5jb20vamVjaC9iYWJl
bGQvYXJjaGl2ZS9yZWZzL3RhZ3MvYmFiZWxkLTEuMTMuMS50YXIuZ3oKPiBBbSBJIG1pc3Npbmcg
c29tZXRoaW5nPwoKVGhlIGdpdGh1YiBtYWNybyBpcyB0byBiZSBjYWxsZWQgdGhhdCB3YXk6CiAg
ICAkKGNhbGwgZ2l0aHViLHVzZXIscGFja2FnZSx2ZXJzaW9uKQoKU2VlIHRoZSBtYW51YWwsIHNl
Y3Rpb24gMTguMjUuNCBIb3cgdG8gYWRkIGEgcGFja2FnZSBmcm9tIEdpdEh1YjsKICAgIGh0dHBz
Oi8vbmlnaHRseS5idWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI2dpdGh1Yi1kb3dubG9hZC11cmwK
CnNvIGZvciBiYWJlbGQ6CiAgICAkKGNhbGwgZ2l0aHViLGplY2gsYmFiZWxkLGJhYmVsZC0kKEJB
QkVMRF9WRVJTSU9OKSkKClNlZSBhbHNvIHRoZSBteXJpYWRzIG9mIGV4aXN0aW5nIGNhbGxzIGlu
IHRoZSB0cmVlOgogICAgZ2l0IGdyZXAgY2FsbFwgZ2l0aHViLAoKUmVnYXJkcywKWWFubiBFLiBN
T1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
