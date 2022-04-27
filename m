Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1293DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 09:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8A0B408C1;
	Wed, 27 Apr 2022 09:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6QI_5bxdhpP; Wed, 27 Apr 2022 09:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F4AB408B8;
	Wed, 27 Apr 2022 09:46:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA0621BF2F8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C92278333E
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jkhyheLIGNE for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 09:46:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6F89832FF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 09:46:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso2319242wmq.0
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wIWK/ed0HeLWKIQcRRnygl/7XoLSznqzGUbLMEVHMNI=;
 b=c3V5dFRZV7FhOwfp9+B8ngQFxmwZJACq3z0k2qB2iZQNfQWLKuTMWHGbRCBx5IlPFG
 oHMNazWnSxjuYwVdggUgK8GU3KxJ2McXLddLzNBJvubL4O2tud+SmgZeGvngFEwjzSIl
 H02JX+JmJYx+CQc1CIxllC8BORLnZ7IeW8/DJeFduocio0O8ocapQ5eC5ZYE3qT0deUS
 TKNSlNvfKAA52ioVW+wM5xoIGuRzHdpgRm2AGKsvbScb2scovkebwn750Ue3uat6QpFa
 N86JHmFGRQwTwSeaJL8dNa/lLo+fFf+FYf3B0Kacqt7z/FYHz+W78l8DKg0sV350BPC9
 jI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wIWK/ed0HeLWKIQcRRnygl/7XoLSznqzGUbLMEVHMNI=;
 b=4NswFoWtAgtJhxhw888IkdvqXH3+frcJyyPWZgc2+us2IyyibCGUGB2EO1MJUo+I+s
 Ehbp/3ddvJQVqj9CwPdwJ+I3riqMYEybmq2Wpn1aP6VLOeuylW4CyXV2lAP9nvU1Crya
 rMMW4IC6/hvfyecUxK+fCS5jny8o+x48cI4SM+YBosrJ8IgLDIhJFDYmqEfcMpYXpC6R
 j/C7SMsks3Kut8+CnBTP4OS9YelfRLOBaFW+bcUNAYJXQqacTXpStqX3xcgXWB6Vdx94
 pKV4mUrpQDrgdW+51hcxF3zusXCIgQumIVDpgSsM9CF9L8e76uOXwkSYvOVUAwzqIjj5
 QtDw==
X-Gm-Message-State: AOAM533t2uQDzaXWFawYjeHaX69xhr5gfIXNIoTRROOAmsdclVzO2SrQ
 wDkwz+7A5vAAQw14ZFMwQgWDZrOPEwZCMQ==
X-Google-Smtp-Source: ABdhPJxG46sTBzHDvK41KFqURewhYcYxtLiYnaFE7KKLl0042P+LfhPl2Jk6rOjJNInv1psinETWqA==
X-Received: by 2002:a05:600c:1991:b0:393:ef28:7ab2 with SMTP id
 t17-20020a05600c199100b00393ef287ab2mr10730610wmq.20.1651052792553; 
 Wed, 27 Apr 2022 02:46:32 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:116a:ef1f:b81d:eca1:1a27:59be])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm1169198wmb.0.2022.04.27.02.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 02:46:32 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 11:46:01 +0200
Message-Id: <20220427094608.16698-3-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427094608.16698-1-etienne.carriere@linaro.org>
References: <20220427094608.16698-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/optee-test: bump to version 3.17.0
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

QnVtcCBPUC1URUUgdGVzdCBwYWNrYWdlIHZlcnNpb24gdG8gT1AtVEVFIHJlbGVhc2UgMy4xNy4w
LgoKQ2M6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KU2lnbmVk
LW9mZi1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgot
LS0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhhc2ggfCA0ICsrLS0KIHBhY2thZ2Uv
b3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wdGVlLXRl
c3Qvb3B0ZWUtdGVzdC5oYXNoIGIvcGFja2FnZS9vcHRlZS10ZXN0L29wdGVlLXRlc3QuaGFzaApp
bmRleCBjNDJlOTIyZDkwLi43ZjJjNDExMGRiIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wdGVlLXRl
c3Qvb3B0ZWUtdGVzdC5oYXNoCisrKyBiL3BhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhh
c2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRl
ZV90ZXN0L2FyY2hpdmUvMy4xNi4wL29wdGVlLXRlc3QtMy4xNi4wLnRhci5negotc2hhMjU2ICBi
MjRhMzg3MTYwNWEzNDFmYTg3ZTZkNGUxMTFmOTcwMDFmMTFhNzJjMDI1ZTc1ZDY3MzllZDc4ODQx
YjZhY2JhICBvcHRlZS10ZXN0LTMuMTYuMC50YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vT1AtVEVFL29wdGVlX3Rlc3QvYXJjaGl2ZS8zLjE3LjAvb3B0ZWUtdGVzdC0zLjE3LjAudGFy
Lmd6CitzaGEyNTYgIDViMDU1NWI2ZmVmOTI2ZjhhMGE0NzEyODVjYjRjMjY0NDA3YzliZTMyNDYx
ODM2MjQwYjNjNDEyYmY3OTMzYmIgIG9wdGVlLXRlc3QtMy4xNy4wLnRhci5negogIyBMb2NhbGx5
IGNvbXB1dGVkCiBzaGEyNTYgIDZlNjgxMDk4MWYwZGRhYjllMGQ0NDM5OWQwNzAwYTE1ZDlmNzYw
YTNjMjg0M2NjODY2NjU5YzIwNzQxMzlhZTcgIExJQ0VOU0UubWQKZGlmZiAtLWdpdCBhL3BhY2th
Z2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lm1rIGIvcGFja2FnZS9vcHRlZS10ZXN0L29wdGVlLXRl
c3QubWsKaW5kZXggN2IyNzU1OGIzNi4uM2E1NjcwZDI2YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9v
cHRlZS10ZXN0L29wdGVlLXRlc3QubWsKKysrIGIvcGFja2FnZS9vcHRlZS10ZXN0L29wdGVlLXRl
c3QubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1PUFRF
RV9URVNUX1ZFUlNJT04gPSAzLjE2LjAKK09QVEVFX1RFU1RfVkVSU0lPTiA9IDMuMTcuMAogT1BU
RUVfVEVTVF9TSVRFID0gJChjYWxsIGdpdGh1YixPUC1URUUsb3B0ZWVfdGVzdCwkKE9QVEVFX1RF
U1RfVkVSU0lPTikpCiBPUFRFRV9URVNUX0xJQ0VOU0UgPSBHUEwtMi4wLCBCU0QtMi1DbGF1c2Us
CiBPUFRFRV9URVNUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
