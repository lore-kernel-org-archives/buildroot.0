Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88140C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 14:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B70F60BEA;
	Sun, 14 Aug 2022 14:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B70F60BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zERjWSY11VHp; Sun, 14 Aug 2022 14:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B82160BDD;
	Sun, 14 Aug 2022 14:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B82160BDD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBF521BF2BC
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F0E82980
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 14:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F0E82980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8QiiOk7K8Pb for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 14:49:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8129A828DD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8129A828DD
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 14:49:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1718E6012F;
 Sun, 14 Aug 2022 16:49:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 16:49:47 +0200
Date: Sun, 14 Aug 2022 16:49:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220814144947.GB2775145@scaer>
References: <20220814125534.1227844-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814125534.1227844-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660488590;
 bh=Y8+skSajdKbM+ekuMxKSYyyLEE8c65hruwRABLWZOeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aImbchytVnmp4DRVHRZfqYR8xVZY+GBG2TWdg+p2UPkqp1WsWMbLGwNGaeEO5D5+t
 jFcK9teYuAXnXEPO1oUtkJGz/OsBjD9zjKYu+SJ3han4/SvBF4da4kJb5lD67aqyLA
 +BUQRgAh3XI9NfHtIfZeIxP8hbLuNAiTpuFsPEa8k9YaRZrJJZ41s0N25RfIJWn4Kg
 GyUlktEnv8hrhQ8Qv+xPV3hi1OgQLzRJDy1f8DO8UAOKQWat2sIJ8+j86Z7Rzl9Lqu
 DVD8Wqdi7ulQnHszPKJsEEHbvfzGayNj18EyHM8aHxPUlD0iwtTVDzDGw5mbZungD/
 RhucRHVQ8OCug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aImbchyt
Subject: Re: [Buildroot] [PATCH] package/gdk-pixbuf: bump to version 2.42.9
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTA4LTE0IDE0OjU1ICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9nZGstcGl4YnVmL2dkay1waXhidWYuaGFz
aCB8IDQgKystLQo+ICBwYWNrYWdlL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi5tayAgIHwgMiArLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nZGstcGl4YnVmL2dkay1waXhidWYuaGFzaCBiL3BhY2thZ2Uv
Z2RrLXBpeGJ1Zi9nZGstcGl4YnVmLmhhc2gKPiBpbmRleCA0YmIyNDZhYTUuLjM1MDg0YTUwYSAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi5oYXNoCj4gKysrIGIv
cGFja2FnZS9nZGstcGl4YnVmL2dkay1waXhidWYuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+IC0j
IEZyb20gaHR0cHM6Ly9mdHAuZ25vbWUub3JnL3B1Yi9nbm9tZS9zb3VyY2VzL2dkay1waXhidWYv
Mi40Mi9nZGstcGl4YnVmLTIuNDIuOC5zaGEyNTZzdW0KPiAtc2hhMjU2ICA4NGFjZWEzYWNiMjQx
MWIyOTEzNGIzMjAxNWE1YjFhYWE2Mjg0NGIxOWM0YjFlZjhiODk3MWM2YjA3NTlmNGM2ICBnZGst
cGl4YnVmLTIuNDIuOC50YXIueHoKPiArIyBGcm9tIGh0dHBzOi8vZnRwLmdub21lLm9yZy9wdWIv
Z25vbWUvc291cmNlcy9nZGstcGl4YnVmLzIuNDIvZ2RrLXBpeGJ1Zi0yLjQyLjkuc2hhMjU2c3Vt
Cj4gK3NoYTI1NiAgMjhmNzk1OGU3YmYyOWEzMmQ0ZTk2MzU1NmQyNDFkMGE0MWE2Nzg2NTgyZmY2
YTVhZDExNjY1ZTAzNDdmYzk2MiAgZ2RrLXBpeGJ1Zi0yLjQyLjkudGFyLnh6Cj4gIHNoYTI1NiAg
ZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4YWIw
MzJmZTU1MSAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dkay1waXhidWYvZ2RrLXBp
eGJ1Zi5tayBiL3BhY2thZ2UvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmLm1rCj4gaW5kZXggNTdlOGJi
ZDUxLi43YTc1ZWQyM2YgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nZGstcGl4YnVmL2dkay1waXhi
dWYubWsKPiArKysgYi9wYWNrYWdlL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi5tawo+IEBAIC01LDcg
KzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAgR0RLX1BJWEJVRl9WRVJT
SU9OX01BSk9SID0gMi40Mgo+IC1HREtfUElYQlVGX1ZFUlNJT04gPSAkKEdES19QSVhCVUZfVkVS
U0lPTl9NQUpPUikuOAo+ICtHREtfUElYQlVGX1ZFUlNJT04gPSAkKEdES19QSVhCVUZfVkVSU0lP
Tl9NQUpPUikuOQo+ICBHREtfUElYQlVGX1NPVVJDRSA9IGdkay1waXhidWYtJChHREtfUElYQlVG
X1ZFUlNJT04pLnRhci54ego+ICBHREtfUElYQlVGX1NJVEUgPSBodHRwOi8vZnRwLmdub21lLm9y
Zy9wdWIvZ25vbWUvc291cmNlcy9nZGstcGl4YnVmLyQoR0RLX1BJWEJVRl9WRVJTSU9OX01BSk9S
KQo+ICBHREtfUElYQlVGX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiAtLSAKPiAyLjM0LjEKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
