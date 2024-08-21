Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F8CC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 12:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A18812A8;
	Wed, 21 Aug 2024 12:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1OQMDrAn4oe; Wed, 21 Aug 2024 12:27:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0A5981332
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A5981332;
	Wed, 21 Aug 2024 12:27:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1AD1BF418
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 12:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D06260A82
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 12:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZKJTm--7GSq for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 12:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA9356073F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA9356073F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA9356073F
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 12:27:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8793813F8B5;
 Wed, 21 Aug 2024 14:27:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 14:27:17 +0200
Date: Wed, 21 Aug 2024 14:27:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stephan =?utf-8?Q?M=C3=BCller?= <smueller@chronox.de>
Message-ID: <ZsXdJRdYLtLx1cgf@landeda>
References: <20240821055146.46029-1-ende.tan@starfivetech.com>
 <22321294.h8k6rc2Cxg@tauon.atsec.com> <ZsXMSfQINZVI5CjT@landeda>
 <2443170.9o76ZdvQCi@positron.chronox.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2443170.9o76ZdvQCi@positron.chronox.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724243243;
 bh=6pLZ3+078xkPb7N45dNpU+bhI5H7Qp5fNOOvKguSveg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWycvSbpV7zepyXDDQ4rrJ1jMs6JEHdoQAmyLRJOrngyqTK9udndj0d2gED9Off8x
 Czt+syTbnYTcASAQp2+zJYCguVQ8kavTikedx8AqNKZRNwEyyN9Ki/reIi49Oovhy1
 uYWIzV81dcDakwNX7Yb+SBCsogMfaUk1AH+GBFEXSJW4YBwVuodvCLDvb24SPttZVT
 mzeiJveA0B3pVPLdEzOi+kNXeIjG+FPRhJ6fpYE4oSbak3kQTexOyNXVOOkGC8JZdK
 0og7yz2Gnrv/Js1SObtkOb+xpySAIC3tdHdNP04X0pqu0fV4jmxYHoEqvi2I8oSpPn
 2e6nW4KPGrG+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sWycvSbp
Subject: Re: [Buildroot] [1/1] package/libkcapi: update site path
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
Cc: fontaine.fabrice@gmail.com, ende.tan@starfivetech.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RlcGhhbiwgQWxsLAoKT24gMjAyNC0wOC0yMSAxMzozNSArMDIwMCwgU3RlcGhhbiBNw7xsbGVy
IHNwYWtlIHRodXNseToKPiBIYXZlIGEgbG9vayBub3cuIEFsdGhvdWdoIEkgaGF2ZSBub3QgdXBk
YXRlZCB0aGUgSFRNTCBwYWdlcywgdGhlIGRpZmZlcmVudCAKPiByZWxlYXNlcyBhcmUgbm93IGF2
YWlsYWJsZSBhdDoKPiBodHRwOi8vd3d3LmNocm9ub3guZGUvbGlia2NhcGkvcmVsZWFzZXMvVkVS
U0lPTi9saWJrY2FwaS1WRVJTSU9OLnRhci54elsuYXNjXQoKWWVzLCBpdCB3b3Jrcy4gVGhhbmtz
IGEgbG90IGZvciBhZGFwdGluZyB5b3VyIHNpdGUuIDotKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJ
Ti4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
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
