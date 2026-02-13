Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C3EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DFCA6141F;
	Fri, 13 Feb 2026 19:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhEU_yaHszed; Fri, 13 Feb 2026 19:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D60626141D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011366;
	bh=h2Pg93bSxZ8ztuO2Eq2jSxU6EBh3YA7HWQTdvpUoYUY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rh1U83oR017pGZIFt4xL6KCETllRLxQoz0UeuJWSbDwx87CtYmhTr6XQ+PdqcEqJo
	 ax7/rnr8oJVR5XRYO6bOG60fo5lH+YgtgHeVdiRVVcrYZCx5g0ctSEpjM6ouBK+Oka
	 2SEg4YSxWqI9oed2LE4+HuNWqpnNAH4zTaaJDPFjrZsjb6DR3gtKDiZXiklRerpkEi
	 finoL0/ZNX1EU6mrZi9cTIN5dibdv3vjqZnVGU6ipcIxeCflVdz3LMpSn6/ZsNe272
	 j6IJ4kGz1qZvWB7jicZnCnEC7Sw/cdx1mY14VLb8JhF0y5WahbIgsnpPQgUevAeHfy
	 6t1VRDF6zGBxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D60626141D;
	Fri, 13 Feb 2026 19:36:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C1A169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A48F4035F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gb9nAw1J0QiI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C73F403B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C73F403B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31B3583545; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:22 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8dc1732b6f790fbcc0d3e3be8a66912ae2c3ddba
X-Git-Newrev: 8571ada6d74a80f45796170fc092b99d7842d9bc
X-Patchwork-Hint: ignore
Message-Id: <20260213193530.31B3583545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{glibc,
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8571ada6d74a80f45796170fc092b99d7842d9bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 807b0bab37ad2d0d11b7f0a54e5859ff1ae9867d)
[thomas: backport to 2.41]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  4 ++--
 package/glibc/glibc.mk         | 10 ++--------
 package/localedef/localedef.mk |  5 +++--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index a7f1daacf9..e999129ccc 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
-# Locally calculated (fetched from Github)
-sha256  7ed7900a90fd1b05fd49a25b1877515c6c3f1ab9ea9248af9d5d0e7fdb3fdd82  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2.tar.gz
+# Locally calculated (fetched from git)
+sha256  3789146d175834dc4873f41bd87932cd6ad7c83d0b7bf340768ee6a927aac784  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d8e178edad..7c07dd5923 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,14 +8,8 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
 GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
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
index 925998a5f4..441145c38f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -8,8 +8,9 @@
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
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
