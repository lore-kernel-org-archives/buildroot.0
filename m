Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1275AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 11:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE26404D5;
	Sun, 23 Jan 2022 11:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwt1qgRR1YkC; Sun, 23 Jan 2022 11:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E95F40572;
	Sun, 23 Jan 2022 11:13:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BABE61BF25F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 11:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B73DE605EE
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 11:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uq6fbbFOv3V6 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 11:13:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D839660B4C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 11:13:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so25651919wmb.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 03:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgNRUoNeC8rhJEZBSu9R2H3KVijJHrxOis1NlqMm2xg=;
 b=YydqaT05Fr4wqFmm5HAZJ2W64SSeeSXamGUhvSFaygVA9U77XX3ECHJ7Z4kVmDkMUi
 qWJyEW0q6J9B0S79fG/R4+4J2o/yARiv7eVh6pydJctve9LSkEea6W8OO7V8PWGeWsJw
 dYsdssNNaMX0R53N7JXKXJDzNq5McAU2SZKZ7DP5nbQ6yYrQQeQzaWRAa9yL9wYs+F/B
 e17DYM/oU3GAqFLPwl8gxA5HglUZD9ZYzqEsf8M6NAi3Bky0/qrLs0W9g7Mw3sO/g8q2
 TG90RDo4oAKc86p3It99Wwryh4PdNBnKut1WbTMsfn9KbsY5RC7c9Yt748FMrDHl4vTP
 HlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qgNRUoNeC8rhJEZBSu9R2H3KVijJHrxOis1NlqMm2xg=;
 b=BRvK+eYPyfxGZonbS27p4u5jjcBStz6VmqqOiV6aOR+/zqTEujMRhan36hpAjMkhYF
 XndTdY8xiLK6lx4zLi/JQR5vc3q61mVXfBXp3D46Qm5ZsNIXB+PQ9rjXnOsFG2dMukUl
 O0TuNr0cLHlH/62iB/sQug5oGgyOGOa5Gl6RsWOiCJAVq9YJI63gI2gIAoSLxAGX+kZl
 jxYHOrSv7c71qPjFZCNPJXtVvW7tIud4JSSmKmErQHCNQubSkVdN+M8crTOFv4ubcvtR
 krcDcyzLD+XJKlMGtgN3z3Bkad0vL6VNXgu0fHAz9U0SSA0Cuqy7XqBn8PNzpNvbKfkv
 jU1g==
X-Gm-Message-State: AOAM532v5x0i0XTPRPrHTNTibgiCs4GX2utZzRaEUJregep5XNFJxWrh
 26mgL70R1Jf7axcH21tzV88r/cD/1ec=
X-Google-Smtp-Source: ABdhPJz5YZR2VQ//XLr4d3rd48CKJZXFKFn8oA/OPKBcQSYlHydaotmkyLinkg5iAZl6UUQ5uiO5Vw==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr7511749wmq.25.1642936382903; 
 Sun, 23 Jan 2022 03:13:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o5sm16377277wmq.21.2022.01.23.03.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 03:13:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 12:11:26 +0100
Message-Id: <20220123111126.573758-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nmon: bump to version 16n
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

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nmon/nmon.hash | 6 +++---
 package/nmon/nmon.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmon/nmon.hash b/package/nmon/nmon.hash
index fd3f09c63a..1d7226a4fe 100644
--- a/package/nmon/nmon.hash
+++ b/package/nmon/nmon.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/nmon/files/
-md5 df67f07ea4006c6204acff586beada81  lmon16m.c
-sha1 68cd02be19036a287fe352823db93223e73a9411  lmon16m.c
+md5  a8172601fdc05f3bc58455cbd3f4475e  lmon16n.c
+sha1  024a3b56179838f0e04bf1706cc9ba56595301a8  lmon16n.c
 # Locally computed
-sha256 2bed4d45fdfdf1d1387ec91e139c04975d5f838e3e0d53c0fe2d803a707e5fc1  lmon16m.c
+sha256  c0012cc2d925dee940c37ceae297abac64ba5a5c30e575e7418b04028613f5f2  lmon16n.c
diff --git a/package/nmon/nmon.mk b/package/nmon/nmon.mk
index 8b39748cce..01371a8c74 100644
--- a/package/nmon/nmon.mk
+++ b/package/nmon/nmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMON_VERSION = 16m
+NMON_VERSION = 16n
 NMON_SITE = https://sourceforge.net/projects/nmon/files
 NMON_SOURCE = lmon$(NMON_VERSION).c
 NMON_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
