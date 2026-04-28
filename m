Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F49FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 20:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6404B41EB8;
	Tue, 28 Apr 2026 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vfYUXeW0vWB; Tue, 28 Apr 2026 20:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DFDB41EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777407825;
	bh=ZSmlcsUjz+pDrYsX1glwvgdfKYQcp2shfJ4tsfE5O4U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVoh+bShFH5dC1YlSvPB9K5tvYEez04UKFhV1JAvm4z+t+oZffRmtmp7u9U3JurkI
	 UmjhuUchLDXe72w8wKMY0RS08ZDYEC61hpP4qZzhe1Fbfo1ApyBvg0mD41MVWmkl3K
	 i6GF5o3plLxE7gTY077nvA51dHz70WkS2vJRn8hgs3j+fUlErDn/MnSa9nDmLfB43A
	 H91d4ZMo1RGoH0ztTQ076bv2wbOeWV9pE5b7cDU753kP2Y4IwQa3RAoLffBe5oEwYg
	 nW/L7HqBD/CBIuanLMDXnxhZk9StQ1o67/xPv7/eJVFC80/PDEkB+ebZRI14FiE/Cx
	 +GOMImAUOr3jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DFDB41EAF;
	Tue, 28 Apr 2026 20:23:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D531B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AF5C40337
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCZIROjOMgTT for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 20:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1E6940470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E6940470
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1E6940470
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 20:23:43 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-82f69a286dbso8900608b3a.2
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 13:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777407822; x=1778012622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8IxzMVx/CKP1clv3SSe3VOAHkTcKSDYB8DlyKCaXFGc=;
 b=QB5e/w4tYn5uHwraKXMB572P1ttsiGsmRx53PWCHA5VstXWMN9M/cEeVpsWKpSpAa4
 BIyxq35umZdtfMsceX0oMTLLnv24I1Tt2MCfez8aLdHKIl/238wNfwUBFi5U6jr41V9S
 FD6pRq2kT5/aHf9ehIkOA4YnLDHkDpdJvtIwMGJw0A2W7hGg1h9Pak4U3BjYJmlX4YB0
 DiLN5XgcVjfNdqQp9ZBC1cpMJ2wCyguuKKuKB0x9qluvdbSspo9WnyBo4OZyiCxXviOo
 9H7ZNF/sctIJfCnHblNUz9Qz4e6X413M8qU8yUQ1jXSPURcYxdrIb+T6+yx59JSleoqb
 z5lg==
X-Gm-Message-State: AOJu0YyrP0yjaZXOgFKkjad/gs0cMRNtEEJ6qdLoEW1bahOCp9v+ocsK
 ytgGI9YN0b+KRG9fA5DQIw3B0FZB6AovJtTsd/LlRLG7Ognvc9vmyXET5DEW64Ay
X-Gm-Gg: AeBDievoGk4v1HVhLg6d5VWtgNZ+QsAMuuqTjofOpyn+Rqh1XtyWVu7rwKf6cQTUkN3
 neF0z9z99ZVH7DRf3NzlLp6G6OWVCUB8OY2SCJuDw8mMylnEA7P4jJNqkGBK3FMc10U87KNYjHp
 fAdDn8KI5wiSXVIRAFyn9WNoh7lLofxU84qNfaCnx8wSsEdsYrSMBgKU871wMn0M5bDeR75UrAM
 Stw5NTTzZRu5/wvgDkBqvRK3G3P/FaJyoYfsdhO8cEa1nUQMJmGoWyGAJP/oYt4/WWnG0EQkcIj
 zqePZ4HAssjj3IHsW+DmalmoECi1kL20nlJyn32XNwA2DBNAF7pD2dJru7TJ436Rdn97Jb7OBNL
 JVW8QuagnsP1nnlbzVnM6q4bCf5CqjOMQl0+E1OAFNH9VcntYj9Vd/tdltLnTtCNFJV4CR3ynFp
 a+4iXc7RxBbVAYvzc7sSQx2c6v/x2Iodt4QLavkfEmCwcESOWfaP3dq7Ok9w==
X-Received: by 2002:a05:6a00:2990:b0:82c:7335:4f71 with SMTP id
 d2e1a72fcca58-834ddc77179mr4219645b3a.36.1777407822280; 
 Tue, 28 Apr 2026 13:23:42 -0700 (PDT)
Received: from fedora ([2409:40e5:1178:d0d6:4db3:78fb:ce74:a637])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834daf7f515sm4567011b3a.59.2026.04.28.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 13:23:41 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 29 Apr 2026 01:53:07 +0530
Message-ID: <20260428202308.2045378-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260412180902.86006-1-chakrabortyshubham66@gmail.com>
References: <20260412180902.86006-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777407822; x=1778012622; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IxzMVx/CKP1clv3SSe3VOAHkTcKSDYB8DlyKCaXFGc=;
 b=DLbXY+g8qSqyH2ksp16P9BdVytLwxWJc6qwmPIaLvDEY4enI3TggKicIAl9vA2iBRa
 42GEjNf2mEJ+nEOdbIh2e9DRsmHw6OeW6GRA+VklBseU1F7rnjlJuMfRrMjoyUae7nRl
 QgYRi9gPvfMat6aOzj0DNCpN2B6/wBy+FWLoq7/bx0OsYgPofo8VHpRiABgpYogQRWqB
 LftuWnMBk2Q1qeUQ8848507u3raAlPbcTYMlTxWrLye81HSzkTDD51lC31McuRhu6+9a
 tDWBXlLdxrw4PUuQOOusK3yS7O7IvOtuhkiEXjyyYSwJ40NcJxMfuynqQ4UQOcv+Bqlt
 GnaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=DLbXY+g8
Subject: [Buildroot] [PATCH v2] package/inotify-tools: bump to version
 4.25.9.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

- Fix crash on >=1024 watched files
- Add recursive watch with --include
- Add static compilation flag
- Fix fanotify-only options when disabled
- Fix man page reference formatting
- Add C++ toolchain dependency (new requirement)
- Add patch to fix fanotify header conflicts with uClibc

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 .../0001-fix-fanotify-header-conflict.patch   | 83 +++++++++++++++++++
 package/inotify-tools/Config.in               |  5 ++
 2 files changed, 88 insertions(+)
 create mode 100644 package/inotify-tools/0001-fix-fanotify-header-conflict.patch

diff --git a/package/inotify-tools/0001-fix-fanotify-header-conflict.patch b/package/inotify-tools/0001-fix-fanotify-header-conflict.patch
new file mode 100644
index 0000000000..9696b42e39
--- /dev/null
+++ b/package/inotify-tools/0001-fix-fanotify-header-conflict.patch
@@ -0,0 +1,83 @@
+From f59f9fefb26342c35c2874e83299d5b69bbc6ffb Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Wed, 29 Apr 2026 01:40:39 +0530
+Subject: [PATCH] libinotifytools: fix fanotify fallback with uClibc
+
+uClibc provides sys/fanotify.h, but it lacks the newer FAN_REPORT_*
+declarations and related event info types needed by inotify-tools 4.25.9.0.
+
+The configure test therefore selects the fallback header path.
+
+That fallback previously included the bundled linux/fanotify.h copy before
+sys/fanotify.h, which led to duplicate struct definitions on uClibc.
+
+Fix it by building the fallback on top of sys/fanotify.h and only defining
+the missing declarations actually used by inotify-tools.
+---
+ .../src/inotifytools/fanotify.h.in            | 45 +++++++++++++++++--
+ 1 file changed, 41 insertions(+), 4 deletions(-)
+
+diff --git a/libinotifytools/src/inotifytools/fanotify.h.in b/libinotifytools/src/inotifytools/fanotify.h.in
+index 9fcbe26..c30bb73 100644
+--- a/libinotifytools/src/inotifytools/fanotify.h.in
++++ b/libinotifytools/src/inotifytools/fanotify.h.in
+@@ -10,15 +10,52 @@
+ #elif !defined __ANDROID__
+ /*
+  * Assuming sys/fanotify.h does exist, but linux/fanotify.h doesn't have
+- * FAN_REPORT_DFID_NAME, so include our own copy of linux/fanotify.h
+- * before including sys/fanotify.h.
++ * FAN_REPORT_DFID_NAME, so extend the libc header with the newer
++ * fanotify declarations required by inotify-tools.
+  */
+-#include "fanotify-dfid-name.h"
+ #include <sys/fanotify.h>
++#include <linux/types.h>
++
++#ifndef FAN_MARK_FILESYSTEM
++#define FAN_MARK_FILESYSTEM 0x00000100
++#endif
++#ifndef FAN_MARK_INODE
++#define FAN_MARK_INODE 0x00000000
++#endif
++#ifndef FAN_REPORT_FID
++#define FAN_REPORT_FID 0x00000200
++#endif
++#ifndef FAN_REPORT_DIR_FID
++#define FAN_REPORT_DIR_FID 0x00000400
++#endif
++#ifndef FAN_REPORT_NAME
++#define FAN_REPORT_NAME 0x00000800
++#endif
++#ifndef FAN_REPORT_DFID_NAME
++#define FAN_REPORT_DFID_NAME (FAN_REPORT_DIR_FID | FAN_REPORT_NAME)
++#endif
++#ifndef FAN_EVENT_INFO_TYPE_FID
++#define FAN_EVENT_INFO_TYPE_FID 1
++struct fanotify_event_info_header {
++	__u8 info_type;
++	__u8 pad;
++	__u16 len;
++};
++struct fanotify_event_info_fid {
++	struct fanotify_event_info_header hdr;
++	__kernel_fsid_t fsid;
++	unsigned char handle[];
++};
++#endif
++#ifndef FAN_EVENT_INFO_TYPE_DFID_NAME
++#define FAN_EVENT_INFO_TYPE_DFID_NAME 2
++#endif
++#ifndef FAN_EVENT_INFO_TYPE_DFID
++#define FAN_EVENT_INFO_TYPE_DFID 3
++#endif
+ #else
+ #include <linux/fanotify.h>
+ #endif // SYS_FANOTIFY_H_EXISTS_AND_WORKS
+ 
+ 
+ #endif
+-
+-- 
+2.54.0
+
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
index 6b113d9e42..45296bd170 100644
--- a/package/inotify-tools/Config.in
+++ b/package/inotify-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_INOTIFY_TOOLS
 	bool "inotify-tools"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	help
 	  inotify-tools is a C library and a set of command-line
@@ -9,3 +10,7 @@ config BR2_PACKAGE_INOTIFY_TOOLS
 	  'inotifywatch' binaries.
 
 	  https://github.com/inotify-tools/inotify-tools
+
+comment "inotify-tools needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
