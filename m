Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B714C38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 18:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A1B4156D;
	Fri, 21 Oct 2022 18:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A1B4156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SpqMonYrR8N; Fri, 21 Oct 2022 18:52:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E15BB40223;
	Fri, 21 Oct 2022 18:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E15BB40223
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF071BF863
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29AAB40223
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29AAB40223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Gl8y_C2MTnB for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F76340104
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F76340104
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DA3E86F48; Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 20:47:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49b11f5e787f68cc310e97a539ad7ed29b041919
X-Git-Newrev: aee1cc302f6da050b198ea63a7c78e62579aed97
X-Patchwork-Hint: ignore
Message-Id: <20221021185221.4DA3E86F48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlog: bump to version 1.2.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=aee1cc302f6da050b198ea63a7c78e62579aed97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/HardySimpson/zlog/releases/tag/1.2.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fer-overflow-at-zlog_conf_build_with_file.patch | 25 ----------------------
 package/zlog/zlog.hash                             |  2 +-
 package/zlog/zlog.mk                               |  5 +----
 3 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch b/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
deleted file mode 100644
index d5f23e1b26..0000000000
--- a/package/zlog/0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a5be8b3a8ddc498de4ad041757285136a55d97e3 Mon Sep 17 00:00:00 2001
-From: XiangfeiCH <chenthrone@163.com>
-Date: Tue, 12 Apr 2022 00:13:35 +0800
-Subject: [PATCH] Fix stack-buffer-overflow at zlog_conf_build_with_file
-
-[Retrieved from:
-https://github.com/HardySimpson/zlog/commit/a5be8b3a8ddc498de4ad041757285136a55d97e3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/conf.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/conf.c b/src/conf.c
-index 0f862fa..9a4cb75 100644
---- a/src/conf.c
-+++ b/src/conf.c
-@@ -305,7 +305,7 @@ static int zlog_conf_build_with_file(zlog_conf_t * a_conf)
- 				/* Oops the buffer is full - what now? */
- 				pline = line;
- 			} else {
--				for (p--; isspace((int)*p); --p)
-+				for (p--; p >= line && isspace((int)*p); --p)
- 					/*EMPTY*/;
- 				p++;
- 				*p = 0;
diff --git a/package/zlog/zlog.hash b/package/zlog/zlog.hash
index c39505b2c6..3b7c6aa78c 100644
--- a/package/zlog/zlog.hash
+++ b/package/zlog/zlog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00037ab8d52772a95d645f1dcfd2c292b7cea326b54e63e219a5b7fdcb7e6508  zlog-1.2.15.tar.gz
+sha256  742401902f2134eb272c49631fe5c38d7aeb9a2ad56fa3ec3d15219b371ba655  zlog-1.2.16.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index 1929a45a3e..329f2cfe2c 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-ZLOG_VERSION = 1.2.15
+ZLOG_VERSION = 1.2.16
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
 ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
-# 0001-Fix-stack-buffer-overflow-at-zlog_conf_build_with_file.patch
-ZLOG_IGNORE_CVES += CVE-2021-43521
-
 define ZLOG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
