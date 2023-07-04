Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E961EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 12:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FBC40950;
	Tue,  4 Jul 2023 12:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7FBC40950
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTZqW2kM2plz; Tue,  4 Jul 2023 12:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCE640912;
	Tue,  4 Jul 2023 12:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCE640912
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5E81BF861
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 12:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 525DA40937
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 12:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 525DA40937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTnpJvVoJe99 for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 12:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3DF40912
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D3DF40912
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 12:44:02 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so46911785e9.2
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 05:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688474640; x=1691066640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zOB9OtrWAJVP9/azOYuGLn+UnlWzxlC2d1HSP+PugqE=;
 b=OgZnvPUF7Xobk2zEqT4bCsLtWU1U65d9tsOSikv9x2uJGbPEXEdLk1tCqchpSP3YNo
 3yCLoE4hWcWzsooYhwwRK1LEJNLshWBOKEs7eQMINR4Cg2sPJ6GthguRiufg+4V9m+1F
 iHL7SF+AQlwP3xonDDYTKvbuD+Jo143/PHbwBEaIuwRin9nNerpIzpRouC+0HVXBUT0X
 beInrqWonUp1QTRC39Vkhz8NapEwqGoGgDdS5q+K751sehW94ZhTKJBVO5jg46SyPO5l
 AI4cQiNCb6pGRyx0Wzi/hy+RUElE3fSYlQf5ekWdcqYKvVaRPaMjmaZLMsqpIJBkde/h
 4RLg==
X-Gm-Message-State: AC+VfDytiRtdkADsD4idfFhX1ScRGIUox981p1CgujQ3wdm5LxsLIzuq
 eKuUOOAMNxS6zicg6W3qBARXW7F2iLun0iP+GwU=
X-Google-Smtp-Source: ACHHUZ4a52bliIy3c6quMrRLhCD8F0IdPUkcpRz+5UgINSrENpDLdMPf8MIXB4LQz41j2BgaMYXJbA==
X-Received: by 2002:a05:600c:22d4:b0:3fa:fe34:f80 with SMTP id
 20-20020a05600c22d400b003fafe340f80mr17047097wmg.39.1688474640393; 
 Tue, 04 Jul 2023 05:44:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:2372:f286:851c:4355])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003fbdd9c72aasm3521606wmc.21.2023.07.04.05.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 05:44:00 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue,  4 Jul 2023 14:43:57 +0200
Message-Id: <20230704124358.325918-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688474640; x=1691066640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zOB9OtrWAJVP9/azOYuGLn+UnlWzxlC2d1HSP+PugqE=;
 b=XNJClUCMWa+YBxhiZdN2TN0fsjT6LPvoZfVEsqo29CdRVhUByNl8bAZ+vjTFk7FLF/
 zst2QrPBe9/v04z3Pf1RtCOt1Re8zxJqXep3dfMfbmeHTlq8HeGqPrQ/VZQOG3cyw2Py
 RRZ56ElCEyioXWuZTE8lUYugeP0xc+nbEkLV3/z8ZZvb3ZwWIxMgVxTWpuYwGK76Buap
 w01UAx8+K8AorxaCYTyGS2PZNrt4iGr6bPtF3YxZQiC9YXORGRZhqbB0OzYKti2bykOO
 04WZwkyAubC0+kFYCmJ7mHyu62XHVSI6iaueHQKNxSHqietEnViyF8YVsqX6niY/BtsR
 e6mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=XNJClUCM
Subject: [Buildroot] [PATCH v2 1/1] package/rust-bindgen: new host package
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cgpob3N0LXJ1c3QtYmlu
ZGdlbiB3aWxsIGJlIHJlcXVpcmVkIHRvIGJ1aWxkIHNldmVyYWwgZGlmZmVyZW50IHJ1c3QtYmFz
ZWQKcGFja2FnZXMsIGluY2x1ZGluZyBhIExpbnV4IGtlcm5lbCB3aXRoIHJ1c3QgbW9kdWxlcyBh
bmQgbWVzYTNkJ3MKcnVzdGljbCB3aGljaCBpcyB0aGUgcnVzdC1iYXNlZCBpbXBsZW1lbnRhdGlv
biBvZiBPcGVuQ0wuCgpUaGUgQ2FyZ28udG9tbCBmaWxlIGF0IHRoZSBwcm9qZWN0IHJvb3QgaXMg
YSAidmlydHVhbCBtYW5pZmVzdCIuIFNpbmNlCndlIG9ubHkgd2FudCB0byBpbnN0YWxsIHJ1c3Qt
YmluZGdlbiwgd2UgY2FuIHNwZWNpZnkgUlVTVF9CSU5ER0VOX1NVQkRJUgo9IGJpbmRnZW4tY2xp
IHRvIHVzZSB0aGUgQ2FyZ28udG9tbCBmcm9tIHRoaXMgZGlyZWN0b3J5LgoKU2lnbmVkLW9mZi1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+ClNpZ25lZC1vZmYtYnk6IFNl
YmFzdGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgotLS0KdjI6CiAgICAtIHJl
bW92ZSBjb21tZW50IGV4cGxhaW5pbmcgZGVwcmVjYXRlZCBjb21tYW5kIGxpbmUgb3B0aW9ucyBm
cm9tCiAgICAgIHJ1c3QtYmluZGdlbi5tawogICAgLSBBZGQgcnVzdC1iaW5kZ2VuIHVuZGVyIFNl
YmFzdGlhbiBXRVlFUiBpbiBERVZFTE9QRVJTIGZpbGUKLS0tCiBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9ydXN0LWJpbmRnZW4vcnVzdC1i
aW5kZ2VuLmhhc2ggfCAgMyArKysKIHBhY2thZ2UvcnVzdC1iaW5kZ2VuL3J1c3QtYmluZGdlbi5t
ayAgIHwgMTcgKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnVzdC1iaW5kZ2VuL3J1c3QtYmluZGdl
bi5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ydXN0LWJpbmRnZW4vcnVzdC1iaW5k
Z2VuLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMTg4YzU3
OTAxMC4uMjMwNTFjZTdlNSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJT
CkBAIC0yNTc2LDYgKzI1NzYsOSBAQCBGOglzdXBwb3J0L21pc2MvdG9vbGNoYWluZmlsZS5jbWFr
ZS5pbgogTjoJU2FtIFZvc3MgPHNhbS52b3NzQGdtYWlsLmNvbT4KIEY6CXBhY2thZ2UvcmlwZ3Jl
cC8KIAorTjoJU2ViYXN0aWFuIFdleWVyIDxzZWJhc3RpYW4ud2V5ZXJAc21pbGUuZnI+CitGOglw
YWNrYWdlL3J1c3QtYmluZGdlbgorCiBOOglTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVu
LnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CiBGOglwYWNrYWdlL21tYy11dGlscy8KIEY6CXBhY2th
Z2UvcHl0aG9uLWZsYXNrLWpzb25ycGMvCmRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QtYmluZGdl
bi9ydXN0LWJpbmRnZW4uaGFzaCBiL3BhY2thZ2UvcnVzdC1iaW5kZ2VuL3J1c3QtYmluZGdlbi5o
YXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZlOTRiYmMwOTYKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3J1c3QtYmluZGdlbi9ydXN0LWJpbmRnZW4uaGFzaApA
QCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBjYWxjdWxhdGVkCitzaGEyNTYgIGUxY2RiYWE4ZTBl
ZDk2ZjY0N2U0OTgwN2FlY2ZjNDRkOTIzOWQ0MzhjMmIxYzA4NGVkYjlhM2NjYTBiMWY2OGYgIHJ1
c3QtYmluZGdlbi0wLjY1LjEudGFyLmd6CitzaGEyNTYgIGMyMzk1M2Q5ZGViMGEzMzEyZGJlYWY2
YzEyOGE2NTdmMzU5MWFjZWU0NTA2NzYxMmZhNjg0MDVlYWE0NTI1ZGIgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcnVzdC1iaW5kZ2VuL3J1c3QtYmluZGdlbi5tayBiL3BhY2thZ2UvcnVz
dC1iaW5kZ2VuL3J1c3QtYmluZGdlbi5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi4xMTcxOThmNDA3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9ydXN0LWJpbmRn
ZW4vcnVzdC1iaW5kZ2VuLm1rCkBAIC0wLDAgKzEsMTcgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCisjCisjIHJ1c3QtYmluZGdlbgorIworIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKworUlVT
VF9CSU5ER0VOX1ZFUlNJT04gPSAwLjY1LjEKK1JVU1RfQklOREdFTl9TSVRFID0gJChjYWxsIGdp
dGh1YixydXN0LWxhbmcscnVzdC1iaW5kZ2VuLHYkKFJVU1RfQklOREdFTl9WRVJTSU9OKSkKK1JV
U1RfQklOREdFTl9MSUNFTlNFID0gQlNELTMtY2xhdXNlCitSVVNUX0JJTkRHRU5fTElDRU5TRV9G
SUxFUyA9IExJQ0VOU0UKKworIyBUaGUgQ2FyZ28udG9tbCBhdCB0aGUgcm9vdCBkaXJlY3Rvcnkg
aXMgYW4gInZpcnR1YWwgbWFuaWZlc3QiLgorIyBTaW5jZSB3ZSBvbmx5IHdhbnQgdG8gYnVpbGQg
YW5kIGluc3RhbGwgYmluZGdlbiB1c2UgdGhlIENhcmdvLnRvbWwKKyMgZnJvbSB0aGUgYmluZGdl
bi1jbGkgc3ViZGlyZWN0b3J5LgorUlVTVF9CSU5ER0VOX1NVQkRJUiA9IGJpbmRnZW4tY2xpCisK
KyQoZXZhbCAkKGhvc3QtY2FyZ28tcGFja2FnZSkpCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
