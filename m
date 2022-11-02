Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521C9C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 07:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F119860881;
	Wed,  2 Nov 2022 07:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F119860881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBzjwZZ9PyyQ; Wed,  2 Nov 2022 07:19:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C03B36072A;
	Wed,  2 Nov 2022 07:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C03B36072A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBEB91BF373
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 07:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15194402DC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 07:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15194402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QsKjYpys0tEh for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 07:13:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E43C1401EB
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 07:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43C1401EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E103387A49; Wed,  2 Nov 2022 07:13:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Nov 2022 08:11:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 5837fe9964016a8d682b7095ac0cd4cbe3a5f3df
X-Git-Newrev: 1adf0b06988b43752ed02a6b9ae308e0c09f88f5
X-Patchwork-Hint: ignore
Message-Id: <20221102071333.E103387A49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lrzip: security
 bump to version 0.651
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

commit: https://git.buildroot.net/buildroot/commit/?id=1adf0b06988b43752ed02a6b9ae308e0c09f88f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix CVE-2022-26291: lrzip v0.641 was discovered to contain a multiple
  concurrency use-after-free between the functions zpaq_decompress_buf()
  and clear_rulist(). This vulnerability allows attackers to cause a
  Denial of Service (DoS) via a crafted Irz file.
- Use official tarball and so drop autoreconf

https://github.com/ckolivas/lrzip/blob/v0.651/WHATS-NEW

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit edbdad93979ce8521653b4031235fd0fa9d438c9)
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
