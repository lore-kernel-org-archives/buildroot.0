Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF03C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC85812DC;
	Sun, 18 May 2025 14:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Re92Jh0j3hV; Sun, 18 May 2025 14:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F5A81277
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F5A81277;
	Sun, 18 May 2025 14:55:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FAB0DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E989381277
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFxZ3h312-OX for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2096880E63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2096880E63
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:55:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1215587075; Sun, 18 May 2025 14:55:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:54:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7050c68b5f16899fae5708412313a4c35d9864ff
X-Git-Newrev: e7c091f11398bdb6498adaa344d0934d97b4ef39
X-Patchwork-Hint: ignore
Message-Id: <20250518145516.1215587075@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncurses: bump to version
 6.5.20250517
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7c091f11398bdb6498adaa344d0934d97b4ef39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250510/NEWS

- Drop upstream patch - 0001-fix-XOPEN_SOURCE-detection.patch
- COPYING hash changed due to Copyright year update.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd: bumped to version 6.5.20250517
 added configure option --disable-widec due to wchar support being
 enabled by default since version 6.5:
 https://github.com/ThomasDickey/ncurses-snapshots/blob/master/INSTALL#L840
 fixing non-wchar ncurses build on wchar-enabled toolchains (Peter)]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch | 17 -----------------
 package/ncurses/ncurses.hash                          |  4 ++--
 package/ncurses/ncurses.mk                            |  7 ++++---
 3 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch b/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
deleted file mode 100644
index 130ef524b4..0000000000
--- a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix detection of XOPEN_SOURCE
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: fixed in latest release, no git/svn/hg
-
-diff -Nur ncurses-snapshots-6_4_20230603.orig/configure ncurses-snapshots-6_4_20230603/configure
---- ncurses-snapshots-6_4_20230603.orig/configure	2023-06-04 00:07:40.000000000 +0200
-+++ ncurses-snapshots-6_4_20230603/configure	2024-08-14 20:38:03.426905460 +0200
-@@ -10411,7 +10411,7 @@
- 	cf_xopen_source="-D_SGI_SOURCE"
- 	cf_XOPEN_SOURCE=
- 	;;
--(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*)
-+(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc)
- 
- cf_gnu_xopen_source=$cf_XOPEN_SOURCE
- 
diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index b82a7b29e4..9829cd512c 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b0910671694c2c8377f579eea68477a15d67bd20ddd4b29328cfe15c62c7b3fd  ncurses-6.4-20230603.tar.gz
+sha256  271044605db2f64fcd1c697c5444a08eae0f70cae33b934e59f205954004a449  ncurses-6.5-20250517.tar.gz
 # Locally computed
-sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
+sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 00e1c0d424..4eac66a71c 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.4
-NCURSES_SNAPSHOT_DATE = 20230603
+NCURSES_VERSION_MAJOR = 6.5
+NCURSES_SNAPSHOT_DATE = 20250517
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
@@ -118,7 +118,8 @@ NCURSES_CONF_OPTS += --enable-ext-colors
 
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_LIBS
 NCURSES_POST_INSTALL_STAGING_HOOKS += NCURSES_LINK_STAGING_PC
-
+else
+NCURSES_CONF_OPTS += --disable-widec
 endif # BR2_PACKAGE_NCURSES_WCHAR
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
