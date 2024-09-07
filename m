Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0127EB64CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 21:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902F56064C;
	Sat,  7 Sep 2024 21:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46Fi4KMtr9an; Sat,  7 Sep 2024 21:06:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7914560676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7914560676;
	Sat,  7 Sep 2024 21:06:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCC61BF41F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39BE9405A1
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPusCa8yWi3M for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 21:06:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE09640598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE09640598
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE09640598
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 21:06:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1D5FE13F88E;
 Sat,  7 Sep 2024 23:06:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 07 Sep 2024 23:06:00 +0200
Date: Sat, 7 Sep 2024 23:06:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZtzAOKw5leT7Za7s@landeda>
References: <20240906171152.1922026-1-james.hilliard1@gmail.com>
 <ZtywKuWN1HXJhHjw@landeda> <Zty1_NkUzhsVYTd_@landeda>
 <CADvTj4rPAr0-TyeGsN50XGEhpSyeO95G6VXXCzJLHeH4qmrdPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rPAr0-TyeGsN50XGEhpSyeO95G6VXXCzJLHeH4qmrdPQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725743164;
 bh=2YqPEPz8TaO9nBzDodxZRAKa2MMI+HZSrTnA/24vwq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwR0eeSuQVOTWgbFweGdcYDZ92vJNUlE5ppx3mL6CU69Dv9IjNuqdL/BmW63Zmi9E
 0TF682jdYQg5mW4dCaChe8dWnK3Dwu1dqj8YNXg8P3E+QwOr2YY/FCgvVmQvjCYxWn
 5k8TXGjaT5v2hLFVvdOflXWL7zfkP0Ai4WNBikxZi4eoVvkkBcLGsAdW/cX+SwBdgZ
 qFZAFVmMHWkzw5fXC+uzQ8V9who6FpM7qGeJ80tKSkV6G5OcpYjc0lX7yvm1I2WsDU
 fRYQrNXmX8tHA6sUwDuhkwt88UiorLpJW/0nDFJ15Goecbtfb25cjOb5DH/JLXjfg0
 gp7H4CQwmOwTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bwR0eeSu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 43.0.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDktMDcgMTQ6NDkgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTYXQsIFNlcCA3LCAyMDI0IGF0IDI6MjLigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ClstLVNOSVAtLV0KPiA+IE5vLCBJ
IGhhdmUgbm90IGFwcGxpZWQgaXQsIGJlY2F1c2UgaXQgaXMgaW5jb3JyZWN0OiB3ZSAqbXVzdCog
aGF2ZSBhCj4gPiBtYW5nbGVkIHNvdXJjZSBmaWxlbmFtZSwgYXMgZXhwbGFpbmVkIGluIGM2MTdl
YmJjOTc3ZDogd2Ugd2FudCB0aGUgbG9jYWwKPiA+IGFyY2hpdmUgdG8gaGF2ZSBvdXIgLWNhcmdv
MiBwb3N0LXZlcnNpb24gc3VmZml4LCBzbyB0aGF0IHdlIGFyZSBmcmVlIHRvCj4gPiB1cGRhdGUg
b3VyIHZlbmRvcmluZyBjb2RlIChhbmQgdXBkYXRlIHRoZSBwb3N0LXZlcnNpb24gc3VmZml4KSB3
aXRob3V0Cj4gPiBjYXVzaW5nIGNvbmZsaWN0cyBpbiB0aGUgZnV0dXJlLgo+IAo+IE9oLCBJIGhh
ZCB0YWtlbiB0aGUgInRoaXMgaXMgYSBzdG9wLWdhcCBtZWFzdXJlIiBwYXJ0IGFzIGFuIGluZGlj
YXRpb24KPiB0aGF0IHRoaXMgd2FzIG9ubHkgYmVpbmcgZG9uZSBpbiBjYXNlcyB3aGVyZSBpdCB3
YXMgbmVlZGVkIHRvIHByZXZlbnQKPiBoYXNoIGNvbmZsaWN0cyhpLmUuIGluIGNhc2VzIHdoZXJl
IHRoZXJlIHdvdWxkIGFjdHVhbGx5IGJlIGEgdmVyc2lvbgo+IGNvbmZsaWN0IGR1ZSB0byB0aGUg
ZmlsZW5hbWUgbm90IGNoYW5naW5nIHdoZW4gdGhlIGhhc2ggY2hhbmdlcykuCgpFeGFjdGx5LiBO
b3csIGNvbnNpZGVyIHRoZSBzaXR1YXRpb24gaWYgSSBhcHBseSB0aGlzIHBhdGNoIHRvZGF5LCBh
bmQKdG9tb3Jyb3cgd2UgY2hhbmdlIHRoZSB2ZW5kcm9pbmcgY29kZSBpbiBkb3dubG9hZC9jYXJn
by1wb3N0LXByb2Nlc3M6CnRoZXJlIHdpbGwgYmUgYSBoYXNoIG1pc21hdGNoIGFnYWluLgoKU08g
d2Ugd2FudCB0byBhdm9pZCB0aGF0LCBhbmQgc28gYXJjaGl2ZXMgdGhhdCBhcmUgY2FyZ28tdmVu
ZG9yZWQgbXVzdApoYXZlIG91ciBwb3N0LXZlcnNpb24gc3Vzc2lmeC4KClllcywgdGhhdCBpcyBh
IHN0b3AtZ2FwIG1lYXN1cmUgIndoaWxlIHdhaXRpbmcgZm9yIGEgZ2VuZXJpYyBzb2x1dGlvbgp0
aGF0IHdvcmtzIGluIGFsbCBjYXNlcywgbm90IGp1c3Qgd2l0aCBQeVBJIiwgYW5kIHdlIGRvIG5v
dCB5ZXQgaGF2ZSBhCmdlbmVyaWMgc29sdXRpb24uLi4gOi0vCgo+IFNpbmNlIHRoZSB2ZXJzaW9u
IHVwZGF0ZSB3b3VsZCByZXN1bHQgaW4gdGhlIHBhY2thZ2Ugbm8gbG9uZ2VyCj4gY29uZmxpY3Rp
bmcgSSBoYWQgcmVtb3ZlZCB0aGUgaGFjay4KClJpZ2h0LCBpdCBkb2VzIG5vdCBjb25mbGljdCB0
b2RheS4gQnV0IHdpbGwgY29uZmxpY3QgdG9tb3Jyb3cuIDstKQoKWy0tU05JUC0tXQo+ID4gSW4g
dGhlICh2ZXJ5IGZhcikgZnV0dXJlLCB3ZSBhcmUgdGhpbmtpbmcgYWJvdXQgZGVjb3JlbGF0aW5n
IHRoZSBsY29hbAo+ID4gZmlsZW5hbWUgZnJvbSB0aGUgcmVtb3RlIG9uZSwgYnV0IHRoaXMgaXMg
Z29pbmcgdG8gdGFrZSBhIGxvdCBvZiB0aW1lLAo+ID4gc28gbWF5YmUgYSBzaG9ydGVyIHNvbHV0
aW9uIHdvdWxkIGJlIGZvciBzY2FuLXB5cGkgdG8gaGFuZGxlIHRoZSBjYXNlCj4gPiBmb3IgcGFj
a2FnZXMgdGhhdCBuZWVkIGNhcmdvIHZlbmRvcmluZyAoYmFzaWNhbGx5LCB0aGUgbWF0dXJpbiBv
cgo+ID4gc2V0dXB0b29scy1ydXN0IHBhY2thZ2VzKS4KPiA+Cj4gPiBDb3VsZCB5b3UgaGF2ZSBh
IGxvb2sgYXQgdGhhdCB0b28sIHBsZWFzZT8KPiAKPiBPaywgSSdsbCBjaGFuZ2UgdGhlc2UgdG8g
a2VlcCB0aGUgY2FyZ28yIHZlbmRvciB2ZXJzaW9uLgoKVGhhbmsgeW91ISDwn5GNCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
