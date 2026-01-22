Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E29D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A57B4095E;
	Thu, 22 Jan 2026 19:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihnlSwYRfBWL; Thu, 22 Jan 2026 19:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C0D40962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109955;
	bh=blhQPxdV/IdHk0HfstctI645bzpKB7YHeFHHvdMRQx4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TbYGwzSRA+BDcsVfESTcZBMJNhpCNrTsTMPa0v+wi/REuAbf2R3IC6DXdcGfVlTpu
	 7k5wdQfcdc8/NvFTdri0dxLEHwBlUVjUuDGieHRbYy2DfDptTNXojdulMCgq+8X/fh
	 OuLIo92dkWQACP4ZvvBzrkuto1TSAj5YoDMLzMaG28UBG4/XYAJqPpw7lkGgih8bGG
	 6xuliSoYYk55q+QQ997qhM1zSj2OdG2H+TJePuC9dtOIP9BhwBVe9pNoAnOqsNVsSx
	 1g0DPzqF3lple6P8Qkvv3QCV8a2g1qgC/vQ4Gc70gIgjcF5/JopO99TgD7ji8GpSnH
	 1K4JqjZQm0tkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C0D40962;
	Thu, 22 Jan 2026 19:25:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19511122
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F208A40156
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRNj2NHM4zKp for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04FCB4012B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04FCB4012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDE3287551; Thu, 22 Jan 2026 19:25:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:24:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 848b3c96d5892f127e659a4a602ff68e0cf69a4e
X-Git-Newrev: 291bf7c48cc7b88287510f62ec635c950be762ab
X-Patchwork-Hint: ignore
Message-Id: <20260122192552.EDE3287551@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/monit: bump version to 5.35.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=291bf7c48cc7b88287510f62ec635c950be762ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-configure.ac-fixes-missing-config-macro-dir.patch   | 12 +++++++-----
 package/monit/monit.hash                                     |  6 +++---
 package/monit/monit.mk                                       |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 9ed49e5797..6fa370dbea 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -1,4 +1,4 @@
-From 99b466f5448951a83a0d763e633906b28c30fc0a Mon Sep 17 00:00:00 2001
+From 347e94149e3caa038d66ee34d79bdb312d36cc49 Mon Sep 17 00:00:00 2001
 From: Jens Maus <mail@jens-maus.de>
 Date: Fri, 22 Sep 2023 21:32:18 +0200
 Subject: [PATCH] configure.ac: fixes missing config macro dir
@@ -12,18 +12,20 @@ Signed-off-by: Jens Maus <mail@jens-maus.de>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 [Bernd: rebased against 5.34.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Daniel: rebased against 5.35.2]
+Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
 ---
  configure.ac          | 2 +-
  libmonit/configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b4f2a14c..41a8c1a5 100644
+index 3a6cf4e6..477cdbaa 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -8,7 +8,7 @@ AC_PREREQ([2.53])
  # Example: 5.0_beta2
- AC_INIT([monit], [5.34.3], [monit-general@nongnu.org])
+ AC_INIT([monit], [5.35.2], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
@@ -31,7 +33,7 @@ index b4f2a14c..41a8c1a5 100644
  AC_CONFIG_SRCDIR([src/monit.c])
  AC_CONFIG_SUBDIRS([libmonit])
 diff --git a/libmonit/configure.ac b/libmonit/configure.ac
-index 800ebf83..03101a6b 100644
+index 84c1217c..c9d10fe2 100644
 --- a/libmonit/configure.ac
 +++ b/libmonit/configure.ac
 @@ -4,7 +4,7 @@ AC_PREREQ([2.53])
@@ -44,5 +46,5 @@ index 800ebf83..03101a6b 100644
  AC_CONFIG_SRCDIR([src])
  
 -- 
-2.47.0
+2.43.0
 
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 2c2956afa3..0f54aa08dd 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.34.3.tar.gz.sha256
-sha256  669d8b95ddec124d1444ba5264f67fdeae8e90e53b2929719f4750fc5ff3ba60  monit-5.34.3.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.35.2.tar.gz.sha256
+sha256  4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f  monit-5.35.2.tar.gz
 # Locally computed
-sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
+sha256  772cd55fbcb4e52a99f9440cb483cd348db05b7d0712c28023e36d9d5caf0b0f  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 7d78597c25..bb38d8245b 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.34.3
+MONIT_VERSION = 5.35.2
 MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
