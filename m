Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB737C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 529DE42954;
	Fri,  7 Jan 2022 19:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nT_LAd-SrPkD; Fri,  7 Jan 2022 19:51:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A49242959;
	Fri,  7 Jan 2022 19:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 361D91C2747
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 242D042954
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeyS6Vq48epT for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2FB14293C
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:51:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k18so12976566wrg.11
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 11:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25MD+XfNRBa285Ctnbl2AqmKB56k87VrmZyoylsyhLQ=;
 b=Vydgasjs4fWzV/t73KqGYHCqiQ7mkU/kCBHMwq0RdM4Fmd+PJu7wcU4Tm14+tbNk9n
 UlPzD/65uTHDrRm20/Og7K9eNCV1ZkLjNYL1ClgTRWEe8+pbID4MPGcfug2kepcF4apm
 aSUla8vY9kXAFCVP0wSgXu2jAXjFKZnw7p9zLVaSXT1EuXX6yWIH/ArYeMof9ytrWPNH
 aj167bov0R4WdwDJl+G1d9GorZMaatZ0KKQE2VFEbLtgFtCdseJMaO0k18TaSru8fwWT
 OE5IkesRKs5iSDymO2y3aPo+OQ5tNX8KABni9vlel8+F2V1H3LBlqSgBm8EZqtbBY1w/
 vXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25MD+XfNRBa285Ctnbl2AqmKB56k87VrmZyoylsyhLQ=;
 b=WfZx1zjN11EKrwKw9iGTrF7NlhcT9BPUW5i7owiNlS0AVzbUGlmGOfv5f/QqGUR48v
 K3G2Q6dVBrbv7WBtOtjSCQzyASBBQamgR1JtV5QUNVTSgrp50maTejXgh+WkA1jlhXw+
 tWGu39pQqyMdxkT89bcVMOGg9PEqesJP+ELepH25TX1o2Ymdf/BB2auxs7JqSur9BLA8
 rR5TArMjDjJbOHX6+Gj/khDN2LaXMKxn60+n/h7H7gTnXSc0KN060ceVdAnZk+7nKJq7
 96zltZXl3BZWmmzfGXZ0+WoLJf7qWrpztGJa+kaEafk+y0cRkXFEbZSbq6dbCZkiQ7+4
 ij4g==
X-Gm-Message-State: AOAM532uUAMR9j9DCqC9G+AjFPydj/vBQXQQp1TMQCfhQQ3KiaGAlzPp
 tU463QcHuCeWttAX+f+6EEXvk5uHUY0=
X-Google-Smtp-Source: ABdhPJzsyCZ5tQ/OCYkUT45juVNBt1mHPD5m3Zy9t9ShbvVD7FJo95HfX6ma212GxG7EY1KheK8+cQ==
X-Received: by 2002:a05:6000:1c05:: with SMTP id
 ba5mr6853692wrb.298.1641585078117; 
 Fri, 07 Jan 2022 11:51:18 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id bk17sm5518311wrb.105.2022.01.07.11.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:51:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 20:49:56 +0100
Message-Id: <20220107194957.1320947-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libosip2: bump to version 5.3.0
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.savannah.nongnu.org/cgit/osip.git/tree/ChangeLog?h=5.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libosip2/libosip2.hash | 2 +-
 package/libosip2/libosip2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libosip2/libosip2.hash b/package/libosip2/libosip2.hash
index 7a08bf26a7..071ad7e61a 100644
--- a/package/libosip2/libosip2.hash
+++ b/package/libosip2/libosip2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  ee3784bc8e7774f56ecd0e2ca6e3e11d38b373435115baf1f1aa0ca0bfd02bf2  libosip2-5.2.1.tar.gz
+sha256  f4725916c22cf514969efb15c3c207233d64739383f7d42956038b78f6cae8c8  libosip2-5.3.0.tar.gz
 
 # Hash for license file:
 sha256  8d9e95ed0e48df46dc758eb0d86df611f771eab4eed94bebb77dca87f1c897de  COPYING
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 967602b426..2f9b7a9242 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSIP2_VERSION = 5.2.1
+LIBOSIP2_VERSION = 5.3.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
