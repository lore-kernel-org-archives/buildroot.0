Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D039AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E97813DB;
	Sun,  6 Feb 2022 14:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ax6HQzPtQkin; Sun,  6 Feb 2022 14:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A45D3813D9;
	Sun,  6 Feb 2022 14:33:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD3A91BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4DF4813B3
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyZJfzPCFmqr for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:33:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8CBC813D9
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:33:21 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m5so3185553wrb.2
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67V0NeMrNJSoeqLh5lHLUW2hN12rNH3zjlnAEyLYDRs=;
 b=oBX/xzNTOUm7VACTWgUML3PNlj+qWKy9pfQgB75uvjBGwSPyn71DfQ5taDuxfaZFYq
 m5IeXRzyUOHz8sxsQq4h6oY2CQ00FOcgRG7zCK0rLsKudeLXYEguTTWy4EZYb2jD+0oM
 9Vg7VYc2s6mkdOsk1eNrcY5pCPlFgjYCFJ7K8avDv3hOZ/gIItMrLxZL8wkDpVGPVaU8
 iAQ/NjKpux969QiRnOoIizYs7ZB+j1VK6kYSElsM6h1ffk7VrbHKeNZqcctgcCcgJXqQ
 fQGEYDuX4d2ZdvD+aPqHbvtPCUtlga5HNcD/AVD+85uZJCvT2Px7tbHb5ggqAjdueK9B
 0X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=67V0NeMrNJSoeqLh5lHLUW2hN12rNH3zjlnAEyLYDRs=;
 b=XndAczEUvzdNTmeBRw7dLsNx53wD4hJc991NM8hKFe9F6T2k5LY+wF6eLJBtqVg195
 T5LMXPqeQWsyVVacD8vb2XaH+/j2eGLT4CwbnK6YOMQscieZwUQ6QQ50UyrEyvotaBNc
 4C+Kmb7QWCJy+DEx7cE/FW03JhLRJm2JQ5seSsLCJ08v9yUJo43Me824VLZTtZ4j22S9
 dbHJR1jr2imfvrhA18W3sI3R2n79e8MJeUDTiWdO4ZVKYPoAExe5dKFHHvJPSMemnsov
 9weZr3GmpdItrZ/vpIj11SxW+OH5I3SIGXRjHteIQfcOio90WuCJIKbB6ma0Dlvg/XPV
 bnhQ==
X-Gm-Message-State: AOAM532Cz+rowh7Ci9aLJ0xpk60igZN9/+BOWlS8AfSTMtvWhSHZr20z
 sKvaLvcNASQIH7MvvGFOJ9aixdNOoBY=
X-Google-Smtp-Source: ABdhPJzr4cGCxNHMWZhUllhU4YKN0dXERfarDJH+ajIMeSpduQ4i7WrpsBpvk3Nz+wo5TCfQZjowXA==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr6666984wrd.134.1644157999932; 
 Sun, 06 Feb 2022 06:33:19 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id bg26sm15506628wmb.48.2022.02.06.06.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:33:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:31:12 +0100
Message-Id: <20220206143112.1752984-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jack1: drop celt comment
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
Cc: Adam Heinrich <adam@adamh.cz>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop celt comment which is not needed since removal of celt051 in commit
b32efbdb0354557db48852478b99080705ba315b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jack1/jack1.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/jack1/jack1.mk b/package/jack1/jack1.mk
index 2f97434ebe..311f7c9ba0 100644
--- a/package/jack1/jack1.mk
+++ b/package/jack1/jack1.mk
@@ -11,8 +11,6 @@ JACK1_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK1_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
 JACK1_INSTALL_STAGING = YES
 
-# Dependency to celt can't be met: jack1 requires celt >= 0.8.0 but we
-# only have 0.5.1.3 and we cannot upgrade.
 JACK1_DEPENDENCIES = host-pkgconf alsa-lib berkeleydb libsamplerate libsndfile
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
