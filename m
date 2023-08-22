Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AFEEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B3760F1C;
	Tue, 22 Aug 2023 19:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B3760F1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdFSNI1JtI0S; Tue, 22 Aug 2023 19:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2107260BF7;
	Tue, 22 Aug 2023 19:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2107260BF7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BED531BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9659140974
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9659140974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t8yvcHc12P8z for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:16:40 +0000 (UTC)
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A9D240896
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9D240896
Received: from localhost.localdomain ([146.241.122.243])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YWrjqB8xUaHc9YWrjqiTQA; Tue, 22 Aug 2023 21:16:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 21:16:34 +0200
Message-Id: <20230822191634.92015-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP8Op5/OY0jaIGqarZdX090xzRMrzy2VLiNsZFMVDOZHKuqQMud7e1pYELNXyRERnl1HN8QnbVHiJOv459LcL3FWM6ElsZhXKDCunYF8gES4VofhRKQO
 6NvB4MgwCRwUsAcvAysXU8vOLHho+MNefmdO7dR7yq/2Cbk4QQ1K7NVWTy2gI0vbYAm/o7N2Xcy4lUvjKRBRNwbVgS0J/nHfMTyuQ34E0v1I3v45mFA5Oqgi
 zXNsxB4GCeIqJcjys9sLEgAZgaeJ1cZ9bK0ZAbNzwYHNTOq/ZxgwVORcrYRD0V3o/5P8cC6M9qpAYGLWN4VJZzUUAEmjYKDk9dXIhmzEwfJaSQKjQYdGASP+
 8zAd3cCL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692731796; bh=8V41cnN6b04HAhXKSArwYxPqgKnI3MrjEElHObhX8ao=;
 h=From:To:Subject:Date:MIME-Version;
 b=du/SJhK9vPpJwCrEHlVaaM4YHwzPbGAOkN9F+JB9hs7dOHtl6QGP5GhgmL3vBunhZ
 Csudwc7Tfi3NvhT4OlhEqjLIytQzA8mi8FxgERbJxeOgQfuojXpioOjZpgcDuoYfJw
 KU7FNhnNFHihzwhFojFlAvz2iDNgGLqi1F+CI4Del14YEdldXo4K+hJ5lRh7nL1fkx
 +S3wdxCG3uZkNfqJmYNa6sbpdbM99B8ONk7YZTcfjXEFajXr1b37PzZAyZ0iPQQ4DD
 acd/sQqrpXmOXhEuB+jZImc2txp2RwJmqQnQ3EbGJV1ARlWVg4EmkMG0JwHEtRP/O0
 vziWVNVS/1ftA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=du/SJhK9
Subject: [Buildroot] [PATCH v2] package/libfuse3: bump to version 3.16.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patch that has been upstreamed:
https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix tarball sha256 hash
---
 ...est-applications-for-cross-compiler-.patch | 43 -------------------
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch

diff --git a/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch b/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
deleted file mode 100644
index b99b4c23f4..0000000000
--- a/package/libfuse3/0001-Wrapper-around-test-applications-for-cross-compiler-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b58a0014bff619f1810af49441d987d732c4244e Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Tue, 13 Jun 2023 20:02:01 +1000
-Subject: [PATCH] Wrapper around test applications for cross compiler
- environment in meson.build (#804)
-
-This enhances commit 7be56c57f93e3436b1fbd9ecc320de5c03a3e4b8 to allow build
-fuse to be built using a cross compiler
-
-Fixes:
-../meson.build:180:12: ERROR: Can not run test applications in this cross environment.
-
-Upstream: https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 7aa4e0d..9707ea3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -177,10 +177,12 @@ int main()
- }
- '''
- 
--result = cc.run(detect_getmntent_needs_unescape)
--if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
--  message('getmntent does not unescape')
--  add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
-+if not meson.is_cross_build()
-+  result = cc.run(detect_getmntent_needs_unescape)
-+  if result.compiled() and result.returncode() == 0 and result.stdout().strip() == 'needs escaping'
-+    message('getmntent does not unescape')
-+    add_project_arguments('-DGETMNTENT_NEEDS_UNESCAPING', language: 'c')
-+  endif
- endif
- 
- # Write private test results into fuse_config.h (stored in build directory)
--- 
-2.34.1
-
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 0397efc542..e812bb81e8 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  cb93e170288804d2e83da9b69925d968655ed75883476773ba5268d08bb1d335  libfuse3-3.15.1.tar.gz
+sha256  17c44c13f6a123c0c13d074fcf61c230a88531202a40c864187dee78f5851693  libfuse3-3.16.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 32e35ff32b..a4b1f08266 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.15.1
+LIBFUSE3_VERSION = 3.16.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
