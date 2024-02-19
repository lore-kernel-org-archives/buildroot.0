Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032EFC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B309240242;
	Mon, 19 Feb 2024 20:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pydpCPNJlvR; Mon, 19 Feb 2024 20:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 612B140B98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 612B140B98;
	Mon, 19 Feb 2024 20:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 931D31BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C3FB81FBE
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkFxQhv9viYv for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BC0481FBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC0481FBD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC0481FBD
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:54:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9E0F213F8AD;
 Mon, 19 Feb 2024 21:53:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Feb 2024 21:53:56 +0100
Date: Mon, 19 Feb 2024 21:53:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZdO_5BmIbcTSFnxk@landeda>
References: <20240219113028.607141-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219113028.607141-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708376041;
 bh=1fzuWXMGUb7u3FVIBT4sHbTZBXtxgeVMKBTKoeABF3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qs7Yo2t+PY9uQH+pwGpH1PBa7fBMMRQ+JIhucH8g1rPkqYUgJBg5M3vZcYbTgWktr
 Qhr/lzydKpLfNbEqr2NZMeRN1dcet3QpEc9YVJ+UzRE6IYwviv5FBzsc8TXKEQDPp8
 e6ifLBKlxQhqkUbJiCPPs4JFCmZEXTIk+uakyiWbCywg6S4xvloQrT6MIsdgEtK4B5
 t2YbDpUaJHGAagLHpnWqy0a2NiUOt/ZsUEDq700mygflTqfMo0vmSztrUmOi4NDJBY
 DY0IqoWZbK3EUyApF9RUddW/Ms/v2CxhjErvTAuhy6aedPk4X1UZ7Ru7lTo/t6QPPK
 H6kLl8RB0Xn9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qs7Yo2t+
Subject: Re: [Buildroot] [PATCH] package/python-django: add patch to fix
 crash with .pyc-only builds
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFyY3VzLCBBbGwsCgpPbiAyMDI0LTAyLTE5IDEyOjMwICswMTAwLCBNYXJjdXMgSG9mZm1hbm4g
dmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gQmFja3BvcnQgYW4gdXBzdHJlYW0gcGF0Y2gg
dGhhdCBmaXhlcyBkamFuZ28gYXV0aCBhbmQgYWRtaW4gYXBwcyBub3QKPiB3b3JraW5nIGluIC5w
eWMgb25seSBidWlsZHMuCj4gCj4gRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvNjE0ODIwOTQ1Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmN1
cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KClRoYW5rcyBmb3IgaGFuZGxpbmcgdGhlIHJlcG9ydCB3aXRoIHVwc3RyZWFtISDwn5GNCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgLi4uZC1zZW5zaXRpdmVfdmFyaWFibGVz
LXNlbnNpdGl2ZV9wb3N0LnBhdGNoIHwgNDUgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9w
eXRob24tZGphbmdvLzAwMDEtRml4ZWQtc2Vuc2l0aXZlX3ZhcmlhYmxlcy1zZW5zaXRpdmVfcG9z
dC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kamFuZ28vMDAwMS1GaXhl
ZC1zZW5zaXRpdmVfdmFyaWFibGVzLXNlbnNpdGl2ZV9wb3N0LnBhdGNoIGIvcGFja2FnZS9weXRo
b24tZGphbmdvLzAwMDEtRml4ZWQtc2Vuc2l0aXZlX3ZhcmlhYmxlcy1zZW5zaXRpdmVfcG9zdC5w
YXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOTBkYzljN2Rk
MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vMDAwMS1GaXhl
ZC1zZW5zaXRpdmVfdmFyaWFibGVzLXNlbnNpdGl2ZV9wb3N0LnBhdGNoCj4gQEAgLTAsMCArMSw0
NSBAQAo+ICtGcm9tIGQyOTRiNzY3OWYyY2I1MWM3MjMxZDZhN2ZiMjJlNzZlYjc0ZTQ5ZWMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IE1hcml1c3ogRmVsaXNpYWsgPGZlbGlzaWFr
Lm1hcml1c3pAZ21haWwuY29tPgo+ICtEYXRlOiBTYXQsIDE3IEZlYiAyMDI0IDA4OjE1OjU5ICsw
MTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4ZWQgIzM1MTg3IC0tIEZpeGVkCj4gKyBAc2Vuc2l0
aXZlX3ZhcmlhYmxlcy9zZW5zaXRpdmVfcG9zdF9wYXJhbWV0ZXJzIGRlY29yYXRvcnMgY3Jhc2gg
d2l0aAo+ICsgLnB5Yy1vbmx5IGJ1aWxkcy4KPiArCj4gK1RoYW5rcyBKb24gSmFuemVuIGZvciB0
aGUgaW1wbGVtZW50YXRpb24gaWRlYS4KPiArCj4gK1RoYW5rcyBNYXJjdXMgSG9mZm1hbm4gZm9y
IHRoZSByZXBvcnQuCj4gKwo+ICtSZWdyZXNzaW9uIGluIDM4ZTM5MWU5NWZlNTI1OGJjNmQyNDY3
MzMyZGM5Y2Q0NGNlNmJhNTIuCj4gK0JhY2twb3J0IG9mIGQxYmUwNWIzZTkyMDlmZDA3ODc4NDFj
NzFhOTU4MTlkODEwNjExODcgZnJvbSBtYWluCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBNYXJjdXMg
SG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHVi
LmNvbS9kamFuZ28vZGphbmdvL2NvbW1pdC80MWE0YmJhODE3ZjEzOWYzY2ZkOTRmMDRlNzI4ZTA0
NjU2MGM5YTE4Cj4gKy0tLQo+ICsgZGphbmdvL3ZpZXdzL2RlY29yYXRvcnMvZGVidWcucHkgfCA0
ICsrLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gKwo+ICtkaWZmIC0tZ2l0IGEvZGphbmdvL3ZpZXdzL2RlY29yYXRvcnMvZGVidWcucHkgYi9k
amFuZ28vdmlld3MvZGVjb3JhdG9ycy9kZWJ1Zy5weQo+ICtpbmRleCA3ZWE4YTU0MGRlLi42NTQw
ZmMwNjUxIDEwMDY0NAo+ICstLS0gYS9kamFuZ28vdmlld3MvZGVjb3JhdG9ycy9kZWJ1Zy5weQo+
ICsrKysgYi9kamFuZ28vdmlld3MvZGVjb3JhdG9ycy9kZWJ1Zy5weQo+ICtAQCAtNDcsNyArNDcs
NiBAQCBkZWYgc2Vuc2l0aXZlX3ZhcmlhYmxlcygqdmFyaWFibGVzKToKPiArIAo+ICsgICAgICAg
ICAgICAgdHJ5Ogo+ICsgICAgICAgICAgICAgICAgIGZpbGVfcGF0aCA9IGluc3BlY3QuZ2V0Zmls
ZSh3cmFwcGVkX2Z1bmMpCj4gKy0gICAgICAgICAgICAgICAgXywgZmlyc3RfZmlsZV9saW5lID0g
aW5zcGVjdC5nZXRzb3VyY2VsaW5lcyh3cmFwcGVkX2Z1bmMpCj4gKyAgICAgICAgICAgICBleGNl
cHQgVHlwZUVycm9yOiAgIyBSYWlzZXMgZm9yIGJ1aWx0aW5zIG9yIG5hdGl2ZSBmdW5jdGlvbnMu
Cj4gKyAgICAgICAgICAgICAgICAgcmFpc2UgVmFsdWVFcnJvcigKPiArICAgICAgICAgICAgICAg
ICAgICAgZiJ7ZnVuYy5fX25hbWVfX30gY2Fubm90IHNhZmVseSBiZSB3cmFwcGVkIGJ5ICIKPiAr
QEAgLTU1LDcgKzU0LDggQEAgZGVmIHNlbnNpdGl2ZV92YXJpYWJsZXMoKnZhcmlhYmxlcyk6Cj4g
KyAgICAgICAgICAgICAgICAgICAgICJQeXRob24gZmlsZSAobm90IGEgYnVpbHRpbiBvciBmcm9t
IGEgbmF0aXZlIGV4dGVuc2lvbikuIgo+ICsgICAgICAgICAgICAgICAgICkKPiArICAgICAgICAg
ICAgIGVsc2U6Cj4gKy0gICAgICAgICAgICAgICAga2V5ID0gaGFzaChmIntmaWxlX3BhdGh9Ontm
aXJzdF9maWxlX2xpbmV9IikKPiArKyAgICAgICAgICAgICAgICBmaXJzdF9saW5lX251bWJlciA9
IHdyYXBwZWRfZnVuYy5fX2NvZGVfXy5jb19maXJzdGxpbmVubwo+ICsrICAgICAgICAgICAgICAg
IGtleSA9IGhhc2goZiJ7ZmlsZV9wYXRofTp7Zmlyc3RfbGluZV9udW1iZXJ9IikKPiArIAo+ICsg
ICAgICAgICAgICAgaWYgdmFyaWFibGVzOgo+ICsgICAgICAgICAgICAgICAgIGNvcm91dGluZV9m
dW5jdGlvbnNfdG9fc2Vuc2l0aXZlX3ZhcmlhYmxlc1trZXldID0gdmFyaWFibGVzCj4gKy0tIAo+
ICsyLjM0LjEKPiArCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUu
IE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycg
Y29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwg
LyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBg
LS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBu
byAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1B
SUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
