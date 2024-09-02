Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0FACA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12D3640643;
	Mon,  2 Sep 2024 15:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDkonT-fjXWE; Mon,  2 Sep 2024 15:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E8840352
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E8840352;
	Mon,  2 Sep 2024 15:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD1C51BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA75E40352
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjIg-X0tQmxX for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5696D40253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5696D40253
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5696D40253
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:52:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A448813F8B3;
 Mon,  2 Sep 2024 17:52:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:52:23 +0200
Date: Mon, 2 Sep 2024 17:52:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZtXfN38rAtArMhPG@landeda>
References: <20240901-aer-v2-1-2080780f907d@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240901-aer-v2-1-2080780f907d@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725292345;
 bh=YCUQFnyqV8w7vFmCgTe7YEU90Lhu++vw3+ZHi5KCUK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SRpp3tYkml6RIDmmKvKA9B7ZKCUQo5zb45FUaI3uvgmrC40ZLYHZtJT1xuy1ZkYcL
 PzWRTbKOiaBnNW8/Xfz3mWpPDk7B8NHAVvG75gAXS8N3DyON535AhpvyFPaYkqEYlq
 gCcSCf/f7uq1X3JzVA8Bt6QpHKkwTqeYyhTHrMypfgnmCfaFcwDpiQvb7eFBBnUwns
 U7C9W+z6h1uU5XqRVw4u1jXTt5QCkFujM6N55CtYs/hZde6Y9bQViYzykaOmkelsUD
 Rc5oGJu4yzTtWFFC+bD6irPchCBHm11gQDIo4NS1mDh+ZmNkwfaARJckiclU4Fy4eH
 L3rmrz6BLnnFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SRpp3tYk
Subject: Re: [Buildroot] [PATCH v2] package/aer-inject: switch upstream
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

Si4sIEFsbCwKCk9uIDIwMjQtMDktMDEgMTg6NDAgKzAyMDAsIEouIE5ldXNjaMOkZmVyIHZpYSBi
dWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEFjY29yZGluZyB0byBhIGNvbW1pdCBpbiBMaW51eFsx
XSwgdGhlIHVwc3RyZWFtIG9mIGFlci1pbmplY3QgY2hhbmdlZCB0bwo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC9hZXItaW5qZWN0Lgo+IAo+IFsxXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9s
aW51cy9hMjllNTI5MGUzNTY2YWU0ZGI0ZTZmZTVmMzFjYWYyMzExOGM4MmI2Cj4gCj4gU2lnbmVk
LW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBLZWVwIFNJVEVf
TUVUSE9EIHRoZSBnYW1lIChnaXQpCj4gLSBGaXggUy1vLWIgbGluZQo+IC0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDkwMS1hZXItdjEtMS0wM2IxMjRjYjY0YjFA
Z214Lm5ldAoKVGhhbmtzLCBJIGxpa2UgaXQgaG93IHlvdSBhZGRlZCB0aGUgbGluayB0byB2MS4g
8J+RjQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvYWVyLWluamVj
dC9hZXItaW5qZWN0Lm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hZXItaW5qZWN0L2Flci1p
bmplY3QubWsgYi9wYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5tawo+IGluZGV4IDZiYzlj
YjQ0ZGEuLjc1MTZlZjYzYWMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9hZXItaW5qZWN0L2Flci1p
bmplY3QubWsKPiArKysgYi9wYWNrYWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5tawo+IEBAIC01
LDcgKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+IAo+ICBBRVJfSU5KRUNUX1ZF
UlNJT04gPSA5YmQ1ZTJjNzg4NmZjYTcyZjEzOWNkODQwMjQ4OGEyMjM1OTU3ZDQxCj4gLUFFUl9J
TkpFQ1RfU0lURSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2dvbmcuY2hlbi9hZXItaW5qZWN0LmdpdAo+ICtBRVJfSU5KRUNUX1NJVEUgPSBodHRwczov
L2dpdGh1Yi5jb20vaW50ZWwvYWVyLWluamVjdC5naXQKPiAgQUVSX0lOSkVDVF9TSVRFX01FVEhP
RCA9IGdpdAo+ICBBRVJfSU5KRUNUX0xJQ0VOU0UgPSBHUEwtMi4wCj4gIEFFUl9JTkpFQ1RfTElD
RU5TRV9GSUxFUyA9IFJFQURNRQo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiAzNzgwMTc2N2Y2OGMw
NTUwMGYxZDQ0OTViNWJhYWMwZTczNDBmN2E5Cj4gY2hhbmdlLWlkOiAyMDI0MDkwMS1hZXItZGMy
MzVjZjhlNDgzCj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gSi4gTmV1c2Now6RmZXIgPGoubmV1
c2NoYWVmZXJAZ214Lm5ldD4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
