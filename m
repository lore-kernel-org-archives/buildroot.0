Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D09C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188E4417CC;
	Fri, 11 Apr 2025 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qn39j4ukKc5m; Fri, 11 Apr 2025 10:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07449413B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07449413B3;
	Fri, 11 Apr 2025 10:44:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A4CC138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11A916F646
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULXKJmsCwhPN for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E84960640
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E84960640
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 169918439F; Fri, 11 Apr 2025 10:44:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:20 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 8fdf9ed8d27ad4436cd9ac8a0d0c27dc47a8e285
X-Git-Newrev: 42a08ee3a58aa2a9811605ee6800e7ca0e5b0a50
X-Patchwork-Hint: ignore
Message-Id: <20250411104450.169918439F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/libmodsecurity:
 bump to version 3.0.13
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42a08ee3a58aa2a9811605ee6800e7ca0e5b0a50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

For release note, see:
https://github.com/owasp-modsecurity/ModSecurity/releases/tag/v3.0.13

- Drop 0001-configure.ac-drop-usage-of-git-at-configure-time.patch
  The package originally had to be reconfigured to patch in uclinux
  support. The fix has been merged upstream [1]. We no longer need to
  reconfigure the package so we can drop this patch.

[1] https://github.com/owasp-modsecurity/ModSecurity/pull/2235

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
[Julien:
 - add link to release note
 - update .checkpackageignore to fix check-package errors
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0748e761e2962e085ecc266bd79bb7991ff71462)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  3 +-
 ...re.ac-drop-usage-of-git-at-configure-time.patch | 80 ----------------------
 ...atch => 0001-modsecurity.pc.in-add-lstdc.patch} |  0
 package/libmodsecurity/libmodsecurity.hash         |  4 +-
 package/libmodsecurity/libmodsecurity.mk           |  4 +-
 5 files changed, 4 insertions(+), 87 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bb815b6329..06052094c0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -705,8 +705,7 @@ package/libloki/0002-use-ln-snf.patch lib_patch.Upstream
 package/libmad/0001-mips-h-constraint-removal.patch lib_patch.Sob lib_patch.Upstream
 package/libmad/0002-configure-ac-automake-foreign.patch lib_patch.Upstream
 package/libmng/0001-jpeg-9a.patch lib_patch.Upstream
-package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch lib_patch.Upstream
-package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch lib_patch.Upstream
+package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch lib_patch.Upstream
 package/libmpeg2/0001-altivec.patch lib_patch.Upstream
 package/libmpeg2/0002-armv4l.patch lib_patch.Upstream
 package/libmpeg2/0003-fix-arm-detection.patch lib_patch.Upstream
diff --git a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
deleted file mode 100644
index 6853b19ccd..0000000000
--- a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From d242b011a8f0d84781bbf7667a44a12646903ca4 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 1 Aug 2021 23:21:35 +0200
-Subject: [PATCH] configure.ac: drop usage of git at configure time
-
-The usage of git is only to print some messages at configure time,
-which is not very useful, and causes a significant number of warning
-when regenerating the configure script.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
----
- configure.ac | 23 -----------------------
- 1 file changed, 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 66d6f4f2..746b1fb4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,6 @@
- 
- # Get the hash of the last commit, to be used if it is not an
- # official release.
--AC_DEFUN([MSC_GIT_HASH], m4_esyscmd_s(git log -1 --format="%h" --abbrev-commit))
- AC_DEFUN([MSC_MAJOR], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_MAJOR " | awk {'print $3'} | sed 's/\"//g'))
- AC_DEFUN([MSC_MINOR], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_MINOR " | awk {'print $3'} | sed 's/\"//g'))
- AC_DEFUN([MSC_PATCHLEVEL], m4_esyscmd_s(cat headers/modsecurity/modsecurity.h | grep "define MODSECURITY_PATCHLEVEL " | awk {'print $3'} | sed 's/\"//g'))
-@@ -25,9 +24,6 @@ m4_define([msc_version],
- m4_define([msc_version_with_patchlevel],
-     [msc_version_major.msc_version_minor.msc_version_patchlevel])
- 
--m4_define([msc_version_git],
--    [m4_esyscmd_s(git describe)])
--
- m4_define([msc_version_info],
-     [msc_version_c_plus_a:msc_version_patchlevel:msc_version_minor])
- 
-@@ -73,11 +69,6 @@ AC_MSG_ERROR([\
- 
-    ])
- fi
--# Libinjection version
--AC_DEFUN([LIBINJECTION_VERSION], m4_esyscmd_s(cd "others/libinjection" && git describe && cd ../..))
--
--# SecLang test version
--AC_DEFUN([SECLANG_TEST_VERSION], m4_esyscmd_s(cd "test/test-cases/secrules-language-tests" && git log -1 --format="%h" --abbrev-commit && cd ../../..))
- 
- 
- # Check for yajl
-@@ -224,10 +215,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
- MSC_VERSION=msc_version
- AC_SUBST([MSC_VERSION])
- 
--MSC_GIT_VERSION=msc_version_git
--AC_SUBST([MSC_GIT_VERSION])
--
--
- AC_ARG_ENABLE(debug-logs,
-     [AS_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
- 
-@@ -419,16 +406,6 @@ AC_OUTPUT
- 
- 
- # Print a fancy summary
--echo " "
--echo " "
--echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
--echo " "
--echo " Mandatory dependencies"
--AS_ECHO_N("   + libInjection                                  ....")
--echo LIBINJECTION_VERSION
--AS_ECHO_N("   + SecLang tests                                 ....")
--echo SECLANG_TEST_VERSION
--
- echo " "
- echo " Optional dependencies"
- 
--- 
-2.39.2
-
diff --git a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
similarity index 100%
rename from package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
rename to package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index dbe43d18e7..704b5541ad 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,5 +1,5 @@
-# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.12/modsecurity-v3.0.12.tar.gz.sha256
-sha256  a36118401641feef376bb469bf468abf94b7948844976a188a6fccb53390b11f  modsecurity-v3.0.12.tar.gz
+# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.13/modsecurity-v3.0.13.tar.gz.sha256
+sha256  86b4881164a161b822a49df3501e83b254323206906134bdc34a6f3338f4d3f2  modsecurity-v3.0.13.tar.gz
 
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index d8c10b98b2..f6a74e13d5 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.12
+LIBMODSECURITY_VERSION = 3.0.13
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
@@ -12,8 +12,6 @@ LIBMODSECURITY_LICENSE = Apache-2.0
 LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
-# We're patching configure.ac
-LIBMODSECURITY_AUTORECONF = YES
 
 LIBMODSECURITY_DEPENDENCIES = pcre2
 LIBMODSECURITY_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
