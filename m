Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48767C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5B324041C;
	Wed, 16 Mar 2022 21:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcYcrMdaPPZ5; Wed, 16 Mar 2022 21:23:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEFDB401DF;
	Wed, 16 Mar 2022 21:23:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6491BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9639A812F2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wVlZaBtFS9V1 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:23:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACD71812E9
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:23:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h15so4741948wrc.6
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGH0hohm4fKtS8iSLzpsHkowmyF4BAZaCJhayZqfYkM=;
 b=dp+g2E0JeVDHohG3ADzNzZjPTxH/mBNLS4SLHDh68tbHPFQcUyyOEWNvdrYtvqvAcK
 LVyJMFiIFqQ6RS7qgTV6gOeYFLbe+B4LQ8dZK+HxWLCNE8djOToyfyXEVEqqcC0ResuE
 Qx1kPp7NelEfplj5DypDkSZXG270mLSnFYlu7xh7Ro935+oOwBpM8IhETVY/loQrmDXM
 2qnrz9ecgjV7rMnG/IjVHrskggaCW/eTWpyPciopUx1cFrm1FNxN6ojRw1KU30ioHk56
 0vmIlzLCtzFsm9n2MATJNMqpW34ajPCtksBp4ekLXdvYo+A9ZiLUgikep5glcYS1Uesi
 3SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGH0hohm4fKtS8iSLzpsHkowmyF4BAZaCJhayZqfYkM=;
 b=TGkCOJzQ6khcCvbpDlBCHGQy5AN2ZQ2O9wcIerKZ+WJXIWhG7exk1CtehsqH7uJo8e
 jrHowuZMne8U6civFOI+xtdVM+NTXavqIRaZvP2Pb9/d1ihv9COMhwakWxhU1cuxn3NF
 LBbtJWuO8Qb+9vh376wLcrrMGOi1cLkA3J2x3bV0tGSDK0tj/GSV4EiHt5AivalAWx6Z
 krkRWvssnKYEJpj9IW9qXImAHksCYUG78ByYiGLj0Hu12aI/WE2ONgL3god3Zj1ADkpq
 /cerMCU+anPzeqo0SeYIz8IBRnDtP0Lk6m+uSgH50xKQ/5lOa6PS3j4vioBRcXZQixkv
 mn1w==
X-Gm-Message-State: AOAM5332UUci7oNhKwlJI8ZWAd+5meSASzyoxdF2sYUNmPYcEUoGDV81
 NPNy1oMFu/4S7OUqj247tGqSihH/yQo=
X-Google-Smtp-Source: ABdhPJxRqU2IxdET/HgoG38fn9rkv4YUXtwQZpO3s/XLfwkSOE2a3AtujAq0vRWfImn/QWaecWKnMA==
X-Received: by 2002:a5d:6c65:0:b0:203:9682:885a with SMTP id
 r5-20020a5d6c65000000b002039682885amr1388756wrz.625.1647465821777; 
 Wed, 16 Mar 2022 14:23:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm2440959wrq.52.2022.03.16.14.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:23:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:22:16 +0100
Message-Id: <20220316212220.3437314-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
References: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/zynaddsubfx: disable tests
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable tests which are enabled by default since the addition of the
package in commit 18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index c8d64f5ce8..b2eb1921fa 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -11,7 +11,7 @@ ZYNADDSUBFX_LICENSE = GPL-2.0+
 ZYNADDSUBFX_LICENSE_FILES = COPYING
 
 # There is no package in buildroot using LV2 plugins: disabling
-ZYNADDSUBFX_CONF_OPTS = -DPluginEnable=OFF
+ZYNADDSUBFX_CONF_OPTS = -DCompileTests=OFF -DPluginEnable=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
