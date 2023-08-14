Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C081EC04FE0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 14:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41ECD61080;
	Mon, 14 Aug 2023 14:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41ECD61080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmd7YrDv652k; Mon, 14 Aug 2023 14:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 773AA6107D;
	Mon, 14 Aug 2023 14:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773AA6107D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7D971BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1121403E0
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 14:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1121403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pc7bZGfmcx9 for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 14:54:19 +0000 (UTC)
Received: from smtpcmd02113.aruba.it (smtpcmd02113.aruba.it [62.149.158.113])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC321402CE
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 14:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC321402CE
Received: from localhost.localdomain ([95.47.160.93])
 by Aruba Outgoing Smtp  with ESMTPSA
 id VYxSqALT31pHiVYxTqFv8X; Mon, 14 Aug 2023 16:54:16 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 16:54:13 +0200
Message-Id: <20230814145413.2099039-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKcxMj7qyCIpo2WMbBUf0d8efeqe6D2Kcr5FUCb8ZQ/G3f8e+kxDoyzqc8t+p8+tHfLK8PR2cX7luCHRiqW4igUX+E0gEWReFUvGoUo8FyIotnbdYY4P
 FAFkLGuY+vmHRaEuICSLak0CnF6S+nlS22VWvNUoUFTaVo4A6Xw8FzWywbuvz1D3b7dpyrI1tkyqx5aNKSF/xr6lfyZT8c9mqAVcElm5elpTM6HdGHVQPQ3Y
 wocQRjUSA4mPIbYIqtAO1/CgeCHpUnxw5xEyOakXsPEdE83gvm32e9xUAbTqiOQONJMXOGplflzggF73yeTkwA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1692024856; bh=ybdh80SSE7IjuoA3Dc+VhxR2OqgIYyH6+LnvKystDdM=;
 h=From:To:Subject:Date:MIME-Version;
 b=MBm29G7GRcnKDFmsjz7L2YeTGhjjf9SVZqhQrerYCEvpDJ0xkqW6LkJJJ2rx9HUhL
 9ZTDJONedtXgCct3ke2boqX0YHU8gt3AUpFBFHmb1iuxjmuCuXZ1e7UkwfqU4d8AeF
 uXY9lIRaluFLpFCDj33cLyEvbpvsxkFrSFFceWVt8BWk5sOes3b1+gfEwWyZVwtMEq
 +gXRngXPM4e5fYh5fhXO77lFwOeqRh3KGf/MR0BMyI9L999016YWmXOxOV2QI7IC51
 GBM625zZPcGsZBxKjptW8ITO6UPrzxzIgAs/zSFP3l9XetKIN5w4LEoKfeZ6jYMhwA
 0REh0Gu0gpCTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=MBm29G7G
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.16.1
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patch that has been upstreamed:
https://github.com/libfuse/libfuse/commit/b58a0014bff619f1810af49441d987d732c4244e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
index 0397efc542..cd990a6991 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  cb93e170288804d2e83da9b69925d968655ed75883476773ba5268d08bb1d335  libfuse3-3.15.1.tar.gz
+sha256  75a7140ce2d4589eda2784d2279be9d2b273a9b6b0f79ecb871dc4dded046fb5  libfuse3-3.16.1.tar.gz
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
