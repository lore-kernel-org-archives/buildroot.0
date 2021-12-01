Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8832AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 13:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E802240352;
	Wed,  1 Dec 2021 13:51:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oW5VV5GxYp5c; Wed,  1 Dec 2021 13:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C770E40345;
	Wed,  1 Dec 2021 13:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E79F41BF349
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 13:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D599240345
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 13:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MFIEGuKETgoI for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 13:51:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E496400FB
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 13:51:08 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id k21so30899423ioh.4
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3bY/frkSOyQo6y3RzwxzA2ffoiBSeD96/d4qt1D0Lo=;
 b=Yxgy68ibUMxVGVv4kE0fJDL9vp/JqR8GGoufIvEd+T3cp/GWKK1Ny70er2qIQyihgA
 HYwTCaNH/gEADa257gtnzsrwp9y26Yu2En9WhR10fdoLSyVDjWfbCgF9UvQI/VqHukVL
 UY9EGnLdRWYem7bZjMkWMC07tuBSVr/aqWGGtGFSgliVDZ5clIcay7KROBq+4fGLBNi3
 Q1QUW/I7qkohQxDcFeAC1BF1s2nVvD9GHZqYZNFM+5R4L21YQ7pO7hzOV717OFe6rwSD
 +Wc/MmwllpvmIB51iLWpDWsrX18qhkrkGy/SSSUrVVI0of9jdRdztKiKTOykyI45zzmE
 3BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3bY/frkSOyQo6y3RzwxzA2ffoiBSeD96/d4qt1D0Lo=;
 b=eRBiRhdqetlk+2YmBDJSViPAiUpUNQhkD68uVVG7ryKosQHbDPtCuCNGLUVMzIlYJ1
 6VmJtnhdP+pSVzPcer2OJVeyk+vCUjU4cqr8kVgUw4JNUxY9RfoJlyFEPukVNEmz80XG
 m+jnEHn6S/u60DeGR3OVpBeW4D024nyFVl0VcxulZSxWUaydxjhr3ukrClzJI8uQAUzJ
 HxnCNMwbC+OnLimuPOcAO1wY/OlbvdHIBNdQAF0M8WdpTUOgPqyEYOgGNf7vIIOrLP4R
 iTmsYVkOdmjywQAYFxEbWeO71/OJuRlzdwQOEBQaMPbqgD3AA+xd0qE67Q+H7t8Q+BuX
 beUw==
X-Gm-Message-State: AOAM532aJmQKyMz0Zc3n2/ApPucanUJqRM+kPRhikmtEO/KQQAtGakyc
 izKig+8GDJ+tmGDsUJABZoEZUq3rYG4=
X-Google-Smtp-Source: ABdhPJwptHYaDH2JW2hu1PW38XAlQseg4R5dAhVlKsrrpN2gOjDGvcHHNlyUDXoFt6H/oKjS3t5wVA==
X-Received: by 2002:a02:85a9:: with SMTP id d38mr10326090jai.71.1638366667405; 
 Wed, 01 Dec 2021 05:51:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id 11sm9875170ilq.23.2021.12.01.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 05:51:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 06:51:03 -0700
Message-Id: <20211201135103.2302297-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iwd: enable required kernel
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Required kernel options are listed in check_crypto() in srv/main.c:
https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/main.c?h=1.20#n268

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iwd/iwd.mk | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 96bdc56e93..8bcd406ea0 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -63,4 +63,34 @@ define IWD_INSTALL_INIT_SYSV
 	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
 endef
 
+define IWD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_NI_INTEL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_X86_64)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES3_EDE_X86_64)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1_SSSE3)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256_SSSE3)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512_SSSE3)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
