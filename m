Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A79C6FD19
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 09:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB724401B2;
	Fri, 10 Mar 2023 09:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB724401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LS4pgT5UK_ZK; Fri, 10 Mar 2023 09:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DB2F40165;
	Fri, 10 Mar 2023 09:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB2F40165
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64C4D1BF31A
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 09:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D9AD820F5
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 09:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9AD820F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G32KrxaAAPFJ for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 09:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A99068208E
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A99068208E
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 09:02:22 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1M89P3-1pefEm2LJr-005Lzt; Fri, 10 Mar 2023 10:02:19 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Mar 2023 10:01:53 +0100
Message-Id: <20230310090153.14053-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:mltvKy8IsAPk+8nxOh0uO5O7ZIVjpSpOTpB23kIQyjDk/azMMGA
 f55Y/N9mhF2hCLxEqYNZWlhYIP4UUKD8BC8V7vRIbRQv37RWrxxfLaoEmUB6ktxkK+CZZpT
 NcSipkEZLqlBe3vzLsJcmVw6i48qjW9+JIhbOHJArTobCRAHxx0L8rh4h6VzGPtrs1IMHr6
 xtvJd0xGHWKhEX7Rk1YhA==
UI-OutboundReport: notjunk:1;M01:P0:w6sR7c+2BPM=;xaGe7oDcgNiQMipF/9RuTBUE5cF
 eug+uYiYnEr+h/DwdjncQnAJnDFkQ06LowIifl4u9nASYNqObyY2dVmuiC7RIh2q0u5dLnpbV
 7VGpHlPLYRHsTjCse8G6UPFRnftCv5j3fMq0p5P97u11kICF213wlRpPRuXavOiLr42XeyjHT
 vUNB948aLwKkxGMFUgovxi5NfvNUikN9ViiDf9SZ2fH1ISUYaAN6rHTjRf52cx9mLjefMLMgv
 3lCjNKsh4OHqBnJRanTutWFjnWqy9fWA5ApJPRCfCe619o6Ocmo6RV7pd6G3aKaPMfMEwF2bh
 +rvSFVTL5pTQfqaoOF6SrZRFl/bX1Vu6xlefgQDEEwcwU+A8DvVdWdqg7HiKXAb/T2EuY3XSB
 NervBbmK9yL/PfqOAy1aSMZGI3SgC2sGR8T7F5hUmPKTL6Iqg69aqMdyZlgd78C2OM3rJwtGO
 RLlwQetXd4q/eAjs3MVj9jnTkpHq7feYTa5RV/6NPVi0k4CNYv4wjimMSgjiF6CiYapaJB6I6
 OblsjaR+OVSl/FSZP+C+mx0YVWH/EGKdOjh7QmyFRysE4Fn172MhRWODGSeFXusgf3uZtUl6C
 ZNKhbPxsu4fjQSoxxD+FL0mQQxATtVuXy0Wnl+RUcYtd6gShW+Q2FQmHJfxcI+sPbjVcvefuF
 Er3jcZxuhbeaKo/Z+p/a4hACYSq654WAzhLtSC/yrg==
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump to version 1.6.2
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

* Fix the license because libgit2 has been using some android code
  without attribution.
* Building in-source is accidentely broken in this release and upstream
  recommends a separate build directory anyway, so use a separate build
  directory.
* Some win32-specific declarations use wchar_t, add an upstreamed patch
  to avoid a dependency to wchar_t elsewhere.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 ...clare-win32-functions-on-non-win32-p.patch | 35 +++++++++++++++++++
 package/libgit2/libgit2.hash                  |  4 +--
 package/libgit2/libgit2.mk                    |  7 ++--
 3 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch

diff --git a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
new file mode 100644
index 0000000000..6be66ffee3
--- /dev/null
+++ b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
@@ -0,0 +1,35 @@
+From 20811c5aa9c528405eaa3f88ff22a9adebafa9e6 Mon Sep 17 00:00:00 2001
+From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+Date: Wed, 8 Mar 2023 14:00:52 +0100
+Subject: [PATCH] sysdir: Do not declare win32 functions on non-win32 platforms
+
+These declaration poses problems on some embedded or retro Linux systems
+that deliberately disable support for wchar_t from their libc.
+
+Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
+[Retrieved from:
+https://github.com/libgit2/libgit2/commit/20811c5aa9c528405eaa3f88ff22a9adebafa9e6]
+---
+ src/libgit2/sysdir.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libgit2/sysdir.h b/src/libgit2/sysdir.h
+index 1d15bbf43..03f59e1de 100644
+--- a/src/libgit2/sysdir.h
++++ b/src/libgit2/sysdir.h
+@@ -134,10 +134,12 @@ extern int git_sysdir_set(git_sysdir_t which, const char *paths);
+  */
+ extern int git_sysdir_reset(void);
+ 
++#ifdef GIT_WIN32
+ /** Sets the registry system dir to a mock; for testing.  */
+ extern int git_win32__set_registry_system_dir(const wchar_t *mock_sysdir);
+ 
+ /** Find the given system dir; for testing. */
+ extern int git_win32__find_system_dirs(git_str *out, const char *subdir);
++#endif
+ 
+ #endif
+-- 
+2.39.2
+
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index e834525df5..baf43c66f7 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7074f1e2697992b82402501182db254fe62d64877b12f6e4c64656516f4cde88  libgit2-1.5.1.tar.gz
-sha256  0fc09da43d666b5b0cf5695defc3100d5cf387936b260ebab37e396d7e0dbc83  COPYING
+sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
+sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index c962c8030f..b31f5199e1 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.5.1
+LIBGIT2_VERSION = 1.6.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
 	MIT (sha1), \
 	BSD-3-Clause (sha256), \
 	wildmatch license (wildmatch), \
-	CC0-1.0 (xoroshiro256)
+	CC0-1.0 (xoroshiro256), \
+	BSD-2-Clause (basename_r)
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_CPE_ID_VENDOR = libgit2_project
 LIBGIT2_INSTALL_STAGING = YES
@@ -24,6 +25,8 @@ LIBGIT2_CONF_OPTS = \
 	-DUSE_NTLMCLIENT=OFF \
 	-DUSE_THREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),ON,OFF)
 
+LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
+
 LIBGIT2_DEPENDENCIES = zlib libhttpparser
 
 # If libiconv is available (for !locale toolchains), then we can use
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
