Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBEECDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA28D60BAA;
	Fri, 13 Oct 2023 15:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA28D60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SenwgWbOHnKc; Fri, 13 Oct 2023 15:05:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3837F6F58D;
	Fri, 13 Oct 2023 15:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3837F6F58D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 471901BF2C1
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E6D280E92
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E6D280E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dF8tJUrWIvZk for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:04:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E471C80DB2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E471C80DB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2FD2847B6; Fri, 13 Oct 2023 15:04:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:59:20 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7590babc70e7994ebdb940d257734925aef511a0
X-Git-Newrev: 20542acda60788162fef0c3043df8ccb2d9ef610
X-Patchwork-Hint: ignore
Message-Id: <20231013150445.D2FD2847B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/enlightenment:
 security bump to version 0.25.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=20542acda60788162fef0c3043df8ccb2d9ef610
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This is a bugfix release which fixes a CVE.

See:
https://www.enlightenment.org/news/2022-09-15-enlightenment-0.25.4

CVE-2022-37706 "enlightenment_sys in Enlightenment before 0.25.4 allows
local users to gain privileges because it is setuid root, and the system
library function mishandles pathnames that begin with a /dev/..
substring."

Hashes were never part of the online news page, therefore mark them as
locally computed.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 83ffe153faa97b08acbfd0d15d4ca7f77604c17a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/enlightenment/enlightenment.hash | 5 +++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 2d977b86f7..ed5d6b24ef 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,4 +1,5 @@
-# From https://www.enlightenment.org/news/2022-01-03-enlightenment-0.25.1
-sha256  2cf05fe3d96ef35e823619dbc0ac513ecabcae2186800ecd804924a637112444  enlightenment-0.25.1.tar.xz
+# From https://www.enlightenment.org/news/2022-09-15-enlightenment-0.25.4
+sha256  56db5d206b821b9a8831d26e713e410ac70b2255a6f43fcdf7c01eefde23b7a2  enlightenment-0.25.4.tar.xz
+# Locally computed
 sha256  8d2fbc393e967cd6f5b8559d1744881a6a1ceb3ec6e1c2368c3916809ffccb8d  COPYING
 sha256  cdc77ee1732455b203610f923fe4196046b3f7509038c48dc0b0c7e3492c23f3  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 95670e800d..836c6e581d 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.25.1
+ENLIGHTENMENT_VERSION = 0.25.4
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
