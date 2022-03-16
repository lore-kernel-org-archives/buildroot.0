Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D934C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 18:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED4D5841F8;
	Wed, 16 Mar 2022 18:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KO20r9cek0P3; Wed, 16 Mar 2022 18:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C003841EA;
	Wed, 16 Mar 2022 18:17:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0111BF3E0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181A460F88
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 18:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQw29M1_y8bN for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 18:17:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8C2960D80
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 18:17:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 763DF13F8E7;
 Wed, 16 Mar 2022 19:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647454663;
 bh=AhiZsC5jnz0iDcEyXeVBkI7OCT+d4M9tYum8RW1fhjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ixAPKr9uxbotr/gQFTajZo+wFpaNMSHqyrStYeRUw+p3jSbAY4dyG+B8k8iVrJ164
 XRxdtiVcc0dCsUHXNzIFLHeCXPVSM3t4eBlnKbaqSHPypVsiuS585ioMX4EX0gJC1v
 8STJQ19y6pzWxZMyy+cObut5K3xyYjPKNvvldRYPkzffcuJ6Nt8bD6PW1TbD0+mzQ/
 2yz2CoVrzIJl5GOF7AzhhGPms8AjN18X24G4GTLGJ7jVN14YkmvYYz3bBrUl9rgphV
 GKp4hi0sWUHHxeEU4H+pde2StwMmBXVMRqalHauE/tHQTQPEUEctSoqYbvNJbQIaZu
 eShpz9KH6eqDw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 19:17:39 +0100
Date: Wed, 16 Mar 2022 19:17:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220316181739.GY283544@scaer>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-3-clement.leger@bootlin.com>
 <20220314203149.GW283544@scaer> <20220315091041.015209a9@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315091041.015209a9@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 2/8] package/python-cryptography: enable
 host package
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBDbMOpbWVudCwgQWxsLAoKT24gMjAyMi0wMy0xNSAwOToxMCArMDEwMCwgVGhvbWFz
IFBldGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4gT24gTW9uLCAxNCBNYXIgMjAyMiAyMTozMTo0OSAr
MDEwMAo+ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+
IAo+ID4gSSB0aGluayB0aGUgaG9zdCB2YXJpYW50IHNob3VsZCBhdXRvbWF0aWNhbGx5IGluaGVy
aXQgdGhhdCBzZXR0aW5nIGZyb20KPiA+IHRoZSB0YXJnZXQgdmFyaWFudC4KPiA+IAo+ID4gQWZ0
ZXJhbGwsIGl0IHNlZW1zIHJlYXNvbmFibGUgdG8gZXhwZWN0IHRoYXQgdGhlIGRvd25sb2FkIG9m
IHRoZSBob3N0Cj4gPiBhbmQgdGFyZ2V0IHZhcmlhbnRzIHNob3VsZCB1c3VhbGx5IGJlIGV4YWN0
bHkgdGhlIHNhbWUuCj4gCj4gSSBhZ3JlZSwgYnV0IEkgdGhvdWdodCB0aGlzIHdhcyByZWFsbHkg
dG9vIG11Y2ggb3V0c2lkZSBvZiB3aGF0IENsw6ltZW50Cj4gaXMgdHJ5aW5nIHRvIGFjaGlldmUg
aW4gdGhpcyBwYXRjaCBzZXJpZXMgKEkgaGVscGVkIENsw6ltZW50IGludGVybmFsbHkKPiBieSBy
ZXZpZXdpbmcvZGlzY3Vzc2luZyB0aGlzIHBhdGNoIHNlcmllcywgYW5kIGluZGVlZCBpZGVudGlm
aWVkIHRoZQo+IGZhY3QgdGhhdCB0aG9zZSB2YXJpYWJsZXMgc2hvdWxkIGJlIGluaGVyaXRlZCBi
ZXR3ZWVuIHRhcmdldC9ob3N0KS4KPiAKPiBCdXQgb2YgY291cnNlIGlmIGFzIGEgbWFpbnRhaW5l
ciB5b3UgdGhpbmsgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBpcwo+IHJlYWxseSBuZWVkZWQgYXMg
YSBwcmUtcmVxdWlzaXRlIHRvIG1lcmdlIHRob3NlIHBhdGNoZXMsIHdlIGNhbiBhc2sKPiBDbMOp
bWVudCB0byB3b3JrIG9uIHRoaXMgOi0pCgpJIHRoaW5rIEkgZXZlbiBwcm92aWRlZCB0aGUgcGF0
Y2ggaW4gbXkgcmV2aWV3Li4uIDstKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
