Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A0EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7953D416D6;
	Tue,  4 Oct 2022 11:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7953D416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PWcXzmzmWZC; Tue,  4 Oct 2022 11:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E58D416C0;
	Tue,  4 Oct 2022 11:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E58D416C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58B861BF9CB
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349F64012F
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 349F64012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbbuWHcxQQht for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F99400D8
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53F99400D8
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:15:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d6so6507172lfs.10
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bWSrap6feJsOcuqJWCTNwZW7N21/dBpkGBRX+H0yVlQ=;
 b=f7FvrDtGW1YP5WtUast3ErZ92oAg0HWfx7oDIV5W6ffgFMtSyAhx1a+hQCYgwCO1bh
 Ywn8n6zTtRC3nZfOc2EHpXS9dojMBgg6dzzBgKYZx++blKH7ZYbVFySzv+bTVn3HPL9V
 n6e3Nlxic5F6eIta73xOnd27NVzjslmdrIOqBJYM3zD4Pm4/dNJN69kq9rSjSanT4SKh
 ENZKY2SF8UUmWPKetaEVnRz5JOoxg0Qjr07fOpdW0GSR88nA6HJI0RV70zb2NMv1SqtI
 9JRXDIZyR+80gBg9kTVFPYOcFevPbpi6qzxWmYlwMcHwLCyIxu4IMkKXSLU/dCGTKUDm
 ESew==
X-Gm-Message-State: ACrzQf2xcOqHzkAKHgHllEtZyVfSJUMqWuKccfIaBghpquBEm8SV5IUf
 r427m7CGzX8P0hcskSevvjBDMnXLJ7iZ1A==
X-Google-Smtp-Source: AMsMyM5TkjuIb+MKSC+zfee9ttt9LWqiF04SSlfC5nci+G0iIwWfQdizv/6hGsE0k4wBNDj2GpNGdA==
X-Received: by 2002:a05:6512:1282:b0:4a2:3c42:c844 with SMTP id
 u2-20020a056512128200b004a23c42c844mr3224284lfs.658.1664882140365; 
 Tue, 04 Oct 2022 04:15:40 -0700 (PDT)
Received: from localhost.localdomain (dsl-129-78.bl27.telepac.pt.
 [176.79.129.78]) by smtp.googlemail.com with ESMTPSA id
 n18-20020a2e9052000000b0026acd11cd51sm1222701ljg.59.2022.10.04.04.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:15:39 -0700 (PDT)
From: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 12:15:28 +0100
Message-Id: <20221004111528.384625-3-nunog@fr24.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004111528.384625-1-nunog@fr24.com>
References: <20221004111528.384625-1-nunog@fr24.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bWSrap6feJsOcuqJWCTNwZW7N21/dBpkGBRX+H0yVlQ=;
 b=UOHyPWdG2d7avW4ZnpeThM+0XWBQA/VebUzIyIduud9hYh6YFn3Rzc4uYd9GeL9qtG
 DZnQO2Kgf8QiWB29Znv2Lpa/cSEPXMDUI1EcTH0k9a6BSL+sFK/nyGAUKCFZ9Xu6KeHu
 GICXdlELwa9QdsjLBz38+vNE28uk4aR6EJPb/8neulEKZ+ROqc5seEk0xbw6nV5/zpo6
 ZUbbyzgPNmEzDCzsOcYH2Y7RMgeqvJXRyMdScNpT0b5IIUr2MEl2gVQts8K8w6c0S5+G
 R5c7SsLrHzhll4e9jk00AXIBO2VEd8ypxVOPeDVHMuvpcLInTdMz5FGRUeCruTxZJsxT
 Kx/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=fr24.com header.i=@fr24.com
 header.a=rsa-sha256 header.s=google header.b=UOHyPWdG
Subject: [Buildroot] [PATCH 3/3] package/libopenssl: don't build afalgeng
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
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWZhbGdlbmcgaXMgbm90IGNyb3NzLWNvbXBpbGVkIHNvIGlzIHVzZWxlc3MgYW5kIGxlYWtzIGJ1
aWxkIGhvc3QgaW5mbwoKU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0
LmNvbT4KLS0tCiBwYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tayB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuc3Ns
L2xpYm9wZW5zc2wubWsgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tawppbmRleCBj
N2EyZDY1Y2M0Li41MGQ0MWE2NTMzIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm9wZW5zc2wvbGli
b3BlbnNzbC5taworKysgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tawpAQCAtODMs
NiArODMsNyBAQCBkZWZpbmUgTElCT1BFTlNTTF9DT05GSUdVUkVfQ01EUwogCQkJbm8tdGVzdHMg
XAogCQkJbm8tZnV6ei1saWJmdXp6ZXIgXAogCQkJbm8tZnV6ei1hZmwgXAorCQkJbm8tYWZhbGdl
bmcgXAogCQkJJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX0NIQUNIQSksLG5v
LWNoYWNoYSkgXAogCQkJJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX1JDNSks
LG5vLXJjNSkgXAogCQkJJChpZiAkKEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX1JDMiks
LG5vLXJjMikgXAotLSAKMi4zNy4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
