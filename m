Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0EAEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20BD54190E;
	Tue, 25 Jul 2023 21:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20BD54190E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWYk9kJDz5eh; Tue, 25 Jul 2023 21:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E0741907;
	Tue, 25 Jul 2023 21:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E0741907
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005DB1BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEBE08209B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEBE08209B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s8lihptRqP6o for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:10:39 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 256C182099
 for <buildroot@busybox.net>; Tue, 25 Jul 2023 21:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256C182099
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BC3CA780316;
 Tue, 25 Jul 2023 23:10:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 23:10:33 +0200
Date: Tue, 25 Jul 2023 23:10:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230725211033.GT3544423@scaer>
References: <20230725103053.941474-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725103053.941474-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690319436;
 bh=sqAeXmFA2LjUcZVVu8JFWqZb6r0ZONPbJmzGA3rLi8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=igbj17w49mBAJsnrTdez84UsrTIIKfMmMPDSNfyUWUbtnzVJswTZBeQwpXWLT5N3X
 BAgezX9wwHv8S5ov28zq/S0+0I5Hc1jcTGi0dbgHDaDSTEUK8urqeUzIp9zImZB1AY
 oQGLWyolZ98+KKBO2R8h74NED9DkgmWfnvXXePNAEJCX9U+lqIQOBoFfO1FaJ/Xywy
 dx8whbcogbFDEUL+aEgtg+ux0tYY6CFzWbrYH+8aajRToNZH8WZRvqlNDrUhZBtT6H
 mauOHG5GEe6PTtTIc/72r0fU/OeoKLoIOIUfBrxFJY2iBpnk8MG2qdTLyYw9GWwFPC
 YW/ENDtaIGR8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=igbj17w4
Subject: Re: [Buildroot] [PATCH] package/jpeg-turbo: bump to version 2.1.5
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIzLTA3LTI1IDEyOjMwICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IGRpZmYgTElDRU5TRS5tZAo+IC1Db3B5cmlnaHQgKEMpMjAwOS0y
MDIyIEQuIFIuIENvbW1hbmRlci4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuPGJyPgo+ICtDb3B5cmln
aHQgKEMpMjAwOS0yMDIzIEQuIFIuIENvbW1hbmRlci4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuPGJy
PgoKQ29tbWl0IGxvZ3MgYXJlIG1lYW50IHRvIGJlIHJlYWQgYnkgaHVtYW5zLCBub3QgbWFjaGlu
ZXMsIHNvIHRoZXkgc2hvdWxkCmJlIG1hZGUgb2Ygc2VudGVuY2VzLCBsaWtlOwoKICAgIFVwZGF0
ZSBsaWNlbnNlIGhhc2ggZHVlIHRvIGNvcHlyaWdodCB5ZWFyIHVwZGF0ZSAoMjAyMiAtPiAyMDIz
KS4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoK
PiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9y
Zz4KPiAtLS0KPiAgcGFja2FnZS9qcGVnLXR1cmJvL2pwZWctdHVyYm8uaGFzaCB8IDEwICsrKysr
LS0tLS0KPiAgcGFja2FnZS9qcGVnLXR1cmJvL2pwZWctdHVyYm8ubWsgICB8ICAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2pwZWctdHVyYm8vanBlZy10dXJiby5oYXNoIGIvcGFja2FnZS9qcGVn
LXR1cmJvL2pwZWctdHVyYm8uaGFzaAo+IGluZGV4IDZlMTI3OGI0OC4uYTkyOWFlNGRjIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvanBlZy10dXJiby9qcGVnLXR1cmJvLmhhc2gKPiArKysgYi9wYWNr
YWdlL2pwZWctdHVyYm8vanBlZy10dXJiby5oYXNoCj4gQEAgLTEsNyArMSw3IEBACj4gLSMgRnJv
bSBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9saWJqcGVnLXR1cmJvL2ZpbGVzLzIu
MS40Lwo+IC1zaGExICA1YTM1NWMwOGNhYTMyNmNlZjdjMmE2MWUwNjJlZGZlOGRkMDJhYzA3ICBs
aWJqcGVnLXR1cmJvLTIuMS40LnRhci5nego+IC1tZDUgIDMyNDFiNTQwMTZjNDQ1ZTVkOGYwZWJi
MGFkOTI5NGVkICBsaWJqcGVnLXR1cmJvLTIuMS40LnRhci5nego+ICsjIEZyb20gaHR0cHM6Ly9z
b3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvbGlianBlZy10dXJiby9maWxlcy8yLjEuNS8KPiArc2hh
MSAgZWRhYjA3MWU3YzViYzEyZjk4YTJhN2FlNDk5YmQ2YjMxMjc3MDg0OSAgbGlianBlZy10dXJi
by0yLjEuNS50YXIuZ3oKPiArbWQ1ICAxYzZlOWY4NTUwYTgyYzZkNGNkMzBiMzcwYzIyYTVmZCAg
bGlianBlZy10dXJiby0yLjEuNS50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1
NiAgZDNlZDI2YTExMzFhMTM2ODZkZmNhNDkzNWU1MjBlYjdjOTBhZTc2ZmJjNDVkOThiYjUwYThk
Yzg2MjMwMzQyYiAgbGlianBlZy10dXJiby0yLjEuNC50YXIuZ3oKPiAtc2hhMjU2ICBlZTFlYWYx
OTRkNTkyNGI2MzYwYWY4YTZiYTZhNGUxNTU0MDM3MDkxZjc1MDU5NDMzMDBjZGVlYzY1ZjFhZWJi
ICBMSUNFTlNFLm1kCj4gK3NoYTI1NiAgYmMxMmJjOWRjZTU1MzAwYzZiZjQzNDJiYzIzM2JjYzI2
YmQzOGJmMjg5ZWVkZjE0NzM2MGQ3MzFjNjY4ZGRhZiAgbGlianBlZy10dXJiby0yLjEuNS50YXIu
Z3oKPiArc2hhMjU2ICA2MGM3NTY3NDJkYjNhZDE5MTMzMDRlOGIxM2YwZTg2ZTIyZTUxYWRiNTBj
YzBiMzMzM2MxNjNmN2U0NWNlZWMxICBMSUNFTlNFLm1kCj4gIHNoYTI1NiAgNGI3YjlmOGMwM2Ji
OGQ2MDI3MGRmZDEyNjg0ZTcwYWIyMWU0YWJmZDI3ZTczOTA1Y2QxYTdjNGNhZTZmNWNkYiAgUkVB
RE1FLmlqZwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2pwZWctdHVyYm8vanBlZy10dXJiby5tayBi
L3BhY2thZ2UvanBlZy10dXJiby9qcGVnLXR1cmJvLm1rCj4gaW5kZXggZTViYzhlN2NmLi41ZTgw
NjE1NmUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9qcGVnLXR1cmJvL2pwZWctdHVyYm8ubWsKPiAr
KysgYi9wYWNrYWdlL2pwZWctdHVyYm8vanBlZy10dXJiby5tawo+IEBAIC00LDcgKzQsNyBAQAo+
ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1KUEVHX1RVUkJPX1ZFUlNJT04g
PSAyLjEuNAo+ICtKUEVHX1RVUkJPX1ZFUlNJT04gPSAyLjEuNQo+ICBKUEVHX1RVUkJPX1NPVVJD
RSA9IGxpYmpwZWctdHVyYm8tJChKUEVHX1RVUkJPX1ZFUlNJT04pLnRhci5nego+ICBKUEVHX1RV
UkJPX1NJVEUgPSBodHRwczovL2Rvd25sb2Fkcy5zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdC9saWJq
cGVnLXR1cmJvLyQoSlBFR19UVVJCT19WRVJTSU9OKQo+ICBKUEVHX1RVUkJPX0xJQ0VOU0UgPSBJ
SkcgKGxpYmpwZWcpLCBCU0QtMy1DbGF1c2UgKFR1cmJvSlBFRyksIFpsaWIgKFNJTUQpCj4gLS0g
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
