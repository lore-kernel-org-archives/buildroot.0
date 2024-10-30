Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0995D5CC9A
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 11:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B48D403B0;
	Wed, 30 Oct 2024 11:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOClBvPycmj0; Wed, 30 Oct 2024 11:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292B94042F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292B94042F;
	Wed, 30 Oct 2024 11:45:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ADAD494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 11:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4813340131
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 11:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mm84AXOCB_cB for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 11:45:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDBF6400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDBF6400BF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDBF6400BF
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 11:45:50 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5F1962C83029;
 Wed, 30 Oct 2024 12:45:48 +0100 (CET)
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Sen Hastings <sen@hastings.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Date: Wed, 30 Oct 2024 12:45:38 +0100
Message-ID: <20241030114547.555006-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1730288748; bh=pBA2yoq/c3YVdKwdHpe268Hrkxqg7NnkHadDC5ubmho=;
 h=From:To:Cc:Subject:Date;
 b=Wt153PxeX5kCzpjoRbjXdw54C5QcEvMcccukDvVH8WJ3Me5V9yzP1RGXAK/84hP8l
 6VqUChvgM4+g73RMNWp1JG0TeFTrpJHfBUet+XIoT2AJtbPoibDzrl1mRIs4qeGK97
 OfEhcTpOj7Z3LH7/UNDWZKjwdr1NaNYg8vy8LjDXKQDxJFY+Gi4L6OVME+Wj88F5mN
 nHz9O7Ec7RhzDe68VLonQqYlxLVsYwAYHCrZ6gr0rizn4Ntu+Ehgoatsk+0uJ/QQae
 geVTz8TwlH7I7rQoXnYFRcFcLdXLog/dh38WYYO2qUKpKpuKluvK3NaTWe3eY/a4hA
 LQRPaWGgSJPMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Wt153Pxe
Subject: [Buildroot] [PATCH] package/systemd: bump to 256.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KClJlbW92
ZSBwYXRjaCB0aGF0IHdhcyBhcHBsaWVkIHVwc3RyZWFtLgoKU2lnbmVkLW9mZi1ieTogTWFyY3Vz
IEhvZmZtYW5uIDxidWlsZHJvb3RAYnVidTEuZXU+Ci0tLQogLi4uZ19sb29wLmgtZml4LW1pc3Np
bmctTE9PUF9TRVRfQkxPQ0tfLnBhdGNoIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2Fn
ZS9zeXN0ZW1kL3N5c3RlbWQuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uv
c3lzdGVtZC9zeXN0ZW1kLm1rICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9zeXN0ZW1kLzAwMDEtc3JjLWJhc2ljLW1pc3NpbmdfbG9vcC5oLWZpeC1taXNz
aW5nLUxPT1BfU0VUX0JMT0NLXy5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC8w
MDAxLXNyYy1iYXNpYy1taXNzaW5nX2xvb3AuaC1maXgtbWlzc2luZy1MT09QX1NFVF9CTE9DS18u
cGF0Y2ggYi9wYWNrYWdlL3N5c3RlbWQvMDAwMS1zcmMtYmFzaWMtbWlzc2luZ19sb29wLmgtZml4
LW1pc3NpbmctTE9PUF9TRVRfQkxPQ0tfLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwYWI1YTRlOThkLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2Uvc3lzdGVtZC8wMDAxLXNy
Yy1iYXNpYy1taXNzaW5nX2xvb3AuaC1maXgtbWlzc2luZy1MT09QX1NFVF9CTE9DS18ucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIDU2YWIxYzU0NDk3ZDlmYWM3NDM4
MGZmOWUxMWFhZjkzMWE5MTdkMmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiA9P1VU
Ri04P3E/UmFwaGE9QzM9QUJsPTIwTT1DMz1BOWxvdHRlPz0gPHJhcGhhZWwubWVsb3R0ZUBtaW5k
LmJlPgotRGF0ZTogRnJpLCAxNCBKdW4gMjAyNCAxNDozNzoyOSArMDIwMAotU3ViamVjdDogW1BB
VENIXSBzcmMvYmFzaWMvbWlzc2luZ19sb29wLmg6IGZpeCBtaXNzaW5nIExPT1BfU0VUX0JMT0NL
X1NJWkUKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotQnVpbGRzIHdpdGgg
a2VybmVscyBoZWFkZXJzIDwgNC4xNCBmYWlsIHdpdGg6Ci0KLS4uL3NyYy9zaGFyZWQvbG9vcC11
dGlsLmM6IEluIGZ1bmN0aW9uIOKAmGxvb3BfY29uZmlndXJlX2ZhbGxiYWNr4oCZOgotLi4vc3Jj
L3NoYXJlZC9sb29wLXV0aWwuYzoyMzc6MzE6IGVycm9yOiDigJhMT09QX1NFVF9CTE9DS19TSVpF
4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFu
IOKAmExPT1BfU0VUX0RJUkVDVF9JT+KAmT8KLSAgICAgICAgICAgICAgICAgaWYgKGlvY3RsKGZk
LCBMT09QX1NFVF9CTE9DS19TSVpFLCAodW5zaWduZWQgbG9uZykgYy0+YmxvY2tfc2l6ZSkgPCAw
KQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBMT09QX1NFVF9ESVJFQ1RfSU8KLQotRml4ZXM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzMzMzQxCi1VcHN0cmVh
bTogaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvNTZhYjFjNTQ0OTdk
OWZhYzc0MzgwZmY5ZTExYWFmOTMxYTkxN2QyYgotU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOp
bG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0tCi0gc3JjL2Jhc2ljL21pc3Npbmdf
bG9vcC5oIHwgNCArKysrCi0gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQotCi1kaWZm
IC0tZ2l0IGEvc3JjL2Jhc2ljL21pc3NpbmdfbG9vcC5oIGIvc3JjL2Jhc2ljL21pc3NpbmdfbG9v
cC5oCi1pbmRleCBiODg1MDFkNzhiLi5mODNhMTRjOTE0IDEwMDY0NAotLS0tIGEvc3JjL2Jhc2lj
L21pc3NpbmdfbG9vcC5oCi0rKysgYi9zcmMvYmFzaWMvbWlzc2luZ19sb29wLmgKLUBAIC0yOSwz
ICsyOSw3IEBAIGFzc2VydF9jYyhMT09QX1NFVF9ESVJFQ1RfSU8gPT0gMHg0QzA4KTsKLSAjaWZu
ZGVmIExPT1BfU0VUX1NUQVRVU19TRVRUQUJMRV9GTEFHUwotICMgIGRlZmluZSBMT09QX1NFVF9T
VEFUVVNfU0VUVEFCTEVfRkxBR1MgKExPX0ZMQUdTX0FVVE9DTEVBUiB8IExPX0ZMQUdTX1BBUlRT
Q0FOKQotICNlbmRpZgotKwotKyNpZm5kZWYgTE9PUF9TRVRfQkxPQ0tfU0laRQotKyMgIGRlZmlu
ZSBMT09QX1NFVF9CTE9DS19TSVpFIDB4NEMwOQotKyNlbmRpZgotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQuaGFzaCBiL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLmhhc2gKaW5kZXggMzk5YWM2MTQ5Mi4uOTc2ZDg4YzFmNSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9zeXN0ZW1kL3N5c3RlbWQuaGFzaAorKysgYi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5o
YXNoCkBAIC0xLDUgKzEsNSBAQAogIyBzaGEyNTYgbG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICA3
ODYxZDU0NDE5MGY5MzhjYWMxYjI0MjYyNGQ3OGM5NmZlMmViYmM3YjcyZjg2MTY2ZTg4YjUwNDUx
YzZmYTU4ICBzeXN0ZW1kLTI1Ni40LnRhci5negorc2hhMjU2ICA4OTZkNzZmZjY1Yzg4ZjVmZDll
NDJmOTBkMTUyYjA1NzkwNDkxNThhMTYzNDMxZGQ3N2NkYzU3NzQ4YjFkN2IwICBzeXN0ZW1kLTI1
Ni43LnRhci5negogc2hhMjU2ICBhYjE1ZmQ1MjZiZDhkZDE4YTllNzdlYmMxMzk2NTZiZjRkMzNl
OTdmYzcyMzhjZDExYmY2MGUyYjliODY2NmM2ICBMSUNFTlNFLkdQTDIKIHNoYTI1NiAgZGM2MjY1
MjBkY2Q1M2EyMmY3MjdhZjNlZTQyYzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1
MSAgTElDRU5TRS5MR1BMMi4xCiBzaGEyNTYgIGU1YTg2NDVhZDk0YWFiMjRlMzEyZGQwYzZiZTJh
YTU0MjM2ZWI5Mzc0NDgwYjFiMTRlYTVjNjE1OTg4NzRmZDUgIExJQ0VOU0VTL0JTRC0yLUNsYXVz
ZS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIGIvcGFja2FnZS9z
eXN0ZW1kL3N5c3RlbWQubWsKaW5kZXggNWRjYTg2ODFiYy4uODdhODI4NWI4YSAxMDA2NDQKLS0t
IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKKysrIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3Rl
bWQubWsKQEAgLTE5LDcgKzE5LDcgQEAKICMgLSBEaWZmIHN5c3VzZXJzLmQgd2l0aCB0aGUgcHJl
dmlvdXMgdmVyc2lvbgogIyAtIERpZmYgZmFjdG9yeS9ldGMvbnNzd2l0Y2guY29uZiB3aXRoIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uCiAjICAgKGRldGFpbHMgYXJlIG9mdGVuIHNwcmlua2xlZCBhcm91
bmQgaW4gUkVBRE1FIGFuZCBtYW5wYWdlcykKLVNZU1RFTURfVkVSU0lPTiA9IDI1Ni40CitTWVNU
RU1EX1ZFUlNJT04gPSAyNTYuNwogU1lTVEVNRF9TSVRFID0gJChjYWxsIGdpdGh1YixzeXN0ZW1k
LHN5c3RlbWQsdiQoU1lTVEVNRF9WRVJTSU9OKSkKIFNZU1RFTURfTElDRU5TRSA9IFwKIAlMR1BM
LTIuMSssIFwKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
