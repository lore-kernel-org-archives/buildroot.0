Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621FC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 16:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF48360B1C;
	Sat, 29 Oct 2022 16:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF48360B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZ1KBZsHmXsf; Sat, 29 Oct 2022 16:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D8A60672;
	Sat, 29 Oct 2022 16:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D8A60672
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11E861BF5DC
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E154D813B6
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 16:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E154D813B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yo0JeVpUTtL1 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BBC3813B5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BBC3813B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A4E58704C; Sat, 29 Oct 2022 16:09:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 18:06:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18b5d6205db7547d633d6ac4ea8ba4fdd81ecc35
X-Git-Newrev: 3383613ad3d697001173b832c0a13257d6f7713a
X-Patchwork-Hint: ignore
Message-Id: <20221029160920.5A4E58704C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=3383613ad3d697001173b832c0a13257d6f7713a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to https.

Removed patch which was applied upstream:
https://gitlab.com/fetchmail/fetchmail/-/commit/28c476ec453fb445bf3eceeec8cce1e9822eabd2

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37721221/
https://sourceforge.net/p/fetchmail/mailman/message/37699234/
https://sourceforge.net/p/fetchmail/mailman/message/37687601/
https://sourceforge.net/p/fetchmail/mailman/message/37681775/
https://sourceforge.net/p/fetchmail/mailman/message/37645690/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ure.ac-fix-cross-compilation-with-openssl.patch | 56 ----------------------
 package/fetchmail/fetchmail.hash                   |  4 +-
 package/fetchmail/fetchmail.mk                     |  6 +--
 3 files changed, 4 insertions(+), 62 deletions(-)

diff --git a/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch b/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
deleted file mode 100644
index fff848196a..0000000000
--- a/package/fetchmail/0001-configure.ac-fix-cross-compilation-with-openssl.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 262aa59c1a7a7100e1dd4e73a6d0112d9becc701 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 1 Apr 2022 19:23:06 +0200
-Subject: [PATCH] configure.ac: fix cross-compilation with openssl
-
-Don't call AC_LIB_LINKFLAGS when the libraries are retrieved through
-pkg-config to avoid the following build failure when cross-compiling
-raised since commit 77503f545d2806d07ab83c59ed9a96f435d281da:
-
-/home/autobuild/autobuild/instance-5/output-1/host/bin/arc-buildroot-linux-gnu-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -I/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include -I/usr/kerberos/include  -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib -o fetchmail socket.o getpass.o fetchmail.o env.o idle.o options.o daemon.o driver.o transact.o sink.o smtp.o idlist.o uid.o mxget.o md5ify.o cram.o gssapi.o opie.o interface.o netrc.o unmime.o conf.o checkalias.o uid_db.o lock.o rcfile_l.o rcfile_y.o ucs/norm_charmap.o fm_realpath.o  pop3.o imap.o etrn.o odmr.o     libfm.a  strlcpy.o strlcat.o  /usr/lib/libssl.so /usr/lib/libcrypto.so
-/usr/lib/libssl.so: file not recognized: file format not recognized
-
-This build failure is raised because AC_LIB_LINKFLAGS will override the
-pkg-config target libraries by the host openssl libraries:
-
-configure: Enabling OpenSSL support in /home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr.
-configure: SSL-check: trying pkg-config for openssl
-checking for SSL... yes
-checking how to link with libssl... /usr/lib/libssl.so /usr/lib/libcrypto.so
-configure: From pkg-config: Adding /usr/lib/libssl.so /usr/lib/libcrypto.so to LIBS. LDFLAGS= -L/home/autobuild/autobuild/instance-5/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/lib -L/home/autobuild/autobuild/instance-5/output-1/host/bin/../arc-buildroot-linux-gnu/sysroot/usr/lib
-
-Fixes:
- - http://autobuild.buildroot.org/results/815f18f25017be178d478458c48712d9a8570d5a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/fetchmail/fetchmail/-/merge_requests/42]
----
- configure.ac | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bd042d51..80e5bf91 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -838,15 +838,13 @@ else
-     PKG_CHECK_MODULES([SSL],[$i],[
- 	  set -- $SSL_LIBS
- 	  while test $# -ge 1 ; do
--		  case $1 in -l*|lib*) :                     ;;
-+		  case $1 in -l*|lib*) LIBS="$LIBS $1"       ;;
- 				    *) LDFLAGS="$LDFLAGS $1" ;;
- 		  esac
- 		  shift
- 	  done
- 	  CPPFLAGS="$SSL_CFLAGS $CPPFLAGS"
--	  AC_LIB_LINKFLAGS([ssl], [crypto])
--	  AS_MESSAGE([From pkg-config: Adding $LIBSSL to LIBS. LDFLAGS=$LDFLAGS])
--	  LIBS="$LIBS $LIBSSL"
-+	  AS_MESSAGE([From pkg-config: $SSL_LIBS])
- 	  found=1
- 	  break],[: ignore-error])
-     done
--- 
-2.35.1
-
diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 5ff129b9a8..4b2cf90ed8 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37628013/
-sha256  397df984082abae51edec6831700d68636f0e117cfaffcbdd3eed66d04b97321  fetchmail-6.4.29.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37721221/
+sha256  c3bdded1b5ce236960bd1ceeee3f3257220ed99c3eec84a5d76bb5618e3258d4  fetchmail-6.4.34.tar.xz
 # Locally computed:
 sha256  6d87443b61041067a5eddb2cabf8aebff15b8b40771ad6b5e4754e607ec21b39  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 25dfcae87b..063e41b2e1 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,15 +5,13 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).29
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).34
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
-FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
+FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
 FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_CPE_ID_VENDOR = fetchmail
 FETCHMAIL_SELINUX_MODULES = fetchmail mta
-# We're patching configure.ac
-FETCHMAIL_AUTORECONF = YES
 
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
