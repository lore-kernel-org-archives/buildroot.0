Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 20:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E23182784;
	Mon, 14 Mar 2022 20:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYrRJt89WKx1; Mon, 14 Mar 2022 20:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 259AD825FE;
	Mon, 14 Mar 2022 20:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47D021BF30F
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3104E60EFD
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oK9JOV5zozBi for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 20:31:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9408B6068B
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 20:31:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84f3:986a:6873:580d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1CCFC13F854;
 Mon, 14 Mar 2022 21:31:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647289914;
 bh=EcQojmK3NO4bwT5IENasNv/bqoyDpr5scVRmqjRn6HE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyfwMbkwp9/5r5EQer5wuA2vMR5ldnnVBsOcje63pH0VmD+hDf5rm6S5VxapeL/8z
 K4bvqQY20qbTTeuFaUJrwGfgO+BqcsHSxEq5qfzJjVUlt+v8DKnV7xcbVGe0/emO9y
 VDR9BPh8STRk1nneX4wjXAE93c5/RXFh8OPEfvpPW4Ae+dnW3DlJKBoZETpRogJcfI
 B1E40+ikMmS2UscMt+o8+ncRsNVqbr3ursR/oDwxbvQpNEEtEKTBcecdJvJP+Wds+M
 /VAJAY2C82EThL8sC6NeztBoPSrOA2nZUttwR5pli3XkBTFUADOKt8u4q1wT4EFMUR
 ERSM58bmhs/wg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Mar 2022 21:31:49 +0100
Date: Mon, 14 Mar 2022 21:31:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220314203149.GW283544@scaer>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
 <20220314153111.1390512-3-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220314153111.1390512-3-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v4 2/8] package/python-cryptography: enable
 host package
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

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTQgMTY6MzEgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBFbmFibGUgaG9zdCBwYWNrYWdlIGFuZCBh
ZGQgbmVlZGVkIGRlcGVuZGVuY2llcy4KPiAKPiBBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8
ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9weXRob24t
Y3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsgfCAxNCArKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tayBiL3BhY2thZ2Uv
cHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gaW5kZXggYTUyNGY3
MjljOC4uOGE0ZmZlNmQ3NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFw
aHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dy
YXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gQEAgLTE3LDE0ICsxNywyOCBAQCBQWVRIT05f
Q1JZUFRPR1JBUEhZX0RFUEVOREVOQ0lFUyA9IFwKPiAgCWhvc3QtcHl0aG9uLWNmZmkgXAo+ICAJ
aG9zdC1ydXN0YyBcCj4gIAlvcGVuc3NsCj4gK0hPU1RfUFlUSE9OX0NSWVBUT0dSQVBIWV9ERVBF
TkRFTkNJRVMgPSBcCj4gKwlob3N0LXB5dGhvbi1zZXR1cHRvb2xzLXJ1c3QgXAo+ICsJaG9zdC1w
eXRob24tY2ZmaSBcCj4gKwlob3N0LXJ1c3RjIFwKPiArCWhvc3Qtb3BlbnNzbAo+ICBQWVRIT05f
Q1JZUFRPR1JBUEhZX0VOViA9IFwKPiAgCSQoUEtHX0NBUkdPX0VOVikgXAo+ICAJUFlPM19DUk9T
U19MSUJfRElSPSIkKFNUQUdJTkdfRElSKS91c3IvbGliL3B5dGhvbiQoUFlUSE9OM19WRVJTSU9O
X01BSk9SKSIKPiArSE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX0VOViA9IFwKPiArCSQoSE9TVF9Q
S0dfQ0FSR09fRU5WKSBcCj4gKwlQWU8zX0NST1NTX0xJQl9ESVI9IiQoSE9TVF9ESVIpL3Vzci9s
aWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpIgo+ICAjIFdlIG5lZWQgdG8gdmVuZG9y
IHRoZSBDYXJnbyBjcmF0ZXMgYXQgZG93bmxvYWQgdGltZQo+ICBQWVRIT05fQ1JZUFRPR1JBUEhZ
X0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9IGNhcmdvCj4gK0hPU1RfUFlUSE9OX0NSWVBUT0dSQVBI
WV9ET1dOTE9BRF9QT1NUX1BST0NFU1MgPSBjYXJnbwoKSSB0aGluayB0aGUgaG9zdCB2YXJpYW50
IHNob3VsZCBhdXRvbWF0aWNhbGx5IGluaGVyaXQgdGhhdCBzZXR0aW5nIGZyb20KdGhlIHRhcmdl
dCB2YXJpYW50LgoKQWZ0ZXJhbGwsIGl0IHNlZW1zIHJlYXNvbmFibGUgdG8gZXhwZWN0IHRoYXQg
dGhlIGRvd25sb2FkIG9mIHRoZSBob3N0CmFuZCB0YXJnZXQgdmFyaWFudHMgc2hvdWxkIHVzdWFs
bHkgYmUgZXhhY3RseSB0aGUgc2FtZS4KCj4gIFBZVEhPTl9DUllQVE9HUkFQSFlfRE9XTkxPQURf
REVQRU5ERU5DSUVTID0gaG9zdC1ydXN0Ywo+ICtIT1NUX1BZVEhPTl9DUllQVE9HUkFQSFlfRE9X
TkxPQURfREVQRU5ERU5DSUVTID0gaG9zdC1ydXN0YwoKRGl0dG8gZm9yIHRoZSBkb3dubG9hZCBk
ZXBlbmRlbmNpZXMuCgpBbHRob3VnaCB0aGF0IG1heSBpbnRvZHVjZSBhIGNpcmN1bGFyIGRlcGVu
ZGVuY3kgKGkuZS46IGZvbyBoYXMgaG9zdC1mb28KYXMgYSBkb3dubG9hZCBkZXBlbmRlbmN5LCBz
byBvZiBjb3Vyc2UgaG9zdC1mb28gY2FuJ3QgaGF2ZSBob3N0LWZvbyBhcwpkb3dubG9hZCBkZXBl
bmRlbmN5Li4uKQoKPiAgUFlUSE9OX0NSWVBUT0dSQVBIWV9ETF9FTlYgPSBcCj4gIAkkKFBLR19D
QVJHT19FTlYpIFwKPiAgCUJSX0NBUkdPX01BTklGRVNUX1BBVEg9c3JjL3J1c3QvQ2FyZ28udG9t
bAo+ICtIT1NUX1BZVEhPTl9DUllQVE9HUkFQSFlfRExfRU5WID0gXAo+ICsJJChIT1NUX1BLR19D
QVJHT19FTlYpIFwKPiArCUJSX0NBUkdPX01BTklGRVNUX1BBVEg9c3JjL3J1c3QvQ2FyZ28udG9t
bAoKSSBhbSBnb2luZyB0byBzdWdnZXN0IHRoYXQgc2hvdWxkIGFsc28gYmUgdGhlIGNhc2UgZm9y
IHRoZSBfRExfRU5WLiBOb3RlCmhvd2V2ZXIgdGhhdCB5b3Ugd291bGQgYW55d2F5IG5lZWQgdG8g
b3ZlcnJpZGUgaXQgZm9yIHRoaXMgcGFja2FnZSwKYmVjYXN1ZSB0aHdlIGhvc3QgYW5kIHRhcmdl
dCB2YXJpYW50cyBoYXZlIGRpZmZlcmVudCBnbyBlbnYuCgpTbywgc29tZXRoaW5nIGxpa2UgKHdp
dGggX0RMX1NVQkRJUiB0aHJvd24gaW50byB0aGUgbWl4OyBvZiBjb3Vyc2UsIHRoZQp3aG9sZSB3
YXMgdGhvcm91Z2hseSB1bnRlc3RlZCk6CgogICAgcGFja2FnZS9wa2ctZ2VuZXJpYzogaG9zdCB2
YXJpYW50IGluaGVyaXRzIGRvd25sb2FkIHNldHRpbmdzCgogICAgQmxhYmxhYmxhIEFmdGVyYWxs
LCBpdCBzZWVtcyByZWFzb25hYmxlIHRvIGV4cGVjdCB0aGF0IHRoZSBkb3dubG9hZAogICAgb2Yg
dGhlIGhvc3QgYW5kIHRhcmdldCB2YXJpYW50cyBzaG91bGQgdXN1YWxseSBiZSBleGFjdGx5IHRo
ZSBzYW1lLAogICAgYnV0IHBhY2thZ2VzIGNhbiBzdGlsbCBvdmVycmlkZSB0aGF0IGZvciB0aGUg
aG9zdCB2YWlyYW50IGluIHNwZWNpYWwKICAgIGNhc2VzIGJsYWJsYWJsYS4uLgoKICAgIFNpZ25l
ZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgoKICAgIGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rIGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5t
awogICAgaW5kZXggYjNhN2UxZDYwZS4uNzlmY2Y2MDNkMyAxMDA2NDQKICAgIC0tLSBhL3BhY2th
Z2UvcGtnLWdlbmVyaWMubWsKICAgICsrKyBiL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKICAgIEBA
IC01NDAsNiArNTQwLDMwIEBAIGlmbmRlZiAkKDIpX1NVQkRJUgogICAgICBlbmRpZgogICAgIGVu
ZGlmCiAgICAgCiAgICAraWZuZGVmICQoMilfRExfU1VCRElSCiAgICArIGlmZGVmICQoMylfRExf
U1VCRElSCiAgICArICAkKDIpX0RMX1NVQkRJUiA9ICQkKCQoMylfRExfU1VCRElSKQogICAgKyBl
bmRpZgogICAgK2VuZGlmCiAgICArCiAgICAraWZuZGVmICQoMilfRE9XTkxPQURfREVQRU5ERU5D
SUVTCiAgICArIGlmZGVmICQoMylfRE9XTkxPQURfREVQRU5ERU5DSUVTCiAgICArICAkKDIpX0RP
V05MT0FEX0RFUEVOREVOQ0lFUyA9ICQkKGZpbHRlci1vdXQgJCgxKSwkJCgkKDMpX0RPV05MT0FE
X0RFUEVOREVOQ0lFUykpCiAgICArIGVuZGlmCiAgICArZW5kaWYKICAgICsKICAgICtpZm5kZWYg
JCgyKV9ETF9FTlYKICAgICsgaWZkZWYgJCgzKV9ETF9FTlYKICAgICsgICQoMilfRExfRU5WID0g
JCQoJCgzKV9ETF9FTlYpCiAgICArIGVuZGlmCiAgICArZW5kaWYKICAgICsKICAgICtpZm5kZWYg
JCgyKV9ET1dOTE9BRF9QT1NUX1BST0NFU1MKICAgICsgaWZkZWYgJCgzKV9ET1dOTE9BRF9QT1NU
X1BST0NFU1MKICAgICsgICQoMilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gJCQoJCgzKV9ET1dO
TE9BRF9QT1NUX1BST0NFU1MpCiAgICArIGVuZGlmCiAgICArZW5kaWYKICAgICsKICAgICBpZm5k
ZWYgJCgyKV9TVFJJUF9DT01QT05FTlRTCiAgICAgIGlmZGVmICQoMylfU1RSSVBfQ09NUE9ORU5U
UwogICAgICAgJCgyKV9TVFJJUF9DT01QT05FTlRTID0gJCQoJCgzKV9TVFJJUF9DT01QT05FTlRT
KQoKVGhvdWdodHM/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgJChldmFsICQocHl0aG9u
LXBhY2thZ2UpKQo+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPiAtLSAKPiAyLjM0
LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4t
LS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0u
LS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVk
ZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1h
LWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3ku
ICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
