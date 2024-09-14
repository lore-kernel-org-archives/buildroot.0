Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00B1C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02298470A;
	Sat, 14 Sep 2024 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuamIuQuMkLo; Sat, 14 Sep 2024 08:23:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A35B84787
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A35B84787;
	Sat, 14 Sep 2024 08:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 829BC1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04E5403EB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqJG-6PG4We6 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B41074033F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B41074033F
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF77586F63; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 686caaa5d47b2553b4a99109aa171a996cebf79b
X-Git-Newrev: 568a90b7afc05f9752d3077ea1646fb0aa8d060d
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.AF77586F63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libev: fix deactivate typo
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=568a90b7afc05f9752d3077ea1646fb0aa8d060d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libev/libev.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index cbd5433d76..80832d0c11 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -12,7 +12,7 @@ LIBEV_LICENSE_FILES = LICENSE
 
 # libev has some assembly function that is not present in Thumb mode:
 # Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
-# so, we desactivate Thumb mode
+# so, we deactivate Thumb mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBEV_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
