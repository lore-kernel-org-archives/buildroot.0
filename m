Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB95C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 16:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAB7611DB;
	Sat,  4 Jun 2022 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id breMZNp-SojM; Sat,  4 Jun 2022 16:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 251EF611AB;
	Sat,  4 Jun 2022 16:29:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94DB31BF3E9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AB7540AA0
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAPr87ClDKT1 for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 16:29:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF1BB4002B
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 16:29:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DDE8486AD4; Sat,  4 Jun 2022 16:17:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 18:29:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 480d76342df775fe36d987f597224fd7cfa18111
X-Git-Newrev: 555d2f0f4d81e239d0d189b92c7611095bc0af04
X-Patchwork-Hint: ignore
Message-Id: <20220604161746.DDE8486AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtest: merge
 BR2_PACKAGE_GTEST_GMOCK blocks
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

commit: https://git.buildroot.net/buildroot/commit/?id=555d2f0f4d81e239d0d189b92c7611095bc0af04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 6a9c6311f8fd4464b5555773589f587338f694a0, two
BR2_PACKAGE_GTEST_GMOCK blocks are used instead of one which is a little
bit unusual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gtest/gtest.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index e7ce89a3f4..8ec5e9c535 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -13,10 +13,6 @@ GTEST_LICENSE_FILES = LICENSE
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_PRODUCT = google_test
 
-ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
-GTEST_DEPENDENCIES += host-gtest
-endif
-
 HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
 HOST_GTEST_DEPENDENCIES = host-python3
@@ -38,6 +34,7 @@ GTEST_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+GTEST_DEPENDENCIES += host-gtest
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
 else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
