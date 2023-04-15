Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6484C77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 17:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 876A0840AB;
	Sat, 15 Apr 2023 17:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 876A0840AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4z2728PprpN; Sat, 15 Apr 2023 17:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B835884068;
	Sat, 15 Apr 2023 17:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B835884068
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD591C403E
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3E7A60E7C
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E7A60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkcD3ePldXez for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 17:23:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A70960E72
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A70960E72
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 17:23:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 247F25FF9E;
 Sat, 15 Apr 2023 19:23:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 19:23:22 +0200
Date: Sat, 15 Apr 2023 19:23:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20230415172322.GQ2819@scaer>
References: <20230411074839.98830-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411074839.98830-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681579405;
 bh=on+c8eYtIv4SHrAnOwzOVm8hBRlXqgP18fwpJ4SwgKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lOtdGA7omn9ZFKn+GagTqscKrsyz/n2dpgytrt2oXcd/UqfvFbAlNhDI1yjv4iK5A
 8MnC0U2nqXkAEYKosYxZIrupU4PDk6uZPHPaByX9CSb2Iq1NDtLEqzlXU7rR7ijskH
 1NSjxk5QpIRcqYa1y+xBs1AFubi3Iq1jpmEBUDiWPWn92TfFubHkjviXo5BU2Xx6Ch
 OeFhtF+Yy6+Y7yIQtorliZvNbI/iW1MXlWbU41I12g6Rj6CgPIwPU2xeswik/HTVvo
 AqVed69qp43E26JK6oZZ2DKyTnFANpxwTAIf5FyUbCeBRK553lvQcEH/AvG76rvoLM
 bqf8qYYfjYiZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lOtdGA7o
Subject: Re: [Buildroot] [PATCH 1/1] package/bubblewrap: bump to version
 0.8.0
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

QWRyacOhbiwgQWxsLAoKT24gMjAyMy0wNC0xMSAxMDo0OCArMDMwMCwgQWRyaWFuIFBlcmV6IGRl
IENhc3RybyBzcGFrZSB0aHVzbHk6Cj4gVGhpcyB2ZXJzaW9uIGFsbG93cyBkaXNhYmxpbmcgdXNh
Z2Ugb2YgbmVzdGVkIHVzZXIgbmFtZXNwYWNlcyBhbmQKPiBpbXByb3ZlcyBlcnJvciBtZXNzYWdl
cy4gUmVsZWFzZSBub3RlczoKPiAKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2J1
YmJsZXdyYXAvcmVsZWFzZXMvdGFnL3YwLjguMAo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBQ
ZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBwYWNrYWdlL2J1YmJsZXdy
YXAvYnViYmxld3JhcC5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvYnViYmxld3JhcC9idWJibGV3
cmFwLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxld3Jh
cC5oYXNoIGIvcGFja2FnZS9idWJibGV3cmFwL2J1YmJsZXdyYXAuaGFzaAo+IGluZGV4IDA0NzVm
ODg4MmEuLmFiYzY5ZDk2YmUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9idWJibGV3cmFwL2J1YmJs
ZXdyYXAuaGFzaAo+ICsrKyBiL3BhY2thZ2UvYnViYmxld3JhcC9idWJibGV3cmFwLmhhc2gKPiBA
QCAtMSw1ICsxLDUgQEAKPiAtIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJzL2J1
YmJsZXdyYXAvcmVsZWFzZXMvdGFnL3YwLjcuMAo+IC1zaGEyNTYgIDc2NGFiNzEwMGJkMDM3ZWE1
M2Q0NDBkMzYyZTA5OWQ3YTQyNTk2NmJjNjJkMWYwMGFiMjZiOGZiYjg4MmE5ZGMgIGJ1YmJsZXdy
YXAtMC43LjAudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVycy9i
dWJibGV3cmFwL3JlbGVhc2VzL3RhZy92MC44LjAKPiArc2hhMjU2ICA5NTdhZDExNDlkYjkwMzNk
Yjg4ZTk4OGIxMmJjZWJlMzQ5YTQ0NWUxZWZjOGE5YjU5YWQyOTM5YTExM2QzMzNhICBidWJibGV3
cmFwLTAuOC4wLnRhci54ego+ICAKPiAgIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGEy
NTYgIGI3OTkzMjI1MTA0ZDkwZGRkODAyNGZkODM4ZmFmMzAwYmVhNWU4M2Q5MTIwM2VhYjk4ZTI5
NTEyYWNlYmQ2OWMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9idWJibGV3cmFwL2J1
YmJsZXdyYXAubWsgYi9wYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxld3JhcC5tawo+IGluZGV4IDY1
OGU2ZTExM2MuLjEwODFkYjY5N2QgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9idWJibGV3cmFwL2J1
YmJsZXdyYXAubWsKPiArKysgYi9wYWNrYWdlL2J1YmJsZXdyYXAvYnViYmxld3JhcC5tawo+IEBA
IC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1CVUJC
TEVXUkFQX1ZFUlNJT04gPSAwLjcuMAo+ICtCVUJCTEVXUkFQX1ZFUlNJT04gPSAwLjguMAo+ICBC
VUJCTEVXUkFQX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVycy9idWJibGV3cmFw
L3JlbGVhc2VzL2Rvd25sb2FkL3YkKEJVQkJMRVdSQVBfVkVSU0lPTikKPiAgQlVCQkxFV1JBUF9T
T1VSQ0UgPSBidWJibGV3cmFwLSQoQlVCQkxFV1JBUF9WRVJTSU9OKS50YXIueHoKPiAgQlVCQkxF
V1JBUF9ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgbGliY2FwCj4gLS0gCj4gMi40MC4wCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1
NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAg
ICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJ
TlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAon
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
