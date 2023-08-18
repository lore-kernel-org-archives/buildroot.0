Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4329C678DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 00:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6837760E84;
	Fri, 18 Aug 2023 00:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6837760E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHFuzxQThdFn; Fri, 18 Aug 2023 00:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998DB60E85;
	Fri, 18 Aug 2023 00:31:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998DB60E85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5130C1BF98E
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 00:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3621742231
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 00:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3621742231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5168sLrDIUMb for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 00:31:44 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B87CE4222E
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 00:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87CE4222E
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b89b0c73d7so649005ad.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 17:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692318703; x=1692923503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5a7C1DLGiiVOsksie88xJqDbRtvG3wdmBLNzBO8X7s=;
 b=gkhebqgAP9s1gb378va8VAFrFdBGK66GdJ7LT2hvY96TwP30haDQaZmUFRnORI4ZEX
 llZTVOjA9SXodSkXRUKb442+cJsG0GkrqNOuCMEts43mRmMbpBlIR+lB9UcxUVoCl2Vy
 3lT/dnFhFREvjhayT6ol1wz+4TUBG2xNs+Gx4fDMLmcl9pLy6MijPk+B14WG2BEIJPrD
 6yWJQneAt8IhHtTv0z/O6ei/TLIxKFtpl4t6NwSiy3Y3BdFj7TwJvb0JoTib+ep1wtJi
 lLFv33zr+yKYf/ZhGl8/zS7x2muKZL22Yw1iyLnfKQd01q7IJnk+2fESSI4bCVae1bHw
 uI8Q==
X-Gm-Message-State: AOJu0YwvSDdTKFO7a7jfRJIDtfjItiEcgWtFhmB0j2e0T3jK3q0FGqUT
 6uoX6fYJkjeoW05K2FzwtV0zow==
X-Google-Smtp-Source: AGHT+IE0bTMAJcM1fIJX74EaYlqd0BTWDAooqz5VDioY4LSoxWqI3j3bRfGKaWyC1f9IjKNqZTrvLg==
X-Received: by 2002:a17:902:f693:b0:1b8:aded:524c with SMTP id
 l19-20020a170902f69300b001b8aded524cmr1103865plg.1.1692318702742; 
 Thu, 17 Aug 2023 17:31:42 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a17090311ca00b001b83dc8649dsm352255plh.250.2023.08.17.17.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 17:31:42 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 48B4B6DA; Thu, 17 Aug 2023 17:31:41 -0700 (PDT)
To: Buildroot mailing list <buildroot@buildroot.org>
Date: Thu, 17 Aug 2023 17:31:23 -0700
Message-Id: <20230818003124.3770152-2-mmayer@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818003124.3770152-1-mmayer@broadcom.com>
References: <20230818003124.3770152-1-mmayer@broadcom.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1692318703; x=1692923503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5a7C1DLGiiVOsksie88xJqDbRtvG3wdmBLNzBO8X7s=;
 b=PIZMo/t+PGGTHnEdxpsm/MBWBzaVFXyOBOoT2aB1wQiXqfSY562MbL9kN4tAOxle5b
 TMNxiCo7omd9kGcDW8v4F/GO0dcGcFHxgpxuM8EZqhk2LIGt0T9DeePQbjG5VGvtIV3P
 VnieUcIQ7lvRNgCyk1s5PkLZu5qAkrWYVCzMc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=PIZMo/t+
Subject: [Buildroot] [PATCH 1/2] package/util-linux: bump version to 2.39.2
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E . Morin" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/v2.39.2-ReleaseNotes

This update primarily allows util-linux to be built against older kernel
headers. It also means that a downstream patch can be eliminated, because
the changes are included in util-linux 2.39.2.

https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=c0136ac0c98b1

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 .../0001-libmount-ifdef-statx-call.patch      | 57 -------------------
 package/util-linux/util-linux.hash            |  2 +-
 package/util-linux/util-linux.mk              |  2 +-
 3 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 package/util-linux/0001-libmount-ifdef-statx-call.patch

diff --git a/package/util-linux/0001-libmount-ifdef-statx-call.patch b/package/util-linux/0001-libmount-ifdef-statx-call.patch
deleted file mode 100644
index ba44650bd3d0..000000000000
--- a/package/util-linux/0001-libmount-ifdef-statx-call.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c0136ac0c98b18208508fbcfac31a843e0bb8a37 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 3 Aug 2023 12:39:19 +0200
-Subject: [PATCH] libmount: ifdef statx() call
-
-In this case the statx() is use to get mount ID. It's optional and not
-required. Let's #ifdef the statx() call and also check for stx_mnt_id
-struct member.
-
-Fixes: https://github.com/util-linux/util-linux/issues/2415
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://github.com/util-linux/util-linux/commit/c0136ac0c98b18208508fbcfac31a843e0bb8a37
----
- configure.ac              | 5 ++++-
- libmount/src/hook_mount.c | 2 ++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a3cf330b5..ae721c7ac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -525,7 +525,10 @@ AC_CHECK_MEMBERS([struct termios.c_line],,,
-     [[#include <termios.h>]])
- 
- AC_CHECK_MEMBERS([struct stat.st_mtim.tv_nsec],,,
--	[#include <sys/stat.h>])
-+    [[#include <sys/stat.h>]])
-+
-+AC_CHECK_MEMBERS([struct statx.stx_mnt_id],,,
-+    [[#include <linux/stat.h>]])
- 
- AC_CHECK_DECLS([_NL_TIME_WEEK_1STDAY],[],[],[[#include <langinfo.h>]])
- 
-diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
-index d69a018ec..056338c49 100644
---- a/libmount/src/hook_mount.c
-+++ b/libmount/src/hook_mount.c
-@@ -294,6 +294,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
- 		/* cleanup after fail (libmount may only try the FS type) */
- 		close_sysapi_fds(api);
- 
-+#if defined(HAVE_STRUCT_STATX) && defined(HAVE_STRUCT_STATX_STX_MNT_ID)
- 	if (!rc && cxt->fs) {
- 		struct statx st;
- 
-@@ -306,6 +307,7 @@ static int hook_create_mount(struct libmnt_context *cxt,
- 				fs->id = cxt->fs->id;
- 		}
- 	}
-+#endif
- 
- done:
- 	DBG(HOOK, ul_debugobj(hs, "create FS done [rc=%d, id=%d]", rc, cxt->fs ? cxt->fs->id : -1));
--- 
-2.39.2
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 7ecd165459d7..1638cd9967b1 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
-sha256  890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b  util-linux-2.39.1.tar.xz
+sha256  87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f  util-linux-2.39.2.tar.xz
 # License files, locally calculated
 sha256  64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455  README.licensing
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0b8e3979b712..73eda5c17134 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.39
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
