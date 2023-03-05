Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06422C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 22:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60B3D40158;
	Sun,  5 Mar 2023 22:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B3D40158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wndShBVKP-af; Sun,  5 Mar 2023 22:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ADC740132;
	Sun,  5 Mar 2023 22:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9ADC740132
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC6BA1BF30D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 22:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2E2140132
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 22:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E2140132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Br-zEHUEmgpM for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 22:55:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20BEE400D2
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20BEE400D2
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 22:55:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.78]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1qRs8Z1L21-00tX4S
 for <buildroot@buildroot.org>; Sun, 05 Mar 2023 23:55:54 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun,  5 Mar 2023 23:55:53 +0100
Message-Id: <20230305225553.7714-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:obSDen+xecURPxDfP68u9/vt5ZIstU9ho0bFNDArJ/w9/p1mpoF
 jrDMO0YIKMCKMRaSFKvUSfWzuxKKqVu2TJYAQXy7ckbF7duWyANzBre/mwIYrjNiYfAUi0L
 WjKTuGHdX1rWTlHXOfozgt4DH9e7RC5kwAFVlmNv2ayxRSpLI0OeWBshAph9omN7wLd2x0u
 zCOhkB5aKm23vPYffYxBQ==
UI-OutboundReport: notjunk:1;M01:P0:u512twNNV8Y=;qtJcXuQCLKZAcz0O+WSTBGLkDXQ
 RqGi9N2LGU4H91M1lEXhCUwek/BOzA/j7/NLKZRwaR2L16byYBTOpM63xKcD6teW8ShYKIXpO
 ZGcWt/ab/Xr9nWe8cjSj3BUVIfA5H/blRYyIXWQLwR+7G/b0PnVxxJ1/Fuz2na5CpQ8Td1EHY
 GqWQlzlz4Nwi94NB6DbQfpJF+WullpdAUAF/bxtKC7SqTFP/lcjKgHUlJr/fX2oJ9e62sZnm0
 rZ3O5JJFkhY8B7ZKiETZzfROkKtDqfSzOxya+c/4kUJjHEycrPK09UkC/Ec49H7pF9gO0e9pc
 rAeVFlTmZajmT9CKCxD8+PMKw5FgUZH94e57JDWolU92DG+kS+yLhDGsJPn739J6vQUhhn4wk
 MEbR91lA4biHwF7dSacdgSg/rMuk7XZSERub4694yqhi4bmfNFNnPIO2E7NvpUazXj8k4g2rd
 WuVAD/EMcC0gsxDgTWnN87IsrOQUpf9odmcPogbGKm053vuAF7affaM21F/8grrZHyezwGE0J
 EFpsqnNJ5oR88GiK+LRZreBzYwOBPrFoX8e4/NrZIgtTBg2r/VYfmiUu0UlzdRTNX9twJkxO8
 gAsRRCJa6yIk4eyTlWNzdsxMV/Rgkm915luwvcQYDDC/pzMB1g1ncOcG4cTPfKmH20rLl2BFc
 hcAqJ6f3JpU5O4NvpeGaoe8CVKL/puBY/JUtPbvap0ljl511eDXVHzW5U+rWUziOoA22YzBRQ
 DtlXmLrGmV/tDtDzWBws9FK3PW+BFGegaIrPN0jMsWS8edlVsuZWMuNonDMV/dd3dA0RK2/yY
 IKbkzLphGl8w1JgDzCoyFAkMoLCMswFa89UhHBBHNsdZ/ZvtWg/8EEKOeoBOGRJVs+EG+xTPZ
 ondkDmCLiY/2rGqxBcadQLfiiSYYf4ay9gRTwlRvlnv/3WT3E2mgM9owmia0QrwYh+xyZudkz
 1561iRWEAgK4jYH6QcycBkJ29V8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1678056954; i=ps.report@gmx.net;
 bh=nbHBTDnH/geeejSaXTgFuzrPdTCoCGJLV6TjZurwnLE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=AXHrURnp31ooCa07jd6SDYtZZxFGJB16AQMEIlFK/uvaUKVgX4Fb+alv+SYbRT/GK
 wJx1hEkeLemYiPUuEJcZM0jFWRfW8a76Q0YNA5nHGyYKfr3V9D/oVSu6pGc4gbMiHc
 65jodnT533iUK2qT4sI0B/4o2kVmrv8gQhMGMEeFi1xlskYCdRrsLIH2KVBF4l5C9o
 K9M6yqMSoMGSg2QEqHULBxXnp22eFaXojIJCgXVC9NBcYW/9fzPCC6tP/T+cSkW9S8
 U30W5H1ALtn96xrN7G9bBtRBNcms53AfU7w7tXd0ipUL+DJnArI54OTb5eYqekTllE
 sfcxKb6pHVYKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=AXHrURnp
Subject: [Buildroot] [PATCH v1] package/uqmi: fix compile error (gcc false
 error reporting)
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

QWRkIHVwc3RyZWFtIHN1Z2dlc3RlZCBwYXRjaCAoWzFdKSB0byBhdm9pZCBnY2MgZmFsc2UgZXJy
b3IgcmVwb3J0aW5nLgoKRml4ZXM6CgogIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvY2U5ZTIwNzRiYjg0ODZkMWVlMjUyMzJiOTg1ZDQ3NDc1ZmFlZmQ2MwoKICBkZXYu
YzoyMTc6MjM6IGVycm9yOiBzdG9yaW5nIHRoZSBhZGRyZXNzIG9mIGxvY2FsIHZhcmlhYmxlICdj
b21wbGV0ZScgaW4gJypyZXEuY29tcGxldGUnIFstV2Vycm9yPWRhbmdsaW5nLXBvaW50ZXI9XQog
ICAgMjE3IHwgICAgICAgICByZXEtPmNvbXBsZXRlID0gJmNvbXBsZXRlOwogICAgICAgIHwgICAg
ICAgICB+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+CgpbMV0gaHR0cDovL2xpc3RzLm9wZW53cnQu
b3JnL3BpcGVybWFpbC9vcGVud3J0LWRldmVsLzIwMjMtTWFyY2gvMDQwNjMzLmh0bWwKClNpZ25l
ZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiAuLi5hbHNl
LWVycm9yLXJlcG9ydGluZy1zdG9yaW5nLXRoZS1hZGQucGF0Y2ggfCA1NCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvdXFtaS8wMDAxLXVxbWktYXZvaWQtZ2NjLWZhbHNlLWVycm9yLXJlcG9ydGlu
Zy1zdG9yaW5nLXRoZS1hZGQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3VxbWkvMDAwMS11
cW1pLWF2b2lkLWdjYy1mYWxzZS1lcnJvci1yZXBvcnRpbmctc3RvcmluZy10aGUtYWRkLnBhdGNo
IGIvcGFja2FnZS91cW1pLzAwMDEtdXFtaS1hdm9pZC1nY2MtZmFsc2UtZXJyb3ItcmVwb3J0aW5n
LXN0b3JpbmctdGhlLWFkZC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5jOTQwOTI1NzY3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS91cW1pLzAwMDEtdXFt
aS1hdm9pZC1nY2MtZmFsc2UtZXJyb3ItcmVwb3J0aW5nLXN0b3JpbmctdGhlLWFkZC5wYXRjaApA
QCAtMCwwICsxLDU0IEBACitGcm9tIDRjMmViOTI2ZWZiNGRlMjRhZjVhM2IxZThjMTgxOTUxOTg4
Mjc0OTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMu
cmVwb3J0QGdteC5uZXQ+CitEYXRlOiBTdW4sIDUgTWFyIDIwMjMgMjI6MDg6MTMgKzAxMDAKK1N1
YmplY3Q6IFtQQVRDSF0gdXFtaTogYXZvaWQgZ2NjIGZhbHNlIGVycm9yIHJlcG9ydGluZyAoc3Rv
cmluZyB0aGUgYWRkcmVzcyBvZgorIGxvY2FsIHZhcmlhYmxlICdjb21wbGV0ZScgaW4gJypyZXEu
Y29tcGxldGUnKQorCitBdm9pZCBnY2MgZmFsc2UgZXJyb3IgcmVwb3J0aW5nIChyZXEtPmNvbXBs
ZXRlIGlzIGxhdGVyIHJlc2V0IHRvIE5VTEwKK2luIGNhc2Ugb2YgdXNlIG9mIGxvY2FsIGNvbXBs
ZXRlKToKKworICBkZXYuYzoyMTc6MjM6IGVycm9yOiBzdG9yaW5nIHRoZSBhZGRyZXNzIG9mIGxv
Y2FsIHZhcmlhYmxlICdjb21wbGV0ZScgaW4gJypyZXEuY29tcGxldGUnIFstV2Vycm9yPWRhbmds
aW5nLXBvaW50ZXI9XQorICAgIDIxNyB8ICAgICAgICAgcmVxLT5jb21wbGV0ZSA9ICZjb21wbGV0
ZTsKKyAgICAgICAgfCAgICAgICAgIH5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn4KKworU2lnbmVk
LW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgorCitbVXBzdHJlYW06
IGh0dHA6Ly9saXN0cy5vcGVud3J0Lm9yZy9waXBlcm1haWwvb3BlbndydC1kZXZlbC8yMDIzLU1h
cmNoLzA0MDYzMy5odG1sXQorU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9y
dEBnbXgubmV0PgorLS0tCisgZGV2LmMgfCAxMiArKysrKysrKysrKysKKyAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvZGV2LmMgYi9kZXYuYworaW5kZXgg
YmQxMDIwNy4uYjhhYzI3MyAxMDA2NDQKKy0tLSBhL2Rldi5jCisrKysgYi9kZXYuYworQEAgLTIw
Myw2ICsyMDMsMTUgQEAgdm9pZCBxbWlfcmVxdWVzdF9jYW5jZWwoc3RydWN0IHFtaV9kZXYgKnFt
aSwgc3RydWN0IHFtaV9yZXF1ZXN0ICpyZXEpCisgCV9fcW1pX3JlcXVlc3RfY29tcGxldGUocW1p
LCByZXEsIE5VTEwpOworIH0KKyAKKysvKiBhdm9pZCBnY2MgZmFsc2UgZXJyb3IgcmVwb3J0aW5n
OgorKyAqICAgZGV2LmM6MjE3OjIzOiBlcnJvcjogc3RvcmluZyB0aGUgYWRkcmVzcyBvZiBsb2Nh
bCB2YXJpYWJsZSDigJhjb21wbGV0ZeKAmSBpbiDigJgqcmVxLmNvbXBsZXRl4oCZIFstV2Vycm9y
PWRhbmdsaW5nLXBvaW50ZXI9XQorKyAqICAgICAyMTcgfCAgICAgICAgIHJlcS0+Y29tcGxldGUg
PSAmY29tcGxldGU7CisrICogICAgICAgICB8ICAgICAgICAgfn5+fn5+fn5+fn5+fn5efn5+fn5+
fn5+fgorKyAqLworKyNpZiBfX0dOVUNfXyA+IDQgfHwgKF9fR05VQ19fID09IDQgJiYgX19HTlVD
X01JTk9SX18gPj0gNikKKysjcHJhZ21hIEdDQyBkaWFnbm9zdGljIHB1c2gKKysjcHJhZ21hIEdD
QyBkaWFnbm9zdGljIGlnbm9yZWQgIi1XZGFuZ2xpbmctcG9pbnRlciIKKysjZW5kaWYKKyBpbnQg
cW1pX3JlcXVlc3Rfd2FpdChzdHJ1Y3QgcW1pX2RldiAqcW1pLCBzdHJ1Y3QgcW1pX3JlcXVlc3Qg
KnJlcSkKKyB7CisgCWJvb2wgY29tcGxldGUgPSBmYWxzZTsKK0BAIC0yMzEsNiArMjQwLDkgQEAg
aW50IHFtaV9yZXF1ZXN0X3dhaXQoc3RydWN0IHFtaV9kZXYgKnFtaSwgc3RydWN0IHFtaV9yZXF1
ZXN0ICpyZXEpCisgCisgCXJldHVybiByZXEtPnJldDsKKyB9CisrI2lmIF9fR05VQ19fID4gNCB8
fCAoX19HTlVDX18gPT0gNCAmJiBfX0dOVUNfTUlOT1JfXyA+PSA2KQorKyNwcmFnbWEgR0NDIGRp
YWdub3N0aWMgcG9wCisrI2VuZGlmCisgCisgc3RydWN0IHFtaV9jb25uZWN0X3JlcXVlc3Qgewor
IAlzdHJ1Y3QgcW1pX3JlcXVlc3QgcmVxOworLS0gCisyLjM5LjIKKwotLSAKMi4zOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
