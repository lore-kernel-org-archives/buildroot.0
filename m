Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60873C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03CDC4157B;
	Tue,  1 Nov 2022 22:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03CDC4157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yj3_d05znKGM; Tue,  1 Nov 2022 22:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B9AE409E3;
	Tue,  1 Nov 2022 22:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9AE409E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 472621BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2214E401D0
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2214E401D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kdc-W29hX8AD for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08FD3401CA
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08FD3401CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8E4A878AB; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:23:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf83252de4dc901bde36cafdbb4038447f7cb7c3
X-Git-Newrev: 1cb57485c86df466c839352127bc203331a85968
X-Patchwork-Hint: ignore
Message-Id: <20221101222354.E8E4A878AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uftrace: bump to version 0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cb57485c86df466c839352127bc203331a85968
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop second patch (already in version)

https://github.com/namhyung/uftrace/blob/v0.12/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch | 31 ----------------------
 package/uftrace/uftrace.hash                       |  2 +-
 package/uftrace/uftrace.mk                         |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch b/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch
deleted file mode 100644
index 03fba88693..0000000000
--- a/package/uftrace/0002-arch-arm-mcount-support.c-define-EF_ARM_VFP_FLOAT-wh.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4e543097e62eb052650433d1d4c9c5996d30f242 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 23 Apr 2021 23:06:01 +0200
-Subject: [PATCH] arch/arm/mcount-support.c: define EF_ARM_VFP_FLOAT when not
- available
-
-uClibc-ng <elf.h> doesn't define EF_ARM_VFP_FLOAT, so let's define it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- arch/arm/mcount-support.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/arch/arm/mcount-support.c b/arch/arm/mcount-support.c
-index 8d23460b..51331740 100644
---- a/arch/arm/mcount-support.c
-+++ b/arch/arm/mcount-support.c
-@@ -3,6 +3,10 @@
- #include <link.h>
- #include <elf.h>
- 
-+#ifndef EF_ARM_VFP_FLOAT
-+# define EF_ARM_VFP_FLOAT 0x400
-+#endif
-+
- #ifndef EF_ARM_ABI_FLOAT_HARD
- # define EF_ARM_ABI_FLOAT_HARD  EF_ARM_VFP_FLOAT
- #endif
--- 
-2.30.2
-
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index b2a3ddc5a9..195f0605c8 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b8b56d540ea95c3eafe56440d6a998e0a140d53ca2584916b6ca82702795bbd9  uftrace-0.10.tar.gz
+sha256  2aad01f27d4f18717b681824c7a28ac3e1efd5e7bbed3ec888a3ea5af60e3700  uftrace-0.12.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index b487b30695..d36c3bd8f5 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.10
+UFTRACE_VERSION = 0.12
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
