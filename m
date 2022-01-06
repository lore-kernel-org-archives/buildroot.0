Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4F1C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 09:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836F36FBBB;
	Thu,  6 Jan 2022 09:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bEV-q44JG68H; Thu,  6 Jan 2022 09:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF966FBE0;
	Thu,  6 Jan 2022 09:38:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32D9B1C113E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A26440898
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:38:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulkNspmFDxsh for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 09:38:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0472E40883
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 09:38:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C95E224000E;
 Thu,  6 Jan 2022 09:38:00 +0000 (UTC)
Date: Thu, 6 Jan 2022 10:37:59 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220106103759.1166357c@windsurf>
In-Reply-To: <faf7a836-82a1-04b9-89de-d9a7825df776@smile.fr>
References: <ea-mime-61d5bfe1-7547-225ebd37@www-7.net-c.com>
 <faf7a836-82a1-04b9-89de-d9a7825df776@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] package/aravis: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, marc.chalain@mailoo.org,
 Marc Chalain <marc.chalain@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBUaHUsIDYgSmFuIDIwMjIgMTA6MjQ6NTMgKzAxMDAKUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgoKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Fy
YXZpcy9Db25maWcuaW4gYi9wYWNrYWdlL2FyYXZpcy9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4wMmM3MWM0NGRhCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysgYi9wYWNrYWdlL2FyYXZpcy9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsMTYg
QEAKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfQVJBVklTCj4gPiArwqDCoMKgIGJvb2wgImFyYXZp
cyAtIEdpZ0UgQ2FtZXJhIgoKSnVzdDoKCgkgYm9vbCAiYXJhdmlzIgoKPiA+ICvCoMKgwqAgZGVw
ZW5kcyBvbiBCUjJfVVNFX1dDSEFSCj4gPiArwqDCoMKgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJ
Tl9IQVNfVEhSRUFEU19OUFRMCj4gPiArwqDCoMKgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUENS
RV8xNgo+ID4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1BDUkVfMzIKClBsZWFzZSB1
c2UgInNlbGVjdCIgZm9yIHBjcmUuCgo+ID4gK0FSQVZJU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlO
Rwo+ID4gK0FSQVZJU19MREZMQUdTID0gJChUQVJHRVRfTERGTEFHUykgJChUQVJHRVRfTkxTX0xJ
QlMpICAKPiAKPiBJcyBnZXR0ZXh0IGEgbWFuZGF0b3J5IGRlcGVuZGVuY3kgPwo+IEF0IGxlYXN0
IGdldHRleHQgc2hvdWxkIGJlIGluIEFSQVZJU19ERVBFTkRFTkNJRVMgd2hlbiBOTFMgc3VwcG9y
dCBpcyBlbmFibGVkLgoKTm8sIGRvbid0IGFkZCBnZXR0ZXh0IGRpcmVjdGx5LCB1c2UgJChUQVJH
RVRfTkxTX0RFUEVOREVOQ0lFUyksIHdoaWNoCndpbGwgYXV0b21hdGljYWxseSBhZGQgKG9yIG5v
dCkgaG9zdC1nZXR0ZXh0IGFuZC9vciBnZXR0ZXh0IHRvIHRoZQpkZXBlbmRlbmNpZXMsIGRlcGVu
ZGluZyBvbiB3aGVuIGl0J3MgbmVlZGVkIG9yIG5vdC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
