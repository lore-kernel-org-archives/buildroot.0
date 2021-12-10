Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD10C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 383A74131B;
	Fri, 10 Dec 2021 19:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3HC6FmFnoqJ; Fri, 10 Dec 2021 19:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A0B44131C;
	Fri, 10 Dec 2021 19:57:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB9251BF2B1
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA40B4273B
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zcKwEFUQLFV for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:57:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61791425C1
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:57:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C7BAB0029D;
 Fri, 10 Dec 2021 20:57:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639166261;
 bh=WVyEvtlVozltRhrg4O1KbL2Bb9i/U7Npubf4kSdaV0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IgIcVr/0n85oTqWd7DylxJgEr96z5p+wUgB9WGCVsC7wEQIDyUx3wS6c3hTOng/fS
 gbrTqCHOKkGFGIzlzMZn+FJ4Chswofm8oHzGE/bV7CDoeavPKX+ZxkQstXaR/q0G6T
 wJc4hYvbr0umZhDSX4kWGLC/M7xcdVnEoP9dzsFRDDxLXwJGt3yh2FlWzI505sYZgi
 zAHko518ZhVHo2GhPLivRBp/nIfzoQWVOx7yIktYnKbpcZyxlT5wkBXqjRJPdJRG07
 DY8w7zdgnolFeBurE7IssFgGZdTVs5mx2NeCNtleqy7sJtyWgQ2aDqQUPOubZz+GIx
 sGWZY6xA0Wvdw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Dec 2021 20:57:39 +0100
Date: Fri, 10 Dec 2021 20:57:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20211210195739.GJ2603@scaer>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210141209.1812043-2-jose.pekkarinen@unikie.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/7] package/minijail: new package
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

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMTItMTAgMTY6MTIgKzAyMDAsIEpvc8OpIFBla2thcmluZW4g
c3Bha2UgdGh1c2x5OgpbLS1TTklQLS1dCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWluaWphaWwv
Q29uZmlnLmluIGIvcGFja2FnZS9taW5pamFpbC9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjAyODY4ZWYwOWMKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9taW5pamFpbC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDEyIEBACj4gK2NvbmZp
ZyBCUjJfUEFDS0FHRV9NSU5JSkFJTAo+ICsJYm9vbCAibWluaWphaWwiCj4gKwlkZXBlbmRzIG9u
ICFCUjJfU1RBVElDX0xJQlMgIyBkbG9wZW4oKQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1Rf
TElCQ0FQCgpXaHkgZG9lcyBhIHRhcmdldCBwYWNha2dlIHNlbGVjdCBhIGhvc3QgbGlicmFyeT8K
CkFueXdhdCwgQlIyX1BBQ0tBR0VfSE9TVF9MSUJDQVAgZG9lcyBub3QgZXhpc3QsIGFuZCB5b3Vy
IHBhdGNoIHNlcmllcwpkb2VzIG5vdCBhZGQgaXQgZWl0aGVyLiBTbyB0aGlzIGlzIHRvdGFsbHkg
dXNlbGVzcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdF
X0xJQkNBUAo+ICsJaGVscAo+ICsJICBNaW5pamFpbCBpcyBhIHNhbmRib3hpbmcgdG9vbCBtYWlu
dGFpbmVkIGJ5IGdvb2dsZS4KPiArCj4gKwkgIGh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9taW5p
amFpbC8KPiArCj4gK2NvbW1lbnQgIm1pbmlqYWlsIG5lZWRzIGEgdG9vbGNoYWluIHdpdGggZHlu
YW1pYyBsaWJyYXJ5IHN1cHBvcnQiCj4gKwlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL21pbmlqYWlsL21pbmlqYWlsLmhhc2ggYi9wYWNrYWdlL21pbmlq
YWlsL21pbmlqYWlsLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLjIyN2E3N2ZjZjUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9taW5pamFpbC9t
aW5pamFpbC5oYXNoCj4gQEAgLTAsMCArMSw1IEBACj4gKyMgRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vZ29vZ2xlL21pbmlqYWlsL3JlbGVhc2VzLwo+ICtzaGEyNTYgIDFlZTVhNTkxNjQ5MWEzMmMx
MjFjNzQyMmI0ZDhjMTY0ODFjMDM5NmEzYWNhYjM0YmYxYzQ0NTg5ZGNmODEwYWUgIGxpbnV4LXYx
Ny50YXIuZ3oKPiArCj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEyNTYgIGM2ZjQzOWM1Y2Yw
NzI2M2Y3MWYwMWQyOWI3OWM3OTE3MmVlNTI5MDg4ZTUxYWI0MzRiMjJiYWFkMDk4OGZlNTcgIExJ
Q0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9taW5pamFpbC9taW5pamFpbC5tayBiL3BhY2th
Z2UvbWluaWphaWwvbWluaWphaWwubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLmJjNzI0MjFiMGMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9taW5p
amFpbC9taW5pamFpbC5tawo+IEBAIC0wLDAgKzEsMjggQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArIwo+ICsjIG1pbmlqYWlsCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiArCj4gK01JTklKQUlMX1ZFUlNJT04gPSBsaW51eC12MTcKPiArTUlOSUpBSUxfU09VUkNFID0g
JChNSU5JSkFJTF9WRVJTSU9OKS50YXIuZ3oKPiArTUlOSUpBSUxfU0lURSA9ICJodHRwczovL2dp
dGh1Yi5jb20vZ29vZ2xlL21pbmlqYWlsL2FyY2hpdmUvcmVmcy90YWdzIgo+ICtNSU5JSkFJTF9M
SUNFTlNFID0gQlNELVN0eWxlCj4gK01JTklKQUlMX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4g
K01JTklKQUlMX0RFUEVOREVOQ0lFUz1saWJjYXAgaG9zdC1saWJjYXAKPiArCj4gK2RlZmluZSBN
SU5JSkFJTF9CVUlMRF9DTURTCj4gKwkoY2QgJChARCk7IFwKPiArCSQoVEFSR0VUX01BS0VfRU5W
KSAkKE1BS0UpIC1DICQoQEQpLyQoZCkgQ0M9IiQoVEFSR0VUX0NDKSIpCgpUaGVyZSBpcyBubyBu
ZWVkIHRvIGVuY2xvc2UgdGhlIGNvbW1hbmQgaW4gcGFyZW50aGVzZXMuIFRoYXQgb3RoZXIKcGFj
a2FnZXMgZG8gaXQgaXMgcHVyZWx5IGhpc3RvcmljYWwgYmFnZ2FnZS4KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgo+ICtlbmRlZgo+ICsKPiArZGVmaW5lIE1JTklKQUlMX0lOU1RBTExfVEFSR0VU
X0NNRFMKPiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS9taW5pamFpbDAgXAo+ICsJCSQo
VEFSR0VUX0RJUikvdXNyL2Jpbi9taW5pamFpbDAKPiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAk
KEBEKS9saWJtaW5pamFpbHByZWxvYWQuc28gXAo+ICsJCSQoVEFSR0VUX0RJUikvbGliL2xpYm1p
bmlqYWlscHJlbG9hZC5zbwo+ICsJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL2xpYm1pbmlq
YWlsLnNvIFwKPiArCQkkKFRBUkdFVF9ESVIpL2xpYi9saWJtaW5pamFpbC5zbwo+ICtlbmRlZgo+
ICsKPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiAtLSAKPiAyLjMwLjIKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
