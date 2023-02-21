Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA07C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 16:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43B3842CAD;
	Tue, 21 Feb 2023 16:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B3842CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvC8pzt1ldRg; Tue, 21 Feb 2023 16:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13EE942CDF;
	Tue, 21 Feb 2023 16:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13EE942CDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6F331BF344
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0FEB4013B
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 16:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0FEB4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8r_Ok4_Q2Dwx for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 16:22:32 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40DA40132
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C40DA40132
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 16:22:31 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UVIZplbyt73vcUVIZpSHah; Tue, 21 Feb 2023 17:15:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 17:15:21 +0100
Message-Id: <20230221161522.3749804-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJX+5/6cwyDcSY+pCRba5kmGathW3nagI4MxAKEOL3exCH2m2ty4CPgbqvcAhpaxtcy/L8ONf+TSfm6TxuGo/ArRGG9CHtjmf56wO1vsVabCSqgk2qv4
 SDjrv5/yKzJTstjNHE6SJXq2ceIJaCwFf8Z04Tr1fT3Cj2FYPeszkkObdM9sG+cPmU4P2spYUQuEBdGKIkAJowToe+/9H7AXSK4j+8TAmo5PxEW/h7FDAWAN
 YDUyXYanZnvndBJBuzmEKZ/z1KzLG4B7X+79+Dba+Gzwb1rl+kx74itlN1GQyFyhvE8L7qe+CcxzGZuK1GShfbhx+NcEKfUFpVa7hGdli9+IU0FbyS4RFh3j
 azEtL14F
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676996124; bh=5K543r+LDDnl4XXsJj6NBBcSefLJDz94JzuFLcd4TTo=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=JaGtezEcTTvA7TwmqcoimbKh248joRv3TK2r0tpWkStB0BOElscl4vibaYkdlXh4R
 IiX9imbPVVd4MuHya6xMUfeIlkLhdWhv32RECxgrJCJ7mw8EAsN/2TVwscJA4PnlmZ
 KIhYZpseMBDPx2W+DhRso/fZ7ilfBv9zDwdAEa8OVrhd7QzffQApy0U7oZVmQKpqdz
 u7v2oVvuvR6bA7/NMxx5bj7zRboi/jUYEaY8AvkMYGNz4AeKWpC8Dg08jvI38cZhpE
 7cdbPyZU6YhJi6AzW0Njn13siwF48E2YaPWZVy/hgBPXsK82VT+/TcbbjDKd1E5PKH
 Y9Gwbthk5abyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JaGtezEc
Subject: [Buildroot] [PATCH] package/webkitgtk: fix build failure with mixed
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
OwphbmQKCkZpeGVzOgpzdGlsbCBub3QgZmFpbGVkCgpbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS9X
ZWJLaXQvV2ViS2l0L3B1bGwvMTA0NDcKClNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxn
aXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgotLS0KIC4uLm9kZXItYm9vbGVh
bi1lbnVtLWFuZC1kZWZpbmUtVFJVRS1GQS5wYXRjaCB8IDUzICsrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS93ZWJraXRndGsvMDAwMS1GaXgtSlBFR0ltYWdlRGVjb2Rlci1ib29sZWFuLWVudW0tYW5k
LWRlZmluZS1UUlVFLUZBLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93ZWJraXRndGsvMDAw
MS1GaXgtSlBFR0ltYWdlRGVjb2Rlci1ib29sZWFuLWVudW0tYW5kLWRlZmluZS1UUlVFLUZBLnBh
dGNoIGIvcGFja2FnZS93ZWJraXRndGsvMDAwMS1GaXgtSlBFR0ltYWdlRGVjb2Rlci1ib29sZWFu
LWVudW0tYW5kLWRlZmluZS1UUlVFLUZBLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjc2NDhjZThmMjkKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3dlYmtp
dGd0ay8wMDAxLUZpeC1KUEVHSW1hZ2VEZWNvZGVyLWJvb2xlYW4tZW51bS1hbmQtZGVmaW5lLVRS
VUUtRkEucGF0Y2gKQEAgLTAsMCArMSw1MyBAQAorRnJvbSAzN2YwN2IwMTQxMjZmOGNhNTZiNjBi
M2E0ZWQzOGY5NmYwN2QyZWM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CitEYXRlOiBU
dWUsIDIxIEZlYiAyMDIzIDE2OjQzOjA1ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCBKUEVH
SW1hZ2VEZWNvZGVyIGJvb2xlYW4gZW51bSBhbmQgI2RlZmluZSBUUlVFL0ZBTFNFIG1peAorIGh0
dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yNTI2NjYKK01JTUUtVmVyc2lv
bjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQt
VHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworUmV2aWV3ZWQgYnkgTk9CT0RZIChPT1BTISkuCisK
K2pwZWdsaWIuaCBjb250YWlucyBhIHR5cGVkZWYgZW51bSBmb3IgYm9vbGVhbiB0eXBlIGJ1dCBM
Q01TVW5pcXVlUHRyLmgKK2luY2x1ZGUgZmlsZXMgdGhhdCBjYW4gY29udGFpbiAjZGVmaW5lIFRS
VUUvRkFMU0UuIFRoaXMgd2F5IGJ1aWxkIGZhaWxzCit3aXRoOgorSlBFR0ltYWdlRGVjb2Rlci5j
cHA6MzQzOjQzOiBlcnJvcjogaW52YWxpZCBjb252ZXJzaW9uIGZyb20g4oCYaW504oCZIHRvIOKA
mGJvb2xlYW7igJkKKworVGhpcyBpcyBiZWNhdXNlIFRSVUUgb3IgRkFMU0Ugc2hvdWxkIGJlIGFu
IGVudW0gaW5zdGVhZCB0aGV5IGdldCBkZWZpbmVkCithcyAxIG9yIDAuIFRvIGZpeCB0aGlzIG1v
dmUganBlZ2xpYi5oIGluY2x1c2lvbiBhZnRlciBMQ01TVW5pcXVlUHRyLmgKK2luY2x1c2lvbi4K
KworU291cmNlL1dlYkNvcmUvcGxhdGZvcm0vaW1hZ2UtZGVjb2RlcnMvanBlZy9KUEVHSW1hZ2VE
ZWNvZGVyLmg6CisKK1NpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgorLS0tCisgLi4uL3BsYXRmb3JtL2ltYWdlLWRlY29k
ZXJzL2pwZWcvSlBFR0ltYWdlRGVjb2Rlci5oICAgICAgICB8IDcgKysrKy0tLQorIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9T
b3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9pbWFnZS1kZWNvZGVycy9qcGVnL0pQRUdJbWFnZURlY29k
ZXIuaCBiL1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL2ltYWdlLWRlY29kZXJzL2pwZWcvSlBFR0lt
YWdlRGVjb2Rlci5oCitpbmRleCBhYTg3NWRlMDBmYWEuLmMzOTZlMTA4NmQ0MSAxMDA2NDQKKy0t
LSBhL1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL2ltYWdlLWRlY29kZXJzL2pwZWcvSlBFR0ltYWdl
RGVjb2Rlci5oCisrKysgYi9Tb3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9pbWFnZS1kZWNvZGVycy9q
cGVnL0pQRUdJbWFnZURlY29kZXIuaAorQEAgLTMyLDE0ICszMiwxNSBAQAorIC8vIElDVSBkZWZp
bmVzIFRSVUUgYW5kIEZBTFNFIG1hY3JvcywgYnJlYWtpbmcgbGlianBlZyB2OSBoZWFkZXJzCisg
I3VuZGVmIFRSVUUKKyAjdW5kZWYgRkFMU0UKKy1leHRlcm4gIkMiIHsKKy0jaW5jbHVkZSAianBl
Z2xpYi5oIgorLX0KKyAKKyAjaWYgVVNFKExDTVMpCisgI2luY2x1ZGUgIkxDTVNVbmlxdWVQdHIu
aCIKKyAjZW5kaWYKKyAKKytleHRlcm4gIkMiIHsKKysjaW5jbHVkZSAianBlZ2xpYi5oIgorK30K
KysKKyBuYW1lc3BhY2UgV2ViQ29yZSB7CisgCisgICAgIGNsYXNzIEpQRUdJbWFnZVJlYWRlcjsK
Ky0tIAorMi4zNC4xCisKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
