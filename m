Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06430C25B10
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 15:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEB5541F9D;
	Fri,  3 May 2024 15:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vp4jltqDbio; Fri,  3 May 2024 15:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB5141FAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB5141FAA;
	Fri,  3 May 2024 15:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8C871BF30D
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58E64031E
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 15:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVKANUEAO_kJ for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 15:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83A30401DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A30401DD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83A30401DD
 for <buildroot@buildroot.org>; Fri,  3 May 2024 15:32:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CB24813F8BA;
 Fri,  3 May 2024 17:32:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 03 May 2024 17:32:14 +0200
Date: Fri, 3 May 2024 17:32:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan =?utf-8?Q?M=C3=BCller?= <stefan.mueller@rey-technology.com>
Message-ID: <ZjUDfla_cDBWzc-I@landeda>
References: <ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2@ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZR0P278MB0201C028ACBF4BFB1CEE9FB0BF1F2@ZR0P278MB0201.CHEP278.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714750336;
 bh=fdLzTw2r/BCclqztQult9dC7Nn2fQ5hV6gnFZb9x12g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tqUA/hfZ2YZVc3/yKSuLl6aSMEjbosLFv9zd3+1LrMztgD2Z5dfm6qzZuugvamkYN
 xibfRGbW15v5wphWaawuPykB6mXanKipY0I/wYhoEk+s8g0lugIcUzVVNGzCxYcjeV
 40cYg0TKk65CFzItNYZ5z1t7K7Xv8xwVhRgErZC0nAifUDxO8ADOHiYQ9sOYjRJHCF
 7aEyUOPuuGzix/+BEowC8X7AuCzyEnJZQhp9Ew45f0Q3+r5mES7JOLozgl7V+Rdu3o
 WsJSVwIi9HslnzsNoZFzkXS2foFzfMlGBKFJ+kJu69He58k8aPFnXV+zTQFzygDv0r
 30w5aGtCgU4/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tqUA/hfZ
Subject: Re: [Buildroot] question: used wrong librarys to build packages
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U3RlZmFuLCBBbGwsCgpPbiAyMDI0LTA1LTAzIDA3OjQyICswMDAwLCBTdGVmYW4gTcO8bGxlciB2
aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBob3cgaXMgaXQgcG9zc2libGUgdGhhdCBidWls
ZHJvb3QgYnVpbGRzIHBhY2thZ2VzIGFuZCBsaW5rcyB0aGVtIGFnYWluc3QKPiBsaWJyYXJpZXMg
dGhhdCBkbyBub3QgZXhpc3QgaW4gYnVpbGRyb290IChvbmx5IG9uIHRoZSBob3N0IHN5c3RlbSwg
bm90IGJlbG93Cj4gdGhlIGJ1aWxkcm9vdCBkaXJlY3RvcnkpPyAtIGkgYW0gYSBiaXQgY29uZnVz
ZWQgbm93Lgo+IAo+IGkgZG93bmxvYWRlZCBidWlsZHJvb3QgMjAyNC4wMi4wMSBhbmQganVzdCBj
b3BpZWQgbXkgY29uZmlncyBpbnRvIGl0Lgo+IAo+IG1hbnkgb2YgdGhlIGJ1aWx0IHBhY2thZ2Vz
IGFyZSBub3cgbGlua2VkIGFnYWluc3QgbGlic3NsLnNvLjEuMSAoYnV0IGJ1aWRyb290Cj4gdXNl
cyBvcGVuc3NsIDMpOgo+IAo+IGV4YW1wbGU6Cj4gCj4gYnVpbGRAYnVpbGQ6fi9idWlsZHJvb3Qv
b3V0cHV0L3RhcmdldC91c3Ivc2JpbiQgbGRkIE5ldHdvcmtNYW5hZ2VyCgpVc2luZyB0aGUgaG9z
dCAnbGRkJyBkb2VzIG5vdCB3b3JrIG9uIHRhcmdldCBiaW5hcmllcywgYmVjYXN1ZSBpdCBkb2Vz
Cm5vdCBrbm93IHRoYXQgdGhleSBhcmUgbm90IG1lYW50IGZvciB0aGUgY3VycmVudCBtYWNoaW5l
LgoKSW4gZmFjdCwgJ2xkZCcgaXMganVzdCBhIGdsb3JpZmllZCB3cmFwcGVyIHRoYXQgYmFzaWNh
bGx5IGlzIGVxdWl2bGFuZXQKdG8gYWN0dWFsbHkgcnVubmluZyB0aGUgZmlsZSB3aXRoIExEX1RS
QUNFX0xPQURFRF9PQkpFQ1RTPTEgaW4gdGhlCmVudmlyb25tZW50OgoKICAgICQgbGRkIC91c3Iv
YmluL2xzCiAgICAgICAgbGludXgtdmRzby5zby4xICgweDAwMDA3ZmZmMDJkMzEwMDApCiAgICAg
ICAgbGlic2VsaW51eC5zby4xID0+IC9saWI2NC9saWJzZWxpbnV4LnNvLjEgKDB4MDAwMDdmNWY5
NTY0YjAwMCkKICAgICAgICBsaWJjYXAuc28uMiA9PiAvbGliNjQvbGliY2FwLnNvLjIgKDB4MDAw
MDdmNWY5NTY0MTAwMCkKICAgICAgICBsaWJjLnNvLjYgPT4gL2xpYjY0L2xpYmMuc28uNiAoMHgw
MDAwN2Y1Zjk1NDVmMDAwKQogICAgICAgIGxpYnBjcmUyLTguc28uMCA9PiAvbGliNjQvbGlicGNy
ZTItOC5zby4wICgweDAwMDA3ZjVmOTUzYzQwMDApCiAgICAgICAgL2xpYjY0L2xkLWxpbnV4LXg4
Ni02NC5zby4yICgweDAwMDA3ZjVmOTU2YjYwMDApCgogICAgJCBMRF9UUkFDRV9MT0FERURfT0JK
RUNUUz0xIC91c3IvYmluL2xzCiAgICAgICAgbGludXgtdmRzby5zby4xICgweDAwMDA3ZmZmMGMz
NDUwMDApCiAgICAgICAgbGlic2VsaW51eC5zby4xID0+IC9saWI2NC9saWJzZWxpbnV4LnNvLjEg
KDB4MDAwMDdmN2RjMWIyYzAwMCkKICAgICAgICBsaWJjYXAuc28uMiA9PiAvbGliNjQvbGliY2Fw
LnNvLjIgKDB4MDAwMDdmN2RjMWIyMjAwMCkKICAgICAgICBsaWJjLnNvLjYgPT4gL2xpYjY0L2xp
YmMuc28uNiAoMHgwMDAwN2Y3ZGMxOTQwMDAwKQogICAgICAgIGxpYnBjcmUyLTguc28uMCA9PiAv
bGliNjQvbGlicGNyZTItOC5zby4wICgweDAwMDA3ZjdkYzE4YTUwMDApCiAgICAgICAgL2xpYjY0
L2xkLWxpbnV4LXg4Ni02NC5zby4yICgweDAwMDA3ZjdkYzFiNzEwMDApCgpTbyB5b3UgY2FuJ3Qg
dXNlIGxkZCBvbiB0YXJnZXQgZXhlY3V0YWJsZXM6IGl0IHdvbid0IHdvcmsuCgpBbHNvLCB1c2lu
ZyBsZGQgaXMgcmVhbGx5IGEgYmFkIGlkZWEsIGFzIGl0IGlzIGJhc2ljYWxseSBlcXVpdmFsZW50
IHRvCmFjdHVhbGx5IHJ1bm5pbmcgdGhlIHByb2dyYW0geW91J3JlIGluc3BlY3Rpbmc7IGRvbid0
IGRvIGl0LiBJbnN0ZWFkIHVzZQpyZWFkZWxmIHRvIGluc3BlY3QgYSBwcm9ncmFtOgoKICAgICQg
cmVhZGVsZiAtZCAvdXNyL2Jpbi9scwogICAgRHluYW1pYyBzZWN0aW9uIGF0IG9mZnNldCAweDIy
OWQ4IGNvbnRhaW5zIDI5IGVudHJpZXM6CiAgICAgIFRhZyAgICAgICAgVHlwZSAgICAgICAgICAg
ICAgICAgICAgICAgICBOYW1lL1ZhbHVlCiAgICAgMHgwMDAwMDAwMDAwMDAwMDAxIChORUVERUQp
ICAgICAgICAgICAgIFNoYXJlZCBsaWJyYXJ5OiBbbGlic2VsaW51eC5zby4xXQogICAgIDB4MDAw
MDAwMDAwMDAwMDAwMSAoTkVFREVEKSAgICAgICAgICAgICBTaGFyZWQgbGlicmFyeTogW2xpYmNh
cC5zby4yXQogICAgIDB4MDAwMDAwMDAwMDAwMDAwMSAoTkVFREVEKSAgICAgICAgICAgICBTaGFy
ZWQgbGlicmFyeTogW2xpYmMuc28uNl0KICAgIFsuLi5dCgogICAgJCByZWFkZWxmIC1wIC5pbnRl
cnAgL3Vzci9iaW4vbHMKICAgIFN0cmluZyBkdW1wIG9mIHNlY3Rpb24gJy5pbnRlcnAnOgogICAg
ICBbICAgICAwXSAgL2xpYjY0L2xkLWxpbnV4LXg4Ni02NC5zby4yCgo+IC4vTmV0d29ya01hbmFn
ZXI6IC9saWIveDg2XzY0LWxpbnV4LWdudS9saWJjLnNvLjY6IHZlcnNpb24gYEdMSUJDXzIuMzMn
IG5vdAo+IGZvdW5kIChyZXF1aXJlZCBieSAuL05ldHdvcmtNYW5hZ2VyKQoKQXMgeW91IGNhbiBz
ZWU6CgogMS4gaXQgdXNlcyB5b3VyIGhvc3Qgc3lzdGVtIGludGVycHJldGVyLCAvbGliL3g4Nl82
NC1saW51eC1nbnUvbGliYy5zby42CiAyLiBpdCByZXBvcnRzIHVua25vd24gdmVyc2lvbmVkIHN5
bWJvbHMsIHByZXN1bWFibHkgYmVjYXVzZSB5b3VyIHN5c3RlbQogICAgdXNlcyBhbiBvbGRlciBn
bGliYyB0aGFuIHlvdXIgdGFyZ2V0IHN5c3RlbS4KCj4gc2hvdWxkbid0IGJ1aWxkcm9vdCB1c2Ug
dGhlIGxpYnJhcmllcyB0aGF0IGFyZSBpbnNpZGUgdGhlIGJ1aWxkcm9vdCBkaXJlY3Rvcnk/CgpJ
dCBkb2VzLCBidXQgeW91IGFyZSB1c2luZyB0aGUgd3JvbmcgdG9vbHMgdG8gY2hlY2suCgo+IENh
biBhbnlvbmUgaGVscCBtZSBmaW5kIG91dCB3aGF0IGlzIHdyb25nPwoKSSBob3BlIHRoZSBhYm92
ZSBpcyBwcm92aWRpbmcgZW5vdWdoIGhpbnRzIGF0IGhvdyB0byBsb29rLgoKUmVnYXJkcywKWWFu
biBFLiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklO
ICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3Bp
cmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0t
LS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
