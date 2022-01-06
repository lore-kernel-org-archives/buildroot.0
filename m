Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B721C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 17:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D0B6FBEF;
	Thu,  6 Jan 2022 17:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abA5DQvwInmj; Thu,  6 Jan 2022 17:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1B76FBE8;
	Thu,  6 Jan 2022 17:17:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA0101BF2F9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E8342864
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 17:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVaySJvs7eXO for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 17:17:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14C9641604
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 17:17:28 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id t123so3034356pfc.13
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 09:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ry2baLdpsL+rxPvCKbXN1HeE3AjsCzTYPn0Dn12W4dg=;
 b=QpteoG4cJuqZZYW7KL9V17I8TJgrBLFo/bv8GGsp5OZY6RnQL8PvMB57rcSg/k7gs6
 kfsVVOX/jbL/COWQ/hUnbJs+nzNGLaAUHZbM+o4xshwq4eu2O7qriquIw8jXUfPwq3ZO
 Db8EZXg5u2TRvrekuibdgWLDGzPIGfADaFFZuZ3BtqMaIGvgS565E1Hp6qk93tUj2qYg
 CPu/WAHIxa1lMh0YSz+4wuFSUaRCgVRlBF7ceEDQBhVT85mdh8I/NE+mQmhrKRnBqx9N
 gfBgYzZMVWDOJEIF6vX02RLwCXj3fRDVTQY6UslCpOOYGofeAks62lqFBfrBHbYkWq01
 55tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ry2baLdpsL+rxPvCKbXN1HeE3AjsCzTYPn0Dn12W4dg=;
 b=6ykcb13swXeuV2fEoXQWf+dEDIrWojAJN5zPvbPbrGJ7tRATvc7CYnQu9B4LDB5Uye
 +hMXf9bxwJQQFqTmZKcaJK18AYztfH19RaanB0BI/CMCG73MZoez0J52GugOeHD4HoeU
 6WVOQ+fnmh7cidwCHZgFOF9BZscRq8aPqqC6PdKy+9UETdyS2M3sEiIRtltMvS/t33lJ
 p3hARiYCTJ1wb/vgZnNVteQd65xGfXf5gxl7xk7FAJ9y7oITqs9SF7ifT6QSNka/3HhP
 4gbTTrot6UAsoG/Y4y47CM4iYE3QOy5SWBVWV5klq2EcKPUoservDwG0ApN/HtqwCAxm
 1kQA==
X-Gm-Message-State: AOAM531YRNOFSCosETAZ9Vv8kga67r3RfCY17qlEFhUX0W2+e0/xyVgJ
 gfVEHVZmNNRN4v/WeIyEcjUqeTAGujg=
X-Google-Smtp-Source: ABdhPJwOJblW+oJzuPBs+pPcfV1sm53gInHodVkEhQH4hbyakvk+ecpgoT7oHWiWprmO/ljKb+3uPw==
X-Received: by 2002:a05:6a00:2313:b0:4bb:8b68:3677 with SMTP id
 h19-20020a056a00231300b004bb8b683677mr59971076pfh.2.1641489448206; 
 Thu, 06 Jan 2022 09:17:28 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id g6sm2027170pgk.37.2022.01.06.09.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 09:17:27 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 09:17:20 -0800
Message-Id: <20220106171720.12857-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/1] package/pkg-generic.mk: fix absolute
 paths in per-package config files
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages (notably qmake packages) generate .cmake, .pc, and .pri files
with absolute paths. Unfortunately, doing so breaks per-package builds because
the paths in those files point outside the per-package sysroot for packages
that have rsynced those same files.

- Rename FIXUP_PYTHON_SYSCONFIGDATA to FIXUP_PER_PACKAGE_FILES in pkg-generic.mk
  to avoid more calls to ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)

- Add .cmake, .pc, and .pri files to the files of which to find to sed the
  per-package paths.

This simple fix allows qt5 submodule packages to build with per-package enabled.

Based off of Louis-Paul's earlier work found here:
https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/

And Yann Morin's feedback found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v3 -> v4:
  - Further compress the method by simply adding the files to the already
    existing find command. (Yann)

changes v2 -> v3:
  - Rename FIXUP_PYTHON_SYSCONFIGDATA to FIXUP_PER_PACKAGE_FILES in
    pkg-generic.mk (Yann)
  
  - Combine FIXUP_CONFIG_FILES_ABSOLUTE_PATHS with FIXUP_PER_PACKAGE_FILES (Yann)

changes v1 -> v2
  - Drop patches 2 and 3 and combine them into a single macro in pkg-generic.mk
  - Move the PRE_CONFIGURE_HOOK to inner-generic-package so it actually runs
  - Rename FIXUP_PC_FILES_ABSOLUTE_PATHS to FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
  - Use $(HOST_DIR) instead of $(STAGING_DIR) to cover both stagin and host
    directories in a single step.

 package/pkg-generic.mk | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a5fe5507b..9952ff1963 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -113,8 +113,16 @@ endif
 # fail.
 # So we just use HOST_DIR as a starting point, and filter on the two directories
 # of interest.
+#
+# When per-package is enabled, packages may generate files with absolute paths
+# that point to the packages per-package sysroot. However, this breaks
+# per-package isolation when the files are rsynced to a new package that depends
+# on the first package. because the hard-coded paths point to directories
+# outside the packages sysroot. Run sed on all .cmake, .pc, and .pri files in a
+# given packages sysroot containing the word "per-package" and replace the path
+# with the appropriate per-package directory.
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define FIXUP_PYTHON_SYSCONFIGDATA
+define FIXUP_PER_PACKAGE_FILES
 	$(Q)find $(HOST_DIR) \
 		\(    -path '$(HOST_DIR)/lib/python*' \
 		   -o -path '$(STAGING_DIR)/usr/lib/python*' \
@@ -122,6 +130,9 @@ define FIXUP_PYTHON_SYSCONFIGDATA
 		\(    \( -name "_sysconfigdata*.pyc" -delete \) \
 		   -o \( -name "_sysconfigdata*.py" -print0 \) \
 		\) \
+		-o -name "*.cmake" -print0 \
+		-o -name "*.pc" -print0 \
+		-o -name "*.pri" -print0 \
 	| xargs -0 --no-run-if-empty \
 		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
 endef
@@ -836,7 +847,7 @@ $(2)_EXTRACT_CMDS ?= \
 		$$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
-$(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
+$(2)_POST_PREPARE_HOOKS += FIXUP_PER_PACKAGE_FILES
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
