Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A647C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:36:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9E160295
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD9E160295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB4160B08;
	Wed,  4 Aug 2021 00:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezlFbMPB2xEq; Wed,  4 Aug 2021 00:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E296F8FB;
	Wed,  4 Aug 2021 00:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEF91BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E041540F55
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmqPNN2NJ8YZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F54D40EE1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B54C083FBA; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:50:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d120f844604da2295bb7bd8fc6c1f4efbe8b5792
X-Git-Newrev: 00de2a1cced508f930b78049c1212973b16c919e
X-Patchwork-Hint: ignore
Message-Id: <20210803211017.B54C083FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fwts: bump to version
 21.05.00
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3048049155016755249=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3048049155016755249==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=00de2a1cced508f930b78049c1212973b16c919e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Update patch

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/0001-build-do-not-use-Werror.patch | 33 ++++++++++++++-----------
 package/fwts/fwts.hash                          |  2 +-
 package/fwts/fwts.mk                            |  2 +-
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
index 07f64b35b1..715c4f63a5 100644
--- a/package/fwts/0001-build-do-not-use-Werror.patch
+++ b/package/fwts/0001-build-do-not-use-Werror.patch
@@ -1,7 +1,10 @@
-From 4c202c0fd7e5bd3264c720d715f05573047d9cf5 Mon Sep 17 00:00:00 2001
+From e481c2f990ffa71f205d4b9daf0823e71269a7f3 Mon Sep 17 00:00:00 2001
 From: Erico Nunes <nunes.erico@gmail.com>
 Date: Fri, 12 Aug 2016 23:11:56 +0200
 Subject: [PATCH] fwts: do not use -Werror
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Warnings come and go with various compiler versions, so using -Werror is
 prone to cause build failures with various compiler versions, especially
@@ -12,6 +15,8 @@ Remove use of -Werror.
 Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 [Fabrice: updated for 20.08.00]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Vincent: rebased onto V21.05.00]
+Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
 ---
  configure.ac              | 2 +-
  src/Makefile.am           | 2 +-
@@ -20,7 +25,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0109d644..3ca599e1 100644
+index f40c3678..0ff5025b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,5 +1,5 @@
@@ -31,12 +36,12 @@ index 0109d644..3ca599e1 100644
  	  AC_CANONICAL_HOST
  	  AC_CONFIG_MACRO_DIR([m4])
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 52c637dd..d9d73f1c 100644
+index cdabb386..7c2e5730 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -14,7 +14,7 @@ AM_CPPFLAGS = \
- 	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c` \
+@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
+ 	-I$(top_srcdir)/efi_runtime			\
  	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
@@ -44,10 +49,10 @@ index 52c637dd..d9d73f1c 100644
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
 diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 54de7f44..e129ed16 100644
+index 55c52b41..50efa97a 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
-@@ -24,7 +24,7 @@ AM_CPPFLAGS = \
+@@ -25,7 +25,7 @@ AM_CPPFLAGS = \
  	`pkg-config --silence-errors --cflags json-c`	\
  	`pkg-config --cflags glib-2.0 gio-2.0` 		\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
@@ -57,18 +62,18 @@ index 54de7f44..e129ed16 100644
  
  pkglib_LTLIBRARIES = libfwts.la
 diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index aa37de55..4d5297cc 100644
+index 1fc0fc02..53614e33 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
  # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  #
  
--AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
-+AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
- 	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c`
+-AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
++AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
+ 	-I$(srcdir)/../lib/include
  
+ bin_PROGRAMS = kernelscan
 -- 
-2.17.1
+2.30.2
 
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 916035bda6..fc79a0b812 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  02160657383a918a48c946a0ffb72c047d19a46f1455c29c0fff4d9ef7e48680  fwts-V21.02.00.tar.gz
+sha256  e2d6e8b0704eba859a567fb8764e5dc5385793fc26bd00ecc70e7af03fd2568d  fwts-V21.05.00.tar.gz
 
 # Hash for license file
 sha256  2003f5c8a1e40d7882f1499bd7adb7bc748c9656851abb28647a3d297c2e8e23  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index eaff7b786b..402a9e0b8f 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 21.02.00
+FWTS_VERSION = 21.05.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0

--===============3048049155016755249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3048049155016755249==--
