Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C9CEE0AEE
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 20:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A4D60C0D;
	Sat,  7 Feb 2026 20:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuf_aBhW7G0w; Sat,  7 Feb 2026 20:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB2760D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770497783;
	bh=2HRoREHVN/kowIhcO9jEX33oc+HDnIocCY/4BIX3oB4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IoDK6PS5VbLkQfLHvRCmEVdAlHWbQNQWO9CL+pORLK1xec+DHKGLrm/GIODLDrCOt
	 EMWsycNfGY+yvekvbWi7nEYXY66x+RHoWVo2phvyJmQIndvqn/qF6vp6yve5rKSSAw
	 t3bYTC9l1qMeX/So/l8zJAAN9ucAAdnJCaMRlPEA783NtLApZqkJ0HyVUHGyyL/6za
	 7foFS6kDssNyppeErN/uYoY5h64Pgow1shRBSKHqHtcyFlxjK1AeZ2zy6d0xFdJeNh
	 RWir3gy5/RsU4j5s1lRsEVFATzLRA00qJwNkCVhZDeg70kgjTaApcSWm80eWOuQbL7
	 t1b6qiCe8Yrgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB2760D5B;
	Sat,  7 Feb 2026 20:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ACA6173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FEBF82684
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2T4FR5hUT_-b for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 20:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142D282779
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142D282779
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:56:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2A4C86B93; Sat,  7 Feb 2026 20:56:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 21:30:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b3b25a7dcfb4d0dbd99cadd8d898e3b7ecc790f
X-Git-Newrev: 807b0bab37ad2d0d11b7f0a54e5859ff1ae9867d
X-Patchwork-Hint: ignore
Message-Id: <20260207205619.E2A4C86B93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: move to sourceware.org git repo
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/807b0bab37ad2d0d11b7f0a54e5859ff1ae9867d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As described in https://gitlab.com/buildroot.org/buildroot/-/issues/160, the
github mirror is getting shut down - So move to the sourceware.org git repo.

The github mirror was originally used because of performance and reliability
issues with sourceware, but that seems be resolved now after server/RAM
upgrades - E.G. from the sourceware news:

April 22, 2024
    server2.sourceware.org now has 512GB RAM, thanks Red Hat.

https://sourceware.org/

So change back to fetch glibc (and localedef) from sourceware.org over git.

Notice: The git archiving leads to slightly different paths and permissions
in the tarball, but the file content is identical:

mkdir a && tar -C a -x --strip-components=1 -f \
	path/to/glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
mkdir b && tar -C b -x --strip-components=1 -f \
	path/to/glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien:
 - add missing SoB line
 - fix command lines in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       |  4 ++--
 package/glibc/glibc.mk         | 10 ++--------
 package/localedef/localedef.mk |  5 +++--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index a58bb7b9a7..0a11cfdb5e 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
-# Locally calculated (fetched from Github)
-sha256  f63ffa06cd17ee8ff891f6de41de6e189b96edc6b2be2807ae597291f4464388  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
+# Locally calculated (fetched from git)
+sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 44bf9c4b06..80d21b86ed 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,14 +8,8 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
 GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
-
-# Upstream doesn't officially provide an https download link.
-# There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
-# sometimes the connection times out. So use an unofficial github mirror.
-# When updating the version, check it on the official repository;
-# *NEVER* decide on a version string by looking at the mirror.
-# Then check that the mirror has been synced already (happens once a day.)
-GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
+GLIBC_SITE = https://sourceware.org/git/glibc.git
+GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 254a79026a..4da110417a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -8,8 +8,9 @@
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
-LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
-LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
+LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
+LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
+LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
 HOST_LOCALEDEF_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
