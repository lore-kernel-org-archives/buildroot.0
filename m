Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A128C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF6E0415B1;
	Mon,  3 Jun 2024 11:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEQhYntD1Rk8; Mon,  3 Jun 2024 11:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E77414EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73E77414EB;
	Mon,  3 Jun 2024 11:53:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 471811BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615C94086C
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gl137yC4jwtu for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9641D406AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9641D406AA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9641D406AA
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1990C13FA35;
 Mon,  3 Jun 2024 13:52:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 13:52:36 +0200
Date: Mon, 3 Jun 2024 13:52:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zl2uhKujEDzv2Gur@landeda>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
 <Zlzg8I5r7cd8yTz5@landeda>
 <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717415559;
 bh=oHANR/acf11meseiz6uslpHN8yU9sab6XDDMs1J0/Rg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USllsU2uIXVJXgkKkAXXyKqto0iv9A1ogYa6Nxk32m4XDSgcKzWFgSuddxSmI6Pvi
 OtyUTrYtVPpqUOtMQU3A6Y1BimCSxb4NArSNoj+GvBSX+5x3zL/fklHEmV5Dx+L8d7
 +vKdZTwvWqTThtjgyDRQVXKe+p1dTLm8HxVDStIln2EUMBQGpu4wyVTqc+yGBhd0k/
 jBPChBfjDmAMfnclE5oAP5WpZik1SCSnD9F+bKIps45PCb9dH5fIHb/mOf6rqzPTuk
 Z0pM6jATRDNZXGxtesyKRRRts3T1ldF+KxKXzAQEiyQWD/JcwoHzV2w0ktGnIWKzAj
 hd43Jn6kSONWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=USllsU2u
Subject: Re: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMDIgMTU6MjUgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBTdW4sIEp1biAyLCAyMDI0IGF0IDM6MTXigK9QTSBZYW5uIEUuIE1P
UklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBPbiAyMDI0LTA2LTAyIDE0
OjUzIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiA+IE9uIFN1biwgSnVu
IDIsIDIwMjQgYXQgMjo0MuKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKWy0tU05JUC0tXQo+ID4gPiA+ICtXaGVuIGEgcGFja2FnZSBzb3VyY2UgdHJl
ZSBjb250YWlucyBhICtDYXJnby5sb2NrKyBmaWxlLCB0aGUgcGFja2FnZSBoYXMKPiA+ID4gPiAr
YmVlbiBfbG9ja2VkXzogY2FyZ28gZGlkIHN0b3JlIHRoZSB2ZXJzaW9ucyBmb3IgdGhlIGNvbXBs
ZXRlIGRlcGVuZGVuY3kKPiA+ID4gPiArY2hhaW4gaW4gdGhlICtDYXJnby5sb2NrKyBmaWxlOyB0
aGF0IGlzIHRoZW4gcmV1c2VkIGJ5IGNhcmdvIGR1cmluZyB0aGUKPiA+ID4gPiArdmVuZG9yaW5n
LCB3aGljaCB5aWVsZHMgYSByZXByb2R1Y2libGUgZGVwZW5kZW5jeSBjaGFpbiwgYW5kIHRodXMg
YQo+ID4gPiA+ICtyZXByb2R1Y2libGUgdGFyYmFsbDsgdGhlcmVmb3JlLCBpdCBpcyBwb3NzaWJs
ZSB0byBjb21wdXRlIGEgaGFzaCBmb3IKPiA+ID4gPiArdGhhdCBhcmNoaXZlLiBJZiBhIHBhY2th
Z2Ugd2FzIGhvd2V2ZXIgbm90IGxvY2tlZCwgdGhlbiB0aGUgdmVyc2lvbnMgZm9yCj4gPiA+ID4g
K3RoZSBkZXBlbmRlbmNpZXMgYXJlIHVua25vd24sIHRoZSBkZXBlbmRlbmN5IGNoYWluIGlzIG5v
dCByZXByb2R1Y2libGUsCj4gPiA+ID4gK2FuZCB0aGUgYXJjaGl2ZSBpcyB0aGVuIG5vdCByZXBy
b2R1Y2libGUsIHdoaWNoIGltcGxpZXMgdGhlcmUgY2FuIGJlIG5vCj4gPiA+ID4gK2hhc2ggZm9y
IHRoYXQgYXJjaGl2ZS4KPiA+ID4gSG1tLCBmb3IgdGhlc2UgY2FzZXMgc2hvdWxkbid0IHdlIGdl
bmVyYXRlIGFuZCBjb21taXQgdGhlIGxvY2tmaWxlIHRvCj4gPiA+IHRoZSBidWlsZHJvb3QgcGFj
a2FnZSBzbyB0aGF0IHdlIGNhbiB0aGVuIGdlbmVyYXRlIGEgZGV0ZXJtaW5pc3RpYyBhcmNoaXZl
Cj4gPiA+IGFuZCBhcmNoaXZlIGhhc2g/ClstLVNOSVAtLV0KPiBZZWFoLCBzb21ldGhpbmcgYWxv
bmcgdGhvc2UgbGluZXMsIG9uZSB0aGluZyB0aGF0IG1pZ2h0IGJlIGEgYml0IHRyaWNreSBpcwo+
IHRoYXQgd2UgcHJvYmFibHkgbmVlZCB0byBpbmNvcnBvcmF0ZSB0aGUgQ2FyZ28ubG9jayBmaWxl
IGhhc2ggb3Igc29tZXRoaW5nCj4gbGlrZSB0aGF0IGluIHRoZSBhcmNoaXZlIG5hbWUsIHNvIHRo
YXQgd2F5IGlmIHRoZSBDYXJnby5sb2NrIGZpbGUgbmVlZHMgdG8gYmUKPiByZWdlbmVyYXRlZCB0
aGUgYXJjaGl2ZSBuYW1lIHdpbGwgYWxzbyBiZSBhcHByb3ByaWF0ZWx5IGNoYW5nZWQgYXQgdGhl
IHNhbWUKPiB0aW1lLgoKSG1tbS4uLiBJbmRlZWQsIHRoaXMgd291bGQgY2F1c2UgcXVpdGUgc29t
ZSBncmllZiBpZiB3ZSB3b3VsZCBjaGFuZ2UgdGhlCkNhcmdvLmxvY2suLi4KCkhvd2V2ZXIsIEkg
ZG9uJ3Qgc2VlIGFuIGVhc3kgc29sdXRpb24gdG8gdGhpcyBpc3N1ZS4uLiA6LS8KCldlbGwsIEkg
ZG8gaGF2ZSBhbiBpZGVhLCBhbmQgaXQgd291bGQgZGVmaW5pdGVseSB3b3JrLCBidXQgaXQgd291
bGQgYmUKKmV4Y2Vzc2l2ZWx5KiB1Z2x5Li4uIEknbGwgdHJ5IHRvIGltcGxlbWVudCBpdCwgYnV0
IGFzIGFuIGFkZGl0aW9uYWwKY2hhbmdlIG9uLXRvcCBvZiB0aGUgZXhpc3Rpbmcgc2VyaWVzLCBi
ZWNhdXNlIEkgYW0gbm90IHN1cmUgaXQgd291bGQgYnIKbWVhbmluZ2Z1bCBpbiB0aGUgZW5kLi4u
IExldCdzIHNlZS4uLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0t
LS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAg
ICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8g
fCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
