Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726C8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D7860B8D;
	Fri, 18 Mar 2022 22:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9eBpJjyyPN7; Fri, 18 Mar 2022 22:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BD960B1D;
	Fri, 18 Mar 2022 22:40:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9261BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64F2360B1D
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qsFHF8rmx_f for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CA5360AC1
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:40:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7208513F86A;
 Fri, 18 Mar 2022 23:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647643235;
 bh=dPkfieBcMCiUU4fh2qmSiX+EHiWJdfDwBvK1BQ/DjII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJRFzjztKFjV7fKMGWAg9qW0ZS4MCTg2XqlqESbhMerGcSRI9vsXoOH0JS+A8msgF
 0m2J8ZdqrFUIah3NlMYBVwvQU6PMl6Ibv97+syYT+Pv1ksWegvUFqPKzuPNYT0zgrQ
 YktUyKikvvSoI2fPrzY0Q0+22eUZLjtMDiN6cYpZhFBEf3/GQ1B1N8s4Nn5QV8dYnP
 k4XwLG3pCmvxH00oiYlE8JVBtM0lc3FtLbYtLnuZRX97fLq4iq/FYm43VuRrQq7tNG
 vnzGKHtEAFDLXRsmFcNddw5YdpjYpzZaKnKpDdaHhfDgUw2sadASGmIf9wimNP25M3
 fnCHsQk4ycAkQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:40:31 +0100
Date: Fri, 18 Mar 2022 23:40:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220318224031.GV283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
 <20220318132427.48737-5-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318132427.48737-5-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 4/8] boot/optee-os: bump to version 3.16.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTggMTQ6MjQgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciBzcGFrZSB0aHVzbHk6Cj4gQnVtcCBPUC1URUUgT1MgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRF
RSByZWxlYXNlIDMuMTYuMCBhbmQgc2V0Cj4gQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QgdG8g
c2VsZWN0Cj4gQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZIHNp
bmNlCj4gcHl0aG9uLWNyeXB0b2dyYXBoeSBpcyBub3cgbmVlZGVkIHRvIGJ1aWxkIG9wdGVlLW9z
Lgo+IAo+IEFja2VkLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFy
by5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJv
b3RsaW4uY29tPgo+IC0tLQo+ICBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgICAgfCA1ICsrKy0t
Cj4gIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9v
dC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IGluZGV4IDAy
YjVkN2M4NmYuLjgxMTkzN2UwMjUgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcu
aW4KPiArKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+IEBAIC0xOSw3ICsxOSw4IEBAIGNo
b2ljZQo+ICAJICBTZWxlY3QgdGhlIHZlcnNpb24gb2YgT1AtVEVFIE9TIHlvdSB3YW50IHRvIHVz
ZQo+ICAKPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCj4gLQlib29sICIzLjE1
LjAiCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JB
UEhZCj4gKwlib29sICIzLjE2LjAiCgozLjE2LjAgbm93IG5lZWRzIHRoZSBkZXBlbmRlbmN5IG9u
IEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUywKc28gaWYgdGhhdCBpcyBub3Qg
bWV0LCB0aGVyZSB3aWxsIG9ubHkgYmUgdGhlIGN1c3RvbSBnaXQgYXMgYSBmYWxsYmFjay4KClRo
aXMgaXMgbm90IHNvIG5pY2UgdGhhdCB0aGUgbGF0ZXN0IGhhcyB0bywgd2VsbCwgYmUgdGhlIGxh
dGVzdCwgYW5kCnRoYXQgd2UgZG9uO3Qga2VlcCAzLjE1LjAgYXJvdW5kIGZvciB0aG9zZSB0aGF0
IGNhbid0IGhhdmUgYSBob3N0IHJ1c3RjCmNvbXBpbGVyLgoKQnV0IHRoZW4sIHdobyBhcmUgd2Ug
a2lkZGluZz8gQnVpbGRzIG9uIG5vbi14ODYgYXJlIHByZXR0eSByYXJlIHlldDsKZXZlbiBpZiBz
b21lIHBlb3BsZSBtaWdodCBiZSBvbiBQUEMgb3IgQUFyY2g2NCwgdGhleSBzdGlsbCBhcmUgdG8g
YmUKbm8gbXVjaCBtb3JlIHRoYW4gdHdvLWhhbmRmdWwgKDEwMjMpLgoKQWxzbywgY2hlY2stcGFj
a2FnZSB3aGluZXM7CgogICAgJCBtYWtlIGNoZWNrLXBhY2thZ2UKICAgIGJvb3Qvb3B0ZWUtb3Mv
Q29uZmlnLmluOjIyOiBhdHRyaWJ1dGVzIG9yZGVyOiB0eXBlLCBkZWZhdWx0LCBkZXBlbmRzCiAg
ICBvbiwgc2VsZWN0LCBoZWxwIChodHRwOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmln
X2ZpbGVzKQoKQW5kIGEgaGlkZGVuIG9uZToKCiAgICBib290L29wdGVlLW9zL29wdGVlLW9zLmhh
c2g6NDogc2VwYXJhdGlvbiBkb2VzIG5vdCBtYXRjaCBleHBlY3RhdGlvbgogICAgKGh0dHA6Ly9u
aWdodGx5LmJ1aWxkcm9vdC5vcmcvI2FkZGluZy1wYWNrYWdlcy1oYXNoKQoKQXBwbGllZCB0byBt
YXN0ZXIgd2l0aCB0aG9zZSBmaXhlZCwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4K
Cj4gIAloZWxwCj4gIAkgIFVzZSB0aGUgbGF0ZXN0IHJlbGVhc2UgdGFnIGZyb20gdGhlIE9QLVRF
RSBPUyBvZmZpY2lhbCBHaXQKPiAgCSAgcmVwb3NpdG9yeS4KPiBAQCAtNTEsNyArNTIsNyBAQCBl
bmRpZgo+ICAKPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfVkVSU0lPTgo+ICAJc3RyaW5n
Cj4gLQlkZWZhdWx0ICIzLjE1LjAiCWlmIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCj4gKwlk
ZWZhdWx0ICIzLjE2LjAiCWlmIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCj4gIAlkZWZhdWx0
IEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCj4gIAkJCQlpZiBCUjJf
VEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQKPiAgCj4gZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUt
b3Mvb3B0ZWUtb3MuaGFzaCBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaAo+IGluZGV4IDNj
MzJlMjViMzYuLmI5YjBlNWI0M2YgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1v
cy5oYXNoCj4gKysrIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCj4gQEAgLTEsNCArMSw0
IEBACj4gLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2FyY2hpdmUv
My4xNS4wL29wdGVlLW9zLTMuMTUuMC50YXIuZ3oKPiAtc2hhMjU2IGU1YmIzZDllZWRhZjc3ODVh
ZjA5MTYwMmFkZGFjNWI1MjExOGY0Y2RjMTA4YWY5Y2Q2ZjZjOTZiMjE1MDNhYjggIG9wdGVlLW9z
LTMuMTUuMC50YXIuZ3oKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVf
b3MvYXJjaGl2ZS8zLjE2LjAvb3B0ZWUtb3MtMy4xNi4wLnRhci5nego+ICtzaGEyNTYgZWJjOGUx
OGFkMjAzOWVlOTdjMzRmNzRhNzU0NmRlOTExOWUyNmYwNGMzNjhiNmM3ZmQwYzU1ZjkzZDMzZDJk
NiAgb3B0ZWUtb3MtMy4xNi4wLnRhci5nego+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAgc2hhMjU2
IDEyNDdlZTkwODU4ZjQwMzdiNmNhYzYzY2JmZmRkZmVkNDM1ZDBkNzNjNjMxYjM3ZDc4YzFlNmU2
YWIzZTVkMWEgIExJQ0VOU0UKPiAtLSAKPiAyLjM0LjEKPiAKCi0tIAouLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJ
SSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
