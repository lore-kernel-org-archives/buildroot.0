Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D01C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE2B60FD5;
	Sun, 10 Apr 2022 20:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-krt7IRGv4y; Sun, 10 Apr 2022 20:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A62560F84;
	Sun, 10 Apr 2022 20:05:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A79E21BF3E1
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B9E83F8E
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hoaG8kpaUrG1 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:05:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE2983F62
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:05:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AFF84838FA; Sun, 10 Apr 2022 19:56:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 22:05:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c96d6925f2e810bddbc8d4a1a98a7d42c66ad339
X-Git-Newrev: 2759c40df782ca4f936c3dc995a27bf6cb9020b4
X-Patchwork-Hint: ignore
Message-Id: <20220410195609.AFF84838FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=2759c40df782ca4f936c3dc995a27bf6cb9020b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:intel:threading_building_blocks is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aintel%3Athreading_building_blocks

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tbb/tbb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index e5929388a2..87e83551fe 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -9,6 +9,8 @@ TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
 TBB_LICENSE_FILES = LICENSE
+TBB_CPE_ID_VENDOR = intel
+TBB_CPE_ID_PRODUCT = threading_building_blocks
 
 TBB_SO_VERSION = 2
 TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
