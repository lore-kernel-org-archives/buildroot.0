Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCFBC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 22:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA6383EE8;
	Sun, 17 Jul 2022 22:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA6383EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OotBYBHV9J8B; Sun, 17 Jul 2022 22:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E878135C;
	Sun, 17 Jul 2022 22:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E878135C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 741711BF59E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F866829B6
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F866829B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mpj3zRf3a6L4 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 22:05:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 926428293F
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 22:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 926428293F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 867AE83C59; Sun, 17 Jul 2022 21:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:33:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b68e509790f095e5c83b10d2af3d6b262708a3ea
X-Git-Newrev: 6832b9b28398e64c34bd5522fadacd42a9c57ab7
X-Patchwork-Hint: ignore
Message-Id: <20220717215231.867AE83C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libabseil-cpp:
 drop unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=6832b9b28398e64c34bd5522fadacd42a9c57ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

ABSL_RUN_TESTS has been replaced by the standard BUILD_TESTING option
(which is already passed by cmake infrastructure) since version
20210324.0 and
https://github.com/abseil/abseil-cpp/commit/a50ae369a30f99f79d7559002aba3413dac1bd48

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6d0c0f1a431de6b5066f7362b119963c8ac4be9e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
