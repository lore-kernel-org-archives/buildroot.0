Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9414CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 422EC4090B;
	Sun, 16 Oct 2022 15:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422EC4090B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-uM48VQRBvh; Sun, 16 Oct 2022 15:07:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D9DE40442;
	Sun, 16 Oct 2022 15:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9DE40442
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19BD91BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A1694058C
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A1694058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYARhDH0vzSI for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:04:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5132D403EC
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5132D403EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C9FD86755; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:01:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51812c339078e5db20ef8dec06b24c36a0d22208
X-Git-Newrev: edbdad93979ce8521653b4031235fd0fa9d438c9
X-Patchwork-Hint: ignore
Message-Id: <20221016150425.3C9FD86755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lrzip: security bump to version
 0.651
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

commit: https://git.buildroot.net/buildroot/commit/?id=edbdad93979ce8521653b4031235fd0fa9d438c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2022-26291: lrzip v0.641 was discovered to contain a multiple
  concurrency use-after-free between the functions zpaq_decompress_buf()
  and clear_rulist(). This vulnerability allows attackers to cause a
  Denial of Service (DoS) via a crafted Irz file.
- Use official tarball and so drop autoreconf

https://github.com/ckolivas/lrzip/blob/v0.651/WHATS-NEW

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lrzip/lrzip.hash | 2 +-
 package/lrzip/lrzip.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index 19295383c3..cb03ff07cc 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b6b4bb1ae76dafbaab96ec9d50d41af5fed45a6c4f2e06feea828c2cd8025c0  lrzip-0.641.tar.gz
+sha256  48bd8decb097c1596c9b3777959cd3e332819434ed77a2823e65aa436f1602f9  lrzip-0.651.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 27d9fde204..0375696414 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 0.641
-LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
-LRZIP_AUTORECONF = YES
+LRZIP_VERSION = 0.651
+LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
+LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
 LRZIP_CPE_ID_VENDOR = long_range_zip_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
