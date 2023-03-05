Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C76C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 14:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC6180C39;
	Sun,  5 Mar 2023 14:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC6180C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fo9FitepEoK; Sun,  5 Mar 2023 14:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD81980EA4;
	Sun,  5 Mar 2023 14:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD81980EA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27A261BF41B
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FE47819C8
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 14:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FE47819C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWtj0fqy78uF for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A30C981B14
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30C981B14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90DDE862A3; Sun,  5 Mar 2023 14:27:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 15:23:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c29b4281d5a1c55739c62438f8d7676d7a16823
X-Git-Newrev: d7085ab3eaeb05fedefdb862efe78ad85ab80187
X-Patchwork-Hint: ignore
Message-Id: <20230305142700.90DDE862A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exfat-utils: security bump to
 version 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7085ab3eaeb05fedefdb862efe78ad85ab80187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-29973: relan exFAT 1.3.0 allows local users to obtain
sensitive information (data from deleted files in the filesystem) in
certain situations involving offsets beyond ValidDataLength.

https://github.com/relan/exfat/releases/tag/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat-utils/exfat-utils.hash | 2 +-
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index 6c6e09ccf0..b4ed8bc568 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835  exfat-utils-1.3.0.tar.gz
+sha256  241575fa93104406a47e79e53e4d907bae69886f11621f70a45276c62b75bf69  exfat-utils-1.4.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index fa471952f2..c02cefb0c5 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.3.0
+EXFAT_UTILS_VERSION = 1.4.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-2.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
