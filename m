Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B2AC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 16:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12A4742CDF;
	Tue, 21 Feb 2023 16:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A4742CDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g-47Cej2Gb8Q; Tue, 21 Feb 2023 16:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BE042FE4;
	Tue, 21 Feb 2023 16:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BE042FE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C90D1BF344
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E956A611B7
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E956A611B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQNBxqxaODD9 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 16:22:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEA21600D1
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BEA21600D1
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 16:22:32 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UVIZplbyt73vcUVIapSHay; Tue, 21 Feb 2023 17:15:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 17:15:22 +0100
Message-Id: <20230221161522.3749804-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221161522.3749804-1-giulio.benetti@benettiengineering.com>
References: <20230221161522.3749804-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJX+5/6cwyDcSY+pCRba5kmGathW3nagI4MxAKEOL3exCH2m2ty4CPgbqvcAhpaxtcy/L8ONf+TSfm6TxuGo/ArRGG9CHtjmf56wO1vsVabCSqgk2qv4
 SDjrv5/yKzJTstjNHE6SJXq2ceIJaCwFf8Z04Tr1fT3Cj2FYPeszkkObdM9sG+cPmU4P2spYUQuEBdGKIkAJowToe+/9H7AXSK4j+8TAmo5PxEW/h7FDAWAN
 YDUyXYanZnvndBJBuzmEKZ/z1KzLG4B7X+79+Dba+Gzwb1rl+kx74itlN1GQyFyhvE8L7qe+CcxzGZuK1GShfbhx+NcEKfUFpVa7hGdli9+IU0FbyS4RFh3j
 azEtL14F
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676996124; bh=5K4tLuwpJrmnRSOMu9+ySXv9CxA7dYCNKUMlHAbCaJk=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=Accod7QXjR7jCOtMjekv+ybIjDOvfjmJ6NSX5EY6CJiNUkD+CerIFbVX4g5Vvz829
 lSUDVvTPCOr0LsBBua42NnWpepWOfXyWxTuEwJ07Zj91Q9JpaPvKaP4Q8nPeFK/Hgk
 MjA9sCkXh1mw6Bcn5A94gS8PQP1y4P5h2sVvZToqjbKEdqMgN22fSm79hdA7PnFdfu
 8Fy/IzHrB20BHZjpHd8uwI16yIROl7WgwKnxMZW+7F+Y+3Wh98ZVj7NCdsTnVu2ZkK
 KtcnqYfqGpYx9y01bDbTOSi9LekmGYa8yBVq8xjm4qT6X7LeCwii0pqubHfge1iyfB
 FmYUIexo93phA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Accod7QX
Subject: [Buildroot] [PATCH] package/wpewebkit: fix build failure with mixed
 boolean types
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGxvY2FsIHBhdGNoIHBlbmRpbmcgdXBzdHJlYW1bMF0gdG8gZml4IGJ1aWxkIGZhaWx1cmUg
ZHVlIHRvIG1peGVkCnR5cGVkZWYgZW51bSB7IEZBTFNFID0gMCwgVFJVRSA9IDEgfSBib29sZWFu
OwphbmQKI2RlZmluZSBGQUxTRSAwCiNkZWZpbmUgVFJVRSAgMQoKRml4ZXM6CnN0aWxsIG5vdCBm
YWlsZWQKClswXTogaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQvcHVsbC8xMDQ0NwoK
U2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdp
bmVlcmluZy5jb20+Ci0tLQogLi4ub2Rlci1ib29sZWFuLWVudW0tYW5kLWRlZmluZS1UUlVFLUZB
LnBhdGNoIHwgNTMgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUzIGluc2Vy
dGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3dwZXdlYmtpdC8wMDAyLUZpeC1K
UEVHSW1hZ2VEZWNvZGVyLWJvb2xlYW4tZW51bS1hbmQtZGVmaW5lLVRSVUUtRkEucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC8wMDAyLUZpeC1KUEVHSW1hZ2VEZWNvZGVyLWJv
b2xlYW4tZW51bS1hbmQtZGVmaW5lLVRSVUUtRkEucGF0Y2ggYi9wYWNrYWdlL3dwZXdlYmtpdC8w
MDAyLUZpeC1KUEVHSW1hZ2VEZWNvZGVyLWJvb2xlYW4tZW51bS1hbmQtZGVmaW5lLVRSVUUtRkEu
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNzY0OGNlOGYyOQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvd3Bld2Via2l0LzAwMDItRml4LUpQRUdJbWFnZURl
Y29kZXItYm9vbGVhbi1lbnVtLWFuZC1kZWZpbmUtVFJVRS1GQS5wYXRjaApAQCAtMCwwICsxLDUz
IEBACitGcm9tIDM3ZjA3YjAxNDEyNmY4Y2E1NmI2MGIzYTRlZDM4Zjk2ZjA3ZDJlYzkgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlA
YmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KK0RhdGU6IFR1ZSwgMjEgRmViIDIwMjMgMTY6NDM6MDUg
KzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IEpQRUdJbWFnZURlY29kZXIgYm9vbGVhbiBlbnVt
IGFuZCAjZGVmaW5lIFRSVUUvRkFMU0UgbWl4CisgaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hv
d19idWcuY2dpP2lkPTI1MjY2NgorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAor
CitSZXZpZXdlZCBieSBOT0JPRFkgKE9PUFMhKS4KKworanBlZ2xpYi5oIGNvbnRhaW5zIGEgdHlw
ZWRlZiBlbnVtIGZvciBib29sZWFuIHR5cGUgYnV0IExDTVNVbmlxdWVQdHIuaAoraW5jbHVkZSBm
aWxlcyB0aGF0IGNhbiBjb250YWluICNkZWZpbmUgVFJVRS9GQUxTRS4gVGhpcyB3YXkgYnVpbGQg
ZmFpbHMKK3dpdGg6CitKUEVHSW1hZ2VEZWNvZGVyLmNwcDozNDM6NDM6IGVycm9yOiBpbnZhbGlk
IGNvbnZlcnNpb24gZnJvbSDigJhpbnTigJkgdG8g4oCYYm9vbGVhbuKAmQorCitUaGlzIGlzIGJl
Y2F1c2UgVFJVRSBvciBGQUxTRSBzaG91bGQgYmUgYW4gZW51bSBpbnN0ZWFkIHRoZXkgZ2V0IGRl
ZmluZWQKK2FzIDEgb3IgMC4gVG8gZml4IHRoaXMgbW92ZSBqcGVnbGliLmggaW5jbHVzaW9uIGFm
dGVyIExDTVNVbmlxdWVQdHIuaAoraW5jbHVzaW9uLgorCitTb3VyY2UvV2ViQ29yZS9wbGF0Zm9y
bS9pbWFnZS1kZWNvZGVycy9qcGVnL0pQRUdJbWFnZURlY29kZXIuaDoKKworU2lnbmVkLW9mZi1i
eTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+
CistLS0KKyAuLi4vcGxhdGZvcm0vaW1hZ2UtZGVjb2RlcnMvanBlZy9KUEVHSW1hZ2VEZWNvZGVy
LmggICAgICAgIHwgNyArKysrLS0tCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL2lt
YWdlLWRlY29kZXJzL2pwZWcvSlBFR0ltYWdlRGVjb2Rlci5oIGIvU291cmNlL1dlYkNvcmUvcGxh
dGZvcm0vaW1hZ2UtZGVjb2RlcnMvanBlZy9KUEVHSW1hZ2VEZWNvZGVyLmgKK2luZGV4IGFhODc1
ZGUwMGZhYS4uYzM5NmUxMDg2ZDQxIDEwMDY0NAorLS0tIGEvU291cmNlL1dlYkNvcmUvcGxhdGZv
cm0vaW1hZ2UtZGVjb2RlcnMvanBlZy9KUEVHSW1hZ2VEZWNvZGVyLmgKKysrKyBiL1NvdXJjZS9X
ZWJDb3JlL3BsYXRmb3JtL2ltYWdlLWRlY29kZXJzL2pwZWcvSlBFR0ltYWdlRGVjb2Rlci5oCitA
QCAtMzIsMTQgKzMyLDE1IEBACisgLy8gSUNVIGRlZmluZXMgVFJVRSBhbmQgRkFMU0UgbWFjcm9z
LCBicmVha2luZyBsaWJqcGVnIHY5IGhlYWRlcnMKKyAjdW5kZWYgVFJVRQorICN1bmRlZiBGQUxT
RQorLWV4dGVybiAiQyIgeworLSNpbmNsdWRlICJqcGVnbGliLmgiCistfQorIAorICNpZiBVU0Uo
TENNUykKKyAjaW5jbHVkZSAiTENNU1VuaXF1ZVB0ci5oIgorICNlbmRpZgorIAorK2V4dGVybiAi
QyIgeworKyNpbmNsdWRlICJqcGVnbGliLmgiCisrfQorKworIG5hbWVzcGFjZSBXZWJDb3JlIHsK
KyAKKyAgICAgY2xhc3MgSlBFR0ltYWdlUmVhZGVyOworLS0gCisyLjM0LjEKKwotLSAKMi4zNC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
