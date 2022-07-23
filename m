Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED0EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85C0D4169C;
	Sat, 23 Jul 2022 20:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85C0D4169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YF_H6QlzlMm6; Sat, 23 Jul 2022 20:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC22D416A3;
	Sat, 23 Jul 2022 20:12:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC22D416A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 872151BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6214E401B2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6214E401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKP5yNhFCT7V for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:12:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19596402D0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19596402D0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:12:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5F6C0780501;
 Sat, 23 Jul 2022 22:12:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 22:12:35 +0200
Date: Sat, 23 Jul 2022 22:12:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: kory.maincent@bootlin.com
Message-ID: <20220723201235.GL2641@scaer>
References: <20220623140028.1315712-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220623140028.1315712-1-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658607160;
 bh=W5OBHlQweDqW39AWjs3NwNtMKP+rCvwN6SPtbFLzKX4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZrAfECexrmYCIbuEBNnLFE+oUJ8hqPi/79lNwsiAaDHZO3cZrUdOIxnVwqbAmBgj
 MYONtgpGu225OezwRt2drEBkp4wDGnjhDkus0b4fu47Job8MmtW09ooaUudUbVuWT6
 A9Y9daJGFPHsXMHlwPer/L+CZ7uoxWpnxJ4KsvhAftTptSiSVp0MEx+TrbGT7aLB8x
 Z+CnzHo9RivyhK+Hd4PeE+hCJqqQcOuzHvIv+drD/rtFEuLI+SM+sYtCAKNkGrRBek
 muM+cO4W3nlWBNrbKwGn1kaapWooDm5pPVd3o2V3uFDJEyW2zQN3lVEGPT5z5ZLnT1
 l66LYtAUJJ2lQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sZrAfECe
Subject: Re: [Buildroot] [PATCH 1/4] boot/arm-trusted-firmware: update
 condition for custom tarball management
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
Cc: thomas.petazzoni@bootlin.com, Sergey Matyukevich <geomatsi@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjItMDYtMjMgMTY6MDAgKzAyMDAsIEtvcnkgTWFpbmNlbnQgdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gRnJvbTogS29yeSBNYWluY2VudCA8a29yeS5tYWlu
Y2VudEBib290bGluLmNvbT4KPiAKPiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGNvbmRpdGlvbiB0
byBoYW5kbGUgY3VzdG9tIHRhcmJhbGxzIGFzIHNwZWNpZmllZCBieQo+IHRoZSBjb25maWd1cmF0
aW9uLiBUaGlzIGNoYW5nZSBpcyBtYWRlIHRvIGhhdmUgY2xlYW5lciBjb25kaXRpb24gYW5kIGZv
cgo+IGNvbnNpc3RlbmN5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnku
bWFpbmNlbnRAYm9vdGxpbi5jb20+CgpTZXJpZXMgb2YgNCBwYXRjaGVzIGFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAKPiBOb3RlczoK
PiAgICAgVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiB0aGlzIG90aGVyIG9uZToKPiAgICAgaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyMi1KdW5lLzY0NTIx
Ni5odG1sCj4gCj4gIGJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdh
cmUubWsgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9hcm0t
dHJ1c3RlZC1maXJtd2FyZS5tayBiL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0
ZWQtZmlybXdhcmUubWsKPiBpbmRleCA5NjViMWEyZWI1Li40MjFkOGM3NzBkIDEwMDY0NAo+IC0t
LSBhL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsKPiAr
KysgYi9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLm1rCj4g
QEAgLTYsNyArNiw3IEBACj4gIAo+ICBBUk1fVFJVU1RFRF9GSVJNV0FSRV9WRVJTSU9OID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfVkVSU0lPTikpCj4g
IAo+IC1pZmVxICgkKEFSTV9UUlVTVEVEX0ZJUk1XQVJFX1ZFUlNJT04pLGN1c3RvbSkKPiAraWZl
cSAoJChCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9UQVJCQUxMKSx5KQo+
ICAjIEhhbmRsZSBjdXN0b20gQVRGIHRhcmJhbGxzIGFzIHNwZWNpZmllZCBieSB0aGUgY29uZmln
dXJhdGlvbgo+ICBBUk1fVFJVU1RFRF9GSVJNV0FSRV9UQVJCQUxMID0gJChjYWxsIHFzdHJpcCwk
KEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT04p
KQo+ICBBUk1fVFJVU1RFRF9GSVJNV0FSRV9TSVRFID0gJChwYXRzdWJzdCAlLywlLCQoZGlyICQo
QVJNX1RSVVNURURfRklSTVdBUkVfVEFSQkFMTCkpKQo+IEBAIC0xOTAsNyArMTkwLDcgQEAgZW5k
ZWYKPiAgIyBDb25maWd1cmF0aW9uIGNoZWNrCj4gIGlmZXEgKCQoQlIyX1RBUkdFVF9BUk1fVFJV
U1RFRF9GSVJNV0FSRSkkKEJSX0JVSUxESU5HKSx5eSkKPiAgCj4gLWlmZXEgKCQoQVJNX1RSVVNU
RURfRklSTVdBUkVfVkVSU0lPTiksY3VzdG9tKQo+ICtpZmVxICgkKEJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQ1VTVE9NX1RBUkJBTEwpLHkpCj4gIGlmZXEgKCQoY2FsbCBxc3RyaXAs
JChCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9O
KSksKQo+ICAkKGVycm9yIE5vIHRhcmJhbGwgbG9jYXRpb24gc3BlY2lmaWVkLiBQbGVhc2UgY2hl
Y2sgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVEFSQkFMTF9MT0NBVElP
TikKPiAgZW5kaWYKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
