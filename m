Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB0EC61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ACB5408D2;
	Tue,  1 Sep 2026 21:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm7ZBlOY1uUa; Tue,  1 Sep 2026 21:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788298474;
	bh=NsXh8cD1Fj5X8JA8H65pm/eO0i4yztztimqU3ZhdBYU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T8yyLP8a91Yq9SdJ6yKzkLSvtdq5yF5rgHfkXz6l1sshD4trS3rR+LnUTDxLiUojA
	 1lhfjtYN7IgM+Tqh9mXh+mXXUl+Y4q7Bo71m/HIe8Cb9U4QcqBE1FAH6CkUaGVEip3
	 cPACQHkCFehoyNVEB+oHHT4+uMs7Vr6ijUP+1sTWpWgtyQHwJY1cBWABmBt7+aAI2Z
	 W9pDJ+pYiGvXHcPpi1DRZWzJx28MfrIr9WY1vl58jVLyLJ7Vhp46476QkaJxuIAMHq
	 ksEjeSF/zros0FYzfvDYiMwFH6PQAJZpGnqz1ixf1UmS0+P0P67HnXusXXPCL568OW
	 DLvcCStkGqcmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FBC407EC;
	Tue,  1 Sep 2026 21:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1550B105
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC1F80E84
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeB9CCwks17i for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0968680E79
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:34:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4ADF81A191B;
 Tue,  1 Sep 2026 21:34:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1414F6053C;
 Tue,  1 Sep 2026 21:34:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9C8FE11C7923D; 
 Tue,  1 Sep 2026 23:34:24 +0200 (CEST)
Date: Tue, 1 Sep 2026 23:34:23 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <apdEDDiiXaZWfMe-@windsurf>
References: <20260815154120.22488-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260815154120.22488-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/atop: fix implicit waddwstr
 declaration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBTYXQsIEF1ZyAxNSwgMjAyNiBhdCAwOToxMToxOVBNICswNTMwLCBTaHViaGFt
IENoYWtyYWJvcnR5IHdyb3RlOgo+IGF0b3AgdXNlcyB3aWRlLWNoYXJhY3RlciBuY3Vyc2VzIGZ1
bmN0aW9ucyBzdWNoIGFzIGB3YWRkd3N0cmAgKGUuZy4sIGluCj4gZHJhd2Jhci5jKS4gRm9yIGA8
Y3Vyc2VzLmg+YCB0byBleHBvc2UgdGhlIHByb3RvdHlwZXMgZm9yIHRoZXNlIHdpZGUtY2hhcmFj
dGVyCj4gZnVuY3Rpb25zLCB0aGUgYF9YT1BFTl9TT1VSQ0VfRVhURU5ERURgIG1hY3JvIG11c3Qg
YmUgZGVmaW5lZCBiZWZvcmUgdGhlCj4gaGVhZGVyIGlzIGluY2x1ZGVkLgo+IFdpdGhvdXQgdGhl
c2UgbWFjcm9zIGRlZmluZWQsIHRoZSBwcmVwcm9jZXNzb3Igc2tpcHMgdGhlIGZ1bmN0aW9uIHBy
b3RvdHlwZXMuCj4gCj4gZHJhd2Jhci5jOjIzMzY6MzM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiAnd2FkZHdzdHInCj4gCj4gVGhpcyBjb21taXQgZml4ZXMgdGhlIGJ1
aWxkIGZhaWx1cmUgYnkgYWRkaW5nIGAtRF9YT1BFTl9TT1VSQ0VfRVhURU5ERURgCj4gYW5kIGAt
RE5DVVJTRVNfV0lERUNIQVJgIHRvIGBBVE9QX0NGTEFHU2AsIGVuc3VyaW5nIHRoZSBuY3Vyc2Vz
IGhlYWRlcnMKPiBjb3JyZWN0bHkgZXhwb3NlIHRoZSByZXF1aXJlZCB3aWRlLWNoYXJhY3RlciBw
cm90b3R5cGVzLgo+IAo+IEZpeGVzIDoKPiAgLSBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvYjkxL2I5MWVhMDcyMjIwMmRlMGQxZmRlZWFlZWExNjdmZDFiMjFiNmQ1ZDYK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTaHViaGFtIENoYWtyYWJvcnR5IDxjaGFrcmFib3J0eXNodWJo
YW02NkBnbWFpbC5jb20+CgpUaGlzIGlzIGxhY2tpbmcgdGhlIHVzdWFsIGluZm9ybWF0aW9uIG9m
IHNpbmNlIHdoZW4gaXQgaXMKaGFwcGVuaW5nLiBXYXMgaXQgd29ya2luZyBiZWZvcmU/IFllcy9u
bz8gSWYgaXQgdXNlZCB0byB3b3JrIGFuZCBub3cKaXQgYnJlYWtzLCB3aHk/CgpCYXNlZCBvbiBo
dHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249YXRvcC0lMjUgaXQgc2VlbXMK
bGlrZSB1cCB0byB0aGUgYnVtcCB0byB2ZXJzaW9uIDIuMTMuMCB3ZSBoYWQgYm90aCBhIHVjbGli
YyBidWlsZApmYWlsdXJlOgoKL2hvbWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0YW5jZS0xL291dHB1
dC0xL2hvc3QvaTY4Ni1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2luY2x1ZGUv
ZmVhdHVyZXMuaDoxNjc6MjI6IGVycm9yOiBvcGVyYXRvciAnPCcgaGFzIG5vIGxlZnQgb3BlcmFu
ZAogIDE2NyB8ICMgaWYgX1BPU0lYX0NfU09VUkNFIDwgMjAwODA5TAoKYW5kIGEgbXVzbCBidWls
ZCBmYWlsdXJlOgoKCmRyYXdiYXIuYzoyMzM2OjMzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24gJ3dhZGR3c3RyJzsgZGlkIHlvdSBtZWFuICd3YWRkc3RyJz8gWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAyMzM2IHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB3YWRkd3N0cih3LT53aW4sIEwiw6LigJ3GkiIpOwogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHdhZGRzdHIKCmJ1dCBub3cgd2l0aCB0aGUgdmVyc2lvbiBidW1wIHRo
aXMgaXNzdWUgb25seSBoYXBwZW5zIHdpdGggbXVzbC4gU28Kd2h5IGRvZXMgaXQgb25seSBoYXBw
ZW4gd2l0aCBtdXNsPyBZb3VyIGFuYWx5c2lzIHBvaW50cyB0byBhIHByb2JsZW0KdGhhdCB3b3Vs
ZCBzZWVtIHRvIGJlIGluZGVwZW5kZW50IG9mIHRoZSBDIGxpYnJhcnksIGJ1dCBpdCBhcHBhcmVu
dGx5Cmlzbid0LgoKU28gYWdhaW4sIEkgZG9uJ3QgZG91YnQgdGhhdCB5b3VyIHBhdGNoIGZpeGVz
IHRoZSBidWlsZCBpc3N1ZSwgYnV0IHRoZQpleHBsYW5hdGlvbiBpcyBub3QgY29udmluY2luZyBl
bm91Z2ggdGhhdCB3aGF0IHlvdSdyZSBwcm9wb3NpbmcgaXMgdGhlCnJpZ2h0IHNvbHV0aW9uLiBJ
bmRlZWQgeW91ciBleHBsYW5hdGlvbiBzYXlzIHRoYXQgdGhvc2UgZGVmaW5lcyBhcmUKQUxXQVlT
IG5lZWRlZCB0byBhY2Nlc3Mgd2FkZHdzdHIsIGJ1dCB0aGUgc2ltcGxlIGZhY3QgdGhhdCB0aGUg
cGFja2FnZQpzZWVtcyB0byBidWlsZCBmaW5lIHdpdGggZ2xpYmMgYW5kIHVjbGliYyBwcm92ZXMg
dGhhdCB0aGlzIGFmZmlybWF0aW9uCmlzIGluY29ycmVjdC4KCkNvdWxkIHlvdSBkbyBtb3JlIHJl
c2VhcmNoIG9uIHRoaXM/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
