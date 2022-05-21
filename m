Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1038EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 15:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C59F40B45;
	Sat, 21 May 2022 15:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R09OcuIOkP96; Sat, 21 May 2022 15:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5BBD40B3B;
	Sat, 21 May 2022 15:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21C011BF25B
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 15:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F16640B3B
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 15:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rkYmYW22Jve2 for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 15:30:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 214BF400AB
 for <buildroot@buildroot.org>; Sat, 21 May 2022 15:30:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m20so3903557wrb.13
 for <buildroot@buildroot.org>; Sat, 21 May 2022 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LCWy9pIm8SlOTeSzAwJXSiSztxKW22Fe3V6cqEeUes4=;
 b=efpOlZYQvX8/uM0SvZ4MjztjGapvuvzC639p3/L9dBhAYsusqyjh2eQEKxL2P3JBr2
 mmzFNQiPn0xlFoKAM6ZWUtJYOguu4a860ti6c5riE8f9oFf7dGgGVV9z8DUmtIfSlxHr
 vCtF+dt4nfZ7GtahTyNfXyhIuuwJLfGV1r/wviaJlukro6eRWWs28cvN2/AhuLS63EIA
 KOA8Kcx7tGnKZjbM4WQd9b6cVpjyQRg/cjRFG2RVDiAUrx+saoK4084J63R13VfmR0Cr
 jG+6Lt5yYwvMeJaO28BBmA5v/O7q3FtzcrioO1faL/Dghn02L39NzYiAYuZdzszsc2LE
 ZiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LCWy9pIm8SlOTeSzAwJXSiSztxKW22Fe3V6cqEeUes4=;
 b=kSF3g2u3IXsJlmq/rKFJjtzmrgGtf7l7nYXMBD8zXPZFNcWgk3B3vdLSU1q5X2nm0H
 XC9LGZznceJX7gBjiQ0ueh03hg9YoYe4pwk7NzH7iZhXG2mGx7qhNyeHeiYoBXei+Eb8
 8K0OvuIvt5BsRdMtBfEXvdNBHxAIJxWkH2heELfmtNzWy1isBhLz7UfPAHvuNMj3ECg0
 D4XZNGceChfPOmH1uH2Zt5lPdFn8uRczAmXahFWhUj7iwCD71p3qfhBNHVVyQGd63DNS
 XKerYC76KVgStOqw2J+XJlsiN9jZGjqU/7MxgveQ47WC5XDfLMOuSKyUfYEuQ808XP74
 B3tw==
X-Gm-Message-State: AOAM533K+e3fQsu1Ixy3cnRYercGpUTkYXyS3ApDGAGWqZ0jsdxrwuB9
 EWSANuaUMd0PmBJK+QdosNBrAHvmj+s=
X-Google-Smtp-Source: ABdhPJyfbeaK6NvkWq2L8Qn02XZk0Y858bGdVgAPyKdRyK5L0suImuNzkhZsN9bW4yr/V0xNCtK2yA==
X-Received: by 2002:a5d:6042:0:b0:20e:65c0:f69b with SMTP id
 j2-20020a5d6042000000b0020e65c0f69bmr12672095wrt.524.1653147043997; 
 Sat, 21 May 2022 08:30:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e3-20020adfa743000000b0020d0f111241sm5444003wrd.24.2022.05.21.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 08:30:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 17:28:24 +0200
Message-Id: <20220521152824.894631-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: security bump to version
 8.2204.1
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-24903: Modules for TCP syslog reception have a heap buffer
overflow when octet-counted framing is used. The attacker can corrupt
heap values, leading to data integrity issues and availability impact.
Remote code execution is unlikely to happen but not impossible.

https://github.com/rsyslog/rsyslog/security/advisories/GHSA-ggw7-xr6h-mmr8#advisory-comment-72243
https://github.com/rsyslog/rsyslog/blob/v8.2204.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index f404098439..4049590bb8 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  19b232f765c4ba7a35b91ef1f5f9af775f6ff78ef56bb7737a2ce79ccbb32b98  rsyslog-8.2010.0.tar.gz
+sha256  a6d731e46ad3d64f6ad4b19bbf1bf56ca4760a44a24bb96823189dc2e71f7028  rsyslog-8.2204.1.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 529f143228..741d090d55 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2010.0
+RSYSLOG_VERSION = 8.2204.1
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
