Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF9EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F0B6610A0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F0B6610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06F7A80F48;
	Tue,  9 Nov 2021 17:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_f37yEaZT6B; Tue,  9 Nov 2021 17:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6101C8100A;
	Tue,  9 Nov 2021 17:56:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C274B1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1F4B6088F
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:56:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kdmwlVOT5pdz for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:56:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E77660874
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636480591;
 bh=kbbEHGN7JxIsF3X9F2Obc5n9J1J8aYfYn+tvVwwP72E=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=MF2gGO2V7B/e2JKXuc4iyJLUbrxFJntL9/NqxDZM+n5J1F/IDp1jp+g42cgXoqzhI
 8lSwASXWe0k2WyYMEu0NdzJenlz7qFg7HDT3h79WeGCjsU3+xdwLaB2IEizyaBS6O8
 SYD5N+ZNy1awXI4AX0PXOeDPC07mgk2HiFQ1NGxw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbAcs-1m8ykJ3AMa-00bedf
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 18:56:31 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:56:30 +0100
Message-Id: <20211109175631.26267-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Jb+JsTS/mvmNAbx/KiJ2YXqsPXVI2IqwSj1ofv2GEf+Nosg088o
 Dpcmw7XadizbR4b/i9krLaC5r88mZyIZpnIreryztwIh8XdihkwBprfyqu0i8oTs9bADblg
 xiLey3uXE3Z/0RFugBTOo9Uiaf9A78A0CReASXHRDydc0qr18ak7KxHJMSKOpDVOnRSeJel
 S8iz7ehT7xAz6h7D6UjEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Tt62WkLyss=:JJ9X+aLsAQq3WOcmOOiIsB
 DX3BspRCna0XObA5VKS6qoJU+IA9ls9wpuZTFvk6TzjHTtIvq23mcuFktcI6I5L8e/Ms84f1v
 MIw80ZozpQoFK5JSJsa4cWBj2qU0ZQZan/RCZUs5crno3AfJHn4pB9zvUUp8zVjbML+g/QMII
 4pbKw+y5pRlh6SlGJ59r2WtECV2RS0AHSCeLUrYw2/MwdQjCv3vyv15invVelYP4O2nAUbcK7
 c1rwMMd4N3iQ68dk6lvZrbILraWeVh53084Co538Pw6HC5lmTULG/PJGT5XZNSe+2vjxoKtNF
 kn1WLaIgBl1O0EgIHsx2reDJzoKBC38ZBwDDHFvnsBAc9cKCa2BA8tevGVFGJB+50coJ53k7U
 0yW5m+3k+7Q+l3ns30loly0bSMWkt9yDAgENy4NsbbLzi4j2spmkY9ASjwYees2J6KXvfEU6i
 wsZaKR7ZeB6BxkgHMWolDoMnG60p7moF0ZqrbbxRzFWr+S+nrJSATQGn+5n8bhcJktb7610uj
 04jQTlHa6sZBIdecqGxCBCNtwB92JhcARyl5HlxYQmZGIJURF1K/IoUNNXP3Ak9fu+XS029Yj
 E9OkuBa0akzaybsnRz6VpX7xJLa17ye7F2aJr232grWc36L48Ta+2NB/lQ96Ss0q9nRIDrfrR
 dyl0Xz6TqUwIztwlkyWUM/SXrNbu3kr72b/0o8sBS9tZM27O6BM2LdG0KRg5KXEyIterLisDo
 HJkd85Jg9y0CBxL6DE368A8pLFzE5S7ooqmGjb3vA1oZbqHT7OM4/xIGJ/sNohcPqzDH6IAvB
 NWNi+icqnrHw4G4RDY4hWUQHrR1T1MS7PBXGjJh5XLXtsZl00QfojZOsQNwSKnT4y4PyqAF7s
 AC1j77eDBENO7r7NVPS5GEOtjOR6dulXI7UI3NdMy2Rx84vq/Rj/LABsZ3a7c7DGdT1ZokoNH
 xjLwM0EwOl8xxAei7/BEXb8Q+sIvdk3Cy4GCH/iiPwVtCQhO1lHEQptUlNXZ/MIEddYo6yNWS
 Z3FjMVbxGu/1sw88uN+Hzq3/Wi9WW5nQrUVLEDfH8KyhouXuaYUntpy7sw1SoKA53f0Sx56Do
 aLMT91Fn7vNE9Q=
Subject: [Buildroot] [PATCH v2 1/2] package/gdb: fix gdb-11.1 compile for
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
