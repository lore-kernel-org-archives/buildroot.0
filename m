Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03463C43217
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989E561037;
	Thu,  6 Oct 2022 19:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989E561037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-vkQ0Z_Q0kd; Thu,  6 Oct 2022 19:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A90286107A;
	Thu,  6 Oct 2022 19:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90286107A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 424B01BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 710C4610C2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 710C4610C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQV2rh6txp_j for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C6F2610BF
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C6F2610BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45FB18699F; Thu,  6 Oct 2022 19:04:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 20:53:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d33c87b87372fc162c69be4fb96c4038dbc31c52
X-Git-Newrev: d1ed333dfe9c859645a44a5d9c909a8692bb8015
X-Patchwork-Hint: ignore
Message-Id: <20221006190452.45FB18699F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grep: bump to version 3.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1ed333dfe9c859645a44a5d9c909a8692bb8015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Updated to the new PCRE2 dependency
* Removed unneeded patches (file m4/stack-direction.m4 is not there)
* Removed autoreconf step because unnecessary after not patching m4
  anymore

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-sigsegv-fix-build-on-microblazeel.patch   | 32 ----------------------
 package/grep/0002-sigsegv-fix-build-on-or1k.patch  | 32 ----------------------
 package/grep/grep.hash                             |  4 +--
 package/grep/grep.mk                               |  8 ++----
 4 files changed, 5 insertions(+), 71 deletions(-)

diff --git a/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch b/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
deleted file mode 100644
index 06869b716e..0000000000
--- a/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3079cea1b18fe72aa1da6b04e561abfb36f4f443 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Nov 2021 09:57:23 +0100
-Subject: sigsegv: fix build on microblazeel
-
-Fix the following build failure on microblazeel with diffutils 3.8:
-sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
-http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=3079cea1b18fe72aa1da6b04e561abfb36f4f443]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- m4/stack-direction.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index c90d69733..70286c8f5 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       m68* | \
-       m88k | \
-       mcore | \
--      microblaze | \
-+      microblaze* | \
-       mips* | \
-       mmix | \
-       mn10200 | \
--- 
-cgit v1.2.1
-
diff --git a/package/grep/0002-sigsegv-fix-build-on-or1k.patch b/package/grep/0002-sigsegv-fix-build-on-or1k.patch
deleted file mode 100644
index 73385fe9f7..0000000000
--- a/package/grep/0002-sigsegv-fix-build-on-or1k.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 11 Nov 2021 10:06:31 +0100
-Subject: sigsegv: fix build on or1k
-
-Fix the following build failure on or1k with diffutils 3.8
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
-sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
-http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
-
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- m4/stack-direction.m4 | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 70286c8f5..29e398d77 100644
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
-       nios2 | \
-       nds32* | \
-       ns32k | \
-+      or1k | \
-       pdp11 | \
-       pj* | \
-       powerpc* | rs6000 | \
--- 
-cgit v1.2.1
-
diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 29d9eb1cd6..6f3bca89ad 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz.sig
+# http://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c  grep-3.7.tar.xz
+sha256  498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382  grep-3.8.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index a485f23dc7..318e00940d 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.7
+GREP_VERSION = 3.8
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CPE_ID_VENDOR = gnu
-# We're patching m4/stack-direction.m4
-GREP_AUTORECONF = YES
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # install into /bin like busybox grep
 GREP_CONF_OPTS = --exec-prefix=/
@@ -40,9 +38,9 @@ GREP_DEPENDENCIES += libiconv
 endif
 
 # link with pcre if enabled
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
 GREP_CONF_OPTS += --enable-perl-regexp
-GREP_DEPENDENCIES += pcre
+GREP_DEPENDENCIES += pcre2
 else
 GREP_CONF_OPTS += --disable-perl-regexp
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
