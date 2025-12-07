Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F05D3B7E8
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C076940678;
	Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWT-2GVGgiru; Sun,  7 Dec 2025 16:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B1A4067B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765123353;
	bh=kmREtPPdO5Qa/wcZq1Ao8vY1tT/G0KZIWTL/BupVx/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jIYYFTwu5uJ1V2tqyRj+8wbeuUxzRiTF3unjlYlUiaOu9xj0bSRJutXIVrLyBTrgw
	 CsOW+GXzeDGGOfmrihcVFxw4dQs2tcBNWJXa8CJJHnhu6dxO72l60ztGz4gAq3Xkvs
	 dkRc7XKnsHWPEx/Av9i5OQAI9CV7zvrjsFAPNfY0M9mJT8dfr5NJqisjzlRVzCWPZI
	 jcd6qytiZRT15w4t2gpIEuFxOFpuGisedV9UfBJJCzWNHJp2vj4d4hXQBuJVl90+ZS
	 2q+6yzoa9CICPoD3IkqOBS7A7SByp77md894fR5KuIWr76vw4h/xoBjyCnqcPMcfrA
	 ovixl4dDH28Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B1A4067B;
	Sun,  7 Dec 2025 16:02:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA46A151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DAC340669
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIA30d6Su3OE for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09FCB4063C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09FCB4063C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:02:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0133386715; Sun,  7 Dec 2025 16:02:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 14:15:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ed35083dc9611e5f93a3ece5c322e966015f5dc
X-Git-Newrev: cf82c2e0540511a7b40602da283eab5a3eacd220
X-Patchwork-Hint: ignore
Message-Id: <20251207160225.0133386715@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/azure-iot-sdk-c: fix
 cmake 4 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf82c2e0540511a7b40602da283eab5a3eacd220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ump-cmake-version-and-update-dependencies.patch | 30 ++++++++++++++++++++++
 ...ump-cmake-version-and-update-dependencies.patch | 30 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch b/package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch
new file mode 100644
index 0000000000..7cef575532
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-Bump-cmake-version-and-update-dependencies.patch
@@ -0,0 +1,30 @@
+From 1a9a5fd688d811ca7300edccbdfc623fdaa1b8dc Mon Sep 17 00:00:00 2001
+From: Dan Cristoloveanu <dcristo@microsoft.com>
+Date: Wed, 27 Jan 2021 12:59:18 -0800
+Subject: [PATCH] Bump cmake version and update dependencies (#65)
+
+* Bump cmake version to 3.18
+
+Upstream: https://github.com/Azure/macro-utils-c/commit/1a9a5fd688d811ca7300edccbdfc623fdaa1b8dc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to LTS_03_2025]
+---
+ deps/azure-macro-utils-c/CMakeLists.txt     | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 29b3416..3b82d4e 100644
+--- a/deps/azure-macro-utils-c/CMakeLists.txt
++++ b/deps/azure-macro-utils-c/CMakeLists.txt
+@@ -1,7 +1,9 @@
+ #Copyright (c) Microsoft. All rights reserved.
+ #Licensed under the MIT license. See LICENSE file in the project root for full license information.
+ 
+-cmake_minimum_required(VERSION 2.8.11)
++if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION)
++    cmake_minimum_required(VERSION 3.18)
++endif()
+ 
+ if(TARGET azure_macro_utils_c)
+     return()
diff --git a/package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch b/package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch
new file mode 100644
index 0000000000..c1076d70be
--- /dev/null
+++ b/package/azure-iot-sdk-c/0002-Bump-cmake-version-and-update-dependencies.patch
@@ -0,0 +1,30 @@
+From 02ed1852d45fda6994748118bab129e5d2527c0f Mon Sep 17 00:00:00 2001
+From: Dan Cristoloveanu <dcristo@microsoft.com>
+Date: Wed, 27 Jan 2021 21:35:21 -0800
+Subject: [PATCH] Bump cmake version (#189)
+
+* Bump version for cmake
+
+Upstream: https://github.com/Azure/umock-c/commit/02ed1852d45fda6994748118bab129e5d2527c0f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to LTS_03_2025]
+---
+ deps/umock-c/CMakeLists.txt | 5 ++++-
+ 1 files change, 13 insertions(+), 74 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f1a7a9f4..fc479cac 100644
+--- a/deps/umock-c/CMakeLists.txt
++++ b/deps/umock-c/CMakeLists.txt
+@@ -1,7 +1,9 @@
+ #Copyright (c) Microsoft. All rights reserved.
+ #Licensed under the MIT license. See LICENSE file in the project root for full license information.
+ 
+-cmake_minimum_required(VERSION 2.8.11)
++if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION)
++    cmake_minimum_required(VERSION 3.18)
++endif()
+ 
+ if(TARGET umock_c)
+     return()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
