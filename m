Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173E4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:56:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D94C260F94
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D94C260F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23744228A;
	Tue,  3 Aug 2021 23:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tP2RcCiurSn; Tue,  3 Aug 2021 23:56:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1C7642278;
	Tue,  3 Aug 2021 23:56:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 873A51BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4610140EE7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yigxM2JdCry for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8CED40E45
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0CD7A86763; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:41:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 04ed52494d1007cf33aa31a49064534280ba71a3
X-Git-Newrev: 2d5829aa3e689dd3f103fff329c19662c0304f07
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.0CD7A86763@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/optee-os: bump to version
 3.13.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2d5829aa3e689dd3f103fff329c19662c0304f07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump OP-TEE OS package version to OP-TEE release 3.13.0.

Add a patch already merged OP-TEE to fix build issue seen with 3.13.0
on some BR toolchain.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-build-warning-when-_LFS64_LARGEFILE-is.patch | 56 ++++++++++++++++++++++
 boot/optee-os/Config.in                            |  4 +-
 boot/optee-os/optee-os.hash                        |  4 +-
 3 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch b/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch
new file mode 100644
index 0000000000..0ff61dc524
--- /dev/null
+++ b/boot/optee-os/0001-core-zlib-fix-build-warning-when-_LFS64_LARGEFILE-is.patch
@@ -0,0 +1,56 @@
+From 82becbadd5918ed7ad3c2b651ce479084b5feb2a Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Mon, 10 May 2021 15:58:41 +0200
+Subject: core: zlib: fix build warning when _LFS64_LARGEFILE is not defined
+
+In zlib, _LFS64_LARGEFILE is expected to be a boolean directive, either
+1 (true) or 0 (false). Depending on toolchain version and directives
+build may produces warnings (as shown below with gcc 9.3) when the macro
+is not defined hence this change to default it to value 0 (false).
+
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+In file included from core/lib/zlib/adler32.c:9:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+  CC      out/core/lib/zlib/zutil.o
+In file included from core/lib/zlib/inftrees.c:7:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+In file included from core/lib/zlib/inflate.c:84:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+In file included from core/lib/zlib/zutil.c:9:
+core/lib/zlib/zutil.h:196:39: warning: "_LFS64_LARGEFILE" is not defined, evaluates to 0 [-Wundef]
+  196 |     (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
+      |                                       ^~~~~~~~~~~~~~~~
+
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/lib/zlib/zconf.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/core/lib/zlib/zconf.h b/core/lib/zlib/zconf.h
+index 0bca18be..a7d13741 100644
+--- a/core/lib/zlib/zconf.h
++++ b/core/lib/zlib/zconf.h
+@@ -487,6 +487,11 @@ typedef uLong FAR uLongf;
+ #  endif
+ #endif
+ 
++/* Other places expect _LFS64_LARGEFILE to be defined with a valid value */
++#ifndef _LFS64_LARGEFILE
++#define _LFS64_LARGEFILE	0
++#endif
++
+ #if defined(_LFS64_LARGEFILE) && _LFS64_LARGEFILE-0
+ #  define Z_LFS64
+ #endif
+-- 
+2.17.1
+
diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 8e833ecd75..4679fd2fde 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "3.12.0"
+	bool "3.13.0"
 	help
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
@@ -50,7 +50,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "3.12.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "3.13.0"	if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index 36bc1d9593..3803a69797 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_os/archive/3.12.0/optee-os-3.12.0.tar.gz
-sha256 b13991099f25d00dac479db93b55034cb93d206e296f2c7aa9c42b92bca2c783  optee-os-3.12.0.tar.gz
+# From https://github.com/OP-TEE/optee_os/archive/3.13.0/optee-os-3.13.0.tar.gz
+sha256 c6629ba54f62a2624299f7d17cf6df2dadc902e6a862c62f85d1b6da6c909c3f  optee-os-3.13.0.tar.gz
 # Locally computed
 sha256 1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
