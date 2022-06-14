Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6499FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4F5409A5;
	Tue, 14 Jun 2022 18:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZNjbZawLeIhP; Tue, 14 Jun 2022 18:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB9FA40933;
	Tue, 14 Jun 2022 18:49:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 290731BF9B5
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFE9740933
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXL_fshmyYZq for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A826C40A02
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A7D40870E1; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 466d1226848053e0e3526f2c2e282b5d97f4302f
X-Git-Newrev: 6d0c0f1a431de6b5066f7362b119963c8ac4be9e
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.A7D40870E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: drop unrecognized
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d0c0f1a431de6b5066f7362b119963c8ac4be9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ABSL_RUN_TESTS has been replaced by the standard BUILD_TESTING option
(which is already passed by cmake infrastructure) since version
20210324.0 and
https://github.com/abseil/abseil-cpp/commit/a50ae369a30f99f79d7559002aba3413dac1bd48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libabseil-cpp/libabseil-cpp.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 738cd03c39..7c6bda7659 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -13,14 +13,12 @@ LIBABSEIL_CPP_INSTALL_STAGING = YES
 LIBABSEIL_CPP_CONF_OPTS = \
 	-DCMAKE_CXX_STANDARD=11 \
 	-DABSL_ENABLE_INSTALL=ON \
-	-DABSL_USE_GOOGLETEST_HEAD=OFF \
-	-DABSL_RUN_TESTS=OFF
+	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 HOST_LIBABSEIL_CPP_CONF_OPTS = \
 	-DCMAKE_CXX_STANDARD=11 \
 	-DABSL_ENABLE_INSTALL=ON \
-	-DABSL_USE_GOOGLETEST_HEAD=OFF \
-	-DABSL_RUN_TESTS=OFF
+	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
