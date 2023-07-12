Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD89EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A6141E95;
	Wed, 12 Jul 2023 19:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2A6141E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56wF0DFDwKXg; Wed, 12 Jul 2023 19:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 986F341F08;
	Wed, 12 Jul 2023 19:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 986F341F08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A01A1BF3BD
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F9C341E95
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F9C341E95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5LGeUDoskSw for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:37:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3B9D41899
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B9D41899
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F8E186EEA; Wed, 12 Jul 2023 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:36:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b52f1e0b0cdd7b54acb63354e12c0e61d1b122f
X-Git-Newrev: 61d2fd40082b5d4176ade9528e19d03080ab4d19
X-Patchwork-Hint: ignore
Message-Id: <20230712193702.8F8E186EEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: bump version to 4.2.8p17
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61d2fd40082b5d4176ade9528e19d03080ab4d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/NEWS

Removed patch 0003, upstream updated autogen to 5.18.16, see Changelog.

Removed patch 0004, fixed upstream:
https://bugs.ntp.org/show_bug.cgi?id=3741

Use sha256 hash provided by upstream.

Updated license hash due to upstream additions to the license
text (https://bugs.ntp.org/show_bug.cgi?id=3725) which do not affect
the license terms: copyright year updates, list of authors, etc.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 --
 package/ntp/0003-override-shell.patch              | 20 -------------
 ...ntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch | 33 ----------------------
 package/ntp/ntp.hash                               |  9 +++---
 package/ntp/ntp.mk                                 |  2 +-
 5 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c75d0f80d2..52d748fa45 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1066,8 +1066,6 @@ package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch Upstream
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
