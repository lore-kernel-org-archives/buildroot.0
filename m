Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6860C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 15:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FA5560B88;
	Mon,  1 Aug 2022 15:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FA5560B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TbSAWgdL8eai; Mon,  1 Aug 2022 15:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F9E600D1;
	Mon,  1 Aug 2022 15:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F9E600D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDF311BF343
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9658600D1
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 15:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9658600D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4CY6fdogbaK for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 15:28:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C04AF600CC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C04AF600CC
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 15:28:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a573:58bd:e1d1:c541])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2DC8019F73F;
 Mon,  1 Aug 2022 17:28:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Aug 2022 17:28:37 +0200
Date: Mon, 1 Aug 2022 17:28:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20220801152837.GB3168@scaer>
References: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
 <20220730121955.GS3168@scaer>
 <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c25e9cda-9f84-6049-fc24-a8f442d8455e@theobroma-systems.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659367721;
 bh=w9c4W5GvBcw0sq7UaZjNOqfPlFIpjSc5L6MPbMflpCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pO7rwSbaSZqxUy5j9jgRASGQyk4YzhNZyOHEwQ5JJcRbhCAaPh4uDIGMuBoA1ZnFH
 sddUqph9apCCyQIVeDMXHWTpBb4ItMtTYVeDPSkpclpQEa/ZuZZdR67PDywKfPNY5v
 F2NjizJ1yYIeOy8VfYft7ziTJwJ+X28QvhJrLMXMdB6F3scGcPiOrucBooEqUpgrg2
 JBpRanxGHFSUIKuDIaWLNwfoszCCNm7nCmSwtFDOHIDwTMhAk/90qqeBvD1Pm81uZA
 ioq4yZaWLAtyu1sieJEthWWbU58BowP8v2JoZPMJknqjglMKAGcFL4SN04EbQyoMP9
 TgOrVlrIPe/JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pO7rwSba
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: workaround make 4.3 issue for
 'printvars and 'show-vars'
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
Cc: Roosen Henri <Henri.Roosen@ginzinger.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UXVlbnRpbiwgQWxsLAoKT24gMjAyMi0wOC0wMSAxNTozNiArMDIwMCwgUXVlbnRpbiBTY2h1bHog
c3Bha2UgdGh1c2x5Ogo+IE9uIDcvMzAvMjIgMTQ6MTksIFlhbm4gRS4gTU9SSU4gd3JvdGU6Cj4g
Pk9uIDIwMjItMDctMjkgMjE6NDkgKzAwMDAsIFJvb3NlbiBIZW5yaSBzcGFrZSB0aHVzbHk6Cj4g
Pj5FdmVudCB0aG91Z2ggdGhlIGJ1ZyB3aXRoIG1ha2UgNC4zIGhhcyBiZWVuIHJlcG9ydGVkIGFu
ZCBmaXhlZCwgdGhlcmUKPiA+PmhhcyBub3QgYmVlbiBhIHJlbGVhc2Ugb2YgbWFrZSB3aXRoIHRo
ZSBmaXggZm9yIGEgbG9uZyB0aW1lLCBzZWUgWzFdLgo+ID4+Cj4gPj5BcyB0aGUgcm9vdCBjYXVz
ZSBzZWVtcyB0aGUgJ2ZpbHRlcicgY29tbWFuZCBjYW5ub3QgaGFuZGxlIGxhcmdlCj4gPj5jaHVu
a3Mgb2YgZGF0YSwgbGlrZSAuVkFSSUFCTEVTLCB3ZSBjYW4gd29ya2Fyb3VuZCB0aGUgcHJvYmxl
bSBieQo+ID4+dXNpbmcgYSBmb3JlYWNoIGNvbW1hbmQgb3ZlciAuVkFSSUFCTEVTLCB0aGVuIHVz
ZSB0aGUgZmlsdGVyIGNvbW1hbmQuCj4gPj4KPiA+Pkl0IG1pZ2h0IG5vdCBiZSBsb2dpY2FsIHRv
IHByb2dyYW0gaXQgdGhhdCB3YXksIGJ1dCBhdCBsZWFzdCB0aGUKPiA+PmZ1bmN0aW9uYWxpdHkg
aXMgbm93IHVzYWJsZS4KPiA+QXdlc29tZSEgSnVzdCBhd2Vzb21lISDwn5GNCj4gSnVzdCBhIGhl
YWRzLXVwIHRoYXQgYG1ha2UgcHJpbnR2YXJzYCBpcyBicm9rZW4gKEkndmUgc2VudCBhIHBhdGNo
IGZvciBpdAo+IGp1c3Qgbm93KSBhbmQgYWxzbyB0aGF0IEkgZ2V0IGEgc2VnZmF1bHQgZm9yIGBt
YWtlIHNob3ctdmFyc2AgKGBtYWtlCj4gc2hvdy12YXJzIFZBUlM9IkJVU1lCT1hfJSIgd29ya3Mg
anVzdCBmaW5lKS4KCkdhaCwgSSB3YXMgcHJldHR5IHN1cmUgaXQgd29ya2VkIGZvciBtZSwgYnV0
IGluZGVlZCBzaG93LXZhcnMgZmFpbHMsCndoaWxlIHByaW50dmFycyBkb2VzIHdvcmsuLi4KCiAg
ICAkIC4vdXRpbHMvZG9ja2VyLXJ1bgogICAgZG9ja2VyJCBtYWtlIGRlZmNvbmZpZzsgbWFrZSBh
bGx5ZXNwYWNrYWdlY29uZmlnCgogICAgZG9ja2VyJCBtYWtlIHByaW50dmFycyA+L2Rldi9udWxs
IDI+JjE7IGVjaG8gJD8KICAgIDAKICAgIGRvY2tlciQgbWFrZSBwcmludHZhcnMgVkFSUz0lID4v
ZGV2L251bGwgMj4mMTsgZWNobyAkPwogICAgMAoKICAgIGRvY2tlciQgbWFrZSBzaG93LXZhcnMg
Pi9kZXYvbnVsbCAyPiYxOyBlY2hvICQ/CiAgICBTZWdtZW50YXRpb24gZmF1bHQgKGNvcmUgZHVt
cGVkKQogICAgMTM5CgpHcnIuLi4gOi0oCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
