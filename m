Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC4EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA3160A9C;
	Sun, 13 Feb 2022 14:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJqfBV2_6hPx; Sun, 13 Feb 2022 14:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B46360758;
	Sun, 13 Feb 2022 14:44:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31CF51BF841
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 209A860758
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 14:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZwuYhnYoj9M for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 14:44:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53C4960608
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 14:44:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EA37082901; Sun, 13 Feb 2022 14:36:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 15:44:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9324d53bc5114cf862602cafcf214adfc7375d32
X-Git-Newrev: 9f22134430f00edcfb9093f6095b1b5f72c27069
X-Patchwork-Hint: ignore
Message-Id: <20220213143638.EA37082901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: fix fourth patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f22134430f00edcfb9093f6095b1b5f72c27069
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of fourth
patch in commit 8251d8c2559b25f11684776fc343059cf100657d:

1 out of 22 hunks FAILED -- saving rejects to file CMakeLists.txt.rej

Fixes:
 - http://autobuild.buildroot.org/results/44f6d7c61316e90d22e75cb1fb77c3bc5b31ad66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grpc/0004-host-grpc-only-cpp-plugin.patch | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/grpc/0004-host-grpc-only-cpp-plugin.patch b/package/grpc/0004-host-grpc-only-cpp-plugin.patch
index 43fad7e3d6..c97d9a9385 100644
--- a/package/grpc/0004-host-grpc-only-cpp-plugin.patch
+++ b/package/grpc/0004-host-grpc-only-cpp-plugin.patch
@@ -10,6 +10,7 @@ others.
 Upstream-status: not accepted (see https://github.com/grpc/grpc/issues/25322)
 
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  CMakeLists.txt | 43 +++++++++++++++++++++++++++++++++++--------
  1 file changed, 35 insertions(+), 8 deletions(-)
@@ -167,15 +168,6 @@ index e8934a3e03..c2df332cc6 100644
  add_executable(check_epollexclusive
    test/build/check_epollexclusive.c
  )
-@@ -3906,8 +3931,6 @@ target_link_libraries(gen_hpack_tables
-   gpr
- )
- 
--
--
- add_executable(gen_legal_metadata_characters
-   tools/codegen/core/gen_legal_metadata_characters.cc
- )
 @@ -3958,6 +3981,8 @@ target_link_libraries(gen_percent_encoding_tables
    ${_gRPC_ALLTARGETS_LIBRARIES}
  )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
