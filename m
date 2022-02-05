Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF226C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4BA881751;
	Sat,  5 Feb 2022 15:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGtNeeimAA6g; Sat,  5 Feb 2022 15:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9508174A;
	Sat,  5 Feb 2022 15:19:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94D191BF39A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83CB34028F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdblY-TaRMYW for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 058EC40287
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:18:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A3B4882967; Sat,  5 Feb 2022 15:11:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 16:11:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ddbcb76aaa4e88dfe7aef5072aafd95107b7161
X-Git-Newrev: c2151a3f222854a711f40dc074be2bc9a63630a1
X-Patchwork-Hint: ignore
Message-Id: <20220205151113.A3B4882967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump to version 0.61.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2151a3f222854a711f40dc074be2bc9a63630a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...me-fix-typo-in-vapigen-option-metadatadir.patch | 33 ----------------------
 package/meson/meson.hash                           |  4 +--
 package/meson/meson.mk                             |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
deleted file mode 100644
index 3788ee0f11..0000000000
--- a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9952446a2a28ea2b009f4b8b2a14ad50f0878bdd Mon Sep 17 00:00:00 2001
-From: Michal Vasilek <michal.vasilek@nic.cz>
-Date: Mon, 10 Jan 2022 21:27:30 +0100
-Subject: [PATCH] gnome: fix typo in vapigen option metadatadir
-
-This typo was introduced in 9ef36fa80bf4483bcd837ea3985a51ab533c7972 and
-can cause a build failure, because --metadatdir is not a valid vapigen
-option.
-
-[aperez@igalia.com: backport from upstream]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[yann.morin.1998@free.fr: make it an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- mesonbuild/modules/gnome.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 1125e56e7..dfc66c2e3 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -1934,7 +1934,7 @@ class GnomeModule(ExtensionModule):
-         cmd: T.List[T.Union[str, 'ExternalProgram']]
-         cmd = [state.find_program('vapigen'), '--quiet', f'--library={library}', f'--directory={build_dir}']
-         cmd.extend([f'--vapidir={d}' for d in kwargs['vapi_dirs']])
--        cmd.extend([f'--metadatdir={d}' for d in kwargs['metadata_dirs']])
-+        cmd.extend([f'--metadatadir={d}' for d in kwargs['metadata_dirs']])
-         cmd.extend([f'--girdir={d}' for d in kwargs['gir_dirs']])
-         cmd += pkg_cmd
-         cmd += ['--metadatadir=' + source_dir]
--- 
-2.25.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c9be54be05..c2d53519d4 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.61.0/meson-0.61.0.tar.gz.asc
-sha256  ea9f33246b1f23f02e90a50e75e0f41e526f6dabf0c24f3e00e27a3f5abdc35c  meson-0.61.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.61.1/meson-0.61.1.tar.gz.asc
+sha256  feb2cefb325b437dbf36146df7c6b87688ddff0b0205caa31dc64055c6da410c  meson-0.61.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 6c0d1ab08e..ad15e3f91e 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.61.0
+MESON_VERSION = 0.61.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
