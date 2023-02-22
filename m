Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259EAC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C20484053D;
	Wed, 22 Feb 2023 17:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C20484053D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9Hw9jVMMIfn; Wed, 22 Feb 2023 17:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DF240B64;
	Wed, 22 Feb 2023 17:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DF240B64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 274DD1BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C99F81423
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C99F81423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwMT2EleMhEU for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58E5781430
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E5781430
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4608B867CA; Wed, 22 Feb 2023 17:08:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:39:44 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3fe2713152e60fe63e8fc78d9baf58fee18a3473
X-Git-Newrev: ef6d357f261bb9209e781f9ca7e33b7bd28b653d
X-Patchwork-Hint: ignore
Message-Id: <20230222170816.4608B867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pugixml: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef6d357f261bb9209e781f9ca7e33b7bd28b653d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index e77ab1a799..bbcb913da6 100644
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
