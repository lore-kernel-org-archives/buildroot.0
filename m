Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE61C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 17:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0FD040493;
	Wed,  2 Mar 2022 17:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5jLZX4gb6b7H; Wed,  2 Mar 2022 17:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AC5403C7;
	Wed,  2 Mar 2022 17:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9B21BF842
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 17:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BD724042F
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 17:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7vEyNfbtQvV for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 17:45:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF26F403C5
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 17:45:36 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p9so3935846wra.12
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAZaXVUtgrh26eOXFycIFlDii5Zz5d6xV9sWaIcM6ks=;
 b=WLxQb2fF1Mjt2oO1pUC9FINGcfMcxMAFDnFJe7OV6wQUp2NgUYZnOPhOsqI7JEzkvp
 UpQkTOpBnPOz2RBLUa5uKspcwiA5K313mb4QtpgccmtOO64A24WUYJKN3XXFoSK9ouL+
 A4eIP1ogE/tq9HD2BJHLlEMsZ20Vso4VAYrwU1U4KLC8orGozcASgWJpjCuOIAI1KoBc
 aqsxNJYSSlx1+/aOrV7huEir1GcbwvhYFFDq/Y7SKITGorLvoNOmYI5Y4VPOFEZIDLtc
 ScujmdphL6NJwR2W1hpl5z7gN6SC6s29wQlMuzbBL1J5Mzc24nH1XbjL44X+yaBnuex9
 Oo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAZaXVUtgrh26eOXFycIFlDii5Zz5d6xV9sWaIcM6ks=;
 b=it3El/OMf611EojClqBQ25+sQQtlHQshVOmOo9l1KZOurzoAPzIeMnWJL9RM6ZGQgH
 Atz5UedgPfNDbfTepIF6oFqAIwNoYqavSzKc8PPhf7Bm+pk0Us+n51Lah4LtEwaYpEoS
 QXArvsC+edfefOlOs6Hfg4592H7YHHEW47oLnFLhsHT7wkEHMdeJacYVzvTL+wB1Z6ou
 En3PGhGPoe5HUCqsswXKNCGo6ieFgo1BCKTBEioCvqMSIRS4SzyLCxszG4PRoRK5+1wc
 naqkkGpA7bK70cwuNLhicw4fyS0iByj3+ULJ9mz4GicYuC1V8SKwlikxh2LotXrhcYIm
 NUQg==
X-Gm-Message-State: AOAM530tDqMW3xmQopmhwHDgq5gxubBKGOp0m+QSkL7Vs2VTKXijRCo5
 8OlfGG0sX/m2ym/PlGGLyXL0K95mfaE=
X-Google-Smtp-Source: ABdhPJwkP7LhsZ+Gl5x80VVToRilgyhu5UFyOPtnpmoiea122z4nJxmEBghUBnw1tbERKmsfR964WQ==
X-Received: by 2002:adf:914f:0:b0:1ed:bb92:d0cc with SMTP id
 j73-20020adf914f000000b001edbb92d0ccmr24147854wrj.297.1646243134860; 
 Wed, 02 Mar 2022 09:45:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037c0342cb62sm8473347wmq.4.2022.03.02.09.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:45:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 18:44:56 +0100
Message-Id: <20220302174456.1641125-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302174456.1641125-1-fontaine.fabrice@gmail.com>
References: <20220302174456.1641125-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/xscreensaver: add gdk-pixbuf-xlib
 dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gdk-pixbuf-xlib dependency is needed since bump of gdk-pixbuf to version
2.42.0 in commit a7b51ed3013c919b293deb95299e33363fb9df70 to avoid the
following "hidden" warnings:

   Warning: GTK version 2.24.33 was found, but at least one supporting
            library (gdk-pixbuf-xlib-2.0) was not, so GTK can't be used.
            Perhaps some of the development packages are not installed?

   Warning: The GTK libraries do not seem to be available; the
            `xscreensaver-demo' program requires them.

   Warning: The GDK-Pixbuf library was not found.

            The PNG library is being used instead.

            Some of the demos will not use images as much as they could.
            You should consider installing GDK-Pixbuf and re-running
            configure.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/Config.in       | 1 +
 package/xscreensaver/xscreensaver.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 787c3130ae..10b2b7012c 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GDK_PIXBUF_XLIB
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index f73a75bf14..46dedc3211 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -15,6 +15,7 @@ XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
+	gdk-pixbuf-xlib \
 	jpeg \
 	libgtk2 \
 	libxml2 \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
