Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C5E82CC8
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69608428D9;
	Wed, 27 Sep 2023 19:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69608428D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lcf1tgugmqGL; Wed, 27 Sep 2023 19:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2BD5404ED;
	Wed, 27 Sep 2023 19:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BD5404ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DEE01BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6267F60670
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6267F60670
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9bhsuaJ3GS3 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B368F60D4F
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B368F60D4F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A455482765; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:13:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c11478fb2760de4def18bb823d7ee498f7ade198
X-Git-Newrev: 05fbb29322aa3aa093191c393befe9a03c654b4a
X-Patchwork-Hint: ignore
Message-Id: <20230927191659.A455482765@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unixodbc: bump to version 2.3.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=05fbb29322aa3aa093191c393befe9a03c654b4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/lurcher/unixODBC/releases/tag/2.3.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...er-drivermanager.h-fix-build-without-thre.patch | 34 ----------------------
 package/unixodbc/unixodbc.hash                     |  2 +-
 package/unixodbc/unixodbc.mk                       |  2 +-
 4 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 373b9b1313..b41ab6918e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1423,7 +1423,6 @@ package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch Upstream
 package/umtprd/0001-Fix-output_dir-make-dependency.patch Upstream
 package/unbound/S70unbound Shellcheck
 package/unifdef/0001-Makefile-fix-error-on-install.patch Upstream
-package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch Upstream
 package/unscd/S46unscd Indent Shellcheck Variables
 package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch Upstream
 package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
diff --git a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
deleted file mode 100644
index 9d54bbf5ef..0000000000
--- a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 119cab666646cd9210439d4696a4bfa18343a2c6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 12 Jul 2022 00:29:28 +0200
-Subject: [PATCH] DriverManager/drivermanager.h: fix build without threads
-
-Fix the following build failure without threads raised since version
-2.3.10 and commit 6df155fb213896b9507b421c58856e4376647ae1:
-
-/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
-/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'
-
-Fixes:
- - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/lurcher/unixODBC/commit/119cab666646cd9210439d4696a4bfa18343a2c6]
----
- DriverManager/drivermanager.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/DriverManager/drivermanager.h b/DriverManager/drivermanager.h
-index 9528fae..abd324b 100644
---- a/DriverManager/drivermanager.h
-+++ b/DriverManager/drivermanager.h
-@@ -808,6 +808,8 @@ void pool_signal();
- 
- #define thread_protect(a,b)
- #define thread_release(a,b)
-+#define pool_timedwait(a)
-+#define pool_signal()
- 
- #endif
- 
diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index 9e5401c2b3..6262dab5ae 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c  unixODBC-2.3.11.tar.gz
+sha256  f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec  unixODBC-2.3.12.tar.gz
 sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index 650e3b3b36..28f1e5bc94 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.11
+UNIXODBC_VERSION = 2.3.12
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
 UNIXODBC_SITE = http://www.unixodbc.org
 UNIXODBC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
