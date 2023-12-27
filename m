Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A8DC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 19:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 340658261C;
	Wed, 27 Dec 2023 19:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 340658261C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZ37L1gR1mIt; Wed, 27 Dec 2023 19:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CB29825C7;
	Wed, 27 Dec 2023 19:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CB29825C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1FE1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA40660F2C
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA40660F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ui4gd7YBS5Vo for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B5F460ED4
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B5F460ED4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1389E836E0; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 20:15:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 078b8558b9e25917db680fdeb8d9c64db9aafc8e
X-Git-Newrev: 95a5ed75457f1511777c57075f33d34b3622a3de
X-Patchwork-Hint: ignore
Message-Id: <20231227192259.1389E836E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1/gstd: drop readline
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=95a5ed75457f1511777c57075f33d34b3622a3de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

readline is not a dependency since bump to version 0.15.0 in commit
cbd06adac50e304f413689febf676911ae29d967 and
https://github.com/RidgeRun/gstd-1.x/commit/978b503840e0f9ae99f732113babbc4fbfb2a770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstd/Config.in | 1 -
 package/gstreamer1/gstd/gstd.mk   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
index df1d2f59c3..bfe1a40bfd 100644
--- a/package/gstreamer1/gstd/Config.in
+++ b/package/gstreamer1/gstd/Config.in
@@ -10,7 +10,6 @@ config BR2_PACKAGE_GSTD
 	select BR2_PACKAGE_LIBEDIT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_READLINE
 	help
 	  GStreamer Daemon, also called gstd, is a GStreamer framework
 	  for controlling audio and video streaming using an
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index ccb3b3e1bc..965ede7949 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -17,8 +17,7 @@ GSTD_DEPENDENCIES = \
 	libdaemon \
 	libedit \
 	libglib2 \
-	libsoup \
-	readline
+	libsoup
 
 GSTD_CONF_OPTS = \
 	-Denable-tests=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
