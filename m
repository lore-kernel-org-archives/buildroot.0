Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54776C433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 20:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08B740898;
	Sun,  8 May 2022 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKLWPik7e0mn; Sun,  8 May 2022 20:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687AC40875;
	Sun,  8 May 2022 20:40:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9422E1BF2A0
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 817ED40875
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU8-LBlyLUEj for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 20:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7DEF40872
 for <buildroot@buildroot.org>; Sun,  8 May 2022 20:40:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j15so16930696wrb.2
 for <buildroot@buildroot.org>; Sun, 08 May 2022 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYWadwcMlogE85SvnPo/4+4v6l1VFF7yGCvZK4JUkeI=;
 b=CeiODGbO+XhyMwV1tZqkva3QwY+KCCPv/oTWJau5h6cR0c1bJ1O6QJxb6VldJ/qfYO
 lmdaB3xoejqD0G/Y0+ZhWP5n3GRQUjFSfjDN6pUTUlIbLx0o1TIDl7w1KQvAQdAim8wd
 SB/DE5A+bbMqOzeUl/LRD9Ytdm2MmAVOxyF2B35ddWzRs4P5DwzuV7Pi97VFDTZm0uTn
 uxK1reost5m8HgOk8zom/4Yp/rW00SECS0ahhxy20gqLm9y+x92WthIA52WwqTUP+wN3
 LQqNkV7W9Fq5Nd3+NFuRdtM76RcGl03y8mY4vJd50LWUbSpLn4Uu1ljQwLs7b7xJ8ECf
 pw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bYWadwcMlogE85SvnPo/4+4v6l1VFF7yGCvZK4JUkeI=;
 b=IEiy8BULJt80ghsSod4nBGWbuaGPOR3WLEPRWXNo8TAHo+7zj8ubQHdH8NiE8loh/c
 iQ2lsKLamaqAlav06ugP/k/cosgyJNF+v2PNiOW2b+fxD3YJWrHklWO8Fi2Wyngk3waH
 Jcw9Sp9+0Yz8093TIFlyAfBxlozfhUnp2YwaT2AbENLL/YBo/qBT2Gd7/YsJizkOPuCB
 gkIbBgyso4vHH2+5LF+hcCURcU8xWDAC/OaNkJbPJJwaDqmLG6FJY705C83wYnP9mv8s
 LlK8JXBFUH6jU3G2ZAYkLLlmhzrR0EI+Q46yBvrahBk8DPwXo74CUXu1tuPgvcbP1Qut
 9hgA==
X-Gm-Message-State: AOAM5326ZYl9EHS024GcUuWCZvnNphFN80rkqrzqE1kmZcZKGS8eCl+1
 NOfMQomyCO4Daxk0J15QnmhQY5BMBN4=
X-Google-Smtp-Source: ABdhPJwHsPWRhs6eNyHwgDf6vdCfsA/lb5eI3ajqC8Ed+3qvclqNlav682DTZDPMRIg0ts5Lb9KFEQ==
X-Received: by 2002:a5d:6489:0:b0:20c:6b7d:1bab with SMTP id
 o9-20020a5d6489000000b0020c6b7d1babmr10966409wri.449.1652042448719; 
 Sun, 08 May 2022 13:40:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm8916565wrq.114.2022.05.08.13.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 13:40:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 22:38:35 +0200
Message-Id: <20220508203835.1366772-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dropwatch: bump to version 1.5.4
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
Cc: Tzu-Jung Lee <roylee17@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/nhorman/dropwatch/releases/tag/v1.5.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dropwatch/dropwatch.hash | 2 +-
 package/dropwatch/dropwatch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index 867a7f12fb..24fc03097b 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b748b66a816c1f94531446c0451da5461a4a31b0949244bb867d741c6ac0148b  dropwatch-1.5.3.tar.gz
+sha256  8c43d0c15d0cb9ce179fa1fb0610611723689a6f551b23c70a7ddc1cf068e8d2  dropwatch-1.5.4.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 36608ad8b3..33775f6c02 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.5.3
+DROPWATCH_VERSION = 1.5.4
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
