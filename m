Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E4EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCD360FA5;
	Sat,  1 Jul 2023 14:16:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CCD360FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y48MWkIHOnZf; Sat,  1 Jul 2023 14:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D1460EFF;
	Sat,  1 Jul 2023 14:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94D1460EFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E61D1BF868
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4734E40452
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4734E40452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3pYOy8j58sF for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B4AB40003
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B4AB40003
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33D4D85F02; Sat,  1 Jul 2023 14:15:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 16:14:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d9ccbcd109e69e341864c975f593cedb2ec6ae8
X-Git-Newrev: ef46caffda82e23d1767247ad92891f4b5ccb9ac
X-Patchwork-Hint: ignore
Message-Id: <20230701141558.33D4D85F02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: bump version to 1.6.40
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ef46caffda82e23d1767247ad92891f4b5ccb9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/png-mng/mailman/message/37860896/

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/9923515ff441b4c07ce3f8c9985a547fe582c4da

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpng/libpng.hash | 8 +++-----
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index c1f65c93af..d864850b06 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,4 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.39/
-md5  aa1ae92e172417039bda072b702f6326  libpng-1.6.39.tar.xz
-sha1  3f2386d61eccae211ec4f57899e4ac2ca60d390b  libpng-1.6.39.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/37860896/
+sha256  535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1  libpng-1.6.40.tar.xz
 # Locally computed:
-sha256  1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937  libpng-1.6.39.tar.xz
-sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
+sha256  5c0bb4b05b1354ae7c173532b6702ea68b611047ff9b91c4d3af77da39c195d9  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index a18c36fe78..b7bacd9217 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.39
+LIBPNG_VERSION = 1.6.40
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
