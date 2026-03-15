Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A6DF3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E4C6143E;
	Sun, 15 Mar 2026 22:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7NVUVG5TpdV; Sun, 15 Mar 2026 22:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF556141C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613182;
	bh=4ZlFoilxrfB7I010rnMYDLTP87MkmV7jW4bxF1xT+Zg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BamiHICN3NLGfHDX3eHy//b6sYHCYBfWKXzgDO5tGHRHiJeWmREpcPgQdTEa2S4A1
	 KRNPPv7tUT1+hDxKawQebvOR17ZJQNo7Dgn1/VshV+Y952RPH2T9Nudbf1Cd7sUe7P
	 Wz8DRbjeSdbLQeLig1G7aTVRpx3arXAW2/vejxLE727khEBtrcQG4WYezYPcXe2md/
	 z0reDFGdqNo6Afi6ir+7QOkBoT9umT9Mr8WvbUv82gj94782yjTW2LpYOHUhqDitXT
	 P82MuHIwdcFdEd4rCz4eDshEa8Y7EiRVnSiO0ae5JDrGkA28oPpl2uORRQgj7jihRN
	 oZeHbZ56sxr9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CF556141C;
	Sun, 15 Mar 2026 22:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCA91B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C6CF4095B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cZ9fbQo8wbS for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB20409BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB20409BD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EB2685BFF; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3c045546a70b8a94ecab9a079aa8e5ce5d2b92c
X-Git-Newrev: e212fc12c60f734f958b850b6d9a8db6bdb9d066
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.9EB2685BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump version
 to 4.9.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e212fc12c60f734f958b850b6d9a8db6bdb9d066
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tox-dev/platformdirs/blob/4.9.4/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index bbf94f6b6f..cc92e4a824 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  e1000e5728e36717b1832e77dc3590c9  platformdirs-4.5.1.tar.gz
-sha256  61d5cdcc6065745cdd94f0f878977f8de9437be93de97c1c12f853c9c0cdcbda  platformdirs-4.5.1.tar.gz
+md5  8168f7450c9606bfa4a28268f0f59a37  platformdirs-4.9.4.tar.gz
+sha256  1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934  platformdirs-4.9.4.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index e099c486c4..11e8acd078 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.5.1
+PYTHON_PLATFORMDIRS_VERSION = 4.9.4
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/cf/86/0248f086a84f01b37aaec0fa567b397df1a119f73c16f6c7a9aac73ea309
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/19/56/8d4c30c8a1d07013911a8fdbd8f89440ef9f08d07a1b50ab8ca8be5a20f9
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
