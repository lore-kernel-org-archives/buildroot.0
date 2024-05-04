Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A5C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8F241EF6;
	Sat,  4 May 2024 21:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgTj7Ov06I9n; Sat,  4 May 2024 21:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA6841EFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CA6841EFA;
	Sat,  4 May 2024 21:41:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1B161BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2037404EC
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrAoU6JbKG7T for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DED54041C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DED54041C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DED54041C
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b79450f78so5376885e9.2
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858835; x=1715463635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MoldEglXlre5NeeqAx0fOzVRrwsYDKOTqeZ56C8Y5YI=;
 b=Xpeor7N/PnlUPXBooDlf6yoSJxrDeAAKG6rD8RZvEEtJ1ff58VWmKkRwFl6eGagzpz
 81/Ck4XrYRnz7fIifdTG3tnPULm4P1nB1dMzd6rWX2r8NmaRIu9YfjcZluasEh8B2T/r
 43HH/wMBr8RtTaRC+HjDSQ+sDok7ULSAtOICFfN+MMd2u6sFXBLdbo1kqKlrXYc0d+nc
 nLVjUM0FJ4oAK+m0Ygl0ZJc5ktiLRjH5P4hE9FslIaxAn4iWYK2rtQxVSW0qsa6D3wzY
 ADtoI++KKOAoo6Eq9Xjg+zOUOLaXLInQlAQDcmR7Xl2ZJbNOO9+nU5zmlau4kG5MMvKz
 P4dg==
X-Gm-Message-State: AOJu0YzXof+EYSLCLkZEy4MS9kV0D/WtJecieA80p2VtGA/i7ZWeZHHg
 2fAypv/zSCVOblPWT6O4Ore9a1pxLelJV83hZJv1BrYZezKAf0OIC/JdJg==
X-Google-Smtp-Source: AGHT+IFc5tEkeZ3fr75RpGmjQAgFKoIIVS8czXDRM6gRDR1cKFD4vX49QOTPN6Qg35DiJIluwLJNkg==
X-Received: by 2002:a05:600c:46c7:b0:418:e5b5:a079 with SMTP id
 q7-20020a05600c46c700b00418e5b5a079mr5489508wmo.10.1714858834709; 
 Sat, 04 May 2024 14:40:34 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:34 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:17 +0200
Message-ID: <a6daed1061c2ec3e3adb89e7585ed5c0270764e6.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858835; x=1715463635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoldEglXlre5NeeqAx0fOzVRrwsYDKOTqeZ56C8Y5YI=;
 b=VogpMJSZ6H7F87K8m8V3Bon/Y5+fcy9mS9nsoEJS8YZIaGZtRtGEKuCb4nf2/qPvLr
 nD9JEXiVRpaBXVZ+Huld7wQoFI/6syKh+Q2myNs+0OyKiJQYhWL10loQalVY2blV27D9
 opDpMBdDsQdRp2sp0Ht6jQs3UIXkyJYlxDtEFa759G3ArDcU7YLCePljTm4iUQjLcPz9
 B9/USyFivz5KxNKIyfovQtIDz3Wff8L9dKTYQ94QLh+W+JP8ta4QL9+kLCSznkbw76zI
 01BAMYrFvf9KX4AwjTV0ByUwZxkrVhuzNIU3R9ALdHavPpiEjf02xkpwKGrU6oGMdj1m
 xMSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VogpMJSZ
Subject: [Buildroot] [PATCH 16/22 v3] package/tar: security bump to version
 1.35
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Fix CVE-2022-48303: GNU Tar through 1.34 has a one-byte out-of-bounds
read that results in use of uninitialized memory for a conditional
jump. Exploitation to change the flow of control has not been
demonstrated. The issue occurs in from_header in list.c via a V7
archive in which mtime has approximately 11 whitespace characters.

With the bump to 1.35, the build will fail on systems that are not
Y2038, such as some uClibc configurations.

In order to preserve the previous behavior, pass --disable-year2038.
See the gnulib documentation for details [1]. Contrary to what the
option name might suggest, it doesn't really disable Y2038 support,
but only the check that the system is Y2038 compliant. So even with
--disable-year2038, if the system is Y2038 compliant (uses a 64-bit
arch, uses the musl C library, or uses the glibc C library with
BR2_TIME_BITS_64=y), tar will be Y2038 compliant.

Update hash of COPYING (http replaced by https)

[0] https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00005.html
[1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html

For the version bump:

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4d483451f0a305781b94b96c15a6cf4b489cd84)
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

For the Y2038 fix:

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7f1088f9cae9f191740423a0084bb31f94af2e75)
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...oundary-checking-in-base-256-decoder.patch | 33 -------------------
 package/tar/tar.hash                          |  6 ++--
 package/tar/tar.mk                            | 16 +++++----
 3 files changed, 13 insertions(+), 42 deletions(-)
 delete mode 100644 package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch

diff --git a/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch b/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
deleted file mode 100644
index 7bad339fe0..0000000000
--- a/package/tar/0002-Fix-boundary-checking-in-base-256-decoder.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 11 Feb 2023 11:57:39 +0200
-Subject: [PATCH] Fix boundary checking in base-256 decoder
-
-* src/list.c (from_header): Base-256 encoding is at least 2 bytes
-long.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-Upstream: https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
----
- src/list.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/list.c b/src/list.c
-index 9fafc425..86bcfdd1 100644
---- a/src/list.c
-+++ b/src/list.c
-@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
- 	  where++;
- 	}
-     }
--  else if (*where == '\200' /* positive base-256 */
--	   || *where == '\377' /* negative base-256 */)
-+  else if (where <= lim - 2
-+	   && (*where == '\200' /* positive base-256 */
-+	       || *where == '\377' /* negative base-256 */))
-     {
-       /* Parse base-256 output.  A nonnegative number N is
- 	 represented as (256**DIGS)/2 + N; a negative number -N is
--- 
-2.39.2
-
diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 1914a9f3b4..108a95ee62 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
-sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  4d62ff37342ec7aed748535323930c7cf94acf71c3591882b26a7ea50f3edc16  tar-1.35.tar.xz
+sha256  c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d  tar-1.35.cpio.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index d57d63970d..a7e85afb72 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,20 +4,24 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.34
+TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
-# busybox installs in /bin, so we need tar to install as well in /bin
-# so that we don't end up with two different tar
-TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
 TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
-# 0002-Fix-boundary-checking-in-base-256-decoder.patch
-TAR_IGNORE_CVES += CVE-2022-48303
+# busybox installs in /bin, so we need tar to install as well in /bin
+# so that we don't end up with two different tar
+#
+# --disable-year2038: tells the configure script to not abort if the
+# system is not Y2038 compliant. tar will support year2038 if the
+# system is compliant even with this option passed
+TAR_CONF_OPTS = \
+	--exec-prefix=/ \
+	--disable-year2038
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
