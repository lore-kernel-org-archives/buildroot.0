Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4329610C8
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4329610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB725406C0;
	Tue,  7 Sep 2021 13:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZiXD_ifMKqD; Tue,  7 Sep 2021 13:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6871404D9;
	Tue,  7 Sep 2021 13:01:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A58F1BF995
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 575A160635
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37e7rS_3maA4 for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99D60605B5
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E325F88807; Tue,  7 Sep 2021 12:59:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 15:00:11 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 78c963244a88bf1f9c03a601eb8d791745770021
X-Git-Newrev: aab37f5a6f2a46769f5147f7c36ee5c35a05bf0e
X-Patchwork-Hint: ignore
Message-Id: <20210907125926.E325F88807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/ushare: fix NLS
 build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=aab37f5a6f2a46769f5147f7c36ee5c35a05bf0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Commit c4e1a075101914f8e0d47f8bb9c06bea13ba0fd2 forgot to add
--enable-nls to patch resulting in the following build failure:

Unknown option "--enable-nls".

Fixes:
 - http://autobuild.buildroot.org/results/6ab2555b419355f01310f230fe612f2a3699bbfd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e63c8ceeea0aeb2c499b994dc0c819e3234c5e3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Don-t-build-po-files-if-NLS-is-disabled.patch | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
index f0fa89998f..3fbda2838e 100644
--- a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
+++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
@@ -1,4 +1,4 @@
-From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
+From c9f5783bb2df4a19c6281daeda30e8ab905d2ca3 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sun, 22 Aug 2021 10:44:48 +0200
 Subject: [PATCH] Don't build po files if NLS is disabled
@@ -7,8 +7,8 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: https://github.com/ddugovic/uShare/pull/12]
 ---
  Makefile  | 7 +++++--
- configure | 1 +
- 2 files changed, 6 insertions(+), 2 deletions(-)
+ configure | 3 +++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
 index ebd8f91..6686cfd 100644
@@ -31,10 +31,19 @@ index ebd8f91..6686cfd 100644
  	for subdir in $(SUBDIRS); do \
  	  $(MAKE) -C $$subdir $@; \
 diff --git a/configure b/configure
-index 4a3efe0..162a776 100755
+index 4a3efe0..f48806a 100755
 --- a/configure
 +++ b/configure
-@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
+@@ -414,6 +414,8 @@ for opt do
+   ;;
+   --with-libdlna-dir=*) libdlnadir="$optval";
+   ;;
++  --enable-nls) nls="yes"
++  ;;
+   --disable-nls) nls="no"
+   ;;
+   --enable-dlna) dlna="yes"
+@@ -723,6 +725,7 @@ append_config "LDFLAGS=$LDFLAGS"
  append_config "INSTALL=$INSTALL"
  
  append_config "DEBUG=$debug"
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
