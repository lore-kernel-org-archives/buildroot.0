Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77068C3065A
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 428F58128F;
	Sun, 30 Jun 2024 14:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-jbEh4g6c-C; Sun, 30 Jun 2024 14:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A4180F14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A4180F14;
	Sun, 30 Jun 2024 14:49:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A35CD1BF976
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FD5560635
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8kZvw7iYn42 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B5E60633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99B5E60633
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:49:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 490F6805E8; Sun, 30 Jun 2024 14:49:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 16:47:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93868c35e9829c13083fd7e954ac7e4909925758
X-Git-Newrev: 53bda6d12f073f6afce35a516b84c1f8d3d272ad
X-Patchwork-Hint: ignore
Message-Id: <20240630144911.490F6805E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump version to 1.11.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53bda6d12f073f6afce35a516b84c1f8d3d272ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=blob;f=NEWS
https://dev.gnupg.org/T7166

Rebased patch.

Updated license hash due to update of FSF address and whitespace changes
in upstream commit:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commitdiff;h=2538430a35b02b9ac002a84930650bf4767fc473

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-configure.ac-add-an-option-to-disable-tests.patch        | 8 +++++---
 package/libgcrypt/libgcrypt.hash                                  | 6 +++---
 package/libgcrypt/libgcrypt.mk                                    | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
index 5ddde9df1b..bc0f9ebe7f 100644
--- a/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
+++ b/package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch
@@ -15,6 +15,8 @@ Fixes:
  - http://autobuild.buildroot.org/results/50a8ba572e3fafd3c6a39bd54bcfcaf78b5ad325
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for version 1.11.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am  |  7 ++++++-
  configure.ac | 10 ++++++++++
@@ -38,13 +40,13 @@ index 7fa4fa4d..f0bd90e4 100644
 -SUBDIRS =         compat mpi cipher random src $(doc) tests
 +SUBDIRS =         compat mpi cipher random src $(doc) $(tests)
  
- EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES      	           \
-              ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011    \
+ EXTRA_DIST = autogen.sh autogen.rc README.GIT LICENSES			   \
+ 	     ChangeLog-2011 build-aux/ChangeLog-2011 doc/ChangeLog-2011	   \
 diff --git a/configure.ac b/configure.ac
 index e8c8cd39..1a6b61e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3231,6 +3231,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
+@@ -3777,6 +3777,16 @@ AC_ARG_ENABLE([doc], AC_HELP_STRING([--disable-doc],
  AM_CONDITIONAL([BUILD_DOC], [test "x$build_doc" != xno])
  
  
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index ffe30e1455..ced8087ca9 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  359e1d01ad2eb9cd2db964ea96ef3712d0c2c649  libgcrypt-1.10.3.tar.bz2
-sha256  8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa  libgcrypt-1.10.3.tar.bz2
+sha1  dd2c68e0685bb99249efeeb06046fae15b5214ba  libgcrypt-1.11.0.tar.bz2
+sha256  09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c  libgcrypt-1.11.0.tar.bz2
 # Locally calculated
-sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 2e4bf7448e..7a68a95c98 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.10.3
+LIBGCRYPT_VERSION = 1.11.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
