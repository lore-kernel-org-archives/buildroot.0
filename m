Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DCDC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F21A661074;
	Tue, 21 Feb 2023 00:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21A661074
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHqq5hPKV797; Tue, 21 Feb 2023 00:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1782560D58;
	Tue, 21 Feb 2023 00:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1782560D58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 216C81BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC014181F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC014181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZG6aix96pO0v for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A4441809
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43A4441809
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 328BA8648F; Mon, 20 Feb 2023 20:53:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 10:14:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98e0452ebb7cb25311d4f615e07df89a5776268b
X-Git-Newrev: 656af31891cc68eb8b27866cb9e9a7ca428a2b16
X-Patchwork-Hint: ignore
Message-Id: <20230220205300.328BA8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fluent-bit: bump to
 version 2.0.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=656af31891cc68eb8b27866cb9e9a7ca428a2b16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Release Notes:

    https://fluentbit.io/announcements/v2.0.9/

- Patch dropped, as it is upstream:

    https://github.com/fluent/fluent-bit/commit/7bcb502ebdcd647d6b83c972805e734ad522eb1a

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-CMakeLists.txt-only-require-a-C-compiler.patch | 27 ----------------------
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch b/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
deleted file mode 100644
index e71bcf0c0d..0000000000
--- a/package/fluent-bit/0001-CMakeLists.txt-only-require-a-C-compiler.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7bcb502ebdcd647d6b83c972805e734ad522eb1a Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Mon, 30 Jan 2023 09:10:37 +0100
-Subject: [PATCH] CMakeLists.txt: only require a C compiler
-
-Fluent-bit is mostly written in C,
-so don't require CXX in the top-level project.
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a7adb02de..3ff7360d8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.12)
--project(fluent-bit)
-+project(fluent-bit C)
- 
- # CMP0069 ensures that LTO is enabled for all compilers
- cmake_policy(SET CMP0069 NEW)
--- 
-2.30.2
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index ce7cea7b59..0caadcd56f 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ff5566389033669feabc9c69a5c6f417dad5c8b066454388e6a706507262acf  fluent-bit-2.0.8.tar.gz
+sha256  393ad4a6ced48c327607653d610ef273843085a17b6e5c8013877abdf31e6945  fluent-bit-2.0.9.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 13077e53cc..c10ef613d7 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.0.8
+FLUENT_BIT_VERSION = 2.0.9
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
