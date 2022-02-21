Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF88C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 18:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10573605B1;
	Tue, 22 Feb 2022 18:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85LAPTh8Fbzq; Tue, 22 Feb 2022 18:12:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46A1A60C1F;
	Tue, 22 Feb 2022 18:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A53B51BF2E3
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9135781B0A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObDwIDtHn6VK for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 18:12:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB08781992
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 18:12:12 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j17so8301021wrc.0
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 10:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVyAxhXk+h7U8w9hPyCmDK6zjEySCL8nilAg6GJ5dVo=;
 b=D+FnIfTtJp2jJ8KQ+7KMNj5QzvX3coBAVMD88ZidZ4WATirxRIeH0NvsFfacu8cFfw
 /3XwApGqAnVaA6hmE6fUCM/Hsh3UGgoMDDLkJKgnWTPtl6zxMjkRYA/T8zT3MuT72Hf6
 kDI8Fh8JRFEJtGMyR3Tr7RDxqpXiDP9nNpkyne4rRzpJGjnrMTispA/ZBBL8Psoiz3Cw
 rBjHVlNvUzhqQtY5v1lHdg58Z9CRZ54vasglJd7njqKdnoT8j2seuscwJhwtE6O2ViRh
 esX3OW6wv1scjptgKyPWANMzuu0Yx3/Iky64qO8mM25IBl08CYo12Db/Utfpb1vXfNgk
 tIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVyAxhXk+h7U8w9hPyCmDK6zjEySCL8nilAg6GJ5dVo=;
 b=UeU6vNRzeNwULiQnO3dJyVtj7P/b1EENacuTPbCS2HOwJNol0Q7rJBEohC1/pnBrNT
 OthJTPH97c5CJp89IPft7MikWFIJcz9/UA5Wmi7swPnPbZo5oLtNHEAy6Zq6Vft4mRI8
 vrLmT/B59mXn8dFHgZhjvBsSzWQbPagAZRAB85pszmlXEeEN37tdd+KYx2sV07iP2G3s
 NgkNyMn6LcCY+oXKI4S/ThWMZeIBkYY0aYb33RNuRUD6uXZWlefwWrK1IlBnp2FaHkzS
 fdD0dnZ+Q/jzeYzp2tOCPUPXu0rhrUgQVIxB89LSDVZ/7pPKsNlXKfcz49+2um8xljSk
 xfbw==
X-Gm-Message-State: AOAM533voedpEuz+bYaVhWBTPLyCgZiizpUY5sgJp1PZ8tpCRR3tgQjt
 1hd3hMjUHesP3CQrqW0fN3taSC1k1nE=
X-Google-Smtp-Source: ABdhPJxsbaJHS0VSPs0APW0i08RouQvU7B0RhlMxEQdEERFHBlcbV36vV27M09ZtzaqatygxZQ6O2g==
X-Received: by 2002:a05:6000:1888:b0:1e7:cd21:c24f with SMTP id
 a8-20020a056000188800b001e7cd21c24fmr20780100wri.308.1645553531103; 
 Tue, 22 Feb 2022 10:12:11 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d14sm47589365wri.93.2022.02.22.10.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:12:10 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 21 Feb 2022 05:30:32 +0100
Message-Id: <20220221043034.2736010-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221043034.2736010-1-francois.perrad@gadz.org>
References: <20220221043034.2736010-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/skeleton-init-portable: new skeleton
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/skeleton-init-portable/Config.in      |  7 ++++++
 .../skeleton-init-portable.mk                 | 23 +++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/skeleton-init-portable/Config.in
 create mode 100644 package/skeleton-init-portable/skeleton-init-portable.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0..7cafd6c95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1010,6 +1010,7 @@ F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
+F:	package/skeleton-init-portable
 F:	package/tekui/
 F:	package/wpebackend-fdo/
 F:	package/wpewebkit/
diff --git a/package/Config.in b/package/Config.in
index 10209d84d..0b947f682 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -6,6 +6,7 @@ menu "Target packages"
 	source "package/skeleton-init-common/Config.in"
 	source "package/skeleton-init-none/Config.in"
 	source "package/skeleton-init-openrc/Config.in"
+	source "package/skeleton-init-portable/Config.in"
 	source "package/skeleton-init-systemd/Config.in"
 	source "package/skeleton-init-sysv/Config.in"
 
diff --git a/package/skeleton-init-portable/Config.in b/package/skeleton-init-portable/Config.in
new file mode 100644
index 000000000..ca434451c
--- /dev/null
+++ b/package/skeleton-init-portable/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SKELETON_INIT_PORTABLE
+	bool
+	select BR2_PACKAGE_HAS_SKELETON
+	select BR2_PACKAGE_SKELETON_INIT_COMMON
+
+config BR2_PACKAGE_PROVIDES_SKELETON
+	default "skeleton-init-portable" if BR2_PACKAGE_SKELETON_INIT_PORTABLE
diff --git a/package/skeleton-init-portable/skeleton-init-portable.mk b/package/skeleton-init-portable/skeleton-init-portable.mk
new file mode 100644
index 000000000..8174a5d82
--- /dev/null
+++ b/package/skeleton-init-portable/skeleton-init-portable.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# skeleton-init-portable
+#
+################################################################################
+
+# The skeleton can't depend on the toolchain, since all packages depends on the
+# skeleton and the toolchain is a target package, as is skeleton.
+# Hence, skeleton would depends on the toolchain and the toolchain would depend
+# on skeleton.
+SKELETON_INIT_PORTABLE_ADD_TOOLCHAIN_DEPENDENCY = NO
+SKELETON_INIT_PORTABLE_ADD_SKELETON_DEPENDENCY = NO
+
+SKELETON_INIT_PORTABLE_DEPENDENCIES = skeleton-init-common
+
+SKELETON_INIT_PORTABLE_PROVIDES = skeleton
+
+define SKELETON_INIT_PORTABLE_INSTALL_TARGET_CMDS
+	touch $(TARGET_DIR)/etc/machine-id
+	mkdir -p $(TARGET_DIR)/var/tmp
+endef
+
+$(eval $(generic-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
