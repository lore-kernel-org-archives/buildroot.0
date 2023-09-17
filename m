Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF882CD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 08:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67EB6610B7;
	Sun, 17 Sep 2023 08:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67EB6610B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wq75tUkIHnjR; Sun, 17 Sep 2023 08:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D9116102D;
	Sun, 17 Sep 2023 08:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D9116102D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6582F1BF3E5
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F13681E71
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 08:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F13681E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALLQkX1XxD9I for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 08:21:54 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BA0481E6F
 for <buildroot@busybox.net>; Sun, 17 Sep 2023 08:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA0481E6F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E011FB0051B;
 Sun, 17 Sep 2023 10:21:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 10:21:48 +0200
Date: Sun, 17 Sep 2023 10:21:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230917082148.GJ415981@scaer>
References: <20230916154351.2747233-1-francois.perrad@gadz.org>
 <20230916154351.2747233-2-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916154351.2747233-2-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694938911;
 bh=/tNswWH29TiiaaR52FADYLFzghDD4OXgR7PEo9LMzvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qqy+0ItsHhYaKoQaUQdvO0K2DClzLxTGlgRbh0oeASESKITn1iUcgAA0oD4yqafsx
 sX51AQoIRFAW0tIYvpxGp9Jx08m7gGQG9UuYvKXYfJMycxMswwVmVA1o03txzXYkYW
 EFiNaBSZMx+XvrUuF7IRGBShkwpbDy7xbO3WsupBOnZGnd1kdE44JPrvMiWWtdO8YH
 1SsTxFRaqhviOfgzyxomLpoBkq93SLe/c/Ys+GJF8eOpBpqBny25eIT/AJXOhVSIhn
 Fsh8VEL8pxXwlZmU/dWhCc2OEgUJAa68smpWSvfDJWUAeUJvGdec12UOdtJKhpWStQ
 4jNfBXHPew3Ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Qqy+0Its
Subject: Re: [Buildroot] [PATCH 02/16] package/perl-convert-asn1: bump to
 version 0.34
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA5LTE2IDE3OjQzICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IExJQ0VOU0U6IHVwZGF0ZSBjb3B5cmlnaHQgeWVhcnMgJiByZWZv
cm1hdGVkIEFydGlzdGljIExpY2VuY2UgcGFydAo+IHNlZSBodHRwczovL21ldGFjcGFuLm9yZy9y
ZWxlYXNlL1RJTUxFR0dFL0NvbnZlcnQtQVNOMS0wLjMzL2RpZmYvVElNTEVHR0UvQ29udmVydC1B
U04xLTAuMzQjTElDRU5TRQoKQWdhaW4sIHRoaXMgZGlmZiBpcyBiYWNrd2FyZHMsIGFuZCB0aGlz
IHRpbWUgaXQgaXMgcmVhbGx5IG9idmlvdXMgdGhhdAp0aGUgb3JkZXJpbmcgaXMgd3Jvbmc7Cgog
ICAgQEAgLTEsNCArMSw0IEBACiAgICAtVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIw
MjMgYnkgR3JhaGFtIEJhcnIuCiAgICArVGhpcyBzb2Z0d2FyZSBpcyBjb3B5cmlnaHQgKGMpIDIw
MjEgYnkgR3JhaGFtIEJhcnIuCgpQbGVhc2UgYmUgY2FyZWZ1bCB3aGVuIHlvdSBwcm92aWRlIHN1
Y2ggaW5mb3JtYXRpb246IGl0IGlzIHN1cHBvc2VkIHRvCmhlbHAgdGhlIHJldmlldywgYnV0IGlu
IHRoaXMgY2FzZSBpdCBtYWRlIHRoZSByZXZpZXcgbW9yZSBkaWZmaWN1bHQuLi4KCkkgZml4ZWQg
aXQgYWdhaW4sIGFuZCBkaXR0byBmb3IgYWxsIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcy4uLgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0t
LQo+ICBwYWNrYWdlL3BlcmwtY29udmVydC1hc24xL3BlcmwtY29udmVydC1hc24xLmhhc2ggfCA4
ICsrKystLS0tCj4gIHBhY2thZ2UvcGVybC1jb252ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEu
bWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGVybC1jb252ZXJ0LWFzbjEvcGVybC1j
b252ZXJ0LWFzbjEuaGFzaCBiL3BhY2thZ2UvcGVybC1jb252ZXJ0LWFzbjEvcGVybC1jb252ZXJ0
LWFzbjEuaGFzaAo+IGluZGV4IDY0NDUxN2FmNS4uMmQxYjFmYWEzIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcGVybC1jb252ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEuaGFzaAo+ICsrKyBiL3Bh
Y2thZ2UvcGVybC1jb252ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEuaGFzaAo+IEBAIC0xLDYg
KzEsNiBAQAo+IC0jIHJldHJpZXZlZCBieSBzY2FuY3BhbiBmcm9tIGh0dHA6Ly9jcGFuLm1ldGFj
cGFuLm9yZy8KPiAtbWQ1ICA4MDQyNTgzNTAyMGRhNzdjNDhjMDVhNDBlMjViYmY3ZSAgQ29udmVy
dC1BU04xLTAuMzMudGFyLmd6Cj4gLXNoYTI1NiAgMWZkZjAwNDUyMGM3OWUzYTI0NGNmOTY4ODYx
NjI5MzUxNmMxMTc5M2Q3NDZjNzYxZjM2NzQ5NmViM2QwNjA3NiAgQ29udmVydC1BU04xLTAuMzMu
dGFyLmd6Cj4gKyMgcmV0cmlldmVkIGJ5IHNjYW5jcGFuIGZyb20gaHR0cHM6Ly9jcGFuLm1ldGFj
cGFuLm9yZy8KPiArbWQ1ICBjY2E2MzA4OGZkZDVjMzY2NWEyMTE5ZWUyOTEzM2Y2YSAgQ29udmVy
dC1BU04xLTAuMzQudGFyLmd6Cj4gK3NoYTI1NiAgYTYyOGQ3YzlkMzkwNTY4ZmI3NjM1OTk3NWZh
MDNmNjI2Y2U1N2YxMGRjMTc5ODBlOGUzNTg3ZDc3MTNlNGVlNyAgQ29udmVydC1BU04xLTAuMzQu
dGFyLmd6Cj4gIAo+ICAjIGNvbXB1dGVkIGJ5IHNjYW5jcGFuCj4gLXNoYTI1NiAgNzA4ODRiMTlh
MzUzN2JmMTc5NTM4YzNiN2Q3ODk2YTU2YWRlNTA5ZGFmZTZiOGQ1NDVjNTk5OWE5YzA1ZjhhOSAg
TElDRU5TRQo+ICtzaGEyNTYgIGFhOGFlMjg4OThhM2UxNjRlZDUyNzNjM2U0ZmQ0YmQ0NWI0MmY3
OTU4ZjI4MjMxOGRmMDY3NzMzNDBlMmM5ZDQgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9wZXJsLWNvbnZlcnQtYXNuMS9wZXJsLWNvbnZlcnQtYXNuMS5tayBiL3BhY2thZ2UvcGVybC1j
b252ZXJ0LWFzbjEvcGVybC1jb252ZXJ0LWFzbjEubWsKPiBpbmRleCBhZmZlNzc1YWMuLmQ4YzRi
NjVlMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BlcmwtY29udmVydC1hc24xL3BlcmwtY29udmVy
dC1hc24xLm1rCj4gKysrIGIvcGFja2FnZS9wZXJsLWNvbnZlcnQtYXNuMS9wZXJsLWNvbnZlcnQt
YXNuMS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gIAo+IC1QRVJMX0NPTlZFUlRfQVNOMV9WRVJTSU9OID0gMC4zMwo+ICtQRVJMX0NPTlZFUlRf
QVNOMV9WRVJTSU9OID0gMC4zNAo+ICBQRVJMX0NPTlZFUlRfQVNOMV9TT1VSQ0UgPSBDb252ZXJ0
LUFTTjEtJChQRVJMX0NPTlZFUlRfQVNOMV9WRVJTSU9OKS50YXIuZ3oKPiAgUEVSTF9DT05WRVJU
X0FTTjFfU0lURSA9ICQoQlIyX0NQQU5fTUlSUk9SKS9hdXRob3JzL2lkL1QvVEkvVElNTEVHR0UK
PiAgUEVSTF9DT05WRVJUX0FTTjFfTElDRU5TRSA9IEFydGlzdGljIG9yIEdQTC0xLjArCj4gLS0g
Cj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Ci0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGlt
ZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICsz
MyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAg
X19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0t
LS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
