Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880DAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 07:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E47240366;
	Mon, 29 Nov 2021 07:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QTHEUJbpHnEX; Mon, 29 Nov 2021 07:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FD43400E4;
	Mon, 29 Nov 2021 07:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A27061BF3FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 916086080C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 07:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFGp-oO_D2wm for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 07:19:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8783D605C2
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 07:19:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v11so34504708wrw.10
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 23:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NuQkauKcLBEWr1qlCjt+dPqqQzNAVREJfSXpQ+0r1Hk=;
 b=Xx4dYY1VPF5SEyGHTXcjC+05G3nArD8c5lSCO7uE3BiOXXM8x2SNGOlR+0CFTVSrCO
 oOkE2XPqW68fjTrtc9Xm4QPt9LatlEfO4o2q2zcXNjCl7jQhfkANwamcwd6i+wdNaGfo
 2eK6+6ojut/+LuEdQKYmW1DOvZ63OaRcs/vQixdq0ZFfKXmo6JYpbrzA4nLRjezQkV/l
 A4AKYDX50Ujvg9BgqaVMUp6J2bXQnpdC1OvIgCcp15YZNAEHVKW4inINsxqbv/5cb2kg
 oiYNnjnRBQz6VwQz6GSJZW4p7WON/WcRygZ+u2MtJ13PT3OcJ+rA25umYjnah+pWD1BL
 zZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NuQkauKcLBEWr1qlCjt+dPqqQzNAVREJfSXpQ+0r1Hk=;
 b=DExJgsllp1VuKsNtuoLYDBzj5rEnoQ9Srft5Tua+sLYS11QZzJ40lPS/Pc+AFznOOx
 0Oi3cXAYJrFWini+Jdo/dXzOlfr07oFtt686ylrlnEVxsHtAi+3LOPzCx+38abmD+zzU
 Ld1AZIIrQiiguX3zejJuVT/CbANeqfu9k55wiUFC/wRhYGIdErWGabtORJSg1Lz2uneF
 15D01yeomQy9equ7juDS4SOl3I3zGhwocRMvSpCqX099fNyI3tI8OsqdC59G20r2j1v1
 XuXTy8gvdbFgQTfrR76iLAD7b5AX4aFstiqyTnOX87tF2H0MwuUvZ/7GZFOEYtmniTG6
 PXnQ==
X-Gm-Message-State: AOAM530JEqR5/S5qQU7CoWqlRYIJeWWct3Vs0S0FNQwQcRLlRI0KIUA7
 g6BxIQWsLaCTJ7DfLnvVspGKgX+XIKs=
X-Google-Smtp-Source: ABdhPJzh0CAfOjVP6rpxW3fL1mbCZHhZ0/MeJd2S5LeRSZ00jWeF2gfpcsG7+zV0bO/EQ3hrCpgxcw==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr31523783wrz.147.1638170349537; 
 Sun, 28 Nov 2021 23:19:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id q4sm12522057wrs.56.2021.11.28.23.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:19:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 08:16:37 +0100
Message-Id: <20211129071637.2176846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wqy-zenhei: drop spurious spaces
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious spaces added by commit
a2387015fe3730291df1381a59acb13af356c543

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wqy-zenhei/wqy-zenhei.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wqy-zenhei/wqy-zenhei.mk b/package/wqy-zenhei/wqy-zenhei.mk
index 88e60f3e56..375b0dd303 100644
--- a/package/wqy-zenhei/wqy-zenhei.mk
+++ b/package/wqy-zenhei/wqy-zenhei.mk
@@ -6,15 +6,15 @@
 
 WQY_ZENHEI_VERSION = 0.9.45
 WQY_ZENHEI_SITE = https://downloads.sourceforge.net/project/wqy/wqy-zenhei/$(WQY_ZENHEI_VERSION)%20%28Fighting-state%20RC1%29
-WQY_ZENHEI_LICENSE =  GPL-2.0-with-font-exception
+WQY_ZENHEI_LICENSE = GPL-2.0-with-font-exception
 WQY_ZENHEI_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 define WQY_ZENHEI_FONTCONFIG_CONF_INSTALL_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/43-wqy-zenhei-sharp.conf \
-	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf
+		$(TARGET_DIR)/usr/share/fontconfig/conf.avail/43-wqy-zenhei-sharp.conf
 	$(INSTALL) -D -m 0644 $(@D)/44-wqy-zenhei.conf \
-	    $(TARGET_DIR)/usr/share/fontconfig/conf.avail/44-wqy-zenhei.conf
+		$(TARGET_DIR)/usr/share/fontconfig/conf.avail/44-wqy-zenhei.conf
 endef
 endif
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
