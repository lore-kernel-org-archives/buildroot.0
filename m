Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B822C7EE29
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 17:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8FC841B77;
	Sat, 10 Jun 2023 17:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8FC841B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0g8NEMtCqiOT; Sat, 10 Jun 2023 17:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F21341D65;
	Sat, 10 Jun 2023 17:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F21341D65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC78A1BF32B
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D39D8818C2
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 17:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D39D8818C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BS7vfjNpqWA for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 17:08:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85235818D7
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85235818D7
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 17:08:44 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout02.t-online.de (Postfix) with SMTP id 9C71D52C2
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 19:08:41 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q824q-29EkE50; Sat, 10 Jun 2023 19:08:37 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57346)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q824q-0005xx-1g
 for buildroot@buildroot.org; Sat, 10 Jun 2023 19:08:36 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 19:08:36 +0200
Message-Id: <20230610170836.1084327-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686416917-61FE19E6-93138573/0/0 CLEAN NORMAL
X-TOI-MSGID: a101d864-c4fe-4f2e-8f3d-8df54a6fd705
Subject: [Buildroot] [PATCH 1/1] package/ntp: bump version to 4.2.8p17
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

Changelog: https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/NEWS

Removed patch 0003, upstream updated autogen to 5.18.16, see Changelog.

Removed patch 0004, fixed upstream:
https://bugs.ntp.org/show_bug.cgi?id=3741

Use sha256 hash provided by upstream.

Updated license hash due to upstream additions to the license text:
https://bugs.ntp.org/show_bug.cgi?id=3725

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                           |  2 --
 package/ntp/0003-override-shell.patch         | 20 -----------
 ...o-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 33 -------------------
 package/ntp/ntp.hash                          |  9 +++--
 package/ntp/ntp.mk                            |  2 +-
 5 files changed, 5 insertions(+), 61 deletions(-)
 delete mode 100644 package/ntp/0003-override-shell.patch
 delete mode 100644 package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 754a6b0be0..69b9b6720e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1083,8 +1083,6 @@ package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch Upstream
 package/nss-pam-ldapd/S45nslcd EmptyLastLine Indent Shellcheck Variables
 package/ntp/0001-nano.patch Upstream
 package/ntp/0002-ntp-syscalls-fallback.patch Upstream
-package/ntp/0003-override-shell.patch Upstream
-package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch Upstream
 package/ntp/S49ntp.in Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch Upstream
 package/ntpsec/0002-wscript-fix-build-without-stack-protector.patch Upstream
diff --git a/package/ntp/0003-override-shell.patch b/package/ntp/0003-override-shell.patch
deleted file mode 100644
index 0161e6520a..0000000000
--- a/package/ntp/0003-override-shell.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-sntp/libopts/m4/libopts.m4: allow override shell with POSIX_SHELL
-
-Pull in fix from upstream AutoGen [1] to accept POSIX_SHELL from the
-environment during the configure step.
-
-[1] http://git.savannah.gnu.org/cgit/autogen.git/commit/?id=db064b9a252f3ef3d8db25411ea0edb0ff8ea758
-
-Signed-off-by: James Byrne <james.byrne@origamienergy.com>
-
-diff --git a/sntp/libopts/m4/libopts.m4 b/sntp/libopts/m4/libopts.m4
---- a/sntp/libopts/m4/libopts.m4
-+++ b/sntp/libopts/m4/libopts.m4
-@@ -114,6 +114,7 @@
-   AC_PROG_SED
-   [while :
-   do
-+      test -x "$POSIX_SHELL" && break
-       POSIX_SHELL=`which bash`
-       test -x "$POSIX_SHELL" && break
-       POSIX_SHELL=`which dash`
diff --git a/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch b/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
deleted file mode 100644
index da03ad4aac..0000000000
--- a/package/ntp/0004-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 082a504cfcc046c3d8adaae1164268bc94e5108a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 31 Jul 2021 10:51:41 -0700
-Subject: [PATCH] libntp: Do not use PTHREAD_STACK_MIN on glibc
-
-In glibc 2.34+ PTHREAD_STACK_MIN is not a compile-time constant which
-could mean different stack sizes at runtime on different architectures
-and it also causes compile failure. Default glibc thread stack size
-or 64Kb set by ntp should be good in glibc these days.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Copied from https://github.com/openembedded/meta-openembedded/blob/master/meta-networking/recipes-support/ntp/ntp/0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch]
-Signed-off-by: Alexey Brodkin <abrokdin@synopsys.com>
----
- libntp/work_thread.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libntp/work_thread.c b/libntp/work_thread.c
-index 03a5647..3ddd751 100644
---- a/libntp/work_thread.c
-+++ b/libntp/work_thread.c
-@@ -41,7 +41,7 @@
- #ifndef THREAD_MINSTACKSIZE
- # define THREAD_MINSTACKSIZE	(64U * 1024)
- #endif
--#ifndef __sun
-+#if !defined(__sun) && !defined(__GLIBC__)
- #if defined(PTHREAD_STACK_MIN) && THREAD_MINSTACKSIZE < PTHREAD_STACK_MIN
- # undef THREAD_MINSTACKSIZE
- # define THREAD_MINSTACKSIZE PTHREAD_STACK_MIN
--- 
-2.32.0
-
diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 3c2f6a95a7..96e21bf2df 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p15.tar.gz.md5
-md5  e1e6b23d2fc75cced41801dbcd6c2561  ntp-4.2.8p15.tar.gz
-# Calculated based on the hash above
-sha256  f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19  ntp-4.2.8p15.tar.gz
-sha256  957e6a13445cc61ab1ca3dc80d8c269cf9b0a6d9eaec20f9f39639b0b3e66ee8  COPYRIGHT
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz.sha256
+sha256  103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866  ntp-4.2.8p17.tar.gz
+# Locally computed
+sha256  06246b8c15ccc1a1873c78525c810f0802e68f383e79ee041e06d1ab9cbf80a4  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 96b099d5b1..e64f6308ec 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -6,7 +6,7 @@
 
 NTP_VERSION_MAJOR = 4.2
 NTP_VERSION_MINOR = 8
-NTP_VERSION_POINT = 15
+NTP_VERSION_POINT = 17
 NTP_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)p$(NTP_VERSION_POINT)
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
