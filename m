Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F8EC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F1C60671;
	Sun, 17 Jul 2022 13:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F1C60671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNpYvXsSSoNJ; Sun, 17 Jul 2022 13:04:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 797C560681;
	Sun, 17 Jul 2022 13:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 797C560681
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F50F1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6819060681
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6819060681
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ska2cD9z0bJ for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:04:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7301F60671
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7301F60671
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:04:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C69D8780511;
 Sun, 17 Jul 2022 15:04:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:04:19 +0200
Date: Sun, 17 Jul 2022 15:04:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ritvik <ritviktanksalkar@gmail.com>
Message-ID: <20220717130419.GH2107091@scaer>
References: <CAJxTgFwAMUZVo3dmnLoLtzNmc1USC2XgQ0tHaebZEYsUdrKrpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJxTgFwAMUZVo3dmnLoLtzNmc1USC2XgQ0tHaebZEYsUdrKrpw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658063061;
 bh=RuiI+ZGj4rQY7uo8/jznAOkKU/d9TVjpdWB+FROFjAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CA2JYHpVho9hUhNGkfBUwwWZOU0Blcomj6wr2KE/kNwpK6IeFvKrnJ9DKvRdMU8Nz
 dA5aWPGLMM76hrqhbo/ENpIUszfEIw1Yrq0Wad+pljTqXnuy0c4Sf8y1dBWqr0p4D8
 DLyP/GwjMuTJlqAeL9mp86CeJaaNYtg/cOcGC6+hq0SkvEx4gaUzK48EUM8i6QEYU7
 RnPNRr5VPFD4z/ee37kDItFEEQLdYMiI2rt2nR0WMysEz0vRTEW2z6QkySY/tFBVHQ
 WegNTB3qgb/BiS2mdISdjF0qWQLtlZkQu4NH+HKwd3KRfQ8hr/jf+W1bu33ICOXzZj
 l02eYeWrEPdpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CA2JYHpV
Subject: Re: [Buildroot] aufs-util patching raises duplicate patch issue
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

Uml0dmlrLCBBbGwsCgpPbiAyMDIyLTA3LTE2IDIwOjE2ICswNTMwLCBSaXR2aWsgc3Bha2UgdGh1
c2x5Ogo+IEhlbGxvIGFsbCwKPiBXaGlsZSBjb21waWxpbmcgYnVpbGRyb290IHdpdGggbGludXgg
a2VybmVswqA1LjEwLjExNS1jaXA3LCB0aGUgY29tcGlsYXRpb24gc3RvcHMgd2hpbGUgYXBwbHlp
bmcgYSBhdWZzLXV0aWxzIHNwZWNpZmljIHBhdGNoCj4gIjAwMDItbm8tY2hlY2stdmVyLnBhdGNo
IiBzYXlpbmcgdGhhdCB0aGVyZSBhcmUgY29uZmxpY3RpbmcgZmlsZXMuIEJlbG93IGFyZSB0aGUg
ZGV0YWlscy4gQW55IGhlbHAgaW4gdGhpcyByZWdhcmQgd291bGQgYmUgaGlnaGx5Cj4gYXBwcmVj
aWF0ZWQuCj4gPj4+IGF1ZnMtdXRpbCDCoFBhdGNoaW5nCj4gQXBwbHlpbmcgMDAwMi1uby1jaGVj
ay12ZXIucGF0Y2ggdXNpbmcgcGF0Y2g6Cj4gRXJyb3I6IGR1cGxpY2F0ZSBmaWxlbmFtZSAnMDAw
Mi1uby1jaGVjay12ZXIucGF0Y2gnCj4gQ29uZmxpY3RpbmcgZmlsZXMgYXJlOgo+IMKgIGFscmVh
ZHkgYXBwbGllZDogL2hvbWUvdWJ1bnR1L2J1aWxkcm9vdC0yMDIyLjAyLjMvcGFja2FnZS9hdWZz
LXV0aWwvLzAwMDItbm8tY2hlY2stdmVyLnBhdGNoCj4gwqAgdG8gYmUgYXBwbGllZCDCoDogL2hv
bWUvdWJ1bnR1L2J1aWxkcm9vdC0yMDIyLjAyLjMvcGFja2FnZS9hdWZzLXV0aWwvLzAwMDItbm8t
Y2hlY2stdmVyLnBhdGNoCj4gbWFrZVsxXTogKioqIFtwYWNrYWdlLyBbMV1wa2ctZ2VuZXJpYy5t
azoyNTE6IC9ob21lL3VidW50dS9idWlsZHJvb3QtMjAyMi4wMi4zL291dHB1dC9idWlsZC9hdWZz
LXV0aWwvLnN0YW1wX3BhdGNoZWRdIEVycm9yIDEKPiBtYWtlOiAqKiogW01ha2VmaWxlOjg0OiBf
YWxsXSBFcnJvciAyCgpEb2VzIHRoYXQgc3RpbGwgaGFwcGVuIGFmdGVyIHlvdSBydToKICAgICQg
bWFrZSBhdWZzLXV0aWwtZGlyY2xlYW4KICAgICQgbWFrZSBhdWZzLXV0aWwtcGF0Y2gKClJlZ2Fy
ZHMsCllhbm4gRS4gTU9SSU4uCgo+IFdhcm0gUmVnYXJkcywKPiBDeWIwckcKPiAKPiBMaW5rczoK
PiAxLiBodHRwOi8vcGtnLWdlbmVyaWMubWs6MjUxCgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
