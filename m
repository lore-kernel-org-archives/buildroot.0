Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AA4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4150240002;
	Fri,  7 Jan 2022 19:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYzb7dRvO9mr; Fri,  7 Jan 2022 19:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 885AF40192;
	Fri,  7 Jan 2022 19:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FBE71BF5DC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EA7341601
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8YNcqeamNmQ for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 207A1415F8
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:35:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r10so5298744wrc.3
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ix47Ronkxr5UUHcsFzYc79dTKPNcqhtdPU9ifCYJeZI=;
 b=AI+UvhuQpifE869r1uBbgWNt1xZHNTPzUjkRDoHB5WTFB/LsZT5nxMe4EVjbiXum5n
 4QW8tLBqzGBuYe/SUyH37wdvWAmrMMh4dBHdnGK9Tswf7xOXh9hrjdcIw9rLWcauUWla
 C3zE1KrcFZ48VP/xqa8twt4Dq07yTx6SbVx8D0jiYfYrsloWtn8pOJLa2IXMe/B3uCAw
 6Db4kYEHeMg6DB00LLKmjtkERZE98JOZprTOLfHe+sGqzpyCoWtBZQv6lOkTwGst5e9p
 eksk/L3UKhwWWrk4IiE0lTmcQpOtiM74XNYzmrDvCLjaxCNYt0Umy788WsNaSYJxps2i
 j8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ix47Ronkxr5UUHcsFzYc79dTKPNcqhtdPU9ifCYJeZI=;
 b=Fo0M2Pk/brs4455G2hDg0GThK+D7SQ2N113s+z5ZCLfc+zxlXmfq5wiGliN8ytUPHZ
 FYkxImE3CLteN6nIFNtPe3LBITZ45YoVANuV6upVy3n4AUbtI18Atfx39piY2j0pFR4Z
 wMOgCfvtbw5Aao/SdET8LtsSHsN9A0QJW4ikogrbCoXHA8sWhoYhjo/lyi0amSscloQp
 IqyB+APCbeXiULXi0NGsoYLEkuAf9Eqb0DuADiO25Sl3VuYGv/28dUNbK+FGc/pBJzth
 XKyq/0qmgrtxb6euxIWapEh1nGORBlnHWziP7NSSinbj+TY9H8/GKKBustQsclOYBK8w
 915Q==
X-Gm-Message-State: AOAM533bMQn6tcA1Fv3DaogJ78PAE3QodR2D9PUXumkwFD/6ESzSmuf8
 CHmSEPZHkDthEBK0WiHiaV1BX1vEp3I=
X-Google-Smtp-Source: ABdhPJwunE577eX4MlgykTr18+G0antDLEFqQu4GVMlct7eq14GrLqbQdsUGjt5QXAeb/rRpdouPuQ==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr7440377wrs.621.1641584145117; 
 Fri, 07 Jan 2022 11:35:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id az15sm4973262wmb.47.2022.01.07.11.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:35:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 20:34:36 +0100
Message-Id: <20220107193436.1278176-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liburing: enable CONFIG_IO_URING
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable CONFIG_IO_URING through LIBURING_LINUX_CONFIG_FIXUPS in case the
user is also building a kernel

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburing/liburing.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/liburing/liburing.mk b/package/liburing/liburing.mk
index a977e74b4f..74ce4156f8 100644
--- a/package/liburing/liburing.mk
+++ b/package/liburing/liburing.mk
@@ -11,6 +11,10 @@ LIBURING_LICENSE = (GPL-2.0 with exceptions and LGPL-2.1+) or MIT
 LIBURING_LICENSE_FILES = COPYING COPYING.GPL LICENSE README
 LIBURING_INSTALL_STAGING = YES
 
+define LIBURING_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IO_URING)
+endef
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBURING_MAKE_OPTS += ENABLE_SHARED=0
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
