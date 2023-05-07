Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F233C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 14:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C77A418A7;
	Sun,  7 May 2023 14:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C77A418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AswmSbBA1-0; Sun,  7 May 2023 14:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A92F4187B;
	Sun,  7 May 2023 14:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A92F4187B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA581BF2F8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2826F4056E
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2826F4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mo0lx4IILIm for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 14:41:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE674400CF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE674400CF
 for <buildroot@buildroot.org>; Sun,  7 May 2023 14:41:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 020E919F74C;
 Sun,  7 May 2023 16:41:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 16:41:49 +0200
Date: Sun, 7 May 2023 16:41:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <20230507144149.GX252090@scaer>
References: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
 <20230507124056.GO252090@scaer> <ZFey+o0AMgSGDnba@probook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZFey+o0AMgSGDnba@probook>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683470513;
 bh=SAlB6Lvy8tVd61JSmtm9QiMCXYeQ8hJYdKhCPhRZS4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RlkhljxJJ1bmAStdLNkb447yLMAkjqMgjOUzYXQoz2HdbvwKHc3bp6AGEifBAD/lh
 4rKktcRssxygKv4EkJ0aFPOr1rxVLUdtdvHS1qH3xpUE4/nq9MnB0JKGUchTZrVyh5
 TRfgwvRTR2Wus0ni32M6c7d+iMOZDZcMci+B1mlk5GCo7CDaPMzYw3xTRtGt3tvmFR
 bz2AR+cmBbZu7ar/x2TuaI1muA/+ETIWZWlV2RaXhO9eItBl3IKDTPPA8WNBarniLA
 Azru7hieFZQLeGVoJIqX0TJh85GAa/Ye1gfHdgtSfk2ej3KXW9jRxcPwYnDdGA178H
 87mHQ2nyAt9Cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RlkhljxJ
Subject: Re: [Buildroot] [PATCH] package/micropython: pass $TARGET_LDFLAGS
 to build
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9uYXRoYW4sIEFsbCwKCk9uIDIwMjMtMDUtMDcgMTY6MTcgKzAyMDAsIEpvbmF0aGFuIE5ldXNj
aMOkZmVyIHNwYWtlIHRodXNseToKPiBPbiBTdW4sIE1heSAwNywgMjAyMyBhdCAwMjo0MDo1NlBN
ICswMjAwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+ID4gSm9uYXRoYW4sIEFsbCwKPiA+IE9uIDIw
MjMtMDQtMjkgMTQ6NDcgKzAyMDAsIEpvbmF0aGFuIE5ldXNjaMOkZmVyIHNwYWtlIHRodXNseToK
PiA+ID4gTERGTEFHUyBuZWVkIHRvIGJlIHBhc3NlZCB0byB0aGUgbWljcm9weXRob24gYnVpbGQg
c3lzdGVtIHZpYSB0aGUKPiA+ID4gTERGTEFHU19FWFRSQSB2YXJpYWJsZSwgd2hpY2ggd2FzIHNv
IGZhciBtaXNzaW5nLiBUaGlzIHBhdGNoIGFkZHMgaXQuCj4gPiBJcyB0aGlzIGZpeGluZyBhbiBh
Y3R1YWwgaXNzdWUsIG9yIGRpZCB5b3UganVzdCBoYXBwZW4gdG8gbm90aWNlIGJ5Cj4gPiBjaGFu
Y2U/Cj4gSXQgZml4ZXMgdGhlIGlzc3VlIHRoYXQgZ2xvYmFsIGxpbmtlciBmbGFncyAoc3VjaCBh
cyBmcm9tCj4gQlIyX1RBUkdFVF9MREZMQUdTKSBhcmUgbm90IGFwcGxpZWQgdG8gdGhlIG1pY3Jv
cHl0aG9uIGJ1aWxkLgo+IEV4dHJhIExERkxBR1MgYXJlIG5vdCBuZWNlc3NhcnkgbW9zdCBvZiB0
aGUgdGltZSwgYnV0IEkgd2FzIHVzaW5nCj4gQlIyX1RBUkdFVF9MREZMQUdTPSIteiB0ZXh0IiB0
byBjaGVjayBmb3IgdGV4dHJlbHMsIGJlY2F1c2UgbWljcm9weXRob24KPiBwcm9kdWNlcyBvbmVb
MV0gYW5kIGl0IGNhdXNlcyBhIGNyYXNoIHdpdGggbXVzbC1saWJjLgoKSSBzZWUuIFRoYW5rcyBm
b3IgdGhlIGZlZWRiYWNrIQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8i
XCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8
IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAg
ICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9y
Zy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
