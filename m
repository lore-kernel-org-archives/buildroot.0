Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D44C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C19BB40359;
	Tue, 17 May 2022 20:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoJaC0Wt59G8; Tue, 17 May 2022 20:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE8F240143;
	Tue, 17 May 2022 20:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 847C91BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8134083E1C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBBkAguv8s_Y for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:48:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEC3583E19
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652820490;
 bh=RJYkMGvDhB9a52SaaenKt9l6r6IgXtF7M08AgMhMDjk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ti2f0Pv8gxdMox5bxLMIV2NqZ0FOQ79EnXuPqE6tV3f6jNXOp2hvdVQZbWIswiVWZ
 9RhWMvfZ8zpgx9gYnyDlrE+ckUYz8Msx/T1gFqdusmg6Lgy3DJ2DGgCRnUOTPjfOoL
 3uZHOeJogpPppTfeFykU3+rfUQkaLINZQ2DkMLQw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.241]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3DW-1o6VWb3jEu-00FVr2; Tue, 17
 May 2022 22:48:09 +0200
Date: Tue, 17 May 2022 22:48:09 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Message-ID: <20220517224809.21f77949@gmx.net>
In-Reply-To: <1332b2a553298d899b231f0cc47de7600a5a4aa5.camel@iki.fi>
References: <379b85295cffd8c19ca02051849d946a24a915de.camel@iki.fi>
 <20220508233809.61d5d2a2@gmx.net>
 <1332b2a553298d899b231f0cc47de7600a5a4aa5.camel@iki.fi>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:rUzCT7JOZRNWDGE4ulMakhzqdSAJfTcRIeWONcQWULIrr43aJbe
 7ZnGm6/yTq772N71Cksk9jqrj7IfYKJByHiCRi8Ef4BRPxkDBdeQqRDB0I5szTxW833aa0q
 k2bEW4H1V9XZojfmJymkr1oHHcfiWOTzKHbnp13EXpF3mG60ctfNRvplqceULcU34Jotx1D
 nxKxCsF1dF4lY/OYMRxUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fu0DPcYO0Go=:FiEpw3dz6B0AcOyKBGLBhO
 zyj7DXakjj3xKGnr3B/sojdFU/ShMibSYaRFn/SZ9ZS9dgMMb7rXx6O4gw4ASaVsZmmR/Ml/r
 9rGqnz35ev3tPr9SYNdgJISBYp1Gzy+1qD+mEhB0XlTOAJASXDl5tfPPjVlDepEOj7NMBGeT/
 K+EAlijhAhunl1rHJEj1KMTgCCKsWPEB94soyVo/XxZ1WzQBbq+YWZsWjlV5q+i+FiBp6yvvS
 Rr6GbJcX7yidJLwv4DVLyR72Mex+ejcZOR8uTa3b4LqMCZcPH+EO7GDe/LqP6rHp+3dAetRyG
 IucFEk8dv/lpjZGCok7ss6rABpb6jw5axbiPjImxrZ4Yh8c23OlCWkmVnuXRBlOadPVAFZyhh
 xHhTDafzcP5Zleh+03R95SM2gRO5sBVL6G4V0/yQ89UrMhiDMlY6WYAX0aQMzdMZ36BByKQRr
 ZJdcNq0BVUsjJ+BAh3Fu5W/0un5fkL4D2pdprDwm+tTnb9vkYm41OwDKbBDmY/ce6UBlrOY+P
 y+/WsqwV8H98whkcfFazoYa/E7fZ4mqHNG6LYq+VjeT6BK/IKxGwrm9AY+minTORvZIyZvt3X
 ZOhnceZplqSyB9LGg1nV+1xmx2FIlajj1gB3bnXFM1qlqvUE0YN90u7+slSDEMJkGPxPCocIu
 /oPl377tqdtWOsHmaL1m+c2s357DOwa+o5Z4JbIP/GdFhAGQzE2M8MCGMIMaPccY66VeOrhOh
 fIpVizJW+KEjp+Vqa5eSAs0RvtuWe80Y1gXCyHRSjCUE2wN6FHCdb7PH6n5d3OB+Oxj0T8Dpc
 C1hmH56NkpxjrH1/UbR1l24XjT4HBudAFnyZ6AneAVLjodQvQGTpoafEGnZXuWojwXIywp5Ph
 YbIO/WTjJFBNCrBJdiEJbTEPugVnlvbPZwXimrt81r1c1rag5ga7wjCkTIyXYPvsipf0WVd55
 dyZ6W3ddjcnw+OJCzFUmdQTvofxUuSmuARGbnLuAfPGySBnbgfu/6fJx84sLqXfe718mNKWDg
 CNQVO8u+ZYEqKFNHi81YWX84D8YV3c/DuvSPr5S//jYJjguvCX3WzYYHLmKPXs87JNNaBYNCz
 EvE/UpjxOS3BAs46pULhkkaXdIpXk179fVO1uz9QhnKZulaGMgO34GYHQ==
Subject: Re: [Buildroot] selftests/sgx
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

SGVsbG8gSmFya2tvLAoKT24gVHVlLCAxNyBNYXkgMjAyMiAyMDowNjo1MSArMDMwMCwgSmFya2tv
IFNha2tpbmVuIDxqYXJra28uc2Fra2luZW5AaWtpLmZpPiB3cm90ZToKCj4gT24gU3VuLCAyMDIy
LTA1LTA4IGF0IDIzOjM4ICswMjAwLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiA+IEhlbGxvIEph
cmtrbywKPiA+IAo+ID4gT24gU2F0LCAwNyBNYXkgMjAyMiAyMzowMzo1NyArMDMwMCwgSmFya2tv
IFNha2tpbmVuIDxqYXJra28uc2Fra2luZW5AaWtpLmZpPiB3cm90ZToKPiA+ICAgCj4gPiA+IEhp
LAo+ID4gPiAKPiA+ID4gV2hlbiBzcGVjaWZ5aW5nICJCUjJfUEFDS0FHRV9MSU5VWF9UT09MU19T
RUxGVEVTVFM9eSIsIGZvciBzb21lIHJlYXNvbgo+ID4gPiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9zZ3gvIGJ1aWxkIHJlc3VsdHMsIGkuZS4gInNneDp0ZXN0X3NneCIsIGRvZXMKPiA+ID4gbm90
IGdldCBpbmNsdWRlZCB0byB0aGUgcm9vdGZzIGltYWdlLCBub3IgaXMgaXQgbGlzdGVkIGluwqAK
PiA+ID4ga3NlbGZ0ZXN0LWxpc3QudHh0Lgo+ID4gPiAKPiA+ID4gSWYgSSBtYW51YWxseSBjb21w
aWxlIGFuZCBpbnN0YWxsIHNlbGZ0ZXN0cywgaXQgZG9lcyBnZXQgaW5jbHVkZWQuIEFueQo+ID4g
PiBpZGVhcyB3aGF0IGNvdWxkIGJlIHdyb25nPyAgCj4gPiAKPiA+IEZvciB3aGljaCBhcmNoaXRl
Y3R1cmUgZG8geW91IChjcm9zcykgY29tcGlsZSAod2hhdCBpcyB5b3VyIHRhcmdldCBhcmNoaXRl
Y3R1cmUpPwo+ID4gCj4gPiBBY2NvcmRpbmcgdG8gZS5nLiBbMV06Cj4gPiAKPiA+IFsuLi5dCj4g
PiDCoCA3IENBTl9CVUlMRF9YODZfNjQgOj0gJChzaGVsbCAuLi94ODYvY2hlY2tfY2Muc2ggJChD
QykgXAo+ID4gwqAgOMKgwqAgCj4gPiBbLi4uXQo+ID4gwqAxOSBURVNUX0NVU1RPTV9QUk9HUyA6
PSAkKE9VVFBVVCkvdGVzdF9zZ3gKPiA+IMKgMjAgCj4gPiDCoDIxIGlmZXEgKCQoQ0FOX0JVSUxE
X1g4Nl82NCksIDEpCj4gPiDCoDIyIGFsbDogJChURVNUX0NVU1RPTV9QUk9HUykgJChPVVRQVVQp
L3Rlc3RfZW5jbC5lbGYKPiA+IMKgMjMgZW5kaWYKPiA+IFsuLi5dICAKPiAKPiBIaSwKPiAKPiBN
eSBjb25maWcgaXMgY29udGFpbmVkIGZ1bGx5IGhlcmU6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29t
L2phcmtrb2pzL2J1aWxkcm9vdC1zZ3gvYmxvYi9tYXN0ZXIvY29uZmlncy9zZ3hfeDg2XzY0X2Rl
ZmNvbmZpZwo+IAo+IEFuZCBteSBrZXJuZWwgY29uZmlnIGlzIGhlcmU6Cj4gCj4gaHR0cHM6Ly9n
aXRodWIuY29tL2phcmtrb2pzL2J1aWxkcm9vdC1zZ3gvYmxvYi9tYXN0ZXIvYm9hcmQvc2d4L3g4
Nl82NC9saW51eC5jb25maWcKPiAKPiBJLmUuIGNhbiBiZSBidWlsdCB3aXRoICJtYWtlIHNneF94
ODZfNjRfZGVmY29uZmlnICYmIG1ha2UiLgo+IAoKVGhlIG9yaWdpbmFsIGVycm9yIG1lc3NhZ2Ug
ZnJvbSBsaW51eC01LjE3LjcvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc2d4IGlzCihOb3RlOiBu
byBnbG9iYWwgZmFpbHVyZSBpbiBsaW51eC10b29scy9zZWxmdGVzdHMgaW4gY2FzZSBvbmUgb3Ig
bW9yZSBvZiB0aGUKdGVzdCBjYXNlIGNvbXBpbGVzIGZhaWwpOgoKICAuLi4vaG9zdC9iaW4veDg2
XzY0LWJ1aWxkcm9vdC1saW51eC1nbnUtZ2NjIC1XYWxsIC1XZXJyb3IgLWcgLUkuLi8uLi8uLi8u
Li90b29scy9pbmNsdWRlIC1mUElDIC16IG5vZXhlY3N0YWNrIC1jIHNpZ3N0cnVjdC5jIC1vIC4u
Li9idWlsZC9saW51eC01LjE3LjcvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0L3Nn
eC9zaWdzdHJ1Y3QubwogIHNpZ3N0cnVjdC5jOjE1OjEwOiBmYXRhbCBlcnJvcjogb3BlbnNzbC9l
cnIuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQogICAgIDE1IHwgI2luY2x1ZGUgPG9wZW5z
c2wvZXJyLmg+CiAgICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn4KICBjb21waWxhdGlv
biB0ZXJtaW5hdGVkLgoKWW91IG5lZWQgdG8gZW5hYmxlICdCUjJfUEFDS0FHRV9PUEVOU1NMJyBp
biB5b3VyIGRlZmNvbmZpZyBhbmQgYXBwbHkKdGhlIGZvbGxvd2luZyBidWlsZHJvb3QgcGF0Y2g6
CgotLS0gYS9wYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtc2VsZnRlc3RzLm1rLmluCisr
KyBiL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1zZWxmdGVzdHMubWsuaW4KQEAgLTE4
LDYgKzE4LDEwIEBAIGVuZGlmCiAKIFNFTEZURVNUU19ERVBFTkRFTkNJRVMgPSBsaWJjYXAtbmcg
cG9wdAogCitpZmVxICgkKEJSMl9QQUNLQUdFX09QRU5TU0wpLHkpCitTRUxGVEVTVFNfREVQRU5E
RU5DSUVTICs9IG9wZW5zc2wKK2VuZGlmCisKIFNFTEZURVNUU19NQUtFX0ZMQUdTID0gXAogICAg
ICAgICQoTElOVVhfTUFLRV9GTEFHUykgXAogICAgICAgIEFSQ0g9JChTRUxGVEVTVFNfQVJDSCkK
CgpSZWdhcmRzLApQZXRlcgoKCj4gPiB0ZXN0X3NneCBpcyBvbmx5IGNvbXBpbGVkIGZvciB4ODZf
NjQgKGFuZC9vciBDQU5fQlVJTERfWDg2XzY0IGlzIHRydWUpLi4uCj4gPiAKPiA+IFJlZ2FyZHMs
Cj4gPiBQZXRlciAgCj4gCj4gQlIsIEphcmtrbwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
