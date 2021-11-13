Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198C9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 10:19:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7959610A1
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 10:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7959610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8898F8261C;
	Sat, 13 Nov 2021 10:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHhlpneNQj64; Sat, 13 Nov 2021 10:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79CA81C18;
	Sat, 13 Nov 2021 10:19:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE2871BF2F0
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 10:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8F194013B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 10:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBYGCin6OHQW for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 10:19:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C42CB4000B
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:19:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1501D89103; Sat, 13 Nov 2021 10:15:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 11:19:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 695fd9bf72d0257d2754af5436e6225c3c32ef88
X-Git-Newrev: 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f
X-Patchwork-Hint: ignore
Message-Id: <20211113101518.1501D89103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sg3_utils: bump to version 1.47
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

commit: https://git.buildroot.net/buildroot/commit/?id=710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so autoreconf
- Update hash of COPYING (upodate in date and author's email:
  https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675)
- Fix the following build failure raised on musl since bump to version
  1.46 in commit a00ed30780819c72174ae959bdd6f15ed961e938:

sg_dd.c: At top level:
sg_dd.c:179:28: error: storage size of 'drand' isn't known
  179 | static struct drand48_data drand;/* opaque, used by srand48_r and mrand48_r */
      |                            ^~~~~

https://github.com/doug-gilbert/sg3_utils/blob/r1.47/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/adc20fd52052daadfe1f16ee3f62c30e518cbd16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sg3_utils/0001-support-uclinux-as-a-linux.patch | 16 ----------------
 package/sg3_utils/sg3_utils.hash                        |  4 ++--
 package/sg3_utils/sg3_utils.mk                          |  5 +----
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
deleted file mode 100644
index d9106cd9f8..0000000000
--- a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Recognise uclinux as a linux
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN sg3_utils-1.42.orig/configure.ac sg3_utils-1.42/configure.ac
---- sg3_utils-1.42.orig/configure.ac	2015-10-21 01:10:59.000000000 +0200
-+++ sg3_utils-1.42/configure.ac	2016-08-14 19:30:37.841766149 +0200
-@@ -71,7 +71,7 @@
- 
- # Define platform-specific symbol.
- AM_CONDITIONAL(OS_FREEBSD, [echo $host_os | grep 'freebsd' > /dev/null])
--AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep '^linux' > /dev/null])
-+AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep -E '^(uc)?linux' > /dev/null])
- AM_CONDITIONAL(OS_OSF, [echo $host_os | grep '^osf' > /dev/null])
- AM_CONDITIONAL(OS_SOLARIS, [echo $host_os | grep '^solaris' > /dev/null])
- AM_CONDITIONAL(OS_WIN32_MINGW, [echo $host_os | grep '^mingw' > /dev/null])
diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index 39510b4dc2..ff2ef55180 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256  59c268b10b93ce31a517af13e19c88f285c12b7dd065f50e36b16a7b6fa7b9a0  sg3_utils-1.46.tar.xz
+sha256  ddb0cab85fedd8b0db020f3e3f02f6967a055616bf16ea9d5c7408cde41472b2  sg3_utils-1.47.tar.xz
 
 # Hash for license files
-sha256  256ec2d7e4e79faabb105ed1ddf32aec11d830c3dadb955a4ab2616eb87439ba  COPYING
+sha256  d212debdb0a5d7754c977f6dc53bb6c88b4ace7ab784ddbccd06bb970adb1a37  COPYING
 sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 1983a12261..055f7befb9 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.46
+SG3_UTILS_VERSION = 1.47
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-2-Clause (library)
@@ -14,9 +14,6 @@ SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
-# Patching configure.ac/Makefile.am
-SG3_UTILS_AUTORECONF = YES
-
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
