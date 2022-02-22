Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A9CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 20:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC56981B04;
	Tue, 22 Feb 2022 20:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IkskUli8NG9; Tue, 22 Feb 2022 20:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 062CA8199D;
	Tue, 22 Feb 2022 20:52:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 496161BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 457B260767
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0UX2xz4Bt-8 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 20:52:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E464D6064D
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:52:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f0be:eb0a:9f13:7f4d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 29D21B0037C;
 Tue, 22 Feb 2022 21:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645563122;
 bh=3djyOnsn5iYv3Ar2jT2K8ErdBm/HdpJXgKoyFCg4vTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Utp6ioolLUajoiV1lYVV6H6flKgCkGurR4hXa4YJtFZ06Q7X1mb9ApenUgT53zr82
 ShVVkyE3FDe8+Ub04U5sJ6wb8ISkIvYQ7wFUGLMlBEn6+qJ4eLOpwCT61+wbomp5tZ
 /5R06DKUszBA00gl45cND9MIzzFqDLooSdyN5OH5fABxjN3M3cPcyyVlzMP/yeUmoH
 byQaQWD2lNnzUbD4xtoJIiXKfVYrMF2uUztzDtduZ04hNZIto+WZtIQ8NKsCtREW81
 xTGUTaoXHrmHHtIzQRSVNvlw772TcAwqJLOKCVaO0Zr5rBlXHCO54N5DYcFlLQuaUa
 0bd75Sx4bjVMA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 21:51:56 +0100
Date: Tue, 22 Feb 2022 21:51:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <20220222205156.GA50412@scaer>
References: <20220222195854.11842-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222195854.11842-1-abrodkin@synopsys.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/qt5/qt5webkit: needs OpenSSL
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxleGV5LCBBbGwsCgpPbiAyMDIyLTAyLTIyIDIyOjU4ICswMzAwLCBBbGV4ZXkgQnJvZGtpbiBz
cGFrZSB0aHVzbHk6Cj4gVy9vIE9wZW5TU0wgUVQ1V2Via2l0IGZhaWxzIHRvIGJ1aWxkIHRoYXQg
d2F5Ogo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IC4uLi9idWlsZC9xdDV3ZWJraXQtNS4yMTIuMC1hbHBoYTQvU291cmNl
L1dlYkNvcmUvcGxhdGZvcm0vbmV0d29yay9xdC9SZXNvdXJjZVJlcXVlc3RRdC5jcHA6IEluIHN0
YXRpYyBtZW1iZXIgZnVuY3Rpb24g4oCYc3RhdGljIGJvb2wgV2ViQ29yZTo6UmVzb3VyY2VSZXF1
ZXN0OjphbHBuSXNTdXBwb3J0ZWQoKeKAmToKPiAuLi4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAt
YWxwaGE0L1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0
UXQuY3BwOjY4OjEyOiBlcnJvcjog4oCYUVNzbFNvY2tldOKAmSBoYXMgbm90IGJlZW4gZGVjbGFy
ZWQKPiAgICA2OCB8ICAgICByZXR1cm4gUVNzbFNvY2tldDo6c3NsTGlicmFyeVZlcnNpb25OdW1i
ZXIoKSA+IDB4MTAwMDIwMDBMICYmCj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn4KPiAu
Li4vYnVpbGQvcXQ1d2Via2l0LTUuMjEyLjAtYWxwaGE0L1NvdXJjZS9XZWJDb3JlL3BsYXRmb3Jt
L25ldHdvcmsvcXQvUmVzb3VyY2VSZXF1ZXN0UXQuY3BwOjY5Ojk6IGVycm9yOiDigJhRU3NsU29j
a2V04oCZIGhhcyBub3QgYmVlbiBkZWNsYXJlZAo+ICAgIDY5IHwgICAgICAgICBRU3NsU29ja2V0
Ojpzc2xMaWJyYXJ5VmVyc2lvblN0cmluZygpLnN0YXJ0c1dpdGgoUUxhdGluMVN0cmluZygiT3Bl
blNTTCIpKTsKPiAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tPjgtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhleSBCcm9ka2luIDxhYnJvZGtpbkBzeW5vcHN5cy5jb20+Cj4gQ2M6IEZh
YnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+IENjOiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiBDYzogUGV0ZXIgU2VpZGVyZXIg
PHBzLnJlcG9ydEBnbXgubmV0Pgo+IENjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4KPiAtLS0KPiAgcGFja2FnZS9xdDUvcXQ1d2Via2l0L0NvbmZpZy5pbiB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9xdDUvcXQ1d2Via2l0L0NvbmZpZy5pbiBiL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC9Db25maWcu
aW4KPiBpbmRleCBlZDg3ZWZjYTk1Li4yNmMzODk3ZDFkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
cXQ1L3F0NXdlYmtpdC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvQ29u
ZmlnLmluCj4gQEAgLTE1LDYgKzE1LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1FUNVdFQktJVAo+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0pQRUcKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MRVZFTERC
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCUE5HCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfT1BF
TlNTTAoKWW91IGZvcmdvdCB0byBhZGQgaXQgdG8gUVQ1V0VCS0lUX0RFUEVOREVOQ0lFUy4uLgoK
UmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUVQ1QkFTRV9J
Q1UKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9RVDVCQVNFX0dVSQo+ICAJc2VsZWN0IEJSMl9QQUNL
QUdFX1FUNUJBU0VfV0lER0VUUwo+IC0tIAo+IDIuMjUuMQo+IAoKLS0gCi4tLS0tLS0tLS0tLS0t
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
