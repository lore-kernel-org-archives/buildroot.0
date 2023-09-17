Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC9BCD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 19:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B65E404A0;
	Sun, 17 Sep 2023 19:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B65E404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMUCkMJu9JxJ; Sun, 17 Sep 2023 19:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C1D04042B;
	Sun, 17 Sep 2023 19:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C1D04042B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E57B61BF406
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB8E281C6E
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 19:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB8E281C6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghGkmbdQq3O9 for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 19:22:55 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B85A81C46
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 19:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B85A81C46
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3200bc30666so601917f8f.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694978573; x=1695583373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3N/G47zV8jCJgdtRxw7EEm8mhRtD0WkkQfg+8fjyx2k=;
 b=DM6GIUE8pZf7ayJQBUN8YmK17+Y0NL4l+yQbkZVYt9+bWar/fYVDL5EO16NcFIltFE
 cAGeDeNN6YS9aQHLL8us9z6j5g6Nva2yqR2PEpYl6GX/D7u21PEdw3aNt1GQpvL/yUsm
 NfAIAp3ES66/k3nBIXxXfnXiGAWwU1GZ2WFXRE7ALG40asHvzjjW6hic7oQNEawAhXON
 Pvf1svb/T1T+6ivFYvMizqVJMSNJCtTiXZ5wAdrXrmBfcitU386KwAHZorgFbEvC716Q
 HZX03Rt2LdmxvvIfHatCX1mVLHLtR9GSUx3vIfCYd6FBX5ALAtv4x1nHIw/YdVUjzwH+
 QkXg==
X-Gm-Message-State: AOJu0Yyj8Yohasm9haj9M8+4rPDMR2cneFHZsT9zBzul6YtGlmtp/V1H
 Rx4s8vAGetVbHhDFzCnalMsp8LBoUEc=
X-Google-Smtp-Source: AGHT+IEfwewnZPoNuEvUxU9v2rQuEy6KJjWJbDl7umZih61irO6Pcf5G1l8WZKvfzF55D9Opatiqow==
X-Received: by 2002:adf:dcc1:0:b0:31f:e86f:cc12 with SMTP id
 x1-20020adfdcc1000000b0031fe86fcc12mr6148211wrm.41.1694978573057; 
 Sun, 17 Sep 2023 12:22:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w7-20020adfec47000000b0031fba0a746bsm3335887wrn.9.2023.09.17.12.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 12:22:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 21:22:43 +0200
Message-Id: <20230917192243.753931-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694978573; x=1695583373; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3N/G47zV8jCJgdtRxw7EEm8mhRtD0WkkQfg+8fjyx2k=;
 b=lepOpYVPcd+jwbRDvzM3KceLxcgjaRV/ldGINyJfc7SCfVpZHtC5PbIFnHueDCKLRq
 O/uT+jXwKXPGsmNBqigwIbUPg1SCGLzTZYJ3jF47aiWu+lco4hW7qXBIbmpIZ5H5Elh0
 QEsnOkmWRAESQgBcHoUZ4UIh+VAwaDEr0SAj+gppMTl7vyZtyV5McqtwVPY5jmcqLKtO
 yfxrakeBzuWmCGkquzbgdSqXkLWLcWmMOGV3HkuEbbjZyLTuteffZ0AFRNaeov8qn0TH
 GOOEQ1TcZNbGVreNvL8rAaDYmfwdoPVIxTcISM8mpUkrUI9JUloVPNY/mkKs0FjHmI1I
 9QTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lepOpYVP
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix musl build
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

Fix the following musl build failure raised since bump to version
2023.05 in commit b86542085df87da91057017b17f261a213bfd918 and
https://github.com/sbabic/swupdate/commit/8228b1390632195158f4387d7aae659ebd6f1469:

In file included from core/bootloader.c:9:
include/util.h:210:23: error: unknown type name 'mode_t'
  210 | int mkpath(char *dir, mode_t mode);
      |                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e545f294c7f032fd7434fdb91aa18a38b2e19038

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-include-util-h-fix-build-on-musl.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/swupdate/0001-include-util-h-fix-build-on-musl.patch

diff --git a/package/swupdate/0001-include-util-h-fix-build-on-musl.patch b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
new file mode 100644
index 0000000000..d1e0db6b56
--- /dev/null
+++ b/package/swupdate/0001-include-util-h-fix-build-on-musl.patch
@@ -0,0 +1,41 @@
+From 1999685830d6e9b57014666b9e53e46de17a471c Mon Sep 17 00:00:00 2001
+From: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Date: Fri, 15 Sep 2023 18:14:57 +0900
+Subject: [PATCH] include/util.h: fix build on musl
+
+Building on musl 1.2.4 fails with the following error/warnings:
+
+include/util.h:211:23: error: unknown type name 'mode_t'
+  211 | int mkpath(char *dir, mode_t mode);
+include/util.h:269:36: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
+  269 | char *swupdate_time_iso8601(struct timeval *tv);
+
+These were caused by a recent reorganization of the headers and glibc
+appears more tolerant here.
+
+Fixes: 8228b1390632 ("Reorganize includes to have smaller files")
+Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Upstream: https://github.com/sbabic/swupdate/commit/1999685830d6e9b57014666b9e53e46de17a471c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/util.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/util.h b/include/util.h
+index 2f5c7adc..5f4cdc01 100644
+--- a/include/util.h
++++ b/include/util.h
+@@ -8,11 +8,13 @@
+ #ifndef _UTIL_H
+ #define _UTIL_H
+ 
++#include <fcntl.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <stdbool.h>
++#include <sys/time.h>
+ #if defined(__linux__)
+ #include <linux/types.h>
+ #endif
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
