Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB93C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2207D40579;
	Sun, 12 Dec 2021 17:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 991HZCROwmEB; Sun, 12 Dec 2021 17:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313AC4063A;
	Sun, 12 Dec 2021 17:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D12F21BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC8FF84EDB
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cywdiKUCHip for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:45:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0144D84ED7
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:45:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id o13so23394327wrs.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 09:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+JYgqsE2BR7Vyx+oC9qUQD++tl4jUJl0W87Ki4Vh6c=;
 b=V14Z5UUg6j4hiHRMYI/vanGsTDAKxefixzqthXJ0JI6moEFX5eTXPvbu5zh5mHniq4
 YmYHvYvGvkS73H2GSmdWmcwbGGQd7vDLXQHacix7AVrzOAZb6HgNmCMoJZzwnbyJrahw
 8FQ69aVvljWO+c+CqVQOGSTrnoJYrSmlojJWRkQ44soan+d9wrNl+pNy4o+gJz/tc1wl
 Gou+MZp1Wkp/4GcyM/U49h/q8drjHH4nne6UKxPf3PJCpm3l/6EPPej3VihnPgtroyko
 zZ+lNbAW6ONQ9CV3m7tPTaMPrgEAeJlyxwOiBSv/qCZJu/XIrJBA0GGtx6VmKb7k/k5y
 qluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f+JYgqsE2BR7Vyx+oC9qUQD++tl4jUJl0W87Ki4Vh6c=;
 b=Os2nFuyReCxlsheAzfcPbMCvC6b6/ioyzfez7e3bg+B2/vqZ8qY/tTGUKXJQRJ6qGd
 IrniXu5Z/rzhdHZD+ySXI6Oo6NArk6EW3XP8Fus4LYADZrItg4Vxlmb4JKHUKw3ozXq1
 2Eq9cd3GY7SCroWInHKYRHkc6j5ALYgYSJ9rQDdW3IcYcp37cxLZ0jJdgP258xOHkDYA
 c5W/uNA4s3A4XZImEUDUBFJBT2qNkxQ4fVehuz2Ue25xEfkyJSjF/oeTvPXuS5ET71Fh
 //fjiWfzxZpKqozKseCd91ZoTFHjoiVqQkzFEGew5mg1SvRigStGVXkIIyXQV33JbVou
 Nrvw==
X-Gm-Message-State: AOAM531iFlh2U3sFrBLopRJ7ctY4bk0L8Q7riBC4LzA6v2DE21uiV7be
 zWDRoiX3SuaekK6VvUQF2W8trcKxkDeKJw==
X-Google-Smtp-Source: ABdhPJwLdzyGA/pTcPPim18Hh22h5nwCVCpgShN2qwP+RSbCzSfwGqvuGg95b4WBWqkIZtKKJvu//A==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr11765066wrm.684.1639331110004; 
 Sun, 12 Dec 2021 09:45:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id w8sm5185343wrk.112.2021.12.12.09.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 09:45:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:44:48 +0100
Message-Id: <20211212174448.667845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rp-pppoe: drop first patch
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

This patch has been added to buildroot more than eleven years ago in commit
e9ae739ce757d73657ef860e21ccc78b3d55816e however it seems that rp-pppoe
builds perfectly fine without it nowadays.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rp-pppoe/0001-krn-plugin.patch        | 27 -------------------
 ...rc-pppoe.h-fix-build-with-musl-libc.patch} |  0
 2 files changed, 27 deletions(-)
 delete mode 100644 package/rp-pppoe/0001-krn-plugin.patch
 rename package/rp-pppoe/{0002-src-pppoe.h-fix-build-with-musl-libc.patch => 0001-src-pppoe.h-fix-build-with-musl-libc.patch} (100%)

diff --git a/package/rp-pppoe/0001-krn-plugin.patch b/package/rp-pppoe/0001-krn-plugin.patch
deleted file mode 100644
index c386e85f29..0000000000
--- a/package/rp-pppoe/0001-krn-plugin.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-[Fabrice: update patch for 3.14]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-diff -Nura rp-pppoe-3.11.orig/src/configure rp-pppoe-3.11/src/configure
---- rp-pppoe-3.11.orig/src/configure	2012-08-21 10:01:10.536440032 -0300
-+++ rp-pppoe-3.11/src/configure	2012-08-21 10:01:45.353442397 -0300
-@@ -4517,7 +4517,7 @@
- modprobe pppoe > /dev/null 2>&1
- fi
- if test "$cross_compiling" = yes; then :
--  ac_cv_linux_kernel_pppoe=no; echo "cross-compiling, default: "
-+  ac_cv_linux_kernel_pppoe=yes; echo "cross-compiling, default: "
- else
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
-diff -Nura rp-pppoe-3.11.orig/src/pppoe-server.c rp-pppoe-3.11/src/pppoe-server.c
---- rp-pppoe-3.11.orig/src/pppoe-server.c	2012-08-21 10:01:10.535440032 -0300
-+++ rp-pppoe-3.11/src/pppoe-server.c	2012-08-21 10:02:02.597443569 -0300
-@@ -20,6 +20,9 @@
- 
- #include "config.h"
- 
-+/* Patched hack to make this cross compile */
-+#define HAVE_LINUX_KERNEL_PPPOE 1
-+
- #if defined(HAVE_NETPACKET_PACKET_H) || defined(HAVE_LINUX_IF_PACKET_H)
- #define _POSIX_SOURCE 1 /* For sigaction defines */
- #endif
diff --git a/package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch b/package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
similarity index 100%
rename from package/rp-pppoe/0002-src-pppoe.h-fix-build-with-musl-libc.patch
rename to package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
