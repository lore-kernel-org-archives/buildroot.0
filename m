Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372C9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7734818A1;
	Tue,  4 Jan 2022 17:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqQe2_9cwX6U; Tue,  4 Jan 2022 17:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997881839;
	Tue,  4 Jan 2022 17:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D32B61BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB49840236
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UI0h-O_OlE1y for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:49:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06CFB400FB
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:49:10 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c3so14363213pls.5
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QZ4EpMrXB9mXb0I06N4dtyB9MhjO5SkEW1OG5BYZS0=;
 b=dvjK7N7vlg9SSIJBkUWh/PD5jgGZvTGS7+UigV14javf0m/2Nik2C14kgJ265iIf9Z
 DPTrm42ICNI8Lg0xd1QOTXhq+ycWWdYRITr3OPrdNY+3/R2ndovmD8+wIwhml66FqFlR
 u9VnjQG99Lx88NiNah31aFYcMgzjX0hoe96ty7FnXsgpBHgnTvd7rdx50Qn1DKnWXLgF
 co8Bu0RUcm/xR/D5V8Gd5qrf0PrzUfyVzzXVGeUvFY6yhaNX/vRGEKbJtdMw0RbS2Vv9
 aFBFjlpEyaW8UdXbJLXIsrHFQ3rNIDowf2HHgPtE8JkvAo13l51Y15xUpUq9mhE8vIEP
 kRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QZ4EpMrXB9mXb0I06N4dtyB9MhjO5SkEW1OG5BYZS0=;
 b=g8Ki5nDU4ifHp8TYi2DytQdK1qcn3LC4co4M5vHPGKFujqyUtNiFknYc0gmQcMhW/1
 G7izx1RFS/JDWM+qMzt78gKebK85PpcLhRgStu+Xzc3oXbhshjro10eF6YSwzMyys0iX
 X+zxHDhio/YSGzzeJ3BIzuKFDqDgVZfJlBn+Smkgi2xDmJSCoEmtB8SxrxxjxShvJKnI
 woqKcloyvwQ4M35jLMiE7jLEPlKyEropTB0HVpGVOXoP1kRBvmgj/Btrw+QtsGK7CDLf
 6sQGH4qWMHjwuiLje+4oMgJUupUywCwnGcUOFCGCyXTjb91wyh2kH5jxHIa1zTrnmn4a
 p7FQ==
X-Gm-Message-State: AOAM532Rro8ObobdOjjiFzdFk/d7DY9uaCabCD3uhgsCcn1XTIvhRar3
 jDxV+pGfprlhErDBWsyP9Ch7jfnjeRs=
X-Google-Smtp-Source: ABdhPJxLbWn45nmYOUMg8ddTGpKCmy9yXtsYE2WzIw7GlknKqPMGXdXKv1pWiXftm7B+Xzxn9oGzrw==
X-Received: by 2002:a17:902:7b96:b0:149:49fc:7de0 with SMTP id
 w22-20020a1709027b9600b0014949fc7de0mr50087059pll.25.1641318548953; 
 Tue, 04 Jan 2022 09:49:08 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id j206sm8984615pfd.94.2022.01.04.09.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:49:08 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 09:48:58 -0800
Message-Id: <20220104174858.2665848-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104174858.2665848-1-aduskett@gmail.com>
References: <20220104174858.2665848-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-generic.mk: fix absolute
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

Add the new pre-configure hook "FIXUP_CONFIG_FILES_ABSOLUTE_PATHS" in
package/pkg-generic.mk which searches for .cmake, .pc, and .pri files in a
given per-package host and staging directory and replaces the old
$(PER_PACKAGE_DIR) directory with the correct directory for the given package.

This simple fix allows qt5 submodule packages to build with per-package enabled.

Based off of Louis-Paul's earlier work found here:
https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/

And Yann Morin's feedback found here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
changes v1 -> v2
  - Drop patches 2 and 3 and combine them into a single macro in pkg-generic.mk
  - Move the PRE_CONFIGURE_HOOK to inner-generic-package so it actually runs
  - Rename FIXUP_PC_FILES_ABSOLUTE_PATHS to FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
  - Use $(HOST_DIR) instead of $(STAGING_DIR) to cover both stagin and host
    directories in a single step.

 package/pkg-generic.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5626af1d87..5a2b4ccaf8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -103,6 +103,21 @@ define fixup-libtool-files
 endef
 endif
 
+# When per-package is enabled, packages may generate files with absolute paths
+# that point to the given sysroot. However, after the rsync step for another
+# package that uses those files, per-package isolation is broken because the
+# hard-coded paths point to directories outside the per-package sysroot.
+# As a pre-configure step, sed all .cmake, .pc, and .pri files in a given
+# package sysroot containing the word "per-package" and replace the line with
+# the appropriate per-package directory.
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
+	$(Q)find $(HOST_DIR)/ -name "*.pc" -o -name "*.cmake" -o -name "*.pri" \
+		| xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(NAME)/:g"
+endef
+endif
+
 # Make sure python _sysconfigdata*.py files only reference the current
 # per-package directory.
 #
@@ -837,6 +852,7 @@ $(2)_EXTRACT_CMDS ?= \
 
 # pre/post-steps hooks
 $(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA
+$(2)_PRE_CONFIGURE_HOOKS += FIXUP_CONFIG_FILES_ABSOLUTE_PATHS
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
