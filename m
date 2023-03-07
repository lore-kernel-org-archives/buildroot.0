Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B2C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CF936112A;
	Tue,  7 Mar 2023 21:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CF936112A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iXTww_ENq2L; Tue,  7 Mar 2023 21:33:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 863C461102;
	Tue,  7 Mar 2023 21:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 863C461102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D18901BF3B0
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACCEC40B7D
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACCEC40B7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCxPeJWIgr28 for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:33:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B171400FE
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B171400FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23CA686A3C; Tue,  7 Mar 2023 21:33:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Mar 2023 22:24:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08a52da2058829216400822e2cd7a1c1c2600eeb
X-Git-Newrev: 3f512366d7a0d96c9e4451beb40457ef592d9103
X-Patchwork-Hint: ignore
Message-Id: <20230307213318.23CA686A3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: remove non-existing
 build tags
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f512366d7a0d96c9e4451beb40457ef592d9103
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The seccomp and apparmor build tags have been removed in 23.0.0. Don't
use those buildtags anymore.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ca1aa27b0a..0ecb5d2251 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -28,11 +28,9 @@ DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
-DOCKER_ENGINE_TAGS += apparmor
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_ENGINE_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
