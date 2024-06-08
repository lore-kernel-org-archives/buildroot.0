Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78CBC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 08:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A93A8190B;
	Sat,  8 Jun 2024 08:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pj1yWQUvMmnd; Sat,  8 Jun 2024 08:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FA082078
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53FA082078;
	Sat,  8 Jun 2024 08:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5461BF421
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 078054271D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 08:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwHkf8mnmIYI for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 08:49:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 632A842718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 632A842718
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 632A842718
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 08:49:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 11F1413F88E;
 Sat,  8 Jun 2024 10:49:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jun 2024 10:49:41 +0200
Date: Sat, 8 Jun 2024 10:49:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZmQbJSzd1F1sNSKc@landeda>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <8f7f18c9f67543b5e6b534bc0562c4a8a44a73c4.1717779951.git.yann.morin.1998@free.fr>
 <CADvTj4rcjwuSj_A-OQH7UCDu3u1OoUn1qA-dXaeYXJVaYiPOPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rcjwuSj_A-OQH7UCDu3u1OoUn1qA-dXaeYXJVaYiPOPA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717836586;
 bh=h89NZa3UhfJkNO6VwlBlgS8xTpa+wNH2IBUzgX9ee5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LFrd0GlX5PDLIWaI5Jdbl0gNIoO06+uYQMWNFnA86yI/FE+hyOUwNXlAT03rb1eB4
 8lTQWkKWZSeUNGM8VHlZw+WNA6pzzlZTJT5Bj0TQQ3P3gatlKaDZF+tne5hukANfsI
 EcrHDrJc6ToxOr03pt3kFVQrMEImoZLk7Ema64Q/pbGrAClChYZTsOakevWc/w3bva
 Xvld33fax8/7LIxZi9Y6Cu8AtSS5E6cUESCXc0/VGjzSM+yahFLp2x8cfeIfe4gvCv
 73+vB89CjOaNGsp27LpiN12wX8+qd2GUwna2Oy8BrpP+JJnmvkd7Iw9sdQdMYl8UYj
 bljsWqfvM9iow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LFrd0GlX
Subject: Re: [Buildroot] [PATCH 12/20 v2] package/python-bcrypt: use
 post-process opts to pass Cargo manifest path
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

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDYtMDcgMTY6MDQgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBGcmksIEp1biA3LCAyMDI0IGF0IDExOjA24oCvQU0gWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgpbLS1TTklQLS1dCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tYmNyeXB0L3B5dGhvbi1iY3J5cHQubWsgYi9wYWNrYWdl
L3B5dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5tawo+ID4gaW5kZXggZjMxMzc0MDFkNy4uZjA5
YzY3NDQxZSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWJjcnlwdC9weXRob24tYmNy
eXB0Lm1rCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5tawo+
ID4gQEAgLTE5LDkgKzE5LDggQEAgUFlUSE9OX0JDUllQVF9FTlYgPSBcCj4gPiAgICAgICAgIFBZ
TzNfQ1JPU1NfTElCX0RJUj0iJChTVEFHSU5HX0RJUikvdXNyL2xpYi9weXRob24kKFBZVEhPTjNf
VkVSU0lPTl9NQUpPUikiCj4gPiAgIyBXZSBuZWVkIHRvIHZlbmRvciB0aGUgQ2FyZ28gY3JhdGVz
IGF0IGRvd25sb2FkIHRpbWUKPiA+ICBQWVRIT05fQkNSWVBUX0RPV05MT0FEX1BPU1RfUFJPQ0VT
UyA9IGNhcmdvCj4gPiArUFlUSE9OX0JDUllQVF9ET1dOTE9BRF9QT1NUX1BST0NFU1NfT1BUUyA9
IC1tIHNyYy9fYmNyeXB0L0NhcmdvLnRvbWwKPiA+ICBQWVRIT05fQkNSWVBUX0RPV05MT0FEX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcnVzdGMKPiA+IC1QWVRIT05fQkNSWVBUX0RMX0VOViA9IFwKPiA+
IC0gICAgICAgJChQS0dfQ0FSR09fRU5WKSBcCj4gPiAtICAgICAgIEJSX0NBUkdPX01BTklGRVNU
X1BBVEg9c3JjL19iY3J5cHQvQ2FyZ28udG9tbAo+ID4gK1BZVEhPTl9CQ1JZUFRfRExfRU5WID0g
JChQS0dfQ0FSR09fRU5WKQo+IAo+IFRoZXJlJ3MgYSBwZW5kaW5nIHBhdGNoIHdoaWNoIGNvbnZl
cnRzIHRoaXMgcGFja2FnZSB0byB1c2Ugc2V0dXB0b29scy1ydXN0Cj4gaW5mcmFzdHJ1Y3R1cmU6
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDI0MDYwMjIxMzMzMy4yNTk3OTgxLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KClllcCwg
SSd2ZSBhbHJlYWR5IHNlZW4gaXQsIGJ1dCBpdCBpcyBhIGdvb2QgdGVzdC1jYXNlIGZvciBteSBj
aGFuZ2VzIGFzCndlbGwsIHNvIEkgZGlkIG5vdCBpbmNvcnBvcmF0ZSBpdCBpbiBteSBzZXJpZXMu
IFRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAou
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMt
YS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5
LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
