Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92657C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485C1613ED;
	Wed, 10 Jan 2024 10:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485C1613ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uVqLdW0r4qx; Wed, 10 Jan 2024 10:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4743613D3;
	Wed, 10 Jan 2024 10:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4743613D3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 99D121BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80143613D3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80143613D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uRJrQG-knCLe for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C449A607C0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C449A607C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B24568553F; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 11:20:35 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 280aa23da67c1f301bf06dd8352d3fd551ed476d
X-Git-Newrev: 8529a89b0f79171208a6649ea9bf0172c301c267
X-Patchwork-Hint: ignore
Message-Id: <20240110102650.B24568553F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gstreamer1/gstd:
 drop readline dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=8529a89b0f79171208a6649ea9bf0172c301c267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

readline is not a dependency since bump to version 0.15.0 in commit
cbd06adac50e304f413689febf676911ae29d967 and
https://github.com/RidgeRun/gstd-1.x/commit/978b503840e0f9ae99f732113babbc4fbfb2a770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 95a5ed75457f1511777c57075f33d34b3622a3de)
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
