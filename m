Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03123C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 001A880F22;
	Sat,  4 Jul 2026 19:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkVQ81OoSLIr; Sat,  4 Jul 2026 19:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE51480E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783194973;
	bh=dnq/8lr3r+cMfG1i3hBp8RA97bGgD4SByJpH05b0Fo4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r43owxaStXX/qDCXL4zQpqw1MytNo00UubQ/Ix4P+4n0T4U/Yh8KCB1JQe9LNS2a6
	 SGKSbFfGMtRSgEd1BYeBhbiyr3EUYkWyNP58mBazGk2AQZ+myUb7V8MWOwahXgbxxP
	 dYjlhVVUMhhx05pd3YXBKlcjO++M0o8kC4eUycOkHWAIdDuKUj5d7fDRIKV2vdl9SZ
	 RTjd25P5ftEg1uq9/GE4K+afNqU/x/suV/7FihdqflqIn21HpYRfUCU0E+yK0Q4OF/
	 juWyiD3IDRZxGMTSdcfGPXf87sA0A3zc3SjI7Bj8W5KJIOh1D4VcejrIeKublGuI03
	 kLRN9RMxQT7lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE51480E75;
	Sat,  4 Jul 2026 19:56:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A89316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A4B605ED
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ga-3dG06Ndec for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 19:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F936605DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F936605DF
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B0B38841D; Sat,  4 Jul 2026 19:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 21:41:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7a90c3274d4d5c14f99ecc72ad3a984f513c136
X-Git-Newrev: c5728ff5af9898ab1db967d7e13af2b17825ed25
X-Patchwork-Hint: ignore
Message-Id: <20260704195541.6B0B38841D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndctl: bump to version 85
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5728ff5af9898ab1db967d7e13af2b17825ed25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream v85 no longer requires the -Dfwctl=enabled / -Dkeyutils=enabled
workaround, so drop both options along with the stale comment.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ndctl/ndctl.hash | 2 +-
 package/ndctl/ndctl.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/ndctl/ndctl.hash b/package/ndctl/ndctl.hash
index f731fb7263..dbba1d16dc 100644
--- a/package/ndctl/ndctl.hash
+++ b/package/ndctl/ndctl.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  dd4b9b9a9dc0a15e980670b6f889e910a80ad60f2309e03bfd9cc6071d14dd30  ndctl-83.tar.gz
+sha256  69039ee12c75c44f67b5fa3f1abb61d1c38ff9303021e50cec0b45801cc93b2e  ndctl-85.tar.gz
 sha256  1334f22048052d69647860fe9fb24997dc3b33737cb494297d68949f589fa1cf  COPYING
 sha256  5c37e41135091a39821cfb306ad8516625b0bb49510ce56ad85c347bbc46df29  LICENSES/other/CC0-1.0
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/other/MIT
diff --git a/package/ndctl/ndctl.mk b/package/ndctl/ndctl.mk
index ceb01d633f..47d51e6b1a 100644
--- a/package/ndctl/ndctl.mk
+++ b/package/ndctl/ndctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDCTL_VERSION = 83
+NDCTL_VERSION = 85
 NDCTL_SITE = $(call github,pmem,ndctl,v$(NDCTL_VERSION))
 NDCTL_LICENSE = \
 	CC0-1.0 (helper routines), \
@@ -26,12 +26,8 @@ NDCTL_DEPENDENCIES = \
 	udev \
 	util-linux-libs
 
-# Currently, disabling keyutils or fwctl support will cause builds to
-# fail. Therefore, always pass the -Dfwctl=enabled and -Dkeyutils=enabled.
 NDCTL_CONF_OPTS = \
 	-Ddocs=disabled \
-	-Dfwctl=enabled \
-	-Dkeyutils=enabled \
 	-Diniparserdir=$(STAGING_DIR)/usr/include/iniparser
 
 ifeq ($(BR2_PACKAGE_LIBTRACEFS)$(BR2_PACKAGE_LIBTRACEEVENT),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
