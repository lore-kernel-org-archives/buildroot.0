Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A4BD64098
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 21:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DBB845D6;
	Fri,  8 Nov 2024 21:53:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNPL-vJF0qvu; Fri,  8 Nov 2024 21:53:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A414D845DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A414D845DC;
	Fri,  8 Nov 2024 21:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDB0C978
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5885845D7
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4RkLsGrqjUq for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 21:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E435A845D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E435A845D6
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 21:53:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEE3085E9A; Fri,  8 Nov 2024 21:53:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 8 Nov 2024 22:47:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5bb457d5d703aa327354236729dff1f261348ac
X-Git-Newrev: 618b5229a52d97035dbd6bf536cd40890c6f2110
X-Patchwork-Hint: ignore
Message-Id: <20241108215337.CEE3085E9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iotools: update to version 1.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=618b5229a52d97035dbd6bf536cd40890c6f2110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is minor update to iotools to fix some issues Aaron noticed and
addressed. The bigger change will come later with better integration
with the regular build systems (CMake).

Cc: Aaron Sierra <aaron@bubbl-tek.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Jarkko Sakkinen <jarkko@kernel.org>
[Julien: removed the "v" in version number]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iotools/iotools.hash | 2 +-
 package/iotools/iotools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iotools/iotools.hash b/package/iotools/iotools.hash
index 6b1ef3d47d..a72d2a6983 100644
--- a/package/iotools/iotools.hash
+++ b/package/iotools/iotools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  iotools-1.7.tar.gz
+sha256  9cb6184030b2e5c2e6a7c7a2d016d29d42d4075a77e1ba982bdc3cd919491faf  iotools-1.8.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
index 5c5a657cab..d855f44a05 100644
--- a/package/iotools/iotools.mk
+++ b/package/iotools/iotools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOTOOLS_VERSION = 1.7
+IOTOOLS_VERSION = 1.8
 IOTOOLS_SITE = $(call github,andy-shev,iotools,v$(IOTOOLS_VERSION))
 IOTOOLS_LICENSE = GPL-2.0+
 IOTOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
