Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2176C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5741140928;
	Mon, 24 Jan 2022 21:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vltv2d_sN_A5; Mon, 24 Jan 2022 21:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A9604061C;
	Mon, 24 Jan 2022 21:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB16E1BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D65694061C
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCfYcPnUEhZ2 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:38:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE8A04024B
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:38:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 131so1445088wmc.4
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 13:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7E6/DLxq+1S3p4WoueTV0yRgTOzXhKbFGIsrdlJTFs=;
 b=fAJ0kbiMocp1OuJtS0pIT2a7EIy6+nP5Q6LFXXEQdXjV9xipJWSPb0QBiRv+Vf+IN7
 lvabWTUTKbfirV7sfowV6xwrrQJJQ5jedGaurkHvn3lzwm338lDR0aKH4yh58ffOW/01
 zkGg6wPYCk4xwskbvajhuHWlQC6D7N4z0S6ScgKwhu7ZtgHbQtGQngerDMBfPXKGD54o
 jA1+BN0ITzei3ou1J7ED8x/babodcVROfTlzhn/preTSSzAjrZ9jxGbrgS/lGMSxqGDh
 sYZcA1PhuS2sW0M+vr1Ka2Rma+U51jpxu7h+2x9AOU290WScvrOm6YdbIvPBh+xXACW9
 zTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7E6/DLxq+1S3p4WoueTV0yRgTOzXhKbFGIsrdlJTFs=;
 b=D4eacB3JRtLWY0ocQj6XlA98x3A3/8jEDSGXj64pYnvZsKBenTdn88bFdxJwNgHmaP
 UoiIGCC+v6nb3kUAn918Wn/grZA4lEGBz7YRDRQcwE3fSEaqRAabazPUXdAb/42ry5u3
 XPx+XXEMQe/QHcZOua/I/mJmin9o8z8jBib9oKT1FotImHn7SyEysHXvXvlB+zMIr4Tx
 2QbXcSSKp9syqykym5b1sotA0wNvaTeye40vvCwZUPOOpweprKnmiFEcJ/lQPzuB8+Vb
 K2BA1vCqHT+LCd9wmYohe8iYnd74Nvgo6m1Yk+Hs9Dk7k6vGe46TL7Ui3kuI9mhPDBHi
 lwAA==
X-Gm-Message-State: AOAM5317A2zf9/4j8QPiU3ZcqGNDbNcHyeyzfbf+Nf/lJQOLxzSl9mtw
 5LDPN4aVrGkwGXSjWkpk6K8SofB/r8g=
X-Google-Smtp-Source: ABdhPJwVwrrwdn/kt3BnRngnw8JYdUb1tnlueI2zoffX1d2GjMMu2dWZG39Zens4rxC0moH/JRlKMg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr209970wmc.53.1643060308647;
 Mon, 24 Jan 2022 13:38:28 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f8sm565314wmg.3.2022.01.24.13.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 13:38:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:36:31 +0100
Message-Id: <20220124213631.2444354-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sslh: fix build with gcc 4.8
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.22c in
commit 5b9c58531e97b012a8a11c6ae5145b16dcfb8f74:

sslh-select.c: In function 'udp_timeouts':
sslh-select.c:480:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i = 0; i < fd_info->max_fd; i++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/aaaac2beb16730747b4265e81d09cb5e072c7267

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 99fb6bf922..897b3b6505 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -11,7 +11,7 @@ SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
 SSLH_DEPENDENCIES = pcre2
 
-SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
 SSLH_DEPENDENCIES += libbsd
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
