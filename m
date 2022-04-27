Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BDDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 09:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 712464064C;
	Wed, 27 Apr 2022 09:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E37K7NdsPOGQ; Wed, 27 Apr 2022 09:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D7DE4063C;
	Wed, 27 Apr 2022 09:46:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42DC11BF2F8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31262418AB
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLwAwHe2z-4A for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 09:46:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 277784189B
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 09:46:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t6so1690975wra.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltBf8/dvi+BpAxo2reWtUsdwVzHKjiWzff22TjlJmxw=;
 b=nINwYDZ2ekumLAfLfpIEB0mpMF5+y70wls072dd5P/ntckoMSELgokM8RhtnY0Tx5X
 0evPkPXfi6mtq1o2rTaC45hcgZh0pKReIvY2PagDfG5EQ4YbFaOM7a7O6lD11PFX8Bje
 muacKC5Xvtl3VAAM6JfTd5isCW1Ch+usiJPRhu/g/xyEm1MrhgFUri8u5waaJhJcTA0A
 mC3qKDNmYxhe2b1/BI5L01hduNyC0lx6age9Am/YlKbAdLg09OlFY/oefKAaeibdUHlp
 cTkaBJQASfxonKPm1ZUXqupwbxFAUg9Ji77for2nK59vmXQ1MoEIbqy0pDQ5NqbWuhla
 thAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltBf8/dvi+BpAxo2reWtUsdwVzHKjiWzff22TjlJmxw=;
 b=6wviMD0xMjWQKSkqiEahrSV+eWJFZcKONh6H1QeLZalBrpyBoMMsLvFLsK3cli2h6J
 AU+XR1x9u/nua7/PIyaA1zkrm7EJ5WEDW2L7i+jH3g7/wJi6B1dNVuurKldBOlHYUjs/
 q67VsmxKgbENPCh/Xai6o+HK1b4Gzg5hvhS+gRsFGaQdN26AI5GSflkM3NvXLf/fmPAc
 2D222gvXWf03+pAGPyraxZNjBJfsnm5sB6PmnNneCN9kM/xy8XJPAqR0alKewVvz6B0g
 QrcBpI6dy5ULHe4YLeQ/LOCa0r/u6yM9E2pfolSy5d3MiCmTMFqS+IMAZoEQVZEu3Gju
 Jnhw==
X-Gm-Message-State: AOAM530FoEP++x105T6GUCM9N2BCrfrkHZcZpTpdNXLjIMsD5vpVe21J
 t01/DGq9BqH0O43YKIsNuovbnh3Lkmr2xg==
X-Google-Smtp-Source: ABdhPJxwt9NwNPC/SV/ZwxEBWQ3owQza3CYpIRFJrB+dSN1wsniiyWExH1CmNQQCz49EdB+OqMu+TQ==
X-Received: by 2002:a05:6000:1565:b0:20a:eba6:ad9c with SMTP id
 5-20020a056000156500b0020aeba6ad9cmr3044946wrz.322.1651052791078; 
 Wed, 27 Apr 2022 02:46:31 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:116a:ef1f:b81d:eca1:1a27:59be])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm1169198wmb.0.2022.04.27.02.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 02:46:30 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 11:46:00 +0200
Message-Id: <20220427094608.16698-2-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427094608.16698-1-etienne.carriere@linaro.org>
References: <20220427094608.16698-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/optee-client: bump to version 3.17.0
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

QnVtcCBPUC1URUUgQ2xpZW50IHBhY2thZ2UgdmVyc2lvbiB0byBPUC1URUUgcmVsZWFzZSAzLjE3
LjAuCgpDYzogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBFdGllbm5lIENhcnJpZXJlIDxldGllbm5lLmNhcnJpZXJlQGxpbmFyby5vcmc+
Ci0tLQogcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggfCA0ICsrLS0KIHBh
Y2thZ2Uvb3B0ZWUtY2xpZW50L29wdGVlLWNsaWVudC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggYi9wYWNrYWdlL29wdGVlLWNsaWVudC9v
cHRlZS1jbGllbnQuaGFzaAppbmRleCBmZjkwZjZkMmE4Li5kMmVmYjEwNDNhIDEwMDY0NAotLS0g
YS9wYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQuaGFzaAorKysgYi9wYWNrYWdlL29w
dGVlLWNsaWVudC9vcHRlZS1jbGllbnQuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMgRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX2NsaWVudC9hcmNoaXZlLzMuMTYuMC9vcHRlZS1j
bGllbnQtMy4xNi4wLnRhci5negotc2hhMjU2ICBjYmE5MmJlZGM5ZjhjMzljMTllNTBhMjIyNTkw
NjZlYWFkNWNlYjI0ODMwOGVkZWUyN2UyMjFmMTFmNWQ4MDY0ICBvcHRlZS1jbGllbnQtMy4xNi4w
LnRhci5negorIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfY2xpZW50L2Fy
Y2hpdmUvMy4xNy4wL29wdGVlLWNsaWVudC0zLjE3LjAudGFyLmd6CitzaGEyNTYgIGJmNjJjZWFh
YzU5ZThhNjUwYWJmNzYzMmU3MDJiNTkyOTMzNWY0OTc0ZjMxNzNmOGM1MTkwMGNiMGY5MTY2MGYg
IG9wdGVlLWNsaWVudC0zLjE3LjAudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAg
ZmRhODM4NTk5M2YxMTJkN2NhNjFiODhiNTRiYTViNGNiZWVjN2U0M2EwZjliMzE3ZDUxODY3MDNj
MTk4NWU4ZiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUt
Y2xpZW50Lm1rIGIvcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lm1rCmluZGV4IDJj
YWRjNTY0ZjAuLmFhZjA3MmI0MGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3B0ZWUtY2xpZW50L29w
dGVlLWNsaWVudC5taworKysgYi9wYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQubWsK
QEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1PUFRFRV9DTElF
TlRfVkVSU0lPTiA9IDMuMTYuMAorT1BURUVfQ0xJRU5UX1ZFUlNJT04gPSAzLjE3LjAKIE9QVEVF
X0NMSUVOVF9TSVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfY2xpZW50LCQoT1BURUVf
Q0xJRU5UX1ZFUlNJT04pKQogT1BURUVfQ0xJRU5UX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKIE9Q
VEVFX0NMSUVOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
