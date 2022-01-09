Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F5CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58579402D1;
	Sun,  9 Jan 2022 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hcz82SBNMKDK; Sun,  9 Jan 2022 22:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F623402C4;
	Sun,  9 Jan 2022 22:18:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5C9E1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93C3A8143B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTD4bFfXZ0GS for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDBFD81415
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:17:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id l10so23300458wrh.7
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QI9HHIewi4Io/453hZmHroH9qgMwPVWCLfjCawhZMo0=;
 b=nHjeJPDJh+bcupxoUs7H4zmKei0N2l85FMWvfFwydCKwbLqPH3bUGh25GS5VgWK+9E
 U+oLczRYdpWUawq9B3rFcdUVOojgr3VGahZw2WCQHgIUnFrZxoGG5GCudToJqDbndfTM
 c+fWS8M+ceASyt9UjnIkQHfaKWHmZHfrvcKnmGErGBWb5tqbtlzmogATzTorKoJvASx6
 vtxzP8f5WhSuHE2EwFmSCjCrWXSDL8G3LJkfnrVpymgDudW+4o3pQN9G2mVmNGGj2zZv
 cETTRXbTJaO7v+nWAiVfgWD+Drm+Fw8QEk1AZPmjBTNjzBTQLjChKaJ1lD8G0g4Br+8F
 RtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QI9HHIewi4Io/453hZmHroH9qgMwPVWCLfjCawhZMo0=;
 b=yL7vIju7N6O5cDo7k0m+tv7mJ3dQUfUgKq/KHXpOHL3YMGx/PwQjRgRD2n34yiVJia
 rgiOZL8HvSxxjKi2V8KxL9IPju7wILo95UwBXihx0Hixx2QGtOYHN3DZDJesJ2u+R3CP
 en7akzsrbirbLGwD2J5CEYNOwgELu3sgofyDcDkOkX6bHL/02s5vYwoqEWE9hLFHtrtl
 XmhkpZxBr5VWDyFNBIPUe2dnHg+jm5Ey2HnIzTuwMbmxmlurmcx+HNdPUACqC9dKd+DN
 brkRw1vlpclxtSQgmgYpN1vvqNFrlqKc2ZLGksOeaAvP1NRVR0BnU7V7DlaKb9UnOKbV
 SVlA==
X-Gm-Message-State: AOAM530MwkYTg29VVR2gAaODKT36sTRXn5uEHzYsJsR7Qov0Dd6uDca+
 utDHxkcE2y/YreA3XBZSoMrBpQ0Pimw=
X-Google-Smtp-Source: ABdhPJx9YdSvlJMEUsaG075Np/wtqHN2CrOiAMeny9y8zYVKtcZ2zI9WgiOdURoEGGNhHGQT/H9Ycg==
X-Received: by 2002:a05:6000:107:: with SMTP id
 o7mr1757767wrx.414.1641766673047; 
 Sun, 09 Jan 2022 14:17:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id ay39sm4965950wmb.29.2022.01.09.14.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:17:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:16:33 +0100
Message-Id: <20220109221633.1307381-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109221633.1307381-1-fontaine.fabrice@gmail.com>
References: <20220109221633.1307381-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/hiawatha: disable ASM if needed
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable ASM as already done in mbedtls package to avoid the following
build failure raised since commit
4e36e8f2081a66f477dd038793082045876d65ee:

In file included from /home/buildroot/autobuild/instance-2/output-1/build/hiawatha-11.1/mbedtls/library/bignum.c:41:
/home/buildroot/autobuild/instance-2/output-1/build/hiawatha-11.1/mbedtls/library/bignum.c: In function 'mpi_mul_hlp':
/home/buildroot/autobuild/instance-2/output-1/build/hiawatha-11.1/mbedtls/library/bn_mul.h:86:13: error: the register 'hi' cannot be clobbered in 'asm' for the current target
   86 | #define asm __asm
      |             ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5436b44777c5d417ae427b99602f516fd8f9489d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index ed9f8aba54..14d3c9f1ee 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -22,6 +22,24 @@ HIAWATHA_CONF_OPTS = \
 	-DWEBROOT_DIR=/var/www/hiawatha \
 	-DWORK_DIR=/var/lib/hiawatha
 
+define HIAWATHA_MBEDTLS_DISABLE_ASM
+	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
+		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
+	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
+		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
+	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
+		$(@D)/mbedtls/include/mbedtls/mbedtls_config.h
+endef
+
+# ARM in thumb mode breaks debugging with asm optimizations
+# Microblaze asm optimizations are broken in general
+# MIPS R6 asm is not yet supported
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
+HIAWATHA_POST_CONFIGURE_HOOKS += HIAWATHA_MBEDTLS_DISABLE_ASM
+else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
+HIAWATHA_POST_CONFIGURE_HOOKS += HIAWATHA_MBEDTLS_DISABLE_ASM
+endif
+
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
