Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4FAD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1531844F4;
	Fri, 12 Dec 2025 07:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CohGeyvjDZkw; Fri, 12 Dec 2025 07:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FC580AEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526363;
	bh=LQ3d/P1Sd9UZfrcpZl2TuMj+sjImfkwnBRqkoL8XHl0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U2R0/Heeqa3WtzCq1z3+FsIKNDRAQwMSuQFjyYbCl+jV4mta/obeFHEg1WhpAOSw9
	 zYEX+vfVg73452b6kFxYvltPnGOoLlp6nS4q+JrPrV2pLNFIoVkCusYl87dU0PJiGa
	 /mFAXAYyKyiKc35h/vsHX3sjpLyf7w/8YBP1SMe7z0+rlBAB2UoOYylkBXLxKRmUmG
	 HACLeD7jHCoZnlBleiNZkd6x07uxD+wa1aZkOtBALIkuNn2DoerbA4GkO7e3dUFZNk
	 3iCKqulAR5Cn3zKH8CV+5wutgpyLIqxAdZG/KjzXIimfRi6J9A3EejUHEZyZmTxRxS
	 1l0TiTf5ihUjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70FC580AEC;
	Fri, 12 Dec 2025 07:59:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81333E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D6F41153
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fJ-bnmA5MYf for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AEFC4119A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AEFC4119A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A21585C4C; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 20:42:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1983c12bd3c50a2a2b180b6562425746d4f90cdc
X-Git-Newrev: eb1f160b7a08537fdfeb0800b9240a497f4237ac
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.2A21585C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump version to 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb1f160b7a08537fdfeb0800b9240a497f4237ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://mesonbuild.com/Release-notes-for-1-10-0.html

Rebased and updated patch 0001 to fix build error:

    NameError: name 'env' is not defined

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Prefer-ext-static-libs-when-default-library-static.patch | 13 ++++++-------
 package/meson/meson.hash                                    |  4 ++--
 package/meson/meson.mk                                      |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index c7f8557ec1..92d5e517a4 100644
--- a/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -24,8 +24,7 @@ http://autobuild.buildroot.net/results/c17/c17bbb12d9deadd64a441b36e324cfbbe8aba
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 [Updated for 0.57.1 - get_builtin_option() vs. get_option(OptionKey())]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Bernd: rebased for 1.6.0 & 1.7.0
- for 1.82.0 - get_option -> optstore.get_value_for]
+[Bernd: rebased for 1.10.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  mesonbuild/compilers/mixins/clike.py | 3 +++
@@ -43,16 +42,16 @@ index 09ad837b1..b7f6b9f22 100644
  from .. import compilers
  from ..compilers import CompileCheckMode
  from .visualstudio import VisualStudioLikeCompiler
-@@ -1053,6 +1054,9 @@ class CLikeCompiler(Compiler):
+@@ -1045,6 +1046,9 @@ class CLikeCompiler(Compiler):
              # TI C28x compilers can use both extensions for static or dynamic libs.
              stlibext = ['a', 'lib']
              shlibext = ['dll', 'so']
-+        elif env.coredata.optstore.get_value_for(OptionKey('default_library')) == 'static':
++        elif self.environment.coredata.optstore.get_value_for(OptionKey('default_library')) == 'static':
 +            # Linux/BSDs
 +            shlibext = ['a']
-         else:
-             # Linux/BSDs
-             shlibext = ['so']
+         elif self.info.is_os2():
+             stlibext = ['_s.lib', '_s.a', 'lib', 'a']
+             shlibext = ['_dll.lib', '_dll.a', 'lib', 'a', 'dll']
 -- 
 2.25.1
 
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 581cfe62a7..d07ea4d1dd 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.9.1/meson-1.9.1.tar.gz.asc
-sha256  4e076606f2afff7881d195574bddcd8d89286f35a17b4977a216f535dc0c74ac  meson-1.9.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.10.0/meson-1.10.0.tar.gz.asc
+sha256  8071860c1f46a75ea34801490fd1c445c9d75147a65508cd3a10366a7006cc1c  meson-1.10.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 29082dcbb5..ca42edf63b 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.9.1
+MESON_VERSION = 1.10.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
