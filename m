Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B4C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 12:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17216083F;
	Mon,  3 Feb 2025 12:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DpMtJ1X6Ixpc; Mon,  3 Feb 2025 12:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4939607C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4939607C7;
	Mon,  3 Feb 2025 12:01:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDCE1A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 12:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4374C8204B
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 12:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tb8jPXpCmKIQ for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 12:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 97F6980C3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97F6980C3C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97F6980C3C
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 12:01:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1torJT2YKK-00Nu5D; Mon, 03
 Feb 2025 13:01:51 +0100
To: buildroot@buildroot.org
Date: Mon,  3 Feb 2025 13:01:30 +0100
Message-ID: <20250203120130.2332720-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:nTaBGuUNlAtawAJpg/3HsurDbOXUyON9AItLUtmrf8TmEbA4b3p
 kozcMr2BnmaO7yER1a4LCqJKzeJ3hpGodw0Wox/Vg3X77OQDtPFxSrZI8qkdYPV0HVBbz/v
 TRZR2TyDwZOvogJHlepBry1p+JNW1XwCqWe0FAwPZgXCvoMo6bY0ADCPoWnzD6NdoxdhL1l
 JYj5WeZm4mYZXj5ksP5eA==
UI-OutboundReport: notjunk:1;M01:P0:WRQVa2jnTtY=;z7FKDRiu/jbMC9V60Axb5IogIz3
 O87qwSo97UJ0DQW2VAoYsMVjm+zYA33DpuANFBIIGCgdW1vSutjNMbIk4O/odVcMEhiP4R6o4
 HLC4NaEGTEKS/wVzV/lbS3nIT/uibUiZgjLKHxPaUaIJaUAXA3ZK8Ct7lwps22G/pV8kiYNwJ
 Y4cwNVc7HF7B8Zv3KA8RdXdCEDm+KGIbwG0WVLapjlAWlhPWE9hd2CegQ4vLga5xZZ0MWTaQD
 BmtBrIXC3Srn1f8772pCtsHyB9rLsIGyorUaiS1gYZ/WYd03vkWIHTi06gervADl2PB1QGDzS
 L/V+wovulgVUSz1XreP+acRJtv/TLEjRW4RSZrqisR6hbj509RcFMMlTjuozHyqlLqqkotBq3
 D5ftc8+De9TOWTmsj7Sd+dc0YOeHRy/44FK7Tuqe/DfMrBV+keAqr2KrSKRIcsJPPAQyhtc7E
 EfEHZu9SSZot/MQXiskLqLwkc3GSjkE27LGov8qY0pXaKMlsJTBTI1bTl/iFG7J1be0vPTLkQ
 69Bnwz6E6Za6OVPGfxcVKLc9Yo6EvpALtB1DG50J2bKrckkVpqthFD5zSOhmIXpnr5EKASv/T
 J0+tDXU1CzRQHqctxgoz/m3vIRuukXzqtTb5iw5FdQDcLDaP6SWtr/ft80eVHwvPeFki2oOle
 Y4fpBWt7V4WlC3OoeSzxqiKWHvKdUztY7EafHMLB6TZPpKAEvwMcOCi8YgvT1qzn3QigVKhwI
 ErLqy0SiPGRv5m1YTxI3qR0MaC2l6T2UTLOoiTotnYzhYi6ijcASk4YxdJYS9dk2ts/NuozUd
 Wb102Yxud+2/R6L5A4RNtUjWcQsWa50eb4jmzGtIYP5HM9cKHfNc3rwJsSfdvGrfyK78xLhz5
 dO1f+kwpS6Q2gPrgNOMgP6w4NpdDOoDbPDn2KW9R2/3AYItbX9rxldYz7PnSrCpPF2OwKNe4w
 aSRnYjs+gSvKHBQSQHTNDX754d7P0PtUMb1FJAZbtojxq+YXeos8m+UQhGQYFseI5yw197N+E
 L1qD9BMGxLEc3+u3WtFnhjmFbzNil9xPXRGkrK+HT8tks5AeDs/NRue8V5EE1aYh627fMlWqt
 l6uoqy3K5W/cnPs4Y6FhnwDwiTMHhY65325UZYZS7hK4BCPLByEdLs9pEadkdIhD+cw5HhLci
 yvY5Pa19gLKtzNGdxPujrUmHoYG0yVs2N7dmGNfeToAgFC7F32dIyP7jlM8Na0PRRErQYOetG
 RteUrh9MeYcDs5tRXehc/e+aBeL2P4c45BCIbQKWbsqSNBC9xM8ofk7Drl8r9FS4HSdSPvk1x
 0ZtyHTVo0Zlheys4ve8b5tbXtpuRn2Bow5gsvKfYI7k3DNqSSIup64y4tH/nWOoM4EA4YDRhE
 8OJznFjh+Xh+rs+HRnnnMtcRJVstR326Zn7FU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738584112; x=1739188912; i=fiona.klute@gmx.de;
 bh=kWIVVlw7UIMvlGGnwdvlnAOFrCJFalEyD0HY94Lp9JY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RgT6Xrs2Sw+sxLpqFAmkDoO7HzERy6o9AOB+WzQjULQqfb1uvKfakDkIAhGVbuvq
 cEERyhZH3QOTphcuS2n3WMwQ4/WYKLTqDIoMdv93SrsUxAQjtjIPzu/r9om2zRcku
 gjcetzlvr321Ew2CChM72qVV3PRNPMj/95LIb+wHqzzqZaYUk3CKGtd5mSiOeatPT
 b0v+efAdZXACcWaA0qEZX5yA0wt+wxEhf17wAWP5Hf3Z02WW/unstwJuetW+tj6rQ
 y5Ej+iY5ufxeUnidH+pswXrRY/MYCFrNftw9VoQX2XiAt/4g8fQW6iBf7iU9/m7/f
 iZFgo8Qk8hVtRmjf8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RgT6Xrs2
Subject: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChXSVdBKSIgPGZpb25hLmtsdXRlQGdteC5kZT4KCkdvIGZvcmNl
cyB0aGUgR09MRCBsaW5rZXIgd2hlbiBkeW5hbWljYWxseSBsaW5raW5nIEdvIGNvZGUsIGJlY2F1
c2UKb2xkIHZlcnNpb25zIG9mIEJGRCBjYXVzZWQgZXJyb3JzLiBUaGUgaXNzdWUgaGFzIGJlZW4g
Zml4ZWQgaW4KQmludXRpbHMgc2luY2UgYXQgbGVhc3QgMi40MSBhY2NvcmRpbmcgdG8gdGhlIHVw
c3RyZWFtIGRlc2NyaXB0aW9uIG9mCnRoZSBwYXRjaCBhZGRlZCB3aXRoIHRoaXMgY29tbWl0IFsx
XSwgYW5kIG5vdyBmb3JjaW5nIEdPTEQgY2F1c2VzCmxpbmtpbmcgZmFpbHVyZSBpZiBsZC5nb2xk
IGlzIG5vdCBhdmFpbGFibGUuIFRoZSBhc3NvY2lhdGVkIEdvbGFuZwppc3N1ZSBbMl0gaXMgc3Rp
bGwgb3Blbi4KCkltcG9ydCB0aGUgcGF0Y2ggdG8gc3RvcCBmb3JjaW5nIEdPTEQuCgpbMV0gaHR0
cHM6Ly9nby1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2dvLysvMzkxMTE1ClsyXSBodHRwczov
L2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy8yMjA0MAoKU2lnbmVkLW9mZi1ieTogRmlvbmEg
S2x1dGUgKFdJV0EpIDxmaW9uYS5rbHV0ZUBnbXguZGU+Ci0tLQogLi4uLWJpbnV0aWxzLWdvbGQt
ZGVwZW5kZW5jeS1vbi1hYXJjaDY0LnBhdGNoIHwgNzAgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L2dvL2dvLXNyYy8wMDAzLWNtZC1saW5rLXN0b3AtZm9yY2luZy1iaW51dGlscy1nb2xkLWRlcGVu
ZGVuY3ktb24tYWFyY2g2NC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28tc3JjLzAw
MDMtY21kLWxpbmstc3RvcC1mb3JjaW5nLWJpbnV0aWxzLWdvbGQtZGVwZW5kZW5jeS1vbi1hYXJj
aDY0LnBhdGNoIGIvcGFja2FnZS9nby9nby1zcmMvMDAwMy1jbWQtbGluay1zdG9wLWZvcmNpbmct
YmludXRpbHMtZ29sZC1kZXBlbmRlbmN5LW9uLWFhcmNoNjQucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMWJhMzFiNjU3NwotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvZ28vZ28tc3JjLzAwMDMtY21kLWxpbmstc3RvcC1mb3JjaW5nLWJpbnV0aWxzLWdvbGQt
ZGVwZW5kZW5jeS1vbi1hYXJjaDY0LnBhdGNoCkBAIC0wLDAgKzEsNzAgQEAKK0Zyb20gNmQyNjVi
MDA4ZTNkMTA2YjI3MDY2NDVlNWE4OGNkOGUyZmI5ODk1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IERpcmsgTcO8bGxlciA8ZGlya0BkbWxsci5kZT4KK0RhdGU6IFdlZCwgMDkgTWFy
IDIwMjIgMTc6NDc6MjMgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gY21kL2xpbms6IHN0b3AgZm9y
Y2luZyBiaW51dGlscy1nb2xkIGRlcGVuZGVuY3kgb24gYWFyY2g2NAorCitUaGUgYmZkIGxpbmtl
ciBhcHBlYXJzIHRvIGJlIHdvcmtpbmcganVzdCBmaW5lIGF0IGxlYXN0IGluIHZlcnNpb24KKzIu
NDEgb3IgYWJvdmUuIFJlamVjdCB0aGUga25vd24gYnJva2VuIG9uZSBpbnN0ZWFkLCB3aGljaAor
YXZvaWRzIGFuIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBsaW5rZXIgZGVwZW5kZW5jeSB0aGF0Citp
cyBjdW1iZXJzb21lIGZvciBkaXN0cmlidXRpb25zLgorCitGaXhlcyAjMjIwNDAuCisKK0NoYW5n
ZS1JZDogSTlmMzc3ZTQ3YzIyZWYyMDQ5NzQ3OWMwOTc4YzA1M2VkNWRlNDZhMzgKK1Vwc3RyZWFt
OiBodHRwczovL2dvLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvZ28vKy8zOTExMTUKK1NpZ25l
ZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgorLS0tCisK
K2RpZmYgLS1naXQgYS9zcmMvY21kL2xpbmsvaW50ZXJuYWwvbGQvbGliLmdvIGIvc3JjL2NtZC9s
aW5rL2ludGVybmFsL2xkL2xpYi5nbworaW5kZXggMmQ4Zjk2NC4uZmNmMGJjNyAxMDA2NDQKKy0t
LSBhL3NyYy9jbWQvbGluay9pbnRlcm5hbC9sZC9saWIuZ28KKysrKyBiL3NyYy9jbWQvbGluay9p
bnRlcm5hbC9sZC9saWIuZ28KK0BAIC0xNjcwLDI3ICsxNjcwLDYgQEAKKyAJCQkvLyBVc2UgbGxk
IHRvIGF2b2lkIGVycm9ycyBmcm9tIGRlZmF1bHQgbGlua2VyIChpc3N1ZSAjMzg4MzgpCisgCQkJ
YWx0TGlua2VyID0gImxsZCIKKyAJCX0KKy0KKy0JCWlmIGN0eHQuQXJjaC5JbkZhbWlseShzeXMu
QVJNNjQpICYmIGJ1aWxkY2ZnLkdPT1MgPT0gImxpbnV4IiB7CistCQkJLy8gT24gQVJNNjQsIHRo
ZSBHTlUgbGlua2VyIHdpbGwgZmFpbCB3aXRoCistCQkJLy8gLXpub2NvcHlyZWxvYyBpZiBpdCB0
aGlua3MgYSBDT1BZIHJlbG9jYXRpb24gaXMKKy0JCQkvLyByZXF1aXJlZC4gU3dpdGNoIHRvIGdv
bGQuCistCQkJLy8gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/
aWQ9MTk5NjIKKy0JCQkvLyBodHRwczovL2dvLmRldi9pc3N1ZS8yMjA0MAorLQkJCWFsdExpbmtl
ciA9ICJnb2xkIgorLQorLQkJCS8vIElmIGdvbGQgaXMgbm90IGluc3RhbGxlZCwgZ2NjIHdpbGwg
c2lsZW50bHkgc3dpdGNoCistCQkJLy8gYmFjayB0byBsZC5iZmQuIFNvIHdlIHBhcnNlIHRoZSB2
ZXJzaW9uIGluZm9ybWF0aW9uCistCQkJLy8gYW5kIHByb3ZpZGUgYSB1c2VmdWwgZXJyb3IgaWYg
Z29sZCBpcyBtaXNzaW5nLgorLQkJCW5hbWUsIGFyZ3MgOj0gZmxhZ0V4dGxkWzBdLCBmbGFnRXh0
bGRbMTpdCistCQkJYXJncyA9IGFwcGVuZChhcmdzLCAiLWZ1c2UtbGQ9Z29sZCIsICItV2wsLS12
ZXJzaW9uIikKKy0JCQljbWQgOj0gZXhlYy5Db21tYW5kKG5hbWUsIGFyZ3MuLi4pCistCQkJaWYg
b3V0LCBlcnIgOj0gY21kLkNvbWJpbmVkT3V0cHV0KCk7IGVyciA9PSBuaWwgeworLQkJCQlpZiAh
Ynl0ZXMuQ29udGFpbnMob3V0LCBbXWJ5dGUoIkdOVSBnb2xkIikpIHsKKy0JCQkJCWxvZy5GYXRh
bGYoIkFSTTY0IGV4dGVybmFsIGxpbmtlciBtdXN0IGJlIGdvbGQgKGlzc3VlICMxNTY5NiwgMjIw
NDApLCBidXQgaXMgbm90OiAlcyIsIG91dCkKKy0JCQkJfQorLQkJCX0KKy0JCX0KKyAJfQorIAlp
ZiBjdHh0LkFyY2guRmFtaWx5ID09IHN5cy5BUk02NCAmJiBidWlsZGNmZy5HT09TID09ICJmcmVl
YnNkIiB7CisgCQkvLyBTd2l0Y2ggdG8gbGQuYmZkIG9uIGZyZWVic2QvYXJtNjQuCitkaWZmIC0t
Z2l0IGEvc3JjL21ha2UuYmFzaCBiL3NyYy9tYWtlLmJhc2gKK2luZGV4IGI2N2FlMTUuLjdkZjQ5
MTAgMTAwNzU1CistLS0gYS9zcmMvbWFrZS5iYXNoCisrKysgYi9zcmMvbWFrZS5iYXNoCitAQCAt
OTQsNiArOTQsMTYgQEAKKyAJOzsKKyBlc2FjCisgCisrIyBUZXN0IGZvciBiYWQgYmZkLmxkCisr
aWYgdGVzdCAiJCh1bmFtZSAtbSkiID0gImFhcmNoNjQiICYmIGxkIC12IHwgZ3JlcCAtRSAiR05V
IGxkLiogMlwuKFswLTNdfDQwKSI7IHRoZW4KKysJZWNobyAnRVJST1I6IFlvdXIgc3lzdGVtIHVz
ZXMgYmZkLkxEIDIuNDAgb3Igb2xkZXIgd2hpY2ggaGFzIGlzc3VlcyB3aXRoIGR5bmFtaWMgbGlu
a2luZyBvbiBhYXJjaDY0JworKwllY2hvICdDb25zaWRlciB1cGdyYWRpbmcgb3Igc3dpdGNoaW5n
IHRvIGJpbnV0aWxzLWdvbGQuJworKwllY2hvCisrCWVjaG8gJ1NlZSBodHRwczovL3NvdXJjZXdh
cmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0zMDQzNycKKysKKysJZXhpdCAxCisrZmkK
KysKKyAjIFRlc3QgZm9yIGJhZCBsZC4KKyBpZiBsZCAtLXZlcnNpb24gMj4mMSB8IGdyZXAgJ2dv
bGQuKiAyXC4yMCcgPi9kZXYvbnVsbDsgdGhlbgorIAllY2hvICdFUlJPUjogWW91ciBzeXN0ZW0g
aGFzIGdvbGQgMi4yMCBpbnN0YWxsZWQuJwotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
