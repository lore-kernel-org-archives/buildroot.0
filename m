Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F196C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 14:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 116EE40C3D;
	Sun, 24 Jul 2022 14:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 116EE40C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGnZaJ6yQ5Qk; Sun, 24 Jul 2022 14:35:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1779F40443;
	Sun, 24 Jul 2022 14:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1779F40443
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A46FA1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CB4E4242B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 14:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB4E4242B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBa_ZbSNrJvH for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 14:35:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF0DA42417
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF0DA42417
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 14:35:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 21D2513FA36;
 Sun, 24 Jul 2022 16:35:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 16:35:33 +0200
Date: Sun, 24 Jul 2022 16:35:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220724143533.GV2641@scaer>
References: <20220720152440.1568667-1-sigmaepsilon92@gmail.com>
 <2569cf83-d180-41ea-ad10-d053528d462d@mind.be>
 <2b27ec0b-ef6d-9540-062c-04d6f75c2cd3@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b27ec0b-ef6d-9540-062c-04d6f75c2cd3@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658673338;
 bh=TzRpnAL7puPIW2MVQF6n57m9NPR6T+0+oJo1uvpB92Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R7nPA5i6WwRXLx9Qk0NV/lw6U8fJbkhyoggPQ8o1hB+eHkYiTTVMM0+1NxQhBQTvm
 +rjQSmtItGAUfvQ0CC6lAMLfWRPxM3MQ93dkF4sypAewiSW409Sa1H8YspJ4a4Q6Aj
 dQLEw+iMOZZcdaUKOKR6IFK7825YlqMjGTpNJLo85rqp2fONH0kiF5IuTskba85P73
 2+Vu+x0xblV/6ShNPfp7fXEBJDhymCh7GXpMVifJ5FlgUNCV0bt5keH2F/QUj+Qkry
 R0uJDGihqOT1ipDqirgmfBwX4cPGL2pqPpSSPwx4En/gpBQLddAvhjtE2lgECNXJ62
 Rjyx/bNY+XMxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R7nPA5i6
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: fix cross-compilation
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWljaGFlbCwgQWxsLAoKT24gMjAyMi0wNy0yMyAxNTo0MSArMDIwMCwgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgc3Bha2UgdGh1c2x5Ogo+IE9uIDIzLzA3LzIwMjIgMTQ6NDIsIEFybm91dCBWYW5kZWNh
cHBlbGxlIHdyb3RlOgo+ID5PbiAyMC8wNy8yMDIyIDE3OjI0LCBNaWNoYWVsIFppbW1lcm1hbm4g
d3JvdGU6Cj4gPj5DdXJyZW50bHksIHRoZSBrZXJuZWwgbW9kdWxlIGdldHMgYnVpbHQgdXNpbmcg
dGhlIGhvc3QtY29tcGlsZXIoZnJvbSB0aGUKPiA+PnVzZXIgZGlzdHJvLCBub3QgZnJvbSBidWls
ZHJvb3QpLgo+IMKgSXQncyBhY3R1YWxseSBlYXN5IHRvIHJlcHJvZHVjZSwganVzdCBjaGFuZ2Ug
dGhlIGFyY2hpdGVjdHVyZSB0byBhbnl0aGluZwo+IG90aGVyIHRoYW4geDg2Lgo+IAo+IMKgSSd2
ZSBsb29rZWQgYXJvdW5kIGEgYml0IGFuZCBpdCBzZWVtcyB0byBtZSB0aGF0IHpmcyBhbHJlYWR5
IGJ1aWxkcyB0aGUKPiBrZXJuZWwgbW9kdWxlIGZyb20gdGhlIGF1dG90b29scyBpbmZyYXN0cnVj
dHVyZSwgc28gd2UncmUgYWN0dWFsbHkgYnVpbGRpbmcKPiBpdCB0d2ljZS4KCkkgY2hlY2tlZCwg
YW5kIGl0IGlzIG5vdCBwb3NzaWJsZSB0byB0ZWxsIHRoZSB6ZnMgYnVpbGRzeXN0ZW0gdG8gbm90
CmJ1aWxkIGl0LgoKPiBJIHRoaW5rIHdlIHNob3VsZCB0aGVyZWZvcmUgcmVtb3ZlIHRoZSBrZXJu
ZWwtbW9kdWxlIGluZnJhIGZvcgo+IHRoaXMgcGFja2FnZSwgYW5kIGluc3RlYWQgYWRkIGEgZGVw
ZW5kZW5jeSBvbiBsaW51eCBhbmQgY29weSB0aGlzIHBhcnQ6Cj4gCj4gIyBJZiB0aGUgcGFja2Fn
ZSBpcyBlbmFibGVkLCBlbnN1cmUgdGhlIGtlcm5lbCB3aWxsIHN1cHBvcnQgbW9kdWxlcwo+IGlm
ZXEgKCQkKEJSMl9QQUNLQUdFXyQoMikpLHkpCj4gTElOVVhfTkVFRFNfTU9EVUxFUyA9IHkKPiBl
bmRpZgoKLi4uIGFuZCBhZGQgbGludXggdG8gWkZTX0RFUERFTkRFTkNJRVMKClNvLCBJJ3ZlIG1h
cmtlZCB0aGUgcGF0Y2ggYXMgY2hhbmdlcyByZXF1ZXN0ZWQgaW4gcGF0Y2h3b3JrLgoKUmVnYXJk
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
