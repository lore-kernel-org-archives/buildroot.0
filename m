Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC60C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3087D60B09;
	Wed, 19 Jan 2022 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1QnuCvnWLij; Wed, 19 Jan 2022 20:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6333D60AF4;
	Wed, 19 Jan 2022 20:33:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D72E1BF405
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2972D40234
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdOFt7TGMRhk for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 20:33:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EEA44022A
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 20:33:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EAC1819F5A1;
 Wed, 19 Jan 2022 21:33:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642624416;
 bh=vgghgiL81H4Y7P2QMEsfzKUxCLlRTN4lzCGnNb6Hj6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T9UB/GnMFWjFI3ent+QIwhx8yiDcUfvJlDUNoDW2UIiCb1sV2u59XnlsKyMMzH/bu
 EmkW+jWu/sr5vFqW4mnrUk1qxiedJMxuYqcne4IH+Mz3Mc+ipjdsm61MEtdpREleTW
 SQow+5f1QzVGopNs+i7lkCE5qbaKnM975W/BlkszzeRugHs3zvc7/x6J3kCspD+y/x
 VNOthemQIBygNfPw739Z93XI39atdomKQHBJVDlul2a28NwqP6tgsUYi/JQ6LiZ61f
 7Vvmfb0ZALDO/lCb5UUhnZRV7ScvqS50oPBhOP4LiTLtczLOV0ps78oXqYf86iAsH7
 3M2AGy7BsZL+g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 21:33:33 +0100
Date: Wed, 19 Jan 2022 21:33:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Tilman =?utf-8?B?S2Vza2luw7Z6?= <arved@arved.at>
Message-ID: <20220119203333.GB3095239@scaer>
References: <20220119155739.c5kzupm5njobmkn6@arved.priv.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220119155739.c5kzupm5njobmkn6@arved.priv.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] Dependency on liburiparser was removed
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGlsbWFuLCBBbGwsCgpPbiAyMDIyLTAxLTE5IDE2OjU3ICswMTAwLCBUaWxtYW4gS2Vza2luw7Z6
IHNwYWtlIHRodXNseToKPiBGcm9tOiBUaWxtYW4gS2Vza2luw7Z6IDxhcnZlZEBhcnZlZC5hdD4K
PiAKPiBEZXBlbmRlbmN5IHdhcyByZW1vdmVkIGZyb20gTWFrZWZpbGUgaW4KPiA1OTM2ODNiNDVm
NzIxNjlkZDk0ZWMxNGZhMTg3MjBiM2NlYzlkZGE0CgpUaGUgY29tbWl0IHRpdGxlIHNob3VsZCBt
ZW50aW9uIHRoZSBpbXBhY3RlZCBwYWNrYWdlLCBhbmQgbWVudGlvbiBhbgphY3Rpb24gaW4gdGhl
IGluZmluaXRpdmUgdGVuc2UsIGxpa2Ugc286CgogICAgcGFja2FnZS90cG0yLXRzczogZG8gbm90
IHNlbGVjdCBsaWJ1cmlwYXJzZXIKClRoZSBjb21taXQgbG9nIHdhcyBtb3N0bHkgT0ssIGlmIGEg
Yml0IGNvbmZ1c2luZywgc28gSSByZXdvcmRlZCBpdCB3aXRoOgoKICAgIENvbW1pdCA1OTM2ODNi
NDVmNzIgKHBhY2thZ2UvdHBtMi10c3M6IHJlbW92ZSB1bnVzZWQgZGVwZW5kZW5jeSkKICAgIHJl
bW92ZWQgdGhlIGJ1aWxkLXRpbWUgZGVwZW5kZW5jeSAoaW4gdGhlIC5tayksIGJ1dCBmb3Jnb3Qg
dG8KICAgIHJlbW92ZSBpdCBmcm9tIHRoZSBDb25maWcuaW4uCgpBcHBsaWVkIHRvIG1hc3RlciB3
aXRoIHRob3NlIGNoYW5nZXMgKGFuZCBmb3IgZ29vZCBtZWFzdXJlLCBhIHR5cG8gb2YKbWluZSB0
aGF0IEkgbm90aWNlZCB0b28gbGF0ZSwgc29ycnkpLiBUaGFua3MhCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKPiBTaWduZWQtb2ZmLWJ5OiBUaWxtYW4gS2Vza2luw7Z6IDxhcnZlZEBhcnZlZC5h
dD4KPiAtLS0KPiAgcGFja2FnZS90cG0yLXRzcy9Db25maWcuaW4gfCAxIC0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90cG0yLXRzcy9D
b25maWcuaW4gYi9wYWNrYWdlL3RwbTItdHNzL0NvbmZpZy5pbgo+IGluZGV4IDJmYzU2ZGJkNzYu
Ljg1Nzk4N2FlMzYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS90cG0yLXRzcy9Db25maWcuaW4KPiAr
KysgYi9wYWNrYWdlL3RwbTItdHNzL0NvbmZpZy5pbgo+IEBAIC0xLDcgKzEsNiBAQAo+ICBjb25m
aWcgQlIyX1BBQ0tBR0VfVFBNMl9UU1MKPiAgCWJvb2wgInRwbTItdHNzIgo+ICAJZGVwZW5kcyBv
biAhQlIyX1NUQVRJQ19MSUJTICMgZGxmY24uaAo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlVS
SVBBUlNFUgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9PUEVOU1NMX0ZPUkNFX0xJQk9QRU5TU0wKPiAgCWhlbHAKPiAtLSAKPiAyLjMyLjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
