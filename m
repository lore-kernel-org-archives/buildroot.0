Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE23C27C79
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 11:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB39681ECB;
	Sun, 16 Jun 2024 11:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u0JbGk00zQ_N; Sun, 16 Jun 2024 11:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0763820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0763820EF;
	Sun, 16 Jun 2024 11:43:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45D221BF2CF
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32CF34041C
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 11:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOuj4W92MGd6 for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 11:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7449400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7449400DA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7449400DA
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 11:43:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AC4C613F8A2;
 Sun, 16 Jun 2024 13:43:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 13:43:24 +0200
Date: Sun, 16 Jun 2024 13:43:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <Zm7P3Jb5MihTI4wl@landeda>
References: <20240613113924.3778837-1-yegorslists@googlemail.com>
 <CAGm1_ktpb1JiBSBjNNoZDgS8iJZyYrO28nGzcER9BnFe0dDYew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ktpb1JiBSBjNNoZDgS8iJZyYrO28nGzcER9BnFe0dDYew@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718538206;
 bh=lz1NZn5ClKC4wH/sBMHBAFLie0a6CTt05fxV3iODqdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R79RhBnl2Il+BaF1/RGoeDRDKArzTpfOmOpkPNqQlLiV4rzDfPlXHRmWaUUnZRVLJ
 1yrw6rYyqZ+5IUzLdS0+zYZ09CGxVjnAl16UqDdPZXPzwRgNQV46YTHdbuVrgWfpBF
 rZlz2iRWzdnal9da1Jb10KX8NkX237Twevalcgk/+By6tzo7do66M5HqFoB1roldCV
 ed0bz0kyJFYSkoF+NQ0Sg1W5f5DGrB5Zx8uwtoT3hT3cDFTRWlmFZj0WVVCX1Tv+PL
 gdXBSUF36yY+wLeZH+xYaa25qDedDBqZQeiCW/DDOe5h7z2pVTTVKGuHMo/biKLJnZ
 IDBXqglSDy6Vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R79RhBnl
Subject: Re: [Buildroot] [PATCH] package/ncftp: fix GCC 14.x related build
 errors
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

WWVnb3IsIEFsbCwKCk9uIDIwMjQtMDYtMTMgMTM6NTEgKzAyMDAsIFllZ29yIFllZnJlbW92IHNw
YWtlIHRodXNseToKWy0tU05JUC0tXQo+IEJ1dCB0aGUgdGhpcmQgcHJvYmxlbSByZW1haW5zIGFu
ZCBJIGRvbid0IGtub3cgaG93IHRvIGZpeCB0aGlzOgo+IAo+IHNwb29sdXRpbC5jOiBJbiBmdW5j
dGlvbiDigJhXcml0ZVNwb29sRW50cnnigJk6Cj4gc3Bvb2x1dGlsLmM6Mjg2OjM4OiBlcnJvcjog
cGFzc2luZyBhcmd1bWVudCAyIG9mIOKAmGxzdGF04oCZIGZyb20KPiBpbmNvbXBhdGlibGUgcG9p
bnRlciB0eXBlIFstV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ICAgMjg2IHwgICAgICAg
ICAgICAgICAgIGlmIChsc3RhdChscGF0aG5hbWUsICZzdCkgPT0gMCkgewo+ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc3RhdDY0ICoKPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20KPiAvaG9tZS91c2VyL2J1aWxkcm9vdC9ic3AtYmFyZWJveC9wZXItcGFja2FnZS9uY2Z0cC9o
b3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvZmVh
dHVyZXMuaDo1MDMsCj4gICAgICAgICAgICAgICAgICBmcm9tCj4gL2hvbWUvdXNlci9idWlsZHJv
b3QvYnNwLWJhcmVib3gvcGVyLXBhY2thZ2UvbmNmdHAvaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4
LWdudWVhYmloZi9zeXNyb290L3Vzci9pbmNsdWRlL3VuaXN0ZC5oOjI1LAo+ICAgICAgICAgICAg
ICAgICAgZnJvbSBzeXNoZHJzLmg6MTQzLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBzcG9vbHV0
aWwuYzo4Ogo+IC9ob21lL3VzZXIvYnVpbGRyb290L2JzcC1iYXJlYm94L3Blci1wYWNrYWdlL25j
ZnRwL2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3IvaW5jbHVk
ZS9zeXMvc3RhdC5oOjMyNzoxMjoKPiBub3RlOiBleHBlY3RlZCDigJhzdHJ1Y3Qgc3RhdCAqIHJl
c3RyaWN04oCZIGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlCj4g4oCYc3RydWN0IHN0YXQ2NCAq4oCZ
Cj4gICAzMjcgfCBleHRlcm4gaW50IF9fUkVESVJFQ1RfTlRIIChsc3RhdCwKPiAgICAgICB8ICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPiAKPiBUaGUgdG9vbGNoYWluIHdhcyBidWlsdCB2aWEg
QlIgZm9yIGFybXY3IGFuZCBnbGliYy4gQW55IGlkZWFzPyBXaHkKPiBzaG91bGQgb25lIHVzZSBz
dHJ1Y3Qgc3RhdDY0IGRpcmVjdGx5PwoKSXQgbG9va3MgbGlrZSBhIGxpdHRsZSBiaXQgb2YgbWFn
aWMgdG8gbWUsIGJ1dCB3aGF0IEkgdGFrZSBmcm9tIHRoZQpfX1JFRElSRUNUX05USCBtYWNybywg
aXMgdGhhdCBpdCBpbnN0cnVjdHMgdGhlIGNvbXBpbGVyIChhbmQgbGlua2VyKSB0bwpyZWFsbHkg
cmVkaXJlY3QgY2FsbHMgdG8gbHN0YXQoKSB0byBsc3RhdDY0KCkgaW5zdGVhZCAoTlRIKSBtZWFu
cyBubwp0aHJvdywgd2hpY2ggaXMgY29tcGxldGVseSBzb21ldGhpbmcgZWxzZSBhbmQgb2Ygbm8g
Y29uZXJuIGhlcmUgSQp0aGluaykuCgpTbywgaXQgaXMgYWdhaW4gYSBtaXNmaXQgYmV0d2VlbiAz
Mi1iaXQgZnVuY3Rpb25zIGFuZCA2NC1iaXQgc3RydWN0dXJlCihvciB0aGUgb3RoZXIgd2F5IGFy
b3VuZCkuCgpJJ3ZiZSBsb29rZWQgYXQgdGhlIGdsaWJjIHNvdXJjZSwgYW5kIGJhc2ljYWxseSBo
ZXJlIGlzIHdoYXQgaXQgZG9lcyBpbgpiaXRzL3N0cnVjdF9zdGF0Lmg6CgogICAgc3RydWN0IHN0
YXQgewogICAgI2lmZGVmIF9fVVNFX1RJTUVfQklUUzY0CiAgICAjIGluY2x1ZGUgPGJpdHMvc3Ry
dWN0X3N0YXRfdGltZTY0X2hlbHBlci5oPgogICAgI2Vsc2UKICAgIC8qIGRlZmluZXMgc3RhdCBm
aWVsZHMgaGVyZSAuLi4qLwogICAgI2VuZGlmCiAgICB9OwoKICAgICNpZmRlZiBfX1VTRV9MQVJH
RUZJTEU2NAogICAgc3RydWN0IHN0YXQ2NHsKICAgICNpZmRlZiBfX1VTRV9USU1FX0JJVFM2NAog
ICAgIyBpbmNsdWRlIDxiaXRzL3N0cnVjdF9zdGF0X3RpbWU2NF9oZWxwZXIuaD4KICAgICNlbHNl
CiAgICAvKiBkZWZpbmVzIHN0YXQ2NCBmaWVsZHMgaGVyZSAuLi4qLwogICAgI2VuZGlmCiAgICB9
OwogICAgI2VuZGlmCgpTbywgYmFzaWNhbGx5OgoKICAtIGZvciA2NC1iaXQgdGltZSwgYm90aCBz
dHJ1Y3RzIGFyZSBleGFjdGx5IHRoZSBzYW1lLgoKICAtIGZvciAzMi1iaXQgdGltZSwgdGhleSBk
byBkaWZmZXIsIGJ1dCB0aGUgQyBsaWJyYXJ5IHNob3VsZCBkbyBpdHMKICAgIG1hZ2ljOgoKICAg
ICQgbWFuIGxzdGF0CgogICAgQyBsaWJyYXJ5L2tlcm5lbCBkaWZmZXJlbmNlcwogICAgICAgIE92
ZXIgIHRpbWUsICBpbmNyZWFzZXMgaW4gdGhlIHNpemUgb2YgdGhlIHN0YXQgc3RydWN0dXJlIGhh
dmUgbGVkCiAgICAgICAgdG8gdGhyZWUgc3VjY2Vzc2l2ZSB2ZXJzaW9ucyBvZiBzdGF0KCkgWy4u
Ll0KCiAgICAgICAgVGhlICBrZXJuZWwtaW50ZXJuYWwgIHZlcnNpb25zICBvZiB0aGUgc3RhdCBz
dHJ1Y3R1cmUgZGVhbHQgd2l0aAogICAgICAgIGJ5IHRoZSBkaWZmZXJlbnQgdmVyc2lvbnMgYXJl
LCByZXNwZWN0aXZlbHk6CgogICAgICAgIF9fb2xkX2tlcm5lbF9zdGF0IFsuLi5dCiAgICAgICAg
c3RhdCBbLi4uXQogICAgICAgIHN0YXQ2NCBbLi4uXQoKICAgICAgICBUaGUgZ2xpYmMgc3RhdCgp
IHdyYXBwZXIgZnVuY3Rpb24gaGlkZXMgdGhlc2UgZGV0YWlscyBmcm9tCiAgICAgICAgYXBwbGlj
YXRpb25zLCBpbnZva2luZyB0aGUgbW9zdCByZWNlbnQgdmVyc2lvbiBvZiB0aGUgc3lzdGVtIGNh
bGwKICAgICAgICBwcm92aWRlZCBieSB0aGUga2VybmVsLCBhbmQgcmVwYWNraW5nIHRoZSByZXR1
cm5lZCBpbuKAkCBmb3JtYXRpb24KICAgICAgICBpZiByZXF1aXJlZCBmb3Igb2xkIGJpbmFyaWVz
LgoKV2l0aCBteSBsaW1pdGVkIHVuZGVyc3RhbmRpbmc6ICJpdCBzaG91bGQgYmUgZmluZSEiLgoK
U28geWVzLCBjYWxscyB0byBsc3RhdCgpIHNob3VsZCB1c2Ugc3RydWN0IHN0YXQuIE9yIGFuIGV4
cGxpY2l0IGNhbGwgdG8KbHN0YXQ2NCgpIHNob3VsZCBiZSBtYWRlLCBtYXliZT8KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
