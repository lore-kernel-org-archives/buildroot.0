Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AB1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 12:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1E66124D
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 12:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF1E66124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB0C81BD4;
	Sat,  6 Nov 2021 12:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1AtpdWrLpCn; Sat,  6 Nov 2021 12:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD68081BA9;
	Sat,  6 Nov 2021 12:09:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABBD1BF83A
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 12:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A6176068B
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 12:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R--2Tgt4Ql7L for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 12:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B872F605B5
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636200576;
 bh=kbbEHGN7JxIsF3X9F2Obc5n9J1J8aYfYn+tvVwwP72E=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=kqL3auwwKE8y+Xk6uch7HzoDTt7iqu8rW/RqYcppeAVOn99i2yjJEIQRYvyn03vF+
 fB8z1SvpUDbe68y3ShiJpTYlC02p4tJkEADNQa4+DtDuHtPab8l1ujcvuR2n8Mwsar
 ZnCbmBkox4fsVD9AhmcbpnUoCDdYKt8xway7AyH0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.26]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1mwTg01r9s-00DGzL
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 13:09:36 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 13:09:34 +0100
Message-Id: <20211106120935.1085-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:qQiBnlFpltp8wEJ1YrhrYi6mmLRbaF5dBaEl77GS7fi83wA72/Y
 qjZrsUy/r0I9hrh4mNxUpw3m3S+CdjIasF2YG1LgpHfbvzCE1aIXR5navZYEb6XomV3QIj7
 VBRDDp0hMaSx2QYi1VWu/Up/pqXloP0IVFK+CoCVOSGzNGY5hX89XSb5Mv7NdKMh1rHuXaX
 fAO3aECdHxULzeBMnvIqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DRXYVA9Ue1Y=:Q4qNjukOgyl/oYqR3O2mRp
 Dt/20MLtUXhSarNEW2iZ0+HuAhdSWN3dUEBczTfOq8kw+7Kd1lVKn8xtgoSh6PgRPicTR9ZNB
 b+lBRuFVbVgc2Db6lJOqzYrOf1wvMi37JmTg9Ez7jYni61dy3fe9Iis7bktc1+1SdREM/k+kO
 J+MJ4fgm83yroFN5n5+8joA1gsvs/qB6A2ZQyBxcxy9jr2Xb1JlDvYXjwsoluqXzPGsRApIP2
 98vm3XCCxq28Wa8diWEa4vZSy+0lV8zBt+cfffy8cbAVDcvkCICiHcMOCXmeiwtx2D/M/iINj
 J0ux92w1qC+HjTJ0mEFi993ADxa3wPYQQvo9h+mX8ial1Nwwv6R3q6JhZTUhMqYklprgu4hoI
 58mbfNLys4l+MvjFg9WDqQw7DgIlmzb8SJAaCdrMXEMzlEPdtc50yiOlE76+EmtkVMvjsik3I
 WjDea39R+RWpfNQBghspqBGGnJdWTwxCv1J5oEcIxoXZMkJ0WvHtFr+P2VGkvKOnlHMr05QP8
 t2fzOS9uItOPCEIp0PvJd9eQgj7OsOBlPgMnx4zds8EldKXKyMKRSFwMnh3ZkYmCA+hAGpOSk
 2OjK/5xVnvuydtv/dk3wX+s4L0gympAxc73cq9Nluzvx6Gh95Mt08EvHtpiUmeWk+s24XVHVg
 bShCpqVvP42GlzUPaSXkqYtEzhwesCds8GWPGU8UNB7TbEKES+7Km55uI7PMRjlwEBo81LqJK
 yeL+kJXTVwrmhJVGUNgU1HBryBkcFDmhCwDv6p/7rKiLuFL72wVLqrvOvbFdPSCAhiajAdmtL
 Lafdi/To7rr+ajebLrOR/J+gMOmL19NBvIzKSB3QLgcNM/dLuMNFuzMYHIVrYhIKZWGqCQAhO
 Xu5OQBTF1LaLOcKfghLe43UKACeYNXUYxeHIgdieNDutv2gj1BWdnz6m009yGWKtD2mhCIybo
 pnLEodzK6jyQKqr8XgfXMzdiMLGKXq7Xp4fq0T62G2IYuOCJy6HSJZd0SHw4uqQwLJ4VGa7GJ
 JW0m+u47q5/pLxVsxaOVzQ9KOK/r8epDSUxeEJSDwu5fYxufATQOL/XQVpQBzQdJ/s5jWCpEH
 Rvnv9o8liRawKg=
Subject: [Buildroot] [PATCH v1 1/2] package/gdb: fix gdb-11.1 compile for
 uclibc < v1.0.35 (getrandom related)
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

LSBmaXggZ2V0cmFuZG9tIGNvbXBpbGUgZm9yIHVjbGliYyA8IHYxLjAuMzUsIGFkZCBtaXNzaW5n
IHN0ZGRlZi5oCiAgaW5jbHVkZSAoZml4ZWQgaW4gdWNsaWJjIHNpbmNlIHYxLjAuMzUsIHNlZSBb
MV0pCgpGaXhlczoKCiAgLi4uL2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lz
cm9vdC91c3IvaW5jbHVkZS9zeXMvcmFuZG9tLmg6Mjc6MzU6IGVycm9yOiB1bmtub3duIHR5cGUg
bmFtZSDigJhzaXplX3TigJkKICAgICAyNyB8IGV4dGVybiBpbnQgZ2V0cmFuZG9tKHZvaWQgKl9f
YnVmLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIGludCBmbGFncykKICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFNl
aWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiAuLi5nZXRyYW5kb20tY29tcGlsZS1mb3It
dWNsaWJjLXYxLjAuMzUucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMzkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ2RiLzEx
LjEvMDAwNy1GaXgtZ2V0cmFuZG9tLWNvbXBpbGUtZm9yLXVjbGliYy12MS4wLjM1LnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nZGIvMTEuMS8wMDA3LUZpeC1nZXRyYW5kb20tY29tcGlsZS1m
b3ItdWNsaWJjLXYxLjAuMzUucGF0Y2ggYi9wYWNrYWdlL2dkYi8xMS4xLzAwMDctRml4LWdldHJh
bmRvbS1jb21waWxlLWZvci11Y2xpYmMtdjEuMC4zNS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi5iMDJkNjNmYzBjCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS9nZGIvMTEuMS8wMDA3LUZpeC1nZXRyYW5kb20tY29tcGlsZS1mb3ItdWNsaWJjLXYxLjAuMzUu
cGF0Y2gKQEAgLTAsMCArMSwzOSBAQAorRnJvbSA4NzkwMDhlZjlhNDhhYTEzNjM2NzFmNWMxNzM2
YjQ5ZjMwYzVhMzc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PgorRGF0ZTogU2F0LCA2IE5vdiAyMDIxIDEwOjA2OjI1ICsw
MTAwCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCBnZXRyYW5kb20gY29tcGlsZSBmb3IgdWNsaWJjIDwg
djEuMC4zNQorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hh
cnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCistIGZpeCBnZXRy
YW5kb20gY29tcGlsZSBmb3IgdWNsaWJjIDwgdjEuMC4zNSwgYWRkIG1pc3Npbmcgc3RkZGVmLmgK
KyAgaW5jbHVkZSAoZml4ZWQgaW4gdWNsaWJjIHNpbmNlIHYxLjAuMzUsIHNlZSBbMV0pCisKK0Zp
eGVzOgorCisgIC4uLi9ob3N0L3g4Nl82NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3Qv
dXNyL2luY2x1ZGUvc3lzL3JhbmRvbS5oOjI3OjM1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYc2l6ZV904oCZCisgICAgIDI3IHwgZXh0ZXJuIGludCBnZXRyYW5kb20odm9pZCAqX19idWYs
IHNpemVfdCBjb3VudCwgdW5zaWduZWQgaW50IGZsYWdzKQorICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KKworWzFdIGh0dHBzOi8vY2dpdC51Y2xpYmMt
bmcub3JnL2NnaS9jZ2l0L3VjbGliYy1uZy5naXQvY29tbWl0Lz9pZD0wMDk3MmMwMmMyYjZlMGE5
NWQ1ZGVmNGE3MWJkZmIxODhlMDkxNzgydAorCitTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJl
ciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBnbnVsaWIvaW1wb3J0L2dldHJhbmRvbS5jIHwg
MSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS9nbnVs
aWIvaW1wb3J0L2dldHJhbmRvbS5jIGIvZ251bGliL2ltcG9ydC9nZXRyYW5kb20uYworaW5kZXgg
NDEyMTJmYi4uMGFkM2Y5NiAxMDA2NDQKKy0tLSBhL2dudWxpYi9pbXBvcnQvZ2V0cmFuZG9tLmMK
KysrKyBiL2dudWxpYi9pbXBvcnQvZ2V0cmFuZG9tLmMKK0BAIC0xOSw2ICsxOSw3IEBACisgCisg
I2luY2x1ZGUgPGNvbmZpZy5oPgorIAorKyNpbmNsdWRlIDxzdGRkZWYuaD4KKyAjaW5jbHVkZSA8
c3lzL3JhbmRvbS5oPgorIAorICNpbmNsdWRlIDxlcnJuby5oPgorLS0gCisyLjMzLjEKKwotLSAK
Mi4zMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
