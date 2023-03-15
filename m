Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445FAC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 15:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB29041910;
	Wed, 15 Mar 2023 15:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB29041910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRDom4zxchxN; Wed, 15 Mar 2023 15:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44AC4190C;
	Wed, 15 Mar 2023 15:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44AC4190C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E71D91BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CED2E81407
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED2E81407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_v5bKwnIuzg for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0800C8134A
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 15:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0800C8134A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC4E987455; Wed, 15 Mar 2023 15:06:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 16:02:49 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 53405e589c5b26472b9cb000e25e42644d6357d0
X-Git-Newrev: fe1d532ac2c27a662e51a06c879521be92ddcbe2
X-Patchwork-Hint: ignore
Message-Id: <20230315150626.EC4E987455@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/pulseaudio: fix
 build without avahi-client
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe1d532ac2c27a662e51a06c879521be92ddcbe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure without avahi-client raised since commit
7752afbe4bb9fa1def5ba89daf21564ea58af79a (before this commit, avahi was
silently disabled):

../output-1/build/pulseaudio-16.1/meson.build:754:2: ERROR: Dependency "avahi-client" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/0aea014eb4ed27870af908668d7b138d150f065a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 63e33bf88dd2138c4caa3dbfd5e1d89518ddd398)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 8c4b99b6ff..89191db541 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -25,7 +25,7 @@ PULSEAUDIO_DEPENDENCIES = \
 
 PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 PULSEAUDIO_CONF_OPTS += -Davahi=enabled
 PULSEAUDIO_DEPENDENCIES += avahi
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
