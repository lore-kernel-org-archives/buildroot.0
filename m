Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E848AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2EB7404BB;
	Mon,  6 Dec 2021 18:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03zUfhNPWSKg; Mon,  6 Dec 2021 18:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD0A3404B5;
	Mon,  6 Dec 2021 18:39:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F25B11BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E75AA41C56
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gb1hFg7WdJbo for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CDFB41C42
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A0EC181468; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:02:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0d0961d29e2ca4332a9b1f456a4c24696c57809
X-Git-Newrev: 1094f574d39238d6f5d79a6e7f7388543c181469
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.A0EC181468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: bump to version 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=1094f574d39238d6f5d79a6e7f7388543c181469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This addresses the autobuilder failure for master as per 2021-11-27.
The root cause was a name clash in a dependency, the libite library,
clashing with the DirectFB LiTE library header files.  Hence, this
update alone does not fix [1], libite also needs to be updated.  To
provide a smooth transition though, watchdogd should be updated first.

[1]: http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/watchdogd/watchdogd.hash | 2 +-
 package/watchdogd/watchdogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 7c1acf0820..09a34d6b47 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256 f36fdea9b323534a704c4c23d9af8050480bca4bdad89cdb50d26fcac316d172  watchdogd-3.4.tar.gz
+sha256 33ec4edc8cb4ada7a4d8324a27d897d33aae5e83257ed64d3d37508825c11237  watchdogd-3.5.tar.gz
 
 # Locally calculated
 sha256 fd685e20931174308c45a26418a7ce34d66704c4e4b92ab1d8299deb255cd676  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 34b17aa169..b666b56433 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 3.4
+WATCHDOGD_VERSION = 3.5
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
