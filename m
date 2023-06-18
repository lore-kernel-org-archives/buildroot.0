Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66803EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 16:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B0D040605;
	Sun, 18 Jun 2023 16:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B0D040605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NY0xYzbU5Pm0; Sun, 18 Jun 2023 16:25:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ED91405F1;
	Sun, 18 Jun 2023 16:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED91405F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76FB51BF5A2
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 16:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502AB60806
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 16:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 502AB60806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24ieoEBLAgMN for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 16:25:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F090F60803
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F090F60803
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 16:25:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a4e:c651:9894:ba33])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3C3F5B0053E;
 Sun, 18 Jun 2023 18:25:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Jun 2023 18:25:25 +0200
Date: Sun, 18 Jun 2023 18:25:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230618162525.GB2754@scaer>
References: <20230507142319.1001150-1-bernd.kuhls@t-online.de>
 <20230507142319.1001150-2-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507142319.1001150-2-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687105528;
 bh=TgsiYwS0dM/RHEesI3UJB+vUS5i5C4nyN7hSoOIsVdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHVgzlImSb2kyzgJEINqyZMfvmHFWnjBhzzodczIhErx/wEeWTkwdA6Qvw7V4UcYP
 tep25d4XvtG0AIjXmnDEBCCBO/lqvxn52Ejk+VHic2zFgLxYoOaF5jJJRL1Q8ugM4k
 9o2Q4Egx1rCTTo42aXNZ13Hn4su8Z/Q/wZopq6pzag5vTKgHtET4WZpc8gMg15d2tm
 I50v2759Z726BufAtMtmtmqQV4YPMRDoxodL+aSWFXIdQRp1ZOQOsREppVtXdA7236
 jM20WedR97edwZG0Sot5kdPxoYCwwqA3rQr+4GqZDRTUQBEpRLNGRxfWuLPvUSZAm5
 b8ab9wRJid53A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mHVgzlIm
Subject: Re: [Buildroot] [PATCH 2/2] package/libdisplay-info: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQsIEFsbCwKCk9uIDIwMjMtMDUtMDcgMTY6MjMgKzAyMDAsIEJlcm5kIEt1aGxzIHNwYWtl
IHRodXNseToKPiBOZWVkZWQgZm9yIHVwY29taW5nIEtvZGkgdmVyc2lvbiAyMS4wLU9tZWdhLgo+
IERlcGVuZHMgb24gdGhlIHByZXZpb3VzIHBhdGNoIHRvIGVuYWJsZSBzdGFnaW5nIGluc3RhbGwg
b2YgaHdkYXRhLgo+IAo+IERpc2FibGUgLWZQSUMgb24gQlIyX202OGtfY2YgdG8gYXZvaWQgYnVp
bGQgZmFpbHVyZToKPiAKPiAvdG1wL2NjZ01oNFlBLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKPiAv
dG1wL2NjZ01oNFlBLnM6IEZhdGFsIGVycm9yOiBUcmllZCB0byBjb252ZXJ0IFBDIHJlbGF0aXZl
IGJyYW5jaCB0byBhYnNvbHV0ZSBqdW1wCj4gCj4gRm9yIGRldGFpbHMgc2VlIGh0dHBzOi8vZ2Nj
LmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTEwMTk3MSNjMTEKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+ClstLVNOSVAtLV0K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkaXNwbGF5LWluZm8vMDAwMS1kaXNwbGF5aWQuYy1J
bmNsdWRlLXN5cy10eXBlcy5oLnBhdGNoIGIvcGFja2FnZS9saWJkaXNwbGF5LWluZm8vMDAwMS1k
aXNwbGF5aWQuYy1JbmNsdWRlLXN5cy10eXBlcy5oLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zMzRiNzg2ZmZmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3BhY2thZ2UvbGliZGlzcGxheS1pbmZvLzAwMDEtZGlzcGxheWlkLmMtSW5jbHVkZS1zeXMtdHlw
ZXMuaC5wYXRjaAo+IEBAIC0wLDAgKzEsMzYgQEAKPiArRnJvbSA2NDhjMWNiNjZiNTcxYjAzNzk3
NmI2MTM2MzY1NGYzOTQ0OGY1ZmFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBC
ZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+Cj4gK0RhdGU6IFN1biwgNyBNYXkg
MjAyMyAxNDoxNDo0OCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIGRpc3BsYXlpZC5jOiBJbmNs
dWRlIHN5cy90eXBlcy5oCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
Cj4gKwo+ICtGaXhlcyBidWlsZCBlcnJvcgo+ICsuLi9kaXNwbGF5aWQuYzozNzc6MTA6IGVycm9y
OiDigJhzc2l6ZV904oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsg
ZGlkIHlvdSBtZWFuIOKAmHNpemVfdOKAmT8KPiArCj4gK3NlZW4gd2l0aDoKPiArYXJjLWxpbnV4
LWdjYy5icl9yZWFsIChCdWlsZHJvb3QgMjAyMS4xMS00NDI4LWc2YjY3NDFiKSAxMC4yLjAKPiAr
Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZW1lcnNpb24vbGli
ZGlzcGxheS1pbmZvLy0vbWVyZ2VfcmVxdWVzdHMvMTYzCgpUaGlzIGhhcyBub3cgYmVlbiBtZXJn
ZWQsIGdvb2QhIFNvLCB3aGVuIHlvdSByZXNwaW4sIHBsZWFzZSB1cGRhdGUgdG8KdXNlIGEgcG9p
bnRlciB0byB0aGUgYWN0dWFsIGNvbW1pdCwgbm90IHRoZSBNUi4gVGhhbmtzIQoKWy0tU05JUC0t
XQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm8u
bWsgYi9wYWNrYWdlL2xpYmRpc3BsYXktaW5mby9saWJkaXNwbGF5LWluZm8ubWsKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmQxMWY2ODJhNWEKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9saWJkaXNwbGF5LWluZm8vbGliZGlzcGxheS1pbmZvLm1rCj4g
QEAgLTAsMCArMSwyNCBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgbGli
ZGlzcGxheS1pbmZvCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0xJQkRJ
U1BMQVlfSU5GT19WRVJTSU9OID0gMC4xLjEKPiArTElCRElTUExBWV9JTkZPX1NPVVJDRSA9IGxp
YmRpc3BsYXktaW5mby0kKExJQkRJU1BMQVlfSU5GT19WRVJTSU9OKS50YXIuYnoyCj4gK0xJQkRJ
U1BMQVlfSU5GT19TSVRFID0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9u
L2xpYmRpc3BsYXktaW5mby8tL2FyY2hpdmUvJChMSUJESVNQTEFZX0lORk9fVkVSU0lPTikKPiAr
TElCRElTUExBWV9JTkZPX0xJQ0VOU0UgPSBNSVQKPiArTElCRElTUExBWV9JTkZPX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFCj4gK0xJQkRJU1BMQVlfSU5GT19JTlNUQUxMX1NUQUdJTkcgPSBZRVMK
PiArTElCRElTUExBWV9JTkZPX0RFUEVOREVOQ0lFUyA9IGh3ZGF0YQo+ICsKPiArIyB3b3JrYXJv
dW5kIGZvciBzdGF0aWNfYXNzZXJ0IG9uIHVjbGliYy1uZyA8IDEuMC40Mgo+ICtMSUJESVNQTEFZ
X0lORk9fQ0ZMQUdTICs9ICQoVEFSR0VUX0NGTEFHUykgLURzdGF0aWNfYXNzZXJ0PV9TdGF0aWNf
YXNzZXJ0CgpTbyB3aGF0IGhhcHBlbnMgd2l0aCB0b29sY2hhaW5zIHVzaW5nIHVjbGliYy1uZyA+
PSAxLjAuNDIgPwoKPiArIyBtNjhrX2NmIGNhbid0IHVzZSBtZXNvbidzIGRlZmF1bHQgLWZQSUMs
IHNvIHdlIG5lZWQgdG8gZGlzYWJsZSBpdCB0bwo+ICsjIGF2b2lkIGEgYnVpbGQgZmFpbHVyZS4K
PiAraWZlcSAoJChCUjJfbTY4a19jZikseSkKPiArTElCRElTUExBWV9JTkZPX0NPTkZfT1BUUyAr
PSAtRGJfc3RhdGljcGljPWZhbHNlCgpJZiBzdGF0aWMrUElDIGlzIHJlYWxseSBib3JrZWQgb24g
Y29sZGZpcmUsIHRoZW4gd2Ugc2hvdWxkIGRvIHRoYXQgZm9yCmFsbCBwYWNrYWdlcywgbm90IGp1
c3QgbGliZGlzcGxheS1pbmZvLCBubz8KCklmIHNvLCB0aGVuIGl0IHNob3VsZCBnbyBpbnRvIHRo
ZSBtZXNvbi1wYWNrYWdlIGluZnJhLCBpLmUuIGluCnBhY2thZ2UvcGtnLW1lc29uLm1rIGFyb3Vu
ZCBsaW5lIDE1OC4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICtlbmRpZgo+ICsKPiArJChl
dmFsICQobWVzb24tcGFja2FnZSkpCj4gLS0gCj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19f
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
