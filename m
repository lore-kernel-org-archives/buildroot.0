Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC8CC7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 19:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA9EC4157E;
	Fri, 20 Jun 2025 19:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAsCftiMuPPS; Fri, 20 Jun 2025 19:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D30F9415A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30F9415A4;
	Fri, 20 Jun 2025 19:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41CD5E2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 19:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FD4940189
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 19:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXTelBGGW9Dq for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 19:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6065C40131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6065C40131
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 19:25:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F3A184016; Fri, 20 Jun 2025 19:25:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 21:21:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c17ce037930400f181d23af312bc64215fffdbc5
X-Git-Newrev: b753f29494a9788cef96d80ac319e7e159647600
X-Patchwork-Hint: ignore
Message-Id: <20250620192543.4F3A184016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.8.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b753f29494a9788cef96d80ac319e7e159647600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mesonbuild.com/Release-notes-for-1-8-0.html

Updated patch 0001 due to upstream commit
https://github.com/mesonbuild/meson/commit/4fa52925459dac650bf053715987ee7beb3b23c1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: fix patch line offsets]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Prefer-ext-static-libs-when-default-library-static.patch  | 7 ++++---
 ...0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch | 2 +-
 package/meson/meson.hash                                           | 4 ++--
 package/meson/meson.mk                                             | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index e56db1be07..c7f8557ec1 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,7 +24,8 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: rebased for 1.6.0 & 1.7.0]
+[Bernd: rebased for 1.6.0 & 1.7.0
+ for 1.82.0 - get_option -> optstore.get_value_for]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
@@ -42,11 +43,11 @@ index 09ad837b1..b7f6b9f22 100644
  from .. import compilers
  from ..compilers import CompileCheckMode
  from .visualstudio import VisualStudioLikeCompiler
-@@ -1053,6 +1053,9 @@ class CLikeCompiler(Compiler):
+@@ -1053,6 +1054,9 @@ class CLikeCompiler(Compiler):
              # TI C28x compilers can use both extensions for static or dynamic libs.
              stlibext = ['a', 'lib']
              shlibext = ['dll', 'so']
-+        elif env.coredata.get_option(OptionKey('default_library')) == 'static':
++        elif env.coredata.optstore.get_value_for(OptionKey('default_library')) == 'static':
 +            # Linux/BSDs
 +            shlibext = ['a']
          else:
diff --git a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 8b95dc7592..d0b246f0a3 100644
--- a/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -30,7 +30,7 @@ diff --git a/mesonbuild/dependencies/pkgconfig.py b/mesonbuild/dependencies/pkgc
 index e86206b88..94888657d 100644
 --- a/mesonbuild/dependencies/pkgconfig.py
 +++ b/mesonbuild/dependencies/pkgconfig.py
-@@ -169,7 +169,8 @@ class PkgConfigCLI(PkgConfigInterface):
+@@ -170,7 +170,8 @@ class PkgConfigCLI(PkgConfigInterface):
              env['PKG_CONFIG_ALLOW_SYSTEM_LIBS'] = '1'
          args: T.List[str] = []
          args += self._define_variable_args(define_variable)
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 881c35d250..40340fb932 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.7.0/meson-1.7.0.tar.gz.asc
-sha256  08efbe84803eed07f863b05092d653a9d348f7038761d900412fddf56deb0284  meson-1.7.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.8.2/meson-1.8.2.tar.gz.asc
+sha256  c105816d8158c76b72adcb9ff60297719096da7d07f6b1f000fd8c013cd387af  meson-1.8.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 292f81b690..e23c851d2e 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.7.0
+MESON_VERSION = 1.8.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
