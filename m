Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA9C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4BB2846CC;
	Sun, 17 Jul 2022 07:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4BB2846CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-CeC7j2kJjB; Sun, 17 Jul 2022 07:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8383846A1;
	Sun, 17 Jul 2022 07:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8383846A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBD01BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76B3340A14
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76B3340A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SGuMHqtrNdJu for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A03A40A0D
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A03A40A0D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CDB4483904; Sun, 17 Jul 2022 07:06:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:19:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f121357ae225be9ac2fbf4505027c2cc690626b
X-Git-Newrev: 1af0f9d255b78a45d6a68b1db0dcfef589988389
X-Patchwork-Hint: ignore
Message-Id: <20220717070652.CDB4483904@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: bump to version 1.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=1af0f9d255b78a45d6a68b1db0dcfef589988389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://dev.gnupg.org/T5352
https://dev.gnupg.org/T5676
https://dev.gnupg.org/T5802

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...eneration-of-lock-obj-pub.native.h-for-cr.patch | 34 -------------------
 .../0002-build-Fix-disable-threads.patch           | 39 ----------------------
 package/libgpg-error/libgpg-error.hash             |  8 ++---
 package/libgpg-error/libgpg-error.mk               |  2 +-
 4 files changed, 5 insertions(+), 78 deletions(-)

diff --git a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
deleted file mode 100644
index 621f070ee2..0000000000
--- a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7350874f6f62314af4c8ec1973c91d305a6f4ddc Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Fri, 26 Mar 2021 16:06:50 +0900
-Subject: [PATCH] build: Fix generation of lock-obj-pub.native.h for cross
- build.
-
-* src/gen-lock-obj.sh: Capture echo output with quotes.
-
---
-
-Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Upstream: 33593864cd54143db594c4237bba41e14179061c
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/gen-lock-obj.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
-index a710f0c..258eec6 100755
---- a/src/gen-lock-obj.sh
-+++ b/src/gen-lock-obj.sh
-@@ -38,7 +38,7 @@
- #     AWK=gawk ./gen-lock-obj.sh
- #
- 
--if test -n `echo -n`; then
-+if test -n "`echo -n`"; then
-     ECHO_C='\c'
-     ECHO_N=''
- else
--- 
-2.31.1
-
diff --git a/package/libgpg-error/0002-build-Fix-disable-threads.patch b/package/libgpg-error/0002-build-Fix-disable-threads.patch
deleted file mode 100644
index 6ed0f83070..0000000000
--- a/package/libgpg-error/0002-build-Fix-disable-threads.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7ede0d4ce19e0ed14cd1cec81ba7df4e467f1eeb Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Mon, 21 Jun 2021 12:16:20 +0900
-Subject: [PATCH] build: Fix --disable-threads.
-
-* src/gen-lock-obj.sh: Fix generating '}}}'.
-
---
-
-GnuPG-bug-id: 5495
-Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Fixes-commit: 1fb90a7da186ee2ee098a666f6f3a35bb1720e59
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/gen-lock-obj.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
-index 258eec6..014667f 100755
---- a/src/gen-lock-obj.sh
-+++ b/src/gen-lock-obj.sh
-@@ -121,10 +121,10 @@ while test "$i" -lt $ac_mtx_size; do
-     fi
-     i=$(( i + 1 ))
- done
-+echo '}}}'
- fi
- 
- cat <<'EOF'
--}}}
- ##
- ## Local Variables:
- ## mode: c
--- 
-2.31.1
-
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 4e124941cd..b29ec37598 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,10 +1,10 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  5e620d71fc24d287a7ac2460b1d819074bb8b9bb  libgpg-error-1.42.tar.bz2
+sha1  fe724ed37b4935964059a47b7c64d5f8246659d8  libgpg-error-1.45.tar.bz2
 
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.42.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  fc07e70f6c615f8c4f590a8e37a9b8dd2e2ca1e9408f8e60459c67452b925e23  libgpg-error-1.42.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.45.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26  libgpg-error-1.45.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index babcbdaded..86dea6ad2a 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.42
+LIBGPG_ERROR_VERSION = 1.45
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
