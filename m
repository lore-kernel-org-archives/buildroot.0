Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88B0C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 08:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3638440E46;
	Mon, 27 Mar 2023 08:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3638440E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27Cd_5pY5Yxp; Mon, 27 Mar 2023 08:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 040C240F4E;
	Mon, 27 Mar 2023 08:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 040C240F4E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 353BD1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 08:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C74060F65
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 08:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C74060F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stLPowCE_4p5 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 08:24:06 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83AD760FEA
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83AD760FEA
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 08:24:05 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1Mq2vS-1qCDNw0xJi-00n6DD; Mon, 27 Mar 2023 10:18:58 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 10:18:24 +0200
Message-Id: <20230327081824.7259-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:5bL8qX0ULlyBqo8nXbZETH0kMaheO5YSdtvOtHwBojGH6TQkxk8
 yj9N9NcJpwvEoHiuhbsv1Im8IX9PgYgDApvSBBGTyHxDtHm7NAfrP1qllcKdBOegp5OSkjW
 TfiW8maRrUNRYdyd6Hz+0QEcaKPbFOnqOVsKoyqsdEedRo4zQrAKBO7krSTBgvjpaq3jht5
 vIe3cmmGZLjpoi/4eic+g==
UI-OutboundReport: notjunk:1;M01:P0:kJcEW6L8jSw=;/kX35KhwX4ARKnt5Lu8KDgn57OM
 j4I+9FvJrHiDR+clcG6/2zRDhnjdoiKojYgKjeKg2r3hztViHxariYvQ7x1Oksu4BeQ2VcmBM
 qL9AkGgAS1KAylH2vlbe1AYu/ojEcaWWFPiuPCLlYXdaNVkepSvg1+je83B2pLg92H3dy4iEw
 8a8g4RjINgn4PTSjrFy6Y1zm+AfmVymWK5UnrXiN7oAQsY44KrOOWrmS4CGwJKGKoM6TF1zHA
 52KkBvDAuBa9hme3eMA2P7Ys5ixIPpAxkDTx5XGzLBoMc5vkL4iNNpwwMxgXf1+zix7hS1iiC
 cFAf9ImxjfV2bpLiun2jNT2yQ8i2eI3Kg+Td0DLIJHcKail4JoC7IMJ0c1lYi8t2kK4d0FvUG
 0n8A270Z2ed4f45IP1TzF2XBAPfCLclDKbzbCSMrWooGi3an49s7ONPlTIRXlCXys4DoGA9yk
 yKNsqtiOCOXtAXuDxZWdR4j9VfLul5LjyATEA39Lp8FLcYSrxn5JkCp4z55Jq2WMz9Yr65U+f
 FwbWe/zRWaV4gPafoV7tNroZYDGVhZH3xGwY/WjmNqR8HYem3mEoXRthEMFh7FurK9nZ8TTjG
 9UN/h4SH2jtZpIBb8z4SXuk00N+j79L1Oz/MsAuPqTMyBFid7+76X1oldi5hT4kRP986mtAKI
 cz2nI4/f/RrPueSp06dyu/XFq+MKOvCm1KQMqTwjMw==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.6.3
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

* Remove patch applied upstream.
* Upstream fixed building inside the source tree, but still does not
  recommend it, so keep LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 ...clare-win32-functions-on-non-win32-p.patch | 35 -------------------
 package/libgit2/libgit2.hash                  |  2 +-
 package/libgit2/libgit2.mk                    |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch

diff --git a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
deleted file mode 100644
index 6be66ffee3..0000000000
--- a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 20811c5aa9c528405eaa3f88ff22a9adebafa9e6 Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Wed, 8 Mar 2023 14:00:52 +0100
-Subject: [PATCH] sysdir: Do not declare win32 functions on non-win32 platforms
-
-These declaration poses problems on some embedded or retro Linux systems
-that deliberately disable support for wchar_t from their libc.
-
-Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-[Retrieved from:
-https://github.com/libgit2/libgit2/commit/20811c5aa9c528405eaa3f88ff22a9adebafa9e6]
----
- src/libgit2/sysdir.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/libgit2/sysdir.h b/src/libgit2/sysdir.h
-index 1d15bbf43..03f59e1de 100644
---- a/src/libgit2/sysdir.h
-+++ b/src/libgit2/sysdir.h
-@@ -134,10 +134,12 @@ extern int git_sysdir_set(git_sysdir_t which, const char *paths);
-  */
- extern int git_sysdir_reset(void);
- 
-+#ifdef GIT_WIN32
- /** Sets the registry system dir to a mock; for testing.  */
- extern int git_win32__set_registry_system_dir(const wchar_t *mock_sysdir);
- 
- /** Find the given system dir; for testing. */
- extern int git_win32__find_system_dirs(git_str *out, const char *subdir);
-+#endif
- 
- #endif
--- 
-2.39.2
-
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index baf43c66f7..a2bbf23d59 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
+sha256  a8e2a09835eabb24ace2fd597a78af182e1e199a894e99a90e4c87c849fcd9c4  libgit2-1.6.2.tar.gz
 sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index b31f5199e1..11f04042de 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.6.2
+LIBGIT2_VERSION = 1.6.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
