Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B16C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 18:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC97C81FC9;
	Sun,  7 May 2023 18:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC97C81FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJeMifcCf0Rn; Sun,  7 May 2023 18:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0B581FB5;
	Sun,  7 May 2023 18:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A0B581FB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC821BF2E3
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 18:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0D49417EF
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 18:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D49417EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kO4pIIYmZDJ for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 18:53:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 503DB409BE
 for <buildroot@buildroot.org>; Sun,  7 May 2023 18:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 503DB409BE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35BB286004; Sun,  7 May 2023 18:53:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 20:49:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfefdea8e5a7b368616fc7733022c23a475b215f
X-Git-Newrev: 00dc5ccd01b7dc981faeaf5aedef1d1f48df865b
X-Patchwork-Hint: ignore
Message-Id: <20230507185317.35BB286004@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=00dc5ccd01b7dc981faeaf5aedef1d1f48df865b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit also:
- adds the md5 from the release note in the package hash file,
- rebase the patch on the new version tag,
- adds the "Upstream:" tag in the patch.

For change log since v0.3.22, see:
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23

Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                              | 1 -
 ...01-Makefile.system-don-t-specify-optimization-level-bui.patch | 9 +++++----
 package/openblas/openblas.hash                                   | 4 +++-
 package/openblas/openblas.mk                                     | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b753e1ecfc..cdc12c2328 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1156,7 +1156,6 @@ package/open-iscsi/0001-SHA3-is-not-supported-by-libressl.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open-plc-utils/0002-plc-plc.h-fix-build-with-gcc-10.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch Upstream
 package/openjdk/17.0.6+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
diff --git a/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
index e0c738748a..ed3cae82ef 100644
--- a/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
+++ b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
@@ -1,4 +1,4 @@
-From d8ec4e4c6ef69165179f376e365034de10e6fee3 Mon Sep 17 00:00:00 2001
+From 89648b76e35dc4657942c861ed9dbfbfe5a3df28 Mon Sep 17 00:00:00 2001
 From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Date: Fri, 5 Mar 2021 14:09:23 +0100
 Subject: [PATCH] Makefile.system: don't specify optimization level
@@ -11,16 +11,17 @@ The CFLAGS/FFLAGS would e.g. contain '-Os -O2' in which -O2 survives.
 
 Remove the optimization level specified in openblas itself.
 
+Upstream: N/A, not upstreamable
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 ---
  Makefile.system | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.system b/Makefile.system
-index 438a8148..9de1bbd5 100644
+index 343b94bb3..c355ca5d9 100644
 --- a/Makefile.system
 +++ b/Makefile.system
-@@ -1519,11 +1519,11 @@ FCOMMON_OPT += -g
+@@ -1585,11 +1585,11 @@ FCOMMON_OPT += -g
  endif
  
  ifndef COMMON_OPT
@@ -35,5 +36,5 @@ index 438a8148..9de1bbd5 100644
  
  override CFLAGS     += $(COMMON_OPT) $(CCOMMON_OPT) -I$(TOPDIR)
 -- 
-2.35.1
+2.40.1
 
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a8b5527e81..2e5fa8865f 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,5 @@
+# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
+md5  115634b39007de71eb7e75cf7591dfb2  openblas-0.3.23.tar.gz
 # Locally calculated
-sha256  7fa9685926ba4f27cfe513adbf9af64d6b6b63f9dcabb37baefad6a65ff347a7  openblas-0.3.22.tar.gz
+sha256  5d9491d07168a5d00116cdc068a40022c3455bf9293c7cb86a65b1054d7e5114  openblas-0.3.23.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 27f20654e7..f7a50d7bc7 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.22
+OPENBLAS_VERSION = 0.3.23
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
