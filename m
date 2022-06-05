Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B7FC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 16:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C44B417CC;
	Sun,  5 Jun 2022 16:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zahe3KTndbOj; Sun,  5 Jun 2022 16:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67A8C41743;
	Sun,  5 Jun 2022 16:55:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3611BF408
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 16:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8342041743
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 16:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3m9asCyERLux for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 16:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BD44410D2
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 16:55:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso6786325wmp.0
 for <buildroot@buildroot.org>; Sun, 05 Jun 2022 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6/9m90OHr66fxnE/Dobj7op78JzbMzxNdaPRlMkzBc=;
 b=NmGGQ+eQBvgsyaq9R0wjCI+QXOld1mhhkJ5ZcTZehYCgykGhOjz7iAxWZWFC9/upcR
 dEdDbwlndAiKFTxmDGIZ4tMggZBZPjAgYLYlP8C05Yzj9u0pDPyek1B2WXmGoVLie+Ai
 TgAOGx8/G8b5hR+RYna8lUhW06w3FBmqdrWDs4WXULUfyAFxg5eUh3L9tvJgZ19Md5vE
 T/nSBKyHI6E6lCG4kFnkSS6d4b3AnEk9NcAzzg5yp/xx8+6Y0q9ck2tRsTRRXAZ28sBp
 QJgJq2LzUbQx9LGy+GfUunbKJT0NdZVJwVQRxr0i87qCBKWSE6nObb7aFUnKLeU/497x
 fTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6/9m90OHr66fxnE/Dobj7op78JzbMzxNdaPRlMkzBc=;
 b=JBp4OXkwVEJNbHnFuiA3JX93jSGX80plWqa8sxNHzf6idCjrpSs9f4ZWYpDWQk4abr
 wX0ASB6TKeIzWJKd+JBMqrJAP9/EQwpsmWIicy0K5QL9ybaX4pkLz0sIZQ9KBsuppR3T
 ka4WQr8Z96CwMt3KIeOqElkQ7vYTAK6BoWKdA9KFbFa/bgy1J5t85Px3U4TumC31jhRg
 9ixddDsRyVATDffjfcUTojNKjeo97WgbSjYdiR4uirpNC0krv3KIY3gpqjT8Cynsvv37
 JSHAJPE5yhco7uYFSLMjqHB4GX4aDU/4b+tLLxMMMaylMWTfL08t68BXA7uxvSfyI4K7
 RseQ==
X-Gm-Message-State: AOAM533BWuEg+ReiFiZv9/TLrkcAV7OsftRUj6VhGGthshAVud6OjTva
 08YA/L94UlDb9wyAzND+RpzBh20a5ww=
X-Google-Smtp-Source: ABdhPJxPz2zKIsIqU0y5SP05RSIEBI6kenFLqDWZay1r9VVg2zhSUGq6QfIlBfibFmhj1vB1sK+WMA==
X-Received: by 2002:a05:600c:4e94:b0:397:62ab:f88f with SMTP id
 f20-20020a05600c4e9400b0039762abf88fmr47671103wmq.63.1654448129018; 
 Sun, 05 Jun 2022 09:55:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm916678wrr.15.2022.06.05.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:55:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Jun 2022 18:52:53 +0200
Message-Id: <20220605165253.2155286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: thermal needs threads
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tmon needs threads since its addition in kernel 3.13 and
https://github.com/torvalds/linux/commit/94f69966faf8e70bd655ea25f9dd5b9400567b75:

tmon.c:23:10: fatal error: pthread.h: No such file or directory
   23 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d7b3d15ebf80ca6dbbbd4554af541182c777e4de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 131380cb02..732ac65a25 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -122,12 +122,16 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dyna
 
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_NCURSES
 	help
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+comment "tmon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LINUX_TOOLS_HV
 	bool "hv"
 	depends on BR2_i386 || BR2_x86_64
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
