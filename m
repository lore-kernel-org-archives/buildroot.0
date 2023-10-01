Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42C6E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 11:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2F141684;
	Sun,  1 Oct 2023 11:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2F141684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1YUSIXyCUimV; Sun,  1 Oct 2023 11:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A1241725;
	Sun,  1 Oct 2023 11:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A1241725
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75C671BF27A
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 11:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D90361004
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 11:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D90361004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FESizEs_0sKf for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 11:40:02 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C94660A92
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 11:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C94660A92
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5E0AA3520D2A; Sun,  1 Oct 2023 13:39:58 +0200 (CEST)
Date: Sun, 1 Oct 2023 13:39:58 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZRlajuI6BnIemOoO@waldemar-brodkorb.de>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
 <20221217051337.3778405-5-Mr.Bossman075@gmail.com>
 <603887d9-3c48-b7de-3e5d-a472e6c08ed2@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <603887d9-3c48-b7de-3e5d-a472e6c08ed2@smile.fr>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1696160398; bh=uSIYHVYVoBGheQ8lbJ5VKpSXC9c03Riz3VBNCInAkZo=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=geqX7wH/r7VL9XnCsQMqFmhCK2zsXsHuHfiDi+plnnBCaWcffxRoXLlWUQO1wEwIy
 7ay/YTKCd/8f/G7PL/h/56e4bqvNWOJAZSVClnUzvVE9o9TPo6db+xEBqf4DIJv2M1
 2UoWqFaijCQP5eICW6vbFB+4EnoI7mqtXpDoNletMOlgvv7nKVKCCYVnWnYn8h1S30
 bgJEYhVKqI5qbLbNthBk4rXWqXYckR2KY4UpfUt14K2nN1FYg78D3xXAisCZRKXBsJ
 xepwwnBmjDshsme0uaC+LptcvkTRWCo3RdroNNVtTAkxNxD6ot+Eud1LOgRS/dlaV4
 Uayz1w+88+XVg==
Subject: Re: [Buildroot] [PATCH v2 4/4]
 configs/qemu_riscv32_nommu_virt_defconfig: New defconfig
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
Reply-To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <mr.bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKUm9tYWluIE5hb3VyIHdyb3RlLAoKPiBIZWxsbywKPiAKPiBMZSAxNy8xMi8y
MDIyIMOgIDA2OjEzLCBKZXNzZSBUYXViZSBhIMOpY3JpdMKgOgo+ID4gQWRkIFJJU0MtViAzMi1i
aXQgbm9tbXUgZGVmY29uZmlnIGZvciBRRU1VIHZpcnQgbWFjaGluZSB3aXRoIE1NVQo+ID4gZGlz
YWJsZWQuCj4gPiAKPiA+IFVubGlrZSBxZW11X3Jpc2N2MzJfdmlydCwgcWVtdV9yaXNjdjMyX25v
bW11X3ZpcnQgZG9lcyBub3QgdXNlIE9wZW5TQkksCj4gPiBzaW5jZSB0aGUga2VybmVsIGlzIHJ1
bm5pbmcgaW4gbWFjaGluZSBtb2RlIChNLW1vZGUpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
ZXNzZSBUYXViZSA8TXIuQm9zc21hbjA3NUBnbWFpbC5jb20+Cj4gPiBDYzogWWltaW4gR3UgPHVz
dGN5bWd1QGdtYWlsLmNvbT4KPiAKPiBJIHJlYmFzZWQgdGhlIGVsZjJmbHQgcGF0Y2ggZm9yIHJp
c2MzMiBbMV0gb24gdG9wIG9mIGVsZjJmbHQgMjAyMy4wOSByZWxlYXNlLAo+IHRoZW4gSSBlbmFi
bGVkIHRoZSByaXNjMzIgdWNsaWJjLW5nIHN1cHBvcnQgWzJdIHdpdGhvdXQgcGF0Y2hpbmcgaXQg
c2luY2Ugd2UgdXNlCj4gdGhlIGxhdGVzdCByZWxlYXNlICh2MS4wLjQ0KSBjb250YWluaW5nIHRo
aXMgY29tbWl0IFszXS4KPiAKPiBCdXQgdGhlIHN5c3RlbSBkb2Vzbid0IGJvb3QgZHVlIHRvIGEg
cmVsb2MgaXNzdWU6Cj4gCj4gYmluZm10X2ZsYXQ6IHJlbG9jIG91dHNpZGUgcHJvZ3JhbSAweGZm
ZjdiNmRjICgwIC0gMHg5Y2VjMC8weDhhMTgwKSwga2lsbGluZyBzaCEKPiBTdGFydGluZyBpbml0
OiAvYmluL3NoIGV4aXN0cyBidXQgY291bGRuJ3QgZXhlY3V0ZSBpdCAoZXJyb3IgLTgpCj4gCj4g
VGhpcyBpc3N1ZSBtYXkgYmUgcmVsYXRlZCB0byB0aGUgdG9vbGNoYWluIHVzZWQgdG8gYnVpbGQg
dGhpcyBkZWZjb25maWcgKGdjYwo+IDEyLjMuMCBhbmQgYmludXRpbHMgMi40MCkgdGhhdCBpcyBu
ZXdlciB0aGFuIHRoZSB0b29sY2hhaW4gdXNlZCBhdCB0aGUgdGltZSB0aGlzCj4gc2VyaWVzIHdh
cyB0ZXN0ZWQuCgpDYW4geW91IHNoYXJlIHlvdXIgZWxmMmZsdCBwYXRjaCwgcGxlYXNlLiAKCmJl
c3QgcmVnYXJkcwogV2FsZGVtYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
