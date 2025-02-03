Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCF7C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DABE4F651;
	Fri, 28 Feb 2025 17:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gjgV6BSQpkJL; Fri, 28 Feb 2025 17:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A5E14F770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5E14F770;
	Fri, 28 Feb 2025 17:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BDE9711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAA1740247
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvJeBdVXT33h for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBA4842F3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBA4842F3B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D460685E25; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:18:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: da66b838e4792338bd066d78261d70c80ea029a5
X-Git-Newrev: d364d188a074214577b364fd4b3b6ac39b55794c
X-Patchwork-Hint: ignore
Message-Id: <20250228163027.D460685E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/meson: bump version to
 1.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d364d188a074214577b364fd4b3b6ac39b55794c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Rebased patch 0001.

Release notes:
https://mesonbuild.com/Release-notes-for-1-7-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Prefer-ext-static-libs-when-default-library-static.patch   | 6 +++---
 package/meson/meson.hash                                            | 4 ++--
 package/meson/meson.mk                                              | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index 55f7512e2e..e56db1be07 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,7 +24,7 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: rebased for 1.6.0]
+[Bernd: rebased for 1.6.0 & 1.7.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
@@ -42,8 +42,8 @@ index 09ad837b1..b7f6b9f22 100644
  from .. import compilers
  from ..compilers import CompileCheckMode
  from .visualstudio import VisualStudioLikeCompiler
-@@ -1038,6 +1038,9 @@ class CLikeCompiler(Compiler):
-             # TI C6000 compiler can use both extensions for static or dynamic libs.
+@@ -1053,6 +1053,9 @@ class CLikeCompiler(Compiler):
+             # TI C28x compilers can use both extensions for static or dynamic libs.
              stlibext = ['a', 'lib']
              shlibext = ['dll', 'so']
 +        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index e02d878d79..881c35d250 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.6.0/meson-1.6.0.tar.gz.asc
-sha256  999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca61139f2eec09d5496  meson-1.6.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.7.0/meson-1.7.0.tar.gz.asc
+sha256  08efbe84803eed07f863b05092d653a9d348f7038761d900412fddf56deb0284  meson-1.7.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index f36091e584..292f81b690 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.6.0
+MESON_VERSION = 1.7.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
