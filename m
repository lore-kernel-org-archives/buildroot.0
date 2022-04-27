Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B877C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 09:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7EF640895;
	Wed, 27 Apr 2022 09:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wltVAdYRuDT; Wed, 27 Apr 2022 09:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B267D40616;
	Wed, 27 Apr 2022 09:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E065D1BF2F8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFC7C8333E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQ-Qi8PmB9bH for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 09:46:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBDBF832FF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 09:46:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k2so1687827wrd.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NALKgz17W/4FbcUHk+Owh0c8CIxGJFVtDQWLtY1dKDg=;
 b=EtUP4F1BksIpNb37tqd108OY0BdE6FGqovth25EOQObp7VgEJlBfegNoAQ9NuJG7O3
 wjafQfF59rPwcI20gC3MT67YDreq9WXefr5OeADY9QRDqtu8+T6iZKiTBnqsGDFgOInh
 sUEpxpy4E5ApZWFhI+iyqlTgMcp7vGaryf/BukXB0DW2BrLCchFBDSNM3vfhOnyRQ0nD
 6EOP3RAn7wfFhT1R8vaHqGYkyyMTsOc/HmUVi3oSgzbsiq7QZUBWJ6mY2Vvcu/uH6h5o
 ebi0bqpszxFNs88YwlEwwgy7oe4BGrQeM+fbFZ/KaymmzWDLgze2NExFQcboYszliA3y
 8ZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NALKgz17W/4FbcUHk+Owh0c8CIxGJFVtDQWLtY1dKDg=;
 b=Vx2MnygK2uE2pEbUM56crchwH4t7bcgV71az8yBEbP2QiAPodYfRmWYhmlQm14PbBq
 1Bm+YuoVinZATbmESbxnkteljNXeN97TWHweEpXw8FPPUxNwXHApX9K9pFa9sIPS6Bxt
 ZeE5Fd6m0inY7xTQ8vwZuuf4S9QTnq4YMp51SUVCTnLJ20z6FGxytIivh4tpJ13N7BeQ
 HhmOmkli+QezbfWhFSdNpfmYmOjfRpWhSW32ACjscT7Cz6PhlPL1odYOcZJhWMYd2zQk
 1NCgCVDPeSydXi8GIESG8A1EgJzOwR6mjkiNWgZgP3+o7oCi0+z3gMOQzZII5PjxVYoC
 MFvw==
X-Gm-Message-State: AOAM531VNamLIvb5pQyn7QWEBQPWQBjPoZMleOI1IbVHT086z3Qhdmi3
 uID6zwthpeSNtGKt5nw/lEEUtNysXAXGAA==
X-Google-Smtp-Source: ABdhPJyRKC38YxqLmsDuR0wVobstU/caJuGt3giQdyK+vq7Nyi4Od1LgjAwAEb9TjyDpzXVov+GgeQ==
X-Received: by 2002:a5d:6908:0:b0:20a:d71b:f4af with SMTP id
 t8-20020a5d6908000000b0020ad71bf4afmr13585738wru.527.1651052795864; 
 Wed, 27 Apr 2022 02:46:35 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:116a:ef1f:b81d:eca1:1a27:59be])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm1169198wmb.0.2022.04.27.02.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 02:46:35 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 11:46:03 +0200
Message-Id: <20220427094608.16698-5-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427094608.16698-1-etienne.carriere@linaro.org>
References: <20220427094608.16698-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/optee-benchmark: bump to version
 3.17.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBPUC1URUUgQmVuY2htYXJrIHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAz
LjE3LjAuCgpDYzogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgpT
aWduZWQtb2ZmLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5v
cmc+Ci0tLQogcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLmhhc2ggfCA0
ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLmhhc2ggYi9w
YWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsuaGFzaAppbmRleCAyZTc1YjRm
ZjhlLi41NDk4MWM5ZDJjIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRl
ZS1iZW5jaG1hcmsuaGFzaAorKysgYi9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5j
aG1hcmsuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGlu
YXJvLXN3Zy9vcHRlZV9iZW5jaG1hcmsvYXJjaGl2ZS8zLjE2LjAvb3B0ZWUtYmVuY2htYXJrLTMu
MTYuMC50YXIuZ3oKLXNoYTI1NiAgNTViMjQ1MjVmMDhmZmRhNjc5OWY5MGFiN2JhYjIxMjVmMWMz
ZjE3ZDVjYmQxYjM0NDgwY2QyOGI1ZjQ2ZmNhOSAgb3B0ZWUtYmVuY2htYXJrLTMuMTYuMC50YXIu
Z3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGluYXJvLXN3Zy9vcHRlZV9iZW5jaG1hcmsv
YXJjaGl2ZS8zLjE3LjAvb3B0ZWUtYmVuY2htYXJrLTMuMTcuMC50YXIuZ3oKK3NoYTI1NiAgNTBh
NDYyM2E0YzM0OTA5ZTcyMmQ0MDMzODFlNDA3N2M4NGQ3MTg5YWIzYTdlZDU3YTQwMmEzNDYxYmVl
MTNlMyAgb3B0ZWUtYmVuY2htYXJrLTMuMTcuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZAog
c2hhMjU2ICAwNTcxYmU1YjczOTE0MmRjM2U0MGUwYTRlN2UzMGQ0YWI4YmZmMGQ0ZDYwNmEzZjJk
YjIwMTA3NDU1ODdkMzgzICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wdGVlLWJlbmNo
bWFyay9vcHRlZS1iZW5jaG1hcmsubWsgYi9wYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1i
ZW5jaG1hcmsubWsKaW5kZXggNDkzZjQwN2E0NC4uMWY1ZTAxYjg2OCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLm1rCisrKyBiL3BhY2thZ2Uvb3B0
ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCiAKLU9QVEVFX0JFTkNITUFSS19WRVJTSU9OID0gMy4xNi4wCitP
UFRFRV9CRU5DSE1BUktfVkVSU0lPTiA9IDMuMTcuMAogT1BURUVfQkVOQ0hNQVJLX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLGxpbmFyby1zd2csb3B0ZWVfYmVuY2htYXJrLCQoT1BURUVfQkVOQ0hNQVJL
X1ZFUlNJT04pKQogT1BURUVfQkVOQ0hNQVJLX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKIE9QVEVF
X0JFTkNITUFSS19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
