Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48652C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 08:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E369E410BC;
	Fri, 23 Aug 2024 08:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpVQWFEVU25S; Fri, 23 Aug 2024 08:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 899AB41244
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 899AB41244;
	Fri, 23 Aug 2024 08:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DBD981BF366
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 08:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9BB280DB4
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 08:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfPGmTDAiPrf for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 08:40:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6EAD980D9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAD980D9E
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EAD980D9E
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 08:40:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso13197135e9.1
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 01:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724402446; x=1725007246;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9hDoAvUqd/P+jOQdfkPrklQuO9iQy/3mHzYnET7eyss=;
 b=JNr3+/3CadTfAz/cMIi8h41NliI/Z4xz7wRRz5c4e46UrdpetA3uJ5XIUe66AMAp8h
 8kxVG0EJeXzaoZBrA1jxH1e8wuEYT445nThi9TE2IIWhxD0RXkNIjtn9hOV7c0cYZDlH
 tEywRxnDZPP0GvL1GZAgwkkqNKdabDUC/vEtxJKl5tjdZNsuT8+M4n7aiUUCqjmg1jUn
 XdipoDecPw2CYASRS+oEljMAZxfd4atRRCo6ZSP1eOGmZNFNIcjysiOWHF62UNS0uvp/
 qEbq5HAsxPLXKDpXq7MaGWMS+6Gdk5Rm9DFRkNL+poSe6aqpUt6Angh9A8HFO2ZymUFh
 nl6A==
X-Gm-Message-State: AOJu0YzgOFza3EEZckSwkGdYBcXkJHEuNr4SjYTqpuQSha69WR9ctPkO
 YIsY2sfAqS9beHgro9vVWBHsJWmsoH4xWZMxBqiJZRyL3TZrXEhU0PoHpg==
X-Google-Smtp-Source: AGHT+IErhgalcyDZPidWPDACmPczJJqmb4jsfJHSNRir8BH7RX26fQ+Unov51GpyvI+hfC41nSd5Aw==
X-Received: by 2002:a5d:6702:0:b0:368:5a86:c1b7 with SMTP id
 ffacd0b85a97d-3731191b603mr957294f8f.55.1724402445908; 
 Fri, 23 Aug 2024 01:40:45 -0700 (PDT)
Received: from fedora.. (ip-109-43-177-41.web.vodafone.de. [109.43.177.41])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-373081ff5d0sm3623561f8f.72.2024.08.23.01.40.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 01:40:45 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 10:40:40 +0200
Message-ID: <20240823084040.74851-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: [Buildroot] [PATCH] package/frotz: Remove the "frotz" package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm not much interested anymore in maintaining the "frotz" package
in buildroot, and since I likely was the only one who really used
it in the past years, I guess it's time remove it now.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 In case somebody else want's to take over the maintenance, feel free
 to ignore this patch.

 package/Config.in        |  1 -
 package/frotz/Config.in  | 10 ----------
 package/frotz/frotz.hash |  3 ---
 package/frotz/frotz.mk   | 31 -------------------------------
 4 files changed, 45 deletions(-)
 delete mode 100644 package/frotz/Config.in
 delete mode 100644 package/frotz/frotz.hash
 delete mode 100644 package/frotz/frotz.mk

diff --git a/package/Config.in b/package/Config.in
index 317f859684..211080345a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -293,7 +293,6 @@ menu "Games"
 	source "package/doom-wad/Config.in"
 	source "package/flare-engine/Config.in"
 	source "package/flare-game/Config.in"
-	source "package/frotz/Config.in"
 	source "package/gnuchess/Config.in"
 	source "package/lbreakout2/Config.in"
 	source "package/ltris/Config.in"
diff --git a/package/frotz/Config.in b/package/frotz/Config.in
deleted file mode 100644
index 9473f5944d..0000000000
--- a/package/frotz/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_FROTZ
-	bool "frotz"
-	select BR2_PACKAGE_NCURSES
-	help
-	  Frotz is an interpreter for old Infocom adventure games and
-	  other Z-code games. Note that frotz cannot be run as root.
-	  You must add a normal user to your buildroot configuration to
-	  be able to use it.
-
-	  https://661.org/proj/if/frotz/
diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
deleted file mode 100644
index 145aa3800f..0000000000
--- a/package/frotz/frotz.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  bdf9131e6de49108c9f032200cea3cb4011e5ca0c9fbdbf5b0c05f7c56c81395  frotz-2.54.tar.bz2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
deleted file mode 100644
index 4c477c396d..0000000000
--- a/package/frotz/frotz.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# Frotz
-#
-################################################################################
-
-FROTZ_VERSION = 2.54
-FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
-FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
-FROTZ_DEPENDENCIES = host-pkgconf ncurses
-FROTZ_LICENSE = GPL-2.0+
-FROTZ_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-FROTZ_CURSES=ncursesw
-FROTZ_UTF8=yes
-else
-FROTZ_CURSES=ncurses
-endif
-
-define FROTZ_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr CONFIG_DIR=/etc \
-		SOUND_TYPE=none CURSES="$(FROTZ_CURSES)" USE_UTF8=$(FROTZ_UTF8) \
-		CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
-endef
-
-define FROTZ_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/frotz $(TARGET_DIR)/usr/bin/frotz
-endef
-
-$(eval $(generic-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
