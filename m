Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D27C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DBF60B71;
	Sat, 15 Jan 2022 10:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KxdGrMPwT1y; Sat, 15 Jan 2022 10:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B64460AC1;
	Sat, 15 Jan 2022 10:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9BAA11BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9485B81C40
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wSz7GAN67Ia for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:18:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CB8581C81
 for <buildroot@busybox.net>; Sat, 15 Jan 2022 10:18:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D80E919F59C;
 Sat, 15 Jan 2022 11:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642241894;
 bh=8l++iL+GpsJ34eYrBcHWjFSRbLAAjFhR0mLRB3LMh1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9z+5Sxn3OTMzRb1l/lp6cQcscHa5d7p703DcMAW3X2MgPcNFiQUbrZZvZ9Hnn5sZ
 7Iuk1BpuxKpHPxyeT9md1rjA5n9d/LHM/vRuVPhSzo9TQXWxa6B5ZaF2pczw2Vt+5l
 CbiNUgioRFDOORoi/tJvJI9orBHPIEIDYgmtL8pklrtluEKiTqSH5MqZSm+Ts9jSXv
 ZoZqGdxklpapwR95KINxV9ckRjIYpzIphVEgkg6+s+67Q3p2WWqHeoOraPFf+FK9xq
 0OMMBgAyVTkcybS85PJcts5wV27KorURgTdz6imnqa8WuvuDqA2B2WmbckGkChCHPw
 /RGrhpZNSLsLw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 11:18:11 +0100
Date: Sat, 15 Jan 2022 11:18:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220115101811.GG1945846@scaer>
References: <20220115091418.60621-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115091418.60621-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/luajit: bump to version
 a91d0d9d3bba1a936669cfac3244509a0f2ac0e3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwKCk9uIDIwMjItMDEtMTUgMTA6MTQgKzAxMDAsIEZyYW5jb2lzIFBlcnJh
ZCBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29p
cy5wZXJyYWRAZ2Fkei5vcmc+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvbHVhaml0L2x1YWppdC5oYXNoIHwgMiAr
LQo+ICBwYWNrYWdlL2x1YWppdC9sdWFqaXQubWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbHVhaml0L2x1YWppdC5oYXNoIGIvcGFja2FnZS9sdWFqaXQvbHVhaml0Lmhhc2gKPiBpbmRl
eCAxNDk3ZWU5ZGYuLmQ5MmVlZmIzOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YWppdC9sdWFq
aXQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbHVhaml0L2x1YWppdC5oYXNoCj4gQEAgLTEsNSArMSw1
IEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgYjFiMTlmOTI0NTFhNjYxYmEx
MTY3ZWUwYjI1OTI5OTYxNmNiM2ExY2RhZjVhYjA1ZDdjY2ZmYWZmZWI0YTBmYiAgbHVhaml0LTA1
ZjE5ODRlMWE4NjJlNGIzZDNjM2IzNzBjNzczNDkyZTJlZGY4NGEudGFyLmd6Cj4gK3NoYTI1NiAg
N2VhOTJlMjQxNGI2NDA1YzdmYjM5NzRhYjA5MjcwN2M0MDBhNTQ5NmU4ZDQ5MzYxNzRiNWJkM2Fh
NmU5NDQ3NyAgbHVhaml0LWE5MWQwZDlkM2JiYTFhOTM2NjY5Y2ZhYzMyNDQ1MDlhMGYyYWMwZTMu
dGFyLmd6Cj4gIAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICBzaGEyNTYgIDQzZmMyNTExNzlk
OTAwZjk5NDhlNTFkZDNjYzkzNzMzZDEyMTlmMmRiMDYwZmFhYTBjODEwMGFkMDU0ZjU0ZDggIENP
UFlSSUdIVAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YWppdC9sdWFqaXQubWsgYi9wYWNrYWdl
L2x1YWppdC9sdWFqaXQubWsKPiBpbmRleCBkMmFmNjlkMWUuLjdjMWI1NTZmZiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2x1YWppdC9sdWFqaXQubWsKPiArKysgYi9wYWNrYWdlL2x1YWppdC9sdWFq
aXQubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ICAKPiAtTFVBSklUX1ZFUlNJT04gPSAwNWYxOTg0ZTFhODYyZTRiM2QzYzNiMzcwYzc3MzQ5MmUy
ZWRmODRhCj4gK0xVQUpJVF9WRVJTSU9OID0gYTkxZDBkOWQzYmJhMWE5MzY2NjljZmFjMzI0NDUw
OWEwZjJhYzBlMwo+ICBMVUFKSVRfU0lURSA9ICQoY2FsbCBnaXRodWIsTHVhSklULEx1YUpJVCwk
KExVQUpJVF9WRVJTSU9OKSkKPiAgTFVBSklUX0xJQ0VOU0UgPSBNSVQKPiAgTFVBSklUX0xJQ0VO
U0VfRklMRVMgPSBDT1BZUklHSFQKPiAtLSAKPiAyLjMyLjAKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwg
IFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8
IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2ln
bmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAw
OTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRo
ZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
LS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
