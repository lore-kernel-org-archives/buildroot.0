Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D1ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CD93404F5;
	Sat, 27 Aug 2022 07:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD93404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0NCGzRaOELpo; Sat, 27 Aug 2022 07:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47529404EB;
	Sat, 27 Aug 2022 07:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47529404EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF671BF853
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E5D813DE
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85E5D813DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGKT8uJ6iGQD for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:56:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFBE78130B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFBE78130B
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:56:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C9A1819F750;
 Sat, 27 Aug 2022 09:56:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 09:56:44 +0200
Date: Sat, 27 Aug 2022 09:56:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20220827075644.GN37358@scaer>
References: <20220826211451.33719-1-fontaine.fabrice@gmail.com>
 <CAB1t1CwHQx=557eBkkBZPAA92dj+GYXMdpHM5WJdYOc1VNJ9JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB1t1CwHQx=557eBkkBZPAA92dj+GYXMdpHM5WJdYOc1VNJ9JQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661587010;
 bh=URsvEyk99+9QsALOaS/ElqKO4D2qjSBw76hBCMP4nbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cv6H3M62Lvap/JmLgx3yDfm2JTVjVVNr7T3BgbLXUWAzpOlwtrkZI0HyftJeO+fad
 J5LBuPaN91A/1yMhJc32p5cL9C3EZgkGuZuFha6hWVsNw4fp31v7jXZGtCD/R59586
 UnOSqBAvEKkraUgKlCnZX9ChvVlTfTo3uYrVBs3mz1KRX+HlKRbTjxfO6vxDugFFLr
 W0YKpnDpRu25FDTL4A63cJKtA89B8ntZ+PadXVMRiKgdk/nRVo4PhQaU/DRCFQvSAk
 sfVJtGLS1qwqoZFQQ+PkBfz2wZMBsFtmnbhfY5SAlnoIDUH2xckTI52TdVWntBYd60
 rv0a5EpN1eK7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cv6H3M62
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: security bump to
 version 1.3.3
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
Cc: Olivier Van den Eede <olivier.van_den_eede.ext@nokia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGV0ciwgT2xpdmllciwgQWxsLAoKT24gMjAyMi0wOC0yNyAwNzoyNyArMDIwMCwgUGV0ciBWb3Jl
bCBzcGFrZSB0aHVzbHk6Cj4gSGkgRmFicmljZSwgYWxsLAo+IHRoYW5rcyEKPiBSZXZpZXdlZC1i
eTogUGV0ciBWb3JlbCA8IFsxXXBldHIudm9yZWxAZ21haWwuY29tPgo+IEZZScKgT2xpdmllciBW
YW4gZGVuIEVlZGUgaGFzIGFsc28gc2VudCB2YWxpZCBwYXRjaCBmb3IgdGhpcyBidXQgaXQgaGF2
ZW4ndCByZWFjaGVkIHBhdGNod29yayBub3QgZXZlbiBNTC4KPiBJIGd1ZXNzIGhlJ3Mgbm90IHN1
YnNjcmliZWQsIHRodXMgb25seSBwZW9wbGUgaW4gQ2MgZ290IHRoZSBtYWlsLgoKSSBoYWQgc2Vl
biB5b3VyIHByZXZpb3VzIHJlcGx5LCBidXQgSSB0b28gZGlkIG5vdCBnZXQgT2xpdmllcidzIHBh
dGNoLApzbyBJIGVuZGVkIHVwIGFwcGx5aW5nIEZhYnJpY2UncyBpbnN0ZWFkLgoKT2xpdmllciwg
dGhhbmtzIGZvciB5b3VyIHBhdGNoLCBidXQgaW5kZWVkLCB5b3UgbmVlZCB0byBiZSBzdWJzY3Jp
YmVkIHRvCnRoZSBsaXN0IHRvIHBvc3QgbWVzc2FnZXMuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklO
LgoKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+IAo+IExpbmtzOgo+IDEuIG1haWx0bzpwZXRyLnZv
cmVsQGdtYWlsLmNvbQoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAoKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
