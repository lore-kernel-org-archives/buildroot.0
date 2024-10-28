Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909B2D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F67606AE;
	Mon, 28 Oct 2024 21:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4sPUgJ6oUS44; Mon, 28 Oct 2024 21:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48F27606C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F27606C2;
	Mon, 28 Oct 2024 21:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0131B4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E355B400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2nLKjAsNvaT for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB8C40015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FB8C40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEBFA8449E; Mon, 28 Oct 2024 21:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:09:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67e62449304501a5dee2a81bac30e1c2e968046a
X-Git-Newrev: 70a777bb666764af476514bc6aa4e29c79abf7cf
X-Patchwork-Hint: ignore
Message-Id: <20241028211108.EEBFA8449E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=70a777bb666764af476514bc6aa4e29c79abf7cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated patch 0001 due to upstream PR
https://github.com/mesonbuild/meson/pull/13368

Release notes:
https://mesonbuild.com/Release-notes-for-1-4-0.html
https://mesonbuild.com/Release-notes-for-1-5-0.html
https://mesonbuild.com/Release-notes-for-1-6-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...r-ext-static-libs-when-default-library-static.patch | 18 ++++++++++++++----
 package/meson/meson.hash                               |  4 ++--
 package/meson/meson.mk                                 |  2 +-
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index 9cedcd0942..55f7512e2e 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,6 +24,8 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Bernd: rebased for 1.6.0]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
  1 file changed, 3 insertions(+)
@@ -32,10 +34,18 @@ diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/
 index 09ad837b1..b7f6b9f22 100644
 --- a/mesonbuild/compilers/mixins/clike.py
 +++ b/mesonbuild/compilers/mixins/clike.py
-@@ -978,6 +978,9 @@ class CLikeCompiler(Compiler):
-         elif env.machines[self.for_machine].is_cygwin():
-             shlibext = ['dll', 'dll.a']
-             prefixes = ['cyg'] + prefixes
+@@ -27,6 +27,7 @@
+ from ... import mlog
+ from ...linkers.linkers import GnuLikeDynamicLinkerMixin, SolarisDynamicLinker, CompCertDynamicLinker
+ from ...mesonlib import LibType
++from ...options import OptionKey
+ from .. import compilers
+ from ..compilers import CompileCheckMode
+ from .visualstudio import VisualStudioLikeCompiler
+@@ -1038,6 +1038,9 @@ class CLikeCompiler(Compiler):
+             # TI C6000 compiler can use both extensions for static or dynamic libs.
+             stlibext = ['a', 'lib']
+             shlibext = ['dll', 'so']
 +        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
 +            # Linux/BSDs
 +            shlibext = ['a']
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 150fd6d1bb..e02d878d79 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.3.1/meson-1.3.1.tar.gz.asc
-sha256  6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7  meson-1.3.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.6.0/meson-1.6.0.tar.gz.asc
+sha256  999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca61139f2eec09d5496  meson-1.6.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 467569d28b..f36091e584 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.3.1
+MESON_VERSION = 1.6.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
