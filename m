Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2BCC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7E140356;
	Mon, 31 Oct 2022 10:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7E140356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t1A-2lSb6lR4; Mon, 31 Oct 2022 10:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 987EF4031E;
	Mon, 31 Oct 2022 10:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987EF4031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93B7C1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F37B60B45
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F37B60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVXRTGi3T5TL for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:46:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1F960595
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A1F960595
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:46:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4DAD9B00592;
 Mon, 31 Oct 2022 11:46:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:46:47 +0100
Date: Mon, 31 Oct 2022 11:46:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20221031104647.GZ1058960@scaer>
References: <20221030230410.982946-1-paul@crapouillou.net>
 <2N5MKR.3RVYNROA50C41@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2N5MKR.3RVYNROA50C41@crapouillou.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667213210;
 bh=mlPm/wvPZcEQ+pYMVlmvUaQJJAAun/n3DMx0F9iR8ek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZVtb3ItAWxg6Rok6sL5D87MZ3YE4aBjEV0mxvXGslgCfpxyh4ROiBRnEaOaRgM6HQ
 plbvBTYBCldg4QyQ5yVeAlQ77l6zCpm6g3sDlNdHNoyV9zp4c+xqWoVa7yiIWep7UE
 q2bXfASXJiJQtoi/8muRlOMdmf95aqcUKHL8LdK8yBrZlZQB8MBHnaeGgS/N+02BBr
 2ciFdYBTHG+YWGYz0dc3Bv5lg4F+PxiaJxmMJdCdTxj4IhOmx4cef+lHYZ7e9Vmyt4
 XpW72Hk1HTiZbZuQAkZ7ie2aU5+uoH9IZQO9msqLKlVlC78SfWwoxcPdP1upiJOncR
 MZB0DrLTEYOBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZVtb3ItA
Subject: Re: [Buildroot] [PATCH 1/1] package/glmark2: add patch to fix GCC
 12 build
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

UGF1bCwgQWxsLAoKT24gMjAyMi0xMC0zMSAxMDo0MCArMDAwMCwgUGF1bCBDZXJjdWVpbCBzcGFr
ZSB0aHVzbHk6Cj4gTGUgZGltLiAzMCBvY3QuIDIwMjIgw6AgMjM6MDQ6MTAgKzAwMDAsIFBhdWwg
Q2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IGEgw6ljcml0IDoKPiA+QWRkIGEgcGF0
Y2ggY2hlcnJ5LXBpY2tlZCBmcm9tIHVwc3RyZWFtIHRvIGZpeCB0aGUgYnVpbGQgd2l0aCBHQ0Mg
MTIuCj4gPgo+ID5VcHN0cmVhbSBjb21taXQgaXMgZDFjYTNmNTNjOTZkYzhhNDA0OGIxN2RjMTYx
NDdhOGZhYzc4MmQ0YS4KPiA+SSBkb24ndCBrbm93IGlmIGl0IGZpeGVzIGFueSBhdXRvYnVpbGRl
ciBlcnJvcnMsIEkgbm90aWNlZCB0aGUgYnVnIHdoZW4KPiA+YnVpbGRpbmcgbG9jYWxseS4KPiA+
Cj4gPlNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+
ID4tLS0KPiA+IC4uLmlibWF0cml4LUFkZC1taXNzaW5nLXV0aWxpdHktaW5jbHVkZS5wYXRjaCB8
IDI5ICsrKysrKysrKysrKysrKysrKysKPiA+IDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspCj4gPiBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+cGFja2FnZS9nbG1hcmsyLzAwMDItbGlibWF0
cml4LUFkZC1taXNzaW5nLXV0aWxpdHktaW5jbHVkZS5wYXRjaAo+ID4KPiA+ZGlmZiAtLWdpdAo+
ID5hL3BhY2thZ2UvZ2xtYXJrMi8wMDAyLWxpYm1hdHJpeC1BZGQtbWlzc2luZy11dGlsaXR5LWlu
Y2x1ZGUucGF0Y2gKPiA+Yi9wYWNrYWdlL2dsbWFyazIvMDAwMi1saWJtYXRyaXgtQWRkLW1pc3Np
bmctdXRpbGl0eS1pbmNsdWRlLnBhdGNoCj4gPm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPmluZGV4
IDAwMDAwMDAwMDAuLjJhNjU4MzkzYWUKPiA+LS0tIC9kZXYvbnVsbAo+ID4rKysgYi9wYWNrYWdl
L2dsbWFyazIvMDAwMi1saWJtYXRyaXgtQWRkLW1pc3NpbmctdXRpbGl0eS1pbmNsdWRlLnBhdGNo
Cj4gPkBAIC0wLDAgKzEsMjkgQEAKPiA+K0Zyb20gZDFjYTNmNTNjOTZkYzhhNDA0OGIxN2RjMTYx
NDdhOGZhYzc4MmQ0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+K0Zyb206IEFsZXhhbmRy
b3MgRnJhbnR6aXMgPGFsZXhhbmRyb3MuZnJhbnR6aXNAY29sbGFib3JhLmNvbT4KPiA+K0RhdGU6
IE1vbiwgMTQgRmViIDIwMjIgMTM6NTQ6MDkgKzAyMDAKPiA+K1N1YmplY3Q6IFtQQVRDSF0gbGli
bWF0cml4OiBBZGQgbWlzc2luZyA8dXRpbGl0eT4gaW5jbHVkZQo+ID4rCj4gPitGaXhlcyBjb21w
aWxhdGlvbiB3aXRoIEdDQyAxMi4KPiA+Kwo+ID4rRml4ZXMgIzE2OQo+IAo+IEZvcmdvdCBJIGhh
ZCB0byBzaWduIHRoZSBwYXRjaCB0b286Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8
cGF1bEBjcmFwb3VpbGxvdS5uZXQ+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJk
cywKWWFubiBFLiBNT1JJTi4KCj4gPistLS0KPiA+KyBVcHN0cmVhbSBjb21taXQ6IGQxY2EzZjUz
Yzk2ZGM4YTQwNDhiMTdkYzE2MTQ3YThmYWM3ODJkNGEKPiA+Kwo+ID4rIHNyYy9saWJtYXRyaXgv
cHJvZ3JhbS5oIHwgMSArCj4gPisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPisK
PiA+K2RpZmYgLS1naXQgYS9zcmMvbGlibWF0cml4L3Byb2dyYW0uaCBiL3NyYy9saWJtYXRyaXgv
cHJvZ3JhbS5oCj4gPitpbmRleCBmOTViNDcwLi4xYzlkZTA4IDEwMDY0NAo+ID4rLS0tIGEvc3Jj
L2xpYm1hdHJpeC9wcm9ncmFtLmgKPiA+KysrKyBiL3NyYy9saWJtYXRyaXgvcHJvZ3JhbS5oCj4g
PitAQCAtMTUsNiArMTUsNyBAQAo+ID4rICNpbmNsdWRlIDxzdHJpbmc+Cj4gPisgI2luY2x1ZGUg
PHZlY3Rvcj4KPiA+KyAjaW5jbHVkZSA8bWFwPgo+ID4rKyNpbmNsdWRlIDx1dGlsaXR5Pgo+ID4r
ICNpbmNsdWRlICJtYXQuaCIKPiA+Kwo+ID4rIC8vIFNpbXBsZSBzaGFkZXIgY29udGFpbmVyLiAg
QWJzdHJhY3RzIGFsbCBvZiB0aGUgT3BlbkdMIGJpdHMsIGJ1dAo+ID5sZWF2ZXMKPiA+Ky0tCj4g
PisyLjM1LjEKPiA+Kwo+ID4tLQo+ID4yLjM1LjEKPiA+Cj4gCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
