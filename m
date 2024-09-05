Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0ECCCD4F5B
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 08:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 765EE403EE;
	Thu,  5 Sep 2024 08:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhOX9WGZx2Mn; Thu,  5 Sep 2024 08:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E36405AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E36405AD;
	Thu,  5 Sep 2024 08:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07C021BF476
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8CF5405AD
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiJenEG3VQRA for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 08:55:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A707403EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A707403EE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A707403EE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 08:55:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 03BF313FA56;
 Thu,  5 Sep 2024 10:55:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 05 Sep 2024 10:55:21 +0200
Date: Thu, 5 Sep 2024 10:55:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Ztlx-byJyg2ryXIF@landeda>
References: <20240904174021.2670289-1-dario.binacchi@amarulasolutions.com>
 <ZtikL2bVIPqtvgJA@landeda>
 <CABGWkvqUodd2xpSpELk+_SbwuPrcpgiMfjWPsGDdWTme7_L=EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvqUodd2xpSpELk+_SbwuPrcpgiMfjWPsGDdWTme7_L=EQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725526528;
 bh=LTkxDhhUvqYW7sVt0plkppu/PLQrS+CjX+tG5g2PTQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lw5c7tcgU6qAISQOyNIVKKaFY+FKe8RS99TB/VQ9mH7MsoGpafZyPXZZchQ60cisX
 O8K7UvC5ZjKH+xgsMu2eYFoXmGrzLG4XF+C++CIzvS3zHeO6Xp6TlztwWNlXVngqPh
 96C7OfERdpLWJaC9aB51dGf4k2QGYQqd+RKKhc0g9TtPUQiLDbCtQf4L5O/5R6R1WK
 5l9p4xtJ5HpG3SAbAVD7G9IKsxNcTUW7mhQV7D31Wwaq65rxFcdIJBdNUKUN4NMI6g
 xLjfdbbmde59KnVgD2w7bV4nL66E75Sywd0O97hHDZtHjqcvjTOcvMN0O2ZYSoaTB8
 GKRoX9iobBhzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lw5c7tcg
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ipmitool: download
 enterprise-numbers versioned
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGFyaW8sIEFsbCwKCk9uIDIwMjQtMDktMDUgMDg6MDkgKzAyMDAsIERhcmlvIEJpbmFjY2hpIHNw
YWtlIHRodXNseToKPiBPbiBXZWQsIFNlcCA0LCAyMDI0IGF0IDg6MTfigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ClstLVNOSVAtLV0KPiA+IEkgdHJp
ZWQgYSBmZXcgaGFja3MsIG5vdGFibHkgdGhlIGluZmFtb3VzIEdFVCBwYXJhbWV0ZXJzLCBsaWtl
Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2xhcnNlZ2dlcnQvaWFuYS1hc3NpZ25tZW50cy9yYXcv
NmVhZlsuLi5dZW50ZXJwcmlzZS1udW1iZXJzL2VudGVycHJpc2UtbnVtYmVycyZwYXRoPWZvby9l
bnRlcnByaXNlLW51bWJlcnMtNmVhZlsuLi5dLnR4dAo+ID4gYW5kIHZhcmlvdXMgdmFyaWFudHMg
b2YgdGhhdCwgYnV0IHRvIG5vdCBhdmFpbC4uLiBTbywgdW5sZXNzIHlvdSBjYW4KPiA+IGNvbWUg
dXAgd2l0aCBhIHdheSB0byBoYWNrIGEgdmVyaW9uZWQgZmlsZW5hbWUgaW4gdGhlIFVSTCwgd2Un
bGwgaGF2ZSB0bwo+ID4gaW50cm9kdWNlIGEgZGVkaWNhdGVkIHBhY2thZ2UuLi4gOi0vCj4gQUZB
SUssIGFkZGluZyB0aGUgcGFja2FnZSBpcyBwcm9iYWJseSB0aGUgY2xlYW5lc3Qgc29sdXRpb24u
CgpBZ3JlZWQuCgpJbiB0aGlzIGNhc2UsIHRoZSBuZXcgcGFja2FnZSBzaG91bGQgcHJvYmFibHkg
YmUgc29tZXRoaW5nIGxpa2U6CgogICAgY29uZmlnIEJSMl9QS0dfSUFOQV9BU1NJR05NRU5UUwog
ICAgICAgIGJvb2wgImlhbmEtYXNzaWdubWVudHMiCiAgICAgICAgc2VsZWN0IEJSMl9QS0dfSUFO
QV9BU1NJR05NRU5UU19QRU5fUkVHCgogICAgaWYgQlIyX1BLR19JQU5BX0FTU0lHTk1FTlRTCgog
ICAgY29uZmlnIEJSMl9QS0dfSUFOQV9BU1NJR05NRU5UU19QRU5fUkVHCiAgICAgICAgYm9vbCAi
UEVOIChFbnRlcnByaXNlIE51bWJlcnMpICByZWdpc3RyeSIKCiAgICBlbmRpZgoKKHdlIG5lZWQg
dGhlIHNlbGVjdCB0byBlbnN1cmUgc29tZXRoaW5nIGdldHMgaW5zdGFsbGVkLCBhbmQgd2UgaGF2
ZSB0aGUKc3ViLW9wdGlvbiBpbiBjYXNlIHdlIG5lZWQgdG8gaW5zdGFsbCBvdGhlciBhaXNzaWdu
bWVudHMgaW4gdGhlIGZ1dHVyZSkuCgpBbmQgdGhlbiBpdCBzaG91bGQgaW5zdGFsbCB0aGF0IGlu
dG86CgogICAgJChUQVJHRVRfRElSKS91c3Ivc2hhcmUvbWlzYy9pYW5hL2VudGVycHJpc2UtbnVt
YmVycwoKQW5kIGlwbWl0b29sIHNob3VsZCBiZSBjb25maWd1cmVkIHRvIHVzZSB0aGF0OgoKICAg
IGlmZXEgKCQoQlIyX1BLR19JQU5BX0FTU0lHTk1FTlRTX1BFTl9SRUcpLHkpCiAgICBJUE1JVE9P
TF9DT05GX0VOViArPSBJQU5BRElSPS91c3Ivc2hhcmUvbWlzYy9pYW5hCiAgICBlbmRpZgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5u
IEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmlj
cycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
