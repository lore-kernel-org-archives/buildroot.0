Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F09C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 17:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9ED4610FC;
	Tue, 26 Apr 2022 17:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQrUMWwoGblR; Tue, 26 Apr 2022 17:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B68960EBA;
	Tue, 26 Apr 2022 17:23:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 793F41BF9A4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76D9A83E47
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 17:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4dZ0NRtjhiz for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 17:23:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CCD83E46
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 17:23:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso1014227wmh.2
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ao6UMxI54TIY3kDFrOXOhsNTw0vIto7xOzX7cIRvkw8=;
 b=g0pkYCN4FD9uQJ+Whpl7rsmBCbcglSPGYVqTwKHn4bJx9QNJ4YLdTqIeJ4UxHfXNmd
 p+ky8lfbTvXN9Iuj3D0soGijg12fSBF50bj7lLZEvbtIhqCGIj4UJsPkPHqcHa9zXAOv
 gu4hoorCDKLrh1Ov5Z/xsDZH/rsVPgkKDvSemKJKYZ1Qs3cQGMYZkVmcD2o8CyOT5JPi
 AJwYB7pC0GlWYldB/CY5qo9acuU2i8I5gETLQkq/IunaDsA3fXrtazs8HERIC2xkYdrN
 U/QbVb3tX0OC+LpHdWyXtdfWyBWH8dZdinrmYE4IFPz9bFNgsicRaJ3gUGYQNTJnTShw
 TNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ao6UMxI54TIY3kDFrOXOhsNTw0vIto7xOzX7cIRvkw8=;
 b=Kby7dG7NbFYAGjs37FWwQ+E9qWb7yl14aeOvRrVlVU/D9dLBIV6Ylld6XMPmtQHZzW
 PW2VNRNpH5Yzz3m+P855Sy+oz4RpwfZAZVvIx5F1PYFXKOiY+wamjy8gYWpY8iYCZgYr
 Scy3ASkFki82iuP2qw08IxCX8FFupuzXykKVbAmprt+caRaDNwb/albYNrQK1DPTArfg
 VOlOz/xjj9rse3Zme3UN8RWAxdMLoRuQ4ewemyY1G9bpD4Aw/sqFpu8vHuNSWIXe8DBy
 oKCfHscuDwawfas1zEex157neZUSMMyZjshZCvKQJWytQhhqekpS3q8cOdgcjqjYB0Mp
 R1Sw==
X-Gm-Message-State: AOAM531gGAbgPNz/I9VVW5Vujo2eGpwBPaZTtslGUiccVJeipNDHW7Ny
 A87sfnNqHz93FIWquNaVzkzwRXrdF8g=
X-Google-Smtp-Source: ABdhPJw+/2l1FPsiI4wANxZzqI4l97P6kiaQx0Cu0lyG9FyZ5fBgzNIaFMbUsZ1xNX/Wq0P/yP0/Hg==
X-Received: by 2002:a7b:cc17:0:b0:38d:af7:3848 with SMTP id
 f23-20020a7bcc17000000b0038d0af73848mr22598843wmh.41.1650993808392; 
 Tue, 26 Apr 2022 10:23:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o6-20020adfca06000000b0020ae96f6ba8sm1152731wrh.65.2022.04.26.10.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:23:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 19:21:29 +0200
Message-Id: <20220426172129.3189250-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
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

Fix the following static build failure:

/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here

Fixes:
 - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nel-fs-declare-int-openlog-as-static.patch | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch

diff --git a/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
new file mode 100644
index 0000000000..ae10bfcfdd
--- /dev/null
+++ b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
@@ -0,0 +1,77 @@
+From 002ca0320cd2c5e1515bf202f470d4becdf01532 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 24 Apr 2022 21:56:36 +0200
+Subject: [PATCH] testcases/kernel/fs: declare int openlog as static
+
+Declare int openlog as static to avoid the following build failure when
+building statically (e.g. on buildroot):
+
+/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
+syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+[Retrieved from:
+https://github.com/linux-test-project/ltp/commit/002ca0320cd2c5e1515bf202f470d4becdf01532]
+---
+ testcases/kernel/fs/fs-bench/random-access-del-create.c | 2 --
+ testcases/kernel/fs/fs-bench/random-access.c            | 2 +-
+ testcases/kernel/fs/fs-bench/random-del-create.c        | 2 +-
+ testcases/kernel/fs/scsi/ltpfs/main.c                   | 2 +-
+ 4 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/testcases/kernel/fs/fs-bench/random-access-del-create.c b/testcases/kernel/fs/fs-bench/random-access-del-create.c
+index 1f62a76b5e..1878fd78b5 100644
+--- a/testcases/kernel/fs/fs-bench/random-access-del-create.c
++++ b/testcases/kernel/fs/fs-bench/random-access-del-create.c
+@@ -11,8 +11,6 @@
+ #define FAIL 0
+ #define SUCCESS 1
+ 
+-int openlog[2] = { 0, 0 };
+-
+ #define MAXNUM 0x100000
+ 
+ #define  MAXERROR 1024
+diff --git a/testcases/kernel/fs/fs-bench/random-access.c b/testcases/kernel/fs/fs-bench/random-access.c
+index cf41d6e81c..c2f32b86e7 100644
+--- a/testcases/kernel/fs/fs-bench/random-access.c
++++ b/testcases/kernel/fs/fs-bench/random-access.c
+@@ -11,7 +11,7 @@
+ #define FAIL 0
+ #define SUCCESS 1
+ 
+-int openlog[2] = { 0, 0 };
++static int openlog[2] = { 0, 0 };
+ 
+ #define MAXNUM 0x100000
+ 
+diff --git a/testcases/kernel/fs/fs-bench/random-del-create.c b/testcases/kernel/fs/fs-bench/random-del-create.c
+index 0a86f976f3..345031f283 100644
+--- a/testcases/kernel/fs/fs-bench/random-del-create.c
++++ b/testcases/kernel/fs/fs-bench/random-del-create.c
+@@ -11,7 +11,7 @@
+ #define FAIL 0
+ #define SUCCESS 1
+ 
+-int openlog[2] = { 0, 0 };
++static int openlog[2] = { 0, 0 };
+ 
+ #define MAXNUM 0x100000
+ 
+diff --git a/testcases/kernel/fs/scsi/ltpfs/main.c b/testcases/kernel/fs/scsi/ltpfs/main.c
+index 2c67c7a478..90a5531ac3 100644
+--- a/testcases/kernel/fs/scsi/ltpfs/main.c
++++ b/testcases/kernel/fs/scsi/ltpfs/main.c
+@@ -38,7 +38,7 @@ int startc = 0;
+ int showchar[] = { 124, 47, 45, 92, 124, 47, 45, 92 };
+ 
+ int nullFileHandle;
+-int openlog[2] = { 0, 0 };
++static int openlog[2] = { 0, 0 };
+ 
+ int cFileCount, dFileCount, errorCount;
+ static int disk_space_pool = 0;
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
