Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C2BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4122B4047D;
	Tue, 30 Nov 2021 16:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9SxHkG2MUm73; Tue, 30 Nov 2021 16:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84BFE4046D;
	Tue, 30 Nov 2021 16:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 824B01BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7217961BC1
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-hHkHElH-PT for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4258606B1
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6190A920D8; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:06:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 714abe3e25cd8b50bc02e4312374232cde8838f3
X-Git-Newrev: 563a3aa2397662e3b2adbddd077d187e8eedea7d
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.6190A920D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espeak: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=563a3aa2397662e3b2adbddd077d187e8eedea7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
10b6d10009c70262cfb492b2abaa3a091a8fb4aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/espeak/espeak.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index 347fcb607d..d592673ac5 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -32,7 +32,7 @@ define ESPEAK_CONFIGURE_CMDS
 endef
 
 define ESPEAK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) \
 		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
