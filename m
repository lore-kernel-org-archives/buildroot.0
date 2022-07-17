Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE8CC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 22:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8577F833A0;
	Sun, 17 Jul 2022 22:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8577F833A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvAFO5NMXfhX; Sun, 17 Jul 2022 22:05:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B7E8293F;
	Sun, 17 Jul 2022 22:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B7E8293F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 370F91BF59E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18A7E4046D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 22:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18A7E4046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNEyQOJ1OnB6 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 22:05:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20BCE40199
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 22:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20BCE40199
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 144E183C53; Sun, 17 Jul 2022 21:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:30:19 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 7b4ac44b3517fc36c95de5cf9591ed3322bf5096
X-Git-Newrev: 10b59d2cb499cf3649cc4d62228373ecbeee83ca
X-Patchwork-Hint: ignore
Message-Id: <20220717215225.144E183C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libabseil-cpp:
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

commit: https://git.buildroot.net/buildroot/commit/?id=10b59d2cb499cf3649cc4d62228373ecbeee83ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
