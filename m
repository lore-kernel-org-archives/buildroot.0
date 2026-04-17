Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7ACF43684
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B6F40654;
	Fri, 17 Apr 2026 09:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68sd7CMPaOUY; Fri, 17 Apr 2026 09:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F3B40645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416403;
	bh=6kLXCG59anQKSq0JcsRZhCmg7e05nJaU1iU7UqbwRkM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ioktciHEnolKmyGcwh1q27KInYxkWIv5FzC72hRNARusJpYqeECFHrILhSRadclEl
	 00U2C/fZqHULYjUuAsLxrwnisLca97jPZ5M+lg8N2pbkbM8CSR2xJCMgIhp+geAeGa
	 FYMhw+QmxaTBQrL6AE+dLgaT/hTZy1/TfeiwwIKP8CPw7fCuuKpHNH1rw8D1aCSmui
	 IK5g7auNdF9niJepro9xtE/EVYeRVsH3k+paPwGT4+cIjMvETt3hlZs1j4muTkgHwF
	 Qs34tZR3I1ofvR3hTxu/LiqNarOvJQR4tAmZ82USOLtRYz+mJUcYanAUV2MvlBPk04
	 41rFjMZ4R94qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F3B40645;
	Fri, 17 Apr 2026 09:00:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C644259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E69040CDF
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cElPLavq_ZBO for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F55C40D01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F55C40D01
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F55C40D01
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so4781125e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416390; x=1777021190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lt58jKIvGPayj1XplDWBCVPUurm5z5wyRfwXre4a3U4=;
 b=ppYglVK5bM7z1bwmZEpGiSRqY/zebjOEBa2mkE1qN12OWVUpFZIdYANHUHQZqJChif
 qTx7+r9FTjSuSt2/QqBYMwrtaf6jFYlRLeu2FQNfTM6pkAQbINpEkCrOdd2KjftSIg63
 7iiSDwJCFR4L8Xc7aznP5kO4BNqxK3OGoOPfXMHI3k9dwUNJvI1X/5zAMwDPE90XtISz
 kANZxug2rTD0waR3F1ka4BUQdiDyIySugQJxfzzrC5+TnmfE9AMj+DvNQCkfGg1MDrg/
 AUAFTIC8UTB8a0yoj7aMWI6luXsFwlNiUI+U/wFM/XmKY8O4juCh2vLdXttkkXs4ECye
 LmVg==
X-Gm-Message-State: AOJu0YwKoSBBbDCEc2Vq5h1yWMQc0r+IYI/5IUEYwvnL4ZAMddi3xqL2
 Bu0SVkHFahKBrwmF1waiGtHkUiPb64SLSiOgXks5Gnefe7TIoxA7Zxk0jxAZQ9T9iMANPLDnRqa
 22/dhA44=
X-Gm-Gg: AeBDietjerQlqqtaL3HEZfdOvCBjIp9/6PXHFAp5Wv008vLM2G2x+ZkIxwXLar2D9q9
 4KjT8ac/eG7FSKlrusm53DpsMsJ5Va/ZAzWcbvnu4qgcQffCLnAdcDbYa5KXyCANAzukvyaqwXZ
 FFI5SbohsSYLmKTBFgkrskcyD80M+whhv6glFMK1aBSda8OwYrixU+mhzlKU8E4Mmp7jiLbO8m+
 qdPc+8arh8yoVmMDrg5HEOaThuk74lOULRj2zWuIsbTwhzbbmJSnfMz2Bd5dnzZQVwLL4rBHxOZ
 Uw0MQ1KS1EoRzizyKyoAPTv7j1f7AvpiTJOyD0yM0IWReyUsOHtr8J2TMkF4VddpyHU09IbjUYX
 6vaQRVje2C6lTdw8A8Z6y51OLfzG5qItYRWdxuTVw1yPxe4KHnVhL1b2EeDiGg2R9rQcpYQJiRP
 /ytjT6TK8jOzRylFuwADcIO135xyYvPUEqRQeMsB/gVe93fwBYAIyCjq83Q4EIJSkcPgAQEzpbF
 Fp33EHSi78acY3a9XfbN23uiUd5Pu4=
X-Received: by 2002:a05:600c:c09c:b0:485:3989:b3e4 with SMTP id
 5b1f17b1804b1-488fb88c647mr17569895e9.6.1776416390179; 
 Fri, 17 Apr 2026 01:59:50 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:49 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:28 +0200
Message-ID: <20260417085936.200528-14-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416390; x=1777021190; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lt58jKIvGPayj1XplDWBCVPUurm5z5wyRfwXre4a3U4=;
 b=dilcsvqhFqnN3WM8LaqioF0K++0x/ANLaUzChIVonFaLo1G79LnVEfDrvH9kZwsjVc
 f0mS9FPOqGxq7Krr/xf2tSVFkf9M4uCmHEILqaigNxUUUCYIKSf2W71GuHnES4pICTcc
 QNRulxX3Hk+vFZZAEtiYwJc05ZNUoW7o72oCM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=dilcsvqh
Subject: [Buildroot] [PATCH v1 13/21] support/testing : test_libjxl : Bump
 kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_libjxl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_libjxl.py b/support/testing/tests/package/test_libjxl.py
index b6d5ffc9ce..dd87281f09 100644
--- a/support/testing/tests/package/test_libjxl.py
+++ b/support/testing/tests/package/test_libjxl.py
@@ -15,7 +15,7 @@ class TestLibJXL(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.79"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
