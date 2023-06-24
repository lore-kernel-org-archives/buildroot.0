Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CF2EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 13:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D27F860B70;
	Sat, 24 Jun 2023 13:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D27F860B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yc0hSNkhLytj; Sat, 24 Jun 2023 13:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B1E60B2B;
	Sat, 24 Jun 2023 13:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12B1E60B2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFBD91BF31F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B519981F71
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B519981F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRV9ujYyaptb for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 13:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11B2A81F60
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11B2A81F60
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 13:18:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 855DDB0053E;
 Sat, 24 Jun 2023 15:18:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 15:18:02 +0200
Date: Sat, 24 Jun 2023 15:18:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230624131802.GK24952@scaer>
References: <20230624090608.3221984-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624090608.3221984-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687612685;
 bh=kVsPZ0a4JFIcZR/ZCOrMdjld+ndN7QO5SzvpeBQCD5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g8rmmLnbIi8urUBmkiWbCIWeYjeI1M78wTq8ZJWmo2nA/ZRgzst+d9pyE5uX92wvh
 82dNGpr0+MbNFwYNH3h9+VyA8iB/M1+/FcUyALLztdlVj9gcdwFjjztE4mKlC1MW2F
 Su+YU5Tj78g7VK7QWDHdfqPba829qWY9MKjEbWF/meo+CinA3HnXFWCcHOoNsLxAFo
 X5ClKBofT+CtyUidzRVtPKMPLsDOauQHerylhd9L0fJdrhKrFjn6LNPbtG5/cgVWpa
 F+J000s6awj4w8CgFM1nL5RSa+6zvo+qf6R3jmQrvoIuAqPCuuYC9QSm8MrhTtJMeQ
 EDy/Ng+z8dr+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g8rmmLnb
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_DEVELOPERS=3A_remove_Jos?=
 =?utf-8?q?=C3=A9_Pekkarinen?=
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
Cc: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQsIEFsbCwKCk9uIDIwMjMtMDYtMjQgMTE6MDYgKzAyMDAsIEJlcm5kIEt1aGxzIHNwYWtl
IHRodXNseToKPiBFLW1haWxzIGFyZSBib3VuY2luZzoKPiAKPiA8am9zZS5wZWtrYXJpbmVuQHVu
aWtpZS5jb20+OiBob3N0IEFTUE1YLkwuR09PR0xFLmNvbVs3NC4xMjUuMTMzLjI2XSBzYWlkOgo+
ICAgICA1NTAtNS4xLjEgVGhlIGVtYWlsIGFjY291bnQgdGhhdCB5b3UgdHJpZWQgdG8gcmVhY2gg
ZG9lcyBub3QgZXhpc3QuIFBsZWFzZQo+ICAgICB0cnkgNTUwLTUuMS4xIGRvdWJsZS1jaGVja2lu
ZyB0aGUgcmVjaXBpZW50J3MgZW1haWwgYWRkcmVzcyBmb3IgdHlwb3Mgb3IKPiAgICAgNTUwLTUu
MS4xIHVubmVjZXNzYXJ5IHNwYWNlcy4gTGVhcm4gbW9yZSBhdCA1NTAgNS4xLjEKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBERVZFTE9QRVJT
IHwgMTMgLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggOWI1OWJiYzU0
Yi4uMDVmZjRiM2IyNiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVS
Uwo+IEBAIC0xNjIwLDE5ICsxNjIwLDYgQEAgTjoJSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxz
YWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Cj4gIEY6CXBhY2thZ2UvemZzLwo+ICBGOglzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQo+ICAKPiAtTjoJSm9zw6kgUGVr
a2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLUY6CXBhY2thZ2UvYWxmcmVk
Lwo+IC1GOglwYWNrYWdlL2F2b2NhZG8vCj4gLUY6CXBhY2thZ2UvYm14Ny8KPiAtRjoJcGFja2Fn
ZS9vcGVuc2MvCj4gLUY6CXBhY2thZ2UvcHl0aG9uLWFleHBlY3QvCj4gLUY6CXBhY2thZ2UvcHl0
aG9uLWFsZW1iaWMvCj4gLUY6CXBhY2thZ2UvcHl0aG9uLWxhcmsvCj4gLUY6CXBhY2thZ2Uvc29m
dGhzbTIvCj4gLUY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25f
YWV4cGVjdC5weQo+IC1GOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2F2b2Nh
ZG8ucHkKPiAtRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fYWV4
cGVjdC5weQo+IC0KPiAgTjoJSm9zZXBoIEtvZ3V0IDxqb3NlcGgua29ndXRAZ21haWwuY29tPgo+
ICBGOglwYWNrYWdlL2F0LXNwaTItY29yZS8KPiAgRjoJcGFja2FnZS9jbGFuZy8KPiAtLSAKPiAy
LjM5LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0g
Ci4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVt
YmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2
MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18g
ICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
