Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A57C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F54A419C6;
	Sun, 29 May 2022 21:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PLU4zKutyzeW; Sun, 29 May 2022 21:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A2F419C1;
	Sun, 29 May 2022 21:33:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B87421BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A50B16108E
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6Fh-TCJEX_p for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:33:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6F3261080
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:33:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A066D780340;
 Sun, 29 May 2022 23:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653859979;
 bh=bUr4hGvPy6K/SR7WfmAVmAhW5qTeyV1c+tNXvMl1L1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPf9zZtpLdosKfJ1+Vk2/kLijMpskhYbZtUhHX0CaE0R3JG0FvJQ7gmsDMVTGcycl
 VjnTw8HhaA9T3xomQdAiVLg1x0hF4vpNV372At7ubnifSdWJgSyfqduHQtL12FRhAv
 7JpTWGCAHl2/KZNDQ8MpabG5HJ6HZY+wnukT1fQ8ZDcErAmk0ULAZ4Ryz0ZSYyhYj7
 5aGT55kb137f2MfzFU4zksguKv7XNOw9iZcBNmz/TzspMog+nn0m/yAc8gdXrlXJQa
 tgbDlWiGCFLd0GqO/ASQS7+CVby08Ds2dEka9qjNrUwhYYm1BrkitQrSFmNMfeoxGm
 51/rqQ6GVFXRQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:32:55 +0200
Date: Sun, 29 May 2022 23:32:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220529213255.GJ993669@scaer>
References: <20220527122710.1296005-1-fontaine.fabrice@gmail.com>
 <20220529210219.GG993669@scaer>
 <CAPi7W80+yF-pwsgkZx7WGXzimC23g3Zfc2tV454-2GotodEZZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W80+yF-pwsgkZx7WGXzimC23g3Zfc2tV454-2GotodEZZg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix uclibc build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0wNS0yOSAyMzowNSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgZGltLiAyOSBtYWkgMjAyMiDDoCAyMzowMiwgWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPiA+IE9uIDIwMjItMDUt
MjcgMTQ6MjcgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+ID4gPiBGaXgg
dGhlIGZvbGxvd2luZyB1Y2xpYmMgYnVpbGQgZmFpbHVyZToKPiA+IFRoaXMgcGF0Y2ggaXMgbWFy
a2VkICJTdXBlcnNlZGVkIiBpbiBwYXRjaHdvcmssIGlzIHRoYXQgZXhwZWN0ZWQ/Cj4gWWVzLCB0
aGlzIHBhdGNoIGlzIGJyb2tlbiBhbmQgcmFpc2VzIGEgcnVudGltZSBidWlsZCBmYWlsdXJlIHdp
dGgKPiBnbGliYyAoYW5kIHJlYWxsb2NhcnJheSkuCj4gVXBzdHJlYW0gYXBwbGllcyBbMV0gdG8g
ImZpeCIgaXQuCj4gSG93ZXZlciwgcmVhbGxvY2FycmF5IGRldGVjdGlvbiBpcyBzdGlsbCBicm9r
ZW4sIGEgTVIgaXMgcGVuZGluZyBbMl0uCj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9waXBld2lyZS9waXBld2lyZS8tL2NvbW1pdC8zZTdmOTc1ZjgzYzc5MThkZWExYzAyYTVi
ZjMzNDk0MGU4MmMyNTkxCj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBl
d2lyZS9waXBld2lyZS8tL21lcmdlX3JlcXVlc3RzLzEyNTEKCkFoLCBPaywgdGhhbmtzIGZvciB0
aGUgZmVlZGJhY2shIDotKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0t
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
