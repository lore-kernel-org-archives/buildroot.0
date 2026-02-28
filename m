Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5481FEE4ED
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 14:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5974440C58;
	Sat, 28 Feb 2026 14:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFpk-2pnBI44; Sat, 28 Feb 2026 14:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 632A940C81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772287985;
	bh=/pw2HKjpxRgJk4tsZUcXLKrNO5/u4EfbXqulHPhHFnA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HUXe8NfjFwBq71d8VVso/mmgUH7PDWFaoKNSA1k0LnKi9sI9lTOH+0QuPD2U+HhNu
	 bWFMa/jsCACCOE5Hv6Ufi5R/W/jxrTaar95ncuCf19SSLUJ/LQfl92InDoIEeND7Fm
	 7P+StwnepiWR51JokINv/5HBp1asKSpqzuJzd7ejrdLmEluYbj3GV3fMz3kJPuGfbb
	 y1kA/+5hE8+Npt56YbiYF1bGYqHa/sM0JMZ9/+ilA2rIYF+pWVZ5GmJPz3pw2R71Zm
	 K3DKS7kkw5Prh7FPHPaLo9Gt37CnSDVaZ+Ylt/Z+DYLuWrfz6185ZMMEE0hUuoUM3/
	 xtHl8AA5/xOBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 632A940C81;
	Sat, 28 Feb 2026 14:13:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7831818D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F0B40C3E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hg25paPiIVNc for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 14:13:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 902AF40C58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 902AF40C58
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 14:13:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87E2C85A58; Sat, 28 Feb 2026 14:13:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 14:44:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a64d520ccc3b65f2c479b7ba79e830a378b8acc7
X-Git-Newrev: d332d9627c17defffda0cb64d20ee5735c0ee9fc
X-Patchwork-Hint: ignore
Message-Id: <20260228141301.87E2C85A58@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libeastl: bump version
 to 3.27.01
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d332d9627c17defffda0cb64d20ee5735c0ee9fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

For release notes since version 3.12.07-3-g4546973, see:
https://github.com/electronicarts/EASTL/releases

Updated license hash due to upstream commit
https://github.com/electronicarts/EASTL/commit/c18a037660ee213e9546edbbbddf31634af11a56

Added patch to raise make_minimum_required in subproject EABase that was
added by upstream commit
https://github.com/electronicarts/EASTL/commit/c530255b690c9d14feff249f5753824eef9ed818
using FetchContent_Declare which downloads the source during configure
so we do not have a chance to use _POST_EXTRACT_HOOKS to patch the
source code directly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add comment in commit log about the previous version number]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ke-patch-EABase-to-fix-build-with-cmake-4.patch | 30 ++++++++++++++++++++++
 package/libeastl/libeastl.hash                     |  5 ++--
 package/libeastl/libeastl.mk                       |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch b/package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..4544073be4
--- /dev/null
+++ b/package/libeastl/0001-cmake-patch-EABase-to-fix-build-with-cmake-4.patch
@@ -0,0 +1,30 @@
+From d2374930c45ecf117b08df0ffa5c1611867f6d92 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 22 Feb 2026 15:26:22 +0100
+Subject: [PATCH] cmake: patch EABase to fix build with cmake 4+
+
+FetchContent_Declare overwrites extracted source files during configure.
+
+Upstream: Not applicable (Buildroot specific)
+(sent PR for version bump: https://github.com/electronicarts/EABase/pull/18)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0124dc7..f76df69 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -75,6 +75,7 @@ FetchContent_Declare(
+   GIT_REPOSITORY https://github.com/electronicarts/EABase.git
+   GIT_TAG        0699a15efdfd20b6cecf02153bfa5663decb653c
+   GIT_SUBMODULES "" # This should be temporary until we update the cyclic submodule dependencies in EABase.
++  PATCH_COMMAND sed -i "s/make_minimum_required(VERSION 3.1)/make_minimum_required(VERSION 3.5)/" "${CMAKE_CURRENT_SOURCE_DIR}/_deps/eabase-src/CMakeLists.txt"
+ )
+ 
+ FetchContent_MakeAvailable(EABase)
+-- 
+2.47.3
+
diff --git a/package/libeastl/libeastl.hash b/package/libeastl/libeastl.hash
index c7ba6da09f..3424fd5951 100644
--- a/package/libeastl/libeastl.hash
+++ b/package/libeastl/libeastl.hash
@@ -1,2 +1,3 @@
-sha256  9b3484553812b3ec3bad0857f7f675499c81f7cf4ac87e5f3b2acbe72e3a878a  libeastl-45469730d641868ce05433fff2e199510c7d45c3.tar.gz
-sha256  82c0243a1a62b8af01dab3bce6ed2b0852604bd508b85a561ba7d32480e598e3  LICENSE
+# Locally computed
+sha256  fce43bf443f5569b00a8deae735394ea0b16f6c3f96867a17ded50775ffcdd12  libeastl-3.27.01.tar.gz
+sha256  cebc1fa5ade455a79f821180cf86bf5f9717dd1df5704b4c2a3bb0617ab35f2a  LICENSE
diff --git a/package/libeastl/libeastl.mk b/package/libeastl/libeastl.mk
index 0559dd856d..15feaf9847 100644
--- a/package/libeastl/libeastl.mk
+++ b/package/libeastl/libeastl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEASTL_VERSION = 45469730d641868ce05433fff2e199510c7d45c3
+LIBEASTL_VERSION = 3.27.01
 LIBEASTL_SITE = $(call github,electronicarts,EASTL,$(LIBEASTL_VERSION))
 LIBEASTL_LICENSE = BSD-3-Clause
 LIBEASTL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
