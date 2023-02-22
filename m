Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA71EC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 869A241736;
	Wed, 22 Feb 2023 17:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 869A241736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ce32CR4yMCD; Wed, 22 Feb 2023 17:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9360D4174F;
	Wed, 22 Feb 2023 17:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9360D4174F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4880C1BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 779D34052C
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 779D34052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJhO-H5CUTXr for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A923240545
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A923240545
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98AB0867CA; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:43:46 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4dd50584123986cb032776a3ede0c62eeb11fab7
X-Git-Newrev: 85b4570d63762886188122aec3771d79fbab3660
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.98AB0867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/pugixml: fix
 configuration options
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

commit: https://git.buildroot.net/buildroot/commit/?id=85b4570d63762886188122aec3771d79fbab3660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Commit upstream 1c5a0bb32583fd294022e68e66b541bf6ff71a67
":sparkles: Update CMake to modern approach" removed all feature
toogles, so starting from release v1.11 any flag passed in BUILD_DEFINES
was completely ignored during the build.
Version 1.11.4 was in use in buildroot since February 2021.

Commit upstream 0f1e75a902ef1751dd63a67fe223b5e8daf4c7f1
"Re-introduced the custom build defines" added PUGIXML_BUILD_DEFINES to
release v1.12, but BUILD_DEFINES is still completely ignored during the
build.
Version 1.12.1 is in use in buildroot since March 2022.

So switch the config options to use PUGIXML_BUILD_DEFINES instead of
BUILD_DEFINES.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cc3a4a7b1de7b158354c650d234339e8a969a730)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 6c756e9c29..c54148d98f 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -29,11 +29,11 @@ ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
 
-PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
+PUGIXML_CONF_OPTS += -DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 
 HOST_PUGIXML_CONF_OPTS += \
 	-DBUILD_PKGCONFIG=ON \
-	-DBUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
+	-DPUGIXML_BUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
