Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0022CC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5444960BB8;
	Sat, 11 Mar 2023 12:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5444960BB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1K2lZ3iLUZc; Sat, 11 Mar 2023 12:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B36960BBB;
	Sat, 11 Mar 2023 12:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B36960BBB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE1C31BF3DD
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 12:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35DE41A11
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 12:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35DE41A11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fBo5PT_-5So for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 12:09:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1831419D6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1831419D6
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 12:09:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.12]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDEg-1qJ4HW2Alc-00iBOD
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 13:09:26 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 13:09:25 +0100
Message-Id: <20230311120925.9147-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Swg3hc9CB0CcgeR4EbCGrNYtykyjBb5DcaY9b5MoCwvTKvK25wV
 gyeI/KLW6X5Aw0gEiEW1xbyDKWoKNqDMpkmkEKdV9z4Iw/ovFrffB7RGIkIhWwzu4tgR9UM
 5OreipXysyEsiHSW5dmabqhFpUixlWH8ziLvswPkLewFhFV/yt9eymloNyLp9iK5MGgJcuB
 W29jPr4fWMcCl1jr7XbNA==
UI-OutboundReport: notjunk:1;M01:P0:kSjM22mCWRA=;4U4Z+F4dbswMcdX+8wSnJzVngNP
 qnxvssW3afvP71ZlP0GHdrBuJt3wiLmYuSmd2Ge0ganaCEKfKU48sjLSEFu4ChO2A2LkZddwU
 7mmWUqtGrESJSM50vxoG+/2MhBPjw+bWnI6pw93k4cPz0fIivhGX/lTYCweMCxDcBF8paK+G8
 0QsMStLSNO9RI6YpNJCPy5W6ppfdDyMf0FFUIyfZ1Hw4SkrpIWgPru5vXrg2tO8jHzEpnsFJl
 NM4HiihzJ93YaZ3JXDvJbrz8ZLaU/G2LDls1+sHSOWki4x45f8mtS5GBwzjHM2CBiiTmia/r0
 TX6my6Gx0v7rUYVtq6mU0OE5Dldqj2QWI9+XF6PAvWM6tbiRn460A/VTiKILe9GAL2GaNHN6o
 fTBOYG3hHGGYj52YcL3TDzvhui7Vpn+5jQdp/x3ik1gu9hydJPZosPtw1kJ6QHvQym2uw5Oed
 52sdKr1y+OrYUsnjCLRF2bBJDrGAaGRNpLElYMKJ8/AZii6z7dPq0NWgN/11Vq9s0obRvsz+7
 BI1un+WOB0TGll2uHToMah08K0pepZ9BjSQPQmQJ9IyWOOhqXjradwzRPY/bYHfefZL8Tq0Wl
 M/vG0uE1s5IUwvHaj//3ItYUGoHdfTz9tXgNJB+eRhs10fRL/p/eoS/uRNnyKWIQLO26pOXT/
 kAtkUD8REeuc88qt9VJtyIKK0eMPaDzdNcEiocsZKfFieSVeA+P21O6/SNGzU0NyqrbnDD7+0
 QMkTvpknQ3J83al6ai2t6SkKjGbXfI9c06LnmDx5FaDoj8MbO1i8xTTIzudN11QyNCr3cmn4q
 BSxgYKbDnqIlQD1Jg3EpZH1iY5ZblEuxfEQJAHi47GfowCnIo3VUiV2feMhYZeGpStjO7KFaB
 yg0OOHsXysIez7303M0xuPgCq0aOQrG4dgvyJT38a9KYmINVpQAYbHT2WDpcgbbm1ozyVebRx
 rCROMw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1678536566; i=ps.report@gmx.net;
 bh=MYbpO3G8fecCEUPTfhe4TRsngOo73Ii1OwZmwN7hAcY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=JsF/siLAil5gzabz/PrVAKA+Td1COqKFroKruwAFGrx7oSgEuWFfJ+Hk70d0sNjJ1
 A4Q8Fy01hCtVwOQadCcb3G5ckG7DhC6Ew5WlRrySpF0xhSe2Y6rR3mi4sGKCzzOfPF
 7Q8+W16G9pvg0MoiUIdplgddp7FfshJSYew7R2md5nbm9MnQpuxXjLyck25y1SxKTv
 ESeUVzemHOzb9wOUhxc0p6KJbH44ZxBfKw0GTZ+mcTi7F7wuupjnkk3O3XTov4b2+G
 2UJaOjnQ62L1Oe7FpjqtLG13Otmn6bI0ec8yi1xHkq2QRA32FfCAYv0S9GCrjsHG6w
 pSRobs7ySUEtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=JsF/siLA
Subject: [Buildroot] [PATCH v1] package/uqmi: update patch for fix compile
 error (gcc false error reporting)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRoZSBwYXRjaCB0byB0byBhdm9pZCBnY2MgZmFsc2UgZXJyb3IgcmVwb3J0aW5nIChh
cHBseSBwcmFnbWEgaWdub3JlZApvbmx5IGZvciBnY2MgPj0gMTIueCAoYXMgdGhlIHdhcm5pbmcg
Jy1XZGFuZ2xpbmctcG9pbnRlcicgd2FzIGludHJvZHVjZWQKd2l0aCBnY2MtMTIueCkuCgpGaXhl
czoKCiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9kZjM4MGY5MjFi
NzQ1MjdiNzcyOTBhNjU4ZGUwYzU3NjgwMDgzYWZhCgogIC4uLi9idWlsZC91cW1pLTBhMTliNWI3
NzE0MDQ2NWMyOWUyYWZhN2Q2MTFmZTkzYWJjOTY3MmYvZGV2LmM6MjEzOjMyOiBlcnJvcjogdW5r
bm93biBvcHRpb24gYWZ0ZXIgJyNwcmFnbWEgR0NDIGRpYWdub3N0aWMnIGtpbmQgWy1XZXJyb3I9
cHJhZ21hc10KICAgIDIxMyB8ICNwcmFnbWEgR0NDIGRpYWdub3N0aWMgaWdub3JlZCAiLVdkYW5n
bGluZy1wb2ludGVyIgogICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+Ci0tLQogLi4uLngtZmFsc2UtZXJyb3ItcmVwb3J0aW5nLXN0b3JpbmctdGgu
cGF0Y2h9IHwgMjMgKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQogcmVuYW1lIHBhY2thZ2UvdXFtaS97MDAwMS11cW1p
LWF2b2lkLWdjYy1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3RvcmluZy10aGUtYWRkLnBhdGNoID0+
IDAwMDEtdXFtaS1hdm9pZC1nY2MtMTIueC1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3RvcmluZy10
aC5wYXRjaH0gKDcxJSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3VxbWkvMDAwMS11cW1pLWF2b2lk
LWdjYy1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3RvcmluZy10aGUtYWRkLnBhdGNoIGIvcGFja2Fn
ZS91cW1pLzAwMDEtdXFtaS1hdm9pZC1nY2MtMTIueC1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3Rv
cmluZy10aC5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDcxJQpyZW5hbWUgZnJvbSBwYWNrYWdlL3Vx
bWkvMDAwMS11cW1pLWF2b2lkLWdjYy1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3RvcmluZy10aGUt
YWRkLnBhdGNoCnJlbmFtZSB0byBwYWNrYWdlL3VxbWkvMDAwMS11cW1pLWF2b2lkLWdjYy0xMi54
LWZhbHNlLWVycm9yLXJlcG9ydGluZy1zdG9yaW5nLXRoLnBhdGNoCmluZGV4IGM5NDA5MjU3Njcu
LmUyMTk5MjI4YjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdXFtaS8wMDAxLXVxbWktYXZvaWQtZ2Nj
LWZhbHNlLWVycm9yLXJlcG9ydGluZy1zdG9yaW5nLXRoZS1hZGQucGF0Y2gKKysrIGIvcGFja2Fn
ZS91cW1pLzAwMDEtdXFtaS1hdm9pZC1nY2MtMTIueC1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3Rv
cmluZy10aC5wYXRjaApAQCAtMSwxMCArMSwxMCBAQAotRnJvbSA0YzJlYjkyNmVmYjRkZTI0YWY1
YTNiMWU4YzE4MTk1MTk4ODI3NDkxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2M2Fi
ODg3YmU5MGM3ZmUzN2Q1MzdlYTc1ZTYwZWI5NWQ2ZDg3ZDNmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgogRGF0ZTogU3Vu
LCA1IE1hciAyMDIzIDIyOjA4OjEzICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHVxbWk6IGF2b2lk
IGdjYyBmYWxzZSBlcnJvciByZXBvcnRpbmcgKHN0b3JpbmcgdGhlIGFkZHJlc3Mgb2YKLSBsb2Nh
bCB2YXJpYWJsZSAnY29tcGxldGUnIGluICcqcmVxLmNvbXBsZXRlJykKK1N1YmplY3Q6IFtQQVRD
SF0gdXFtaTogYXZvaWQgZ2NjLTEyLnggZmFsc2UgZXJyb3IgcmVwb3J0aW5nIChzdG9yaW5nIHRo
ZQorIGFkZHJlc3Mgb2YgbG9jYWwgdmFyaWFibGUgJ2NvbXBsZXRlJyBpbiAnKnJlcS5jb21wbGV0
ZScpCiAKLUF2b2lkIGdjYyBmYWxzZSBlcnJvciByZXBvcnRpbmcgKHJlcS0+Y29tcGxldGUgaXMg
bGF0ZXIgcmVzZXQgdG8gTlVMTAorQXZvaWQgZ2NjLTEyLnggZmFsc2UgZXJyb3IgcmVwb3J0aW5n
IChyZXEtPmNvbXBsZXRlIGlzIGxhdGVyIHJlc2V0IHRvIE5VTEwKIGluIGNhc2Ugb2YgdXNlIG9m
IGxvY2FsIGNvbXBsZXRlKToKIAogICBkZXYuYzoyMTc6MjM6IGVycm9yOiBzdG9yaW5nIHRoZSBh
ZGRyZXNzIG9mIGxvY2FsIHZhcmlhYmxlICdjb21wbGV0ZScgaW4gJypyZXEuY29tcGxldGUnIFst
V2Vycm9yPWRhbmdsaW5nLXBvaW50ZXI9XQpAQCAtMTIsMjcgKzEyLDMwIEBAIGluIGNhc2Ugb2Yg
dXNlIG9mIGxvY2FsIGNvbXBsZXRlKToKICAgICAgICAgfCAgICAgICAgIH5+fn5+fn5+fn5+fn5+
Xn5+fn5+fn5+fn4KIAogU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBn
bXgubmV0PgotCi1bVXBzdHJlYW06IGh0dHA6Ly9saXN0cy5vcGVud3J0Lm9yZy9waXBlcm1haWwv
b3BlbndydC1kZXZlbC8yMDIzLU1hcmNoLzA0MDYzMy5odG1sXQorW1Vwc3RyZWFtOiBodHRwOi8v
bGlzdHMub3BlbndydC5vcmcvcGlwZXJtYWlsL29wZW53cnQtZGV2ZWwvMjAyMy1NYXJjaC8wNDA2
NjcuaHRtbF0KIFNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4KKy0tLQorQ2hhbmdlcyB2MSAtPiB2MjoKKyAgLSBhcHBseSBwcmFnbWEgaWdub3JlZCBvbmx5
IGZvciBnY2MgPj0gMTIueCAoYXMgdGhlIHdhcm5pbmcKKyAgICAnLVdkYW5nbGluZy1wb2ludGVy
JyB3YXMgaW50cm9kdWNlZCB3aXRoIGdjYy0xMi54KQogLS0tCiAgZGV2LmMgfCAxMiArKysrKysr
KysrKysKICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEv
ZGV2LmMgYi9kZXYuYwotaW5kZXggYmQxMDIwNy4uYjhhYzI3MyAxMDA2NDQKK2luZGV4IGJkMTAy
MDcuLmRiZDQyZDQgMTAwNjQ0CiAtLS0gYS9kZXYuYwogKysrIGIvZGV2LmMKIEBAIC0yMDMsNiAr
MjAzLDE1IEBAIHZvaWQgcW1pX3JlcXVlc3RfY2FuY2VsKHN0cnVjdCBxbWlfZGV2ICpxbWksIHN0
cnVjdCBxbWlfcmVxdWVzdCAqcmVxKQogIAlfX3FtaV9yZXF1ZXN0X2NvbXBsZXRlKHFtaSwgcmVx
LCBOVUxMKTsKICB9CiAgCi0rLyogYXZvaWQgZ2NjIGZhbHNlIGVycm9yIHJlcG9ydGluZzoKKysv
KiBhdm9pZCBnY2MtMTIueCBmYWxzZSBlcnJvciByZXBvcnRpbmc6CiArICogICBkZXYuYzoyMTc6
MjM6IGVycm9yOiBzdG9yaW5nIHRoZSBhZGRyZXNzIG9mIGxvY2FsIHZhcmlhYmxlIOKAmGNvbXBs
ZXRl4oCZIGluIOKAmCpyZXEuY29tcGxldGXigJkgWy1XZXJyb3I9ZGFuZ2xpbmctcG9pbnRlcj1d
CiArICogICAgIDIxNyB8ICAgICAgICAgcmVxLT5jb21wbGV0ZSA9ICZjb21wbGV0ZTsKICsgKiAg
ICAgICAgIHwgICAgICAgICB+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+CiArICovCi0rI2lmIF9f
R05VQ19fID4gNCB8fCAoX19HTlVDX18gPT0gNCAmJiBfX0dOVUNfTUlOT1JfXyA+PSA2KQorKyNp
ZiBfX0dOVUNfXyA+PSAxMgogKyNwcmFnbWEgR0NDIGRpYWdub3N0aWMgcHVzaAogKyNwcmFnbWEg
R0NDIGRpYWdub3N0aWMgaWdub3JlZCAiLVdkYW5nbGluZy1wb2ludGVyIgogKyNlbmRpZgpAQCAt
NDMsNyArNDYsNyBAQCBpbmRleCBiZDEwMjA3Li5iOGFjMjczIDEwMDY0NAogIAogIAlyZXR1cm4g
cmVxLT5yZXQ7CiAgfQotKyNpZiBfX0dOVUNfXyA+IDQgfHwgKF9fR05VQ19fID09IDQgJiYgX19H
TlVDX01JTk9SX18gPj0gNikKKysjaWYgX19HTlVDX18gPj0gMTIKICsjcHJhZ21hIEdDQyBkaWFn
bm9zdGljIHBvcAogKyNlbmRpZgogIAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
