Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D29C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Apr 2022 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26FFC4017E;
	Fri,  1 Apr 2022 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P_WxCZxicMyM; Fri,  1 Apr 2022 21:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FAF74012D;
	Fri,  1 Apr 2022 21:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB571BF358
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1919441C6A
 for <buildroot@lists.busybox.net>; Fri,  1 Apr 2022 21:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GpQaKfxi1XXF for <buildroot@lists.busybox.net>;
 Fri,  1 Apr 2022 21:02:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD48341908
 for <buildroot@buildroot.org>; Fri,  1 Apr 2022 21:02:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c7so6014177wrd.0
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TClHxyQi911J11HTur1x1HT9+5WSwCulrixgtYu4bHs=;
 b=S7bBj2xZd00xZSwhFEEFAPOGXoSrvOo+++FLyjNpm+ZuTQ1hsT3A7nNSksxEV8EUHs
 aUWiSYKx8KHl5XWZ0/uqH3obMEJKkmQ6pFQ66R4REQ6DGY3wZuIgfnv6aWvTP29iuhn1
 FG1A7mdbmZr/2qbjg1PCKOQbnkoLY0F8C6YODANyROw/Ji4XDTIO87xzJbmY7PZOVoJz
 EnvbHvkrtRgBs/oQ6+BKbF0PAotgdEEkxI1zDn8MBP/v2guO2E8ZbMa2bg1A8iV2cKJM
 moR/OxFEHSctO1VuchRaHItn4eJDpZaIeWkVmctUsB0Cy/WRhU+JEfDPJfGETuqtgWSg
 2KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TClHxyQi911J11HTur1x1HT9+5WSwCulrixgtYu4bHs=;
 b=X+GiiN52UNkNb5xUGa/XWRgZhDG9qiF56rBn9fwNAYt0Zb2vRyRH4BeiQ1Pj8VdIw4
 jED9GG6vcsctT5CT25rNLsm8E/955ImOt/+wSRfQ5JPDuJD8wpEx60Q2QAHg0T5zwXkW
 sqqzUdAS4j+QOHvv2ZDzVbIizhvhy3PxuatXe7s8eEGY2kL7Rb/fE6a+9kaobNCl8NKI
 jhNNUhxJQ+5tINwGfPxNi36ZlIvILd8YkQ4CgfuwIxqvTu9rFAWN8ZaNO1yEAXIyy7bs
 AVeMNeI8LFW51DEpWQ38LQkMwe7a+/pBtwsNgliD9P+aYyFbbXDlR31ETtdVCfFnAalG
 lJiw==
X-Gm-Message-State: AOAM531N5F18LPXMbcbKTPN4rL7IsFz6CqHnB9ftoroRDRjzZbJbwyLu
 yKKKmeRIq/qEfj7233JYv9sEbG1PGrs=
X-Google-Smtp-Source: ABdhPJxEWW4xn7LBognFvcKT0QKVaLzxEL231W3Yp+GX+OjHNXNP4ufUh/ZvPLaqdbrGogtkYI/SmQ==
X-Received: by 2002:adf:d1e1:0:b0:204:1e6a:d2b6 with SMTP id
 g1-20020adfd1e1000000b002041e6ad2b6mr8965547wrd.487.1648846956588; 
 Fri, 01 Apr 2022 14:02:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056000136800b00203e740c7desm2879522wrz.71.2022.04.01.14.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 14:02:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 23:00:55 +0200
Message-Id: <20220401210055.946614-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liblinear: bump to version 2.44
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of COPYRIGHT (date updated:
  https://github.com/cjlin1/liblinear/commit/3d2fdc801ce45f470b1b5ed1945cb63126358485)
- Update LIBLINEAR_INSTALL_SHARED due to
  https://github.com/cjlin1/liblinear/commit/42f423c023e45879c8750b468e0afe74931afe3f
- Some minor bugs are fixed:
  https://github.com/cjlin1/liblinear/compare/v243...v244

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liblinear/liblinear.hash | 4 ++--
 package/liblinear/liblinear.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index a714b8bc4e..27aa4e3e87 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807  liblinear-2.43.tar.gz
-sha256  c5c91211a0edaa4c77e352f6b27a8f9c6768afe27d48176d6094905c534eacb3  COPYRIGHT
+sha256  45572b99d4eeffc3e8ad7b72c27370be867edf3523c396d8b278a2c873bfbb5c  liblinear-2.44.tar.gz
+sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 1ad734c756..c100ccc6c5 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.43
+LIBLINEAR_VERSION = 2.44
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
@@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
 define LIBLINEAR_INSTALL_SHARED
-	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.4 $(1)/usr/lib/liblinear.so.4
-	ln -sf liblinear.so.4 $(1)/usr/lib/liblinear.so
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.5 $(1)/usr/lib/liblinear.so.5
+	ln -sf liblinear.so.5 $(1)/usr/lib/liblinear.so
 endef
 LIBLINEAR_CFLAGS += -fPIC
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
