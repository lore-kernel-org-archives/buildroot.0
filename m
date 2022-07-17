Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AC6C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 18:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775CA405B3;
	Sun, 17 Jul 2022 18:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775CA405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dZ_lbKfP2cH; Sun, 17 Jul 2022 18:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 872AE40A5C;
	Sun, 17 Jul 2022 18:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872AE40A5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D720A1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1625827AA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1625827AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFnb9K2zyixz for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 18:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 230B38193E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 230B38193E
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 18:05:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 05BCE78050A;
 Sun, 17 Jul 2022 20:05:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 20:05:44 +0200
Date: Sun, 17 Jul 2022 20:05:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220717180544.GU2249625@scaer>
References: <20220713115851.620731-1-thomas.petazzoni@bootlin.com>
 <20220717092020.GF2543@scaer> <20220717182632.32e8d732@windsurf>
 <20220717184749.13a817bf@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220717184749.13a817bf@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658081150;
 bh=ehrU8fAp6kTBgTyUwn/c3fiaQlSnuOF1ifFQkg6mzFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6wAE6I9eaz8Kikqv40pYoZmwg6Gg/C2mJXoraYZJTwlHFCsTWiFScHPt5/iWXDuu
 gOo747S/GpKes7eFLcTS6yc1YBG1flMwtX0rIZ9ohG1onxBjUHlf7GGhkqjzsOCHGN
 ta4qBSgZBx5nVtkVlmHraHVapR3GqTqwhiMI5WM0ABuXmcHW55zj01VqX0HYM9Mq2q
 kIiXcUyGGp7CqQV+nS5Rp20+OmCNRzk5V8eei30IXoNXx+VoIZe9hEgPPBXqwBajlM
 Hkn0Qx9ZiZ74x0GAwESGfyDFalf7qJl8TWgpXMLVq1GsS0njzVhG4im2vIlTHdT66/
 DzHRNPr/ae96A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X6wAE6I9
Subject: Re: [Buildroot] [PATCH] package/python-pillow: fix host package
 build
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
Cc: kory.maincent@bootlin.com,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIyLTA3LTE3IDE4OjQ3ICswMjAwLCBUaG9tYXMgUGV0YXp6b25p
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE9uIFN1biwgMTcgSnVsIDIwMjIgMTg6MjY6
MzIgKzAyMDAKPiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PiB3cm90ZToKPiA+IFRoYXQgYmVpbmcgc2FpZCwgZ3JlcHBpbmcgdGhyb3VnaCB0aGUgb3B0ZWVf
b3MgY29kZSBmcm9tIFNULCBJIG5vCj4gPiBsb25nZXIgc2VlIHdoZXJlIHB5dGhvbi1waWxsb3cg
aXMgdXNlZC4gSSd2ZSBzdGFydGVkIGEgdGVzdCBidWlsZCB0bwo+ID4gY2hlY2sgdGhpcyAoYnV0
IEknbSBwcmV0dHkgc3VyZSBpdCB3YXMgbmVlZGVkIGF0IHNvbWUgcG9pbnQsIGFzIEkKPiA+IGxv
b2tlZCBpbnRvIHRoaXMgd2l0aCBLw7ZyeSkuCj4gU2VlbXMgbGlrZSB0aGlzIHdob2xlIHB5dGhv
bi1waWxsb3cgZGFuY2UgaXMgaW4gZmFjdCBubyBsb25nZXIKPiBuZWVkZWQuLi4gYXQgbGVhc3Qg
SSBjYW4gYnVpbGQgdGhlIGxhdGVzdCBPUFRFRS1PUyBmcm9tIFNUIHdpdGhvdXQKPiBob3N0LXB5
dGhvbi1waWxsb3cgaW5zdGFsbGVkIChpbiBhIGNsZWFuLCBtaW5pbWFsIFVidW50dSBEb2NrZXIK
PiBjb250YWluZXIpLgoKT0ssIHNvOiBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
