Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB13C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 13:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F6D41844;
	Wed, 15 Mar 2023 13:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F6D41844
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeGKtqIk5iMq; Wed, 15 Mar 2023 13:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CA164195C;
	Wed, 15 Mar 2023 13:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA164195C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2351BF31D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02FFC403AE
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FFC403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KW5OP3SEYJdo for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 13:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2934140184
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2934140184
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18A84873E6; Wed, 15 Mar 2023 13:09:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 14:03:28 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f0e9d63690dd7623dc13bc7700b22a370d86748d
X-Git-Newrev: cb2d0c50e63383768fad45e4fae17a84b620e59a
X-Patchwork-Hint: ignore
Message-Id: <20230315130904.18A84873E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exfat-utils:
 security bump to version 1.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb2d0c50e63383768fad45e4fae17a84b620e59a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-29973: relan exFAT 1.3.0 allows local users to obtain
sensitive information (data from deleted files in the filesystem) in
certain situations involving offsets beyond ValidDataLength.

https://github.com/relan/exfat/releases/tag/v1.4.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d7085ab3eaeb05fedefdb862efe78ad85ab80187)
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
