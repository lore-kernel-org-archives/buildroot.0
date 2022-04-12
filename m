Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7463C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A2240862;
	Tue, 12 Apr 2022 19:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kf2KOEZqAUgV; Tue, 12 Apr 2022 19:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2845E40160;
	Tue, 12 Apr 2022 19:55:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8898D1BF3FD
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 780628315C
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 19:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VrFsnpNXhRd for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 19:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88D9182F20
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 19:55:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7133:9439:48a3:ea79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0D1EB13F85F;
 Tue, 12 Apr 2022 21:55:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649793328;
 bh=bdZwfuoHd0V69VFwxyF8G6vh9UIxf+3prVdd6wDKQsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jDpnwoYB9aAJl3wOUqyhGHkCk8MQof0vIannc4j/1ghIpel0rtKOZdTL4Cb8XZdj1
 zLavSayWkhbi7E4LOOSTJahZxOaYyDv9IKpf0HSO6rN+PTL+0r45TOz9GJEHiwAZD2
 3hxc3FSSH1NRG+BEcbN6jNRnbJHXZV17tOa0KKpjoY4Ax9yTsiXoUXdBDi61W7PIGL
 xZHn4AwDlxuCPLgJhDakC3fxCwbgvJEybXsfoe1R/B94/M0aDAzdbqfV4Z6C7STWHY
 17IdVLPNck8GaiL2tMaVw90lDF7tqr1Pp0+Lk+WABq0U9VOjsNJe4gvlfps7Ud5lPE
 ce5ImbwmLtswQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 12 Apr 2022 21:55:25 +0200
Date: Tue, 12 Apr 2022 21:55:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220412195525.GI4029883@scaer>
References: <20220412180233.2709789-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412180233.2709789-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/pango: bump to version 1.50.6
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA0LTEyIDIwOjAyICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL3BhbmdvL3BhbmdvLmhhc2ggfCA0ICsr
LS0KPiAgcGFja2FnZS9wYW5nby9wYW5nby5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9wYW5nby9wYW5nby5oYXNoIGIvcGFja2FnZS9wYW5nby9wYW5nby5oYXNoCj4gaW5kZXggMzE5
ZDk3NzhjLi5mZWNmMzY4NTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9wYW5nby9wYW5nby5oYXNo
Cj4gKysrIGIvcGFja2FnZS9wYW5nby9wYW5nby5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gLSMg
RnJvbSBodHRwczovL2Z0cC5hY2MudW11LnNlL3B1Yi9HTk9NRS9zb3VyY2VzL3BhbmdvLzEuNTAv
cGFuZ28tMS41MC41LnNoYTI1NnN1bQo+IC1zaGEyNTYgIDZkMTM2ODcyZGE2MjA3ZmU4OGM1Y2Qy
Yzk1YzM2YmNhZjRlZDI5NDAyYjg1NDY2M2E4NmNkN2VmZTk5YjBjZjUgIHBhbmdvLTEuNTAuNS50
YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vZnRwLmFjYy51bXUuc2UvcHViL0dOT01FL3NvdXJjZXMv
cGFuZ28vMS41MC9wYW5nby0xLjUwLjYuc2hhMjU2c3VtCj4gK3NoYTI1NiAgYTk5OGJjZjM2ODgx
YzNhYzIwNDk1ZDQwYmNlYjMwNGY0ZWFhOTE3NWJkMjk2N2M4NTY1NjQzNGNiZGFmZTg2YSAgcGFu
Z28tMS41MC42LnRhci54ego+ICAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gIHNoYTI1NiAgZDI0
NTgwN2Y5MDAzMjg3MmQxNDM4ZDc0MWVkMjFlMjQ5MGUxMTc1ZGM4YWEzYWZhNWRkYjZjOGU1Mjli
NThlNSAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BhbmdvL3BhbmdvLm1rIGIvcGFj
a2FnZS9wYW5nby9wYW5nby5tawo+IGluZGV4IDY5ZWM1YmI0OS4uYzI2NGU3Njc0IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcGFuZ28vcGFuZ28ubWsKPiArKysgYi9wYWNrYWdlL3BhbmdvL3Bhbmdv
Lm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICBQ
QU5HT19WRVJTSU9OX01BSk9SID0gMS41MAo+IC1QQU5HT19WRVJTSU9OID0gJChQQU5HT19WRVJT
SU9OX01BSk9SKS41Cj4gK1BBTkdPX1ZFUlNJT04gPSAkKFBBTkdPX1ZFUlNJT05fTUFKT1IpLjYK
PiAgUEFOR09fU09VUkNFID0gcGFuZ28tJChQQU5HT19WRVJTSU9OKS50YXIueHoKPiAgUEFOR09f
U0lURSA9IGh0dHA6Ly9mdHAuZ25vbWUub3JnL3B1Yi9HTk9NRS9zb3VyY2VzL3BhbmdvLyQoUEFO
R09fVkVSU0lPTl9NQUpPUikKPiAgUEFOR09fSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gLS0gCj4g
Mi4zMi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0t
IAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2
NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19f
ICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06
ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
