Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ABCC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 09:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FC45401CA;
	Fri, 31 May 2024 09:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id by31CuJkcFH5; Fri, 31 May 2024 09:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44B60403A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44B60403A9;
	Fri, 31 May 2024 09:35:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A04F1D4FF2
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83F2C403A9
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 09:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5zhnqmzgpR2 for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 09:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3631F401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3631F401CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3631F401CA
 for <buildroot@buildroot.org>; Fri, 31 May 2024 09:35:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 520CA13F8AE;
 Fri, 31 May 2024 11:35:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 11:35:50 +0200
Date: Fri, 31 May 2024 11:35:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZlmZ9uQdSgv36LaK@landeda>
References: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240530-s6-update-v1-1-8088e16a1cf4@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717148152;
 bh=Ua250HsV83wUn3zx/DDZnBtR9co2YngycjWq7dH+h3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AMoHDiVGKVND7/jISugjLSRAQW9bSDEFyR2iKvRtV2RumtOGrvSspOUJe/EWbGikI
 iPC5ZN4P3XhRwG2dU1y21byh9VjggGnJjA28+ip3cR29T+5IFMicig4qdig15uV8MJ
 BxTUNV4nJr9MGtgHs+BFlc+nPnrYkAfWZDM6Eub7n9UvNfmQiSQExOsMjOZiIckRQX
 oL8FcyovPzxq0QXQ+9wZefs5LtcX53R79EjV3qWgfBudzWdWX+lKV6kIAR7YYsybY0
 7fEXNWkNzmcYim/dFvWqu+Ca/VILbReKws/0rcwzui3kEuW01uBOBuP0AyzsLtRf+H
 L5F2fWOMB9big==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AMoHDiVG
Subject: Re: [Buildroot] [PATCH] {skalibs, execline, mdevd, s6, s6-{rc,
 linux-init, {linux, portable}-utils, networking}}: bump
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

Si4sIEFsbCwKClRoYW5rcyBmb3IgdGhpcyBwYXRjaC4KCk9uIDIwMjQtMDUtMzAgMjI6MzIgKzAy
MDAsIEouIE5ldXNjaMOkZmVyIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IFVwZGF0ZSBh
bGwgc2thcm5ldC5vcmcgcGFja2FnZXMgdG8gdGhlaXIgY3VycmVudCB1cHN0cmVhbSB2ZXJzaW9u
Lgo+IAo+IGRpZmYgQ09QWUlORyAoc2xpZ2h0bHkgZGlmZmVyZW50IGJldHdlZW4gcGFja2FnZXMp
Ogo+IC1Db3B5cmlnaHQgKGMpIDIwMTEtMjAyMiBMYXVyZW50IEJlcmNvdCA8c2thLXNrYXdhcmVA
c2thcm5ldC5vcmc+Cj4gK0NvcHlyaWdodCAoYykgMjAxMS0yMDI0IExhdXJlbnQgQmVyY290IDxz
a2Etc2thd2FyZUBza2FybmV0Lm9yZz4KCkluIGEgY29tbWl0IGxvZywgd2Ugd2FudCBodW1hbi1y
ZWFkYWJsZSBleHBsYW5hbHRpb25zLCBub3QgYQoocHNldWRvLSlkaWZmOyBzbyBqdXN0IHN0YXRl
IHNvbWV0aGluZyBsaWtlOgogICAgVXBkYXRlIGhhc2hlcyBvZiBsaWNlbnNlIGZpbGVzIGZvciBh
biB1cGRhdGUgaW4gY29weXJpZ2h0IHllYXJzLgoKPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jD
pGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0Pgo+IC0tLQo+IFRoaXMgcGF0Y2goc2V0KSB1cGRh
dGVzIHRoZSBwYWNrYWdlcyBmcm9tIHNrYXJuZXQub3JnLiBJdCBpcyBvbmUgY29tbWl0Cj4gdG8g
YXZvaWQgYnVpbGQgZmFpbHVyZXMgZHVlIHRvIGluY29tcGF0aWJsZSB2ZXJzaW9uczoKClRoYW5r
cyBmb3IgdGhlIGV4cGxhbmF0aW9ucy4gSXQgc2hvdWxkIGJlIGluIHRoZSBjb21taXQgbG9nLCBz
byB0aGF0CndoZW4gd2UgZWVmZXIgdG8gdGhhdCBjb21taXQgaW4gdGhlIGZ1dHVyZSwgd2UgaW1t
ZWRpYXRlbHkgdW5kZXJzdGFuZAp3aHkgdGhleSB3ZXJlIGFsbCBidW1wZWQgdG9nZXRoZXIuCgo+
IEZvciBleGFtcGxlLCB3aGVuCj4gSSBvbmx5IHVwZGF0ZSBza2FsaWJzIHRvIDIuMTQuMS4xIGFu
ZCBsZWF2ZSB0aGUgcmVzdCBhcyBpcywgZXhlY2xpbmUKPiBmYWlscyB0byBidWlsZC4KCklzIGl0
IHBvc3NpYmxlIHRvIGRvIHRoZSByZXZlcnNlOiBidW1wIHNrYWxpYnMgbGFzdD8gSS5lLiB3b3Vs
ZCB0aGUKbmV3ZXIgZXhlY2xpbmUgKGFuZCBvdGhlciBwYWNrYWdlcykgc3RpbGwgYnVpbGQgYW5k
IHJ1biBPSyB3aXRoIHRoZQpjdXJyZW50IHNrYWxpYnMgdmVyc2lvbiwgb3IgYXJlIHRoZXkgcmVh
bGx5IHNvIHRpZ2h0bHkgY291cGxlZD8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
