Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87394C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 12:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C294417FC;
	Wed,  8 Nov 2023 12:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C294417FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzpTHnO85C-V; Wed,  8 Nov 2023 12:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F9DB41820;
	Wed,  8 Nov 2023 12:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9DB41820
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D640C1BF954
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0CD981F1D
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0CD981F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNANWArM8fpn for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC8D481EFD
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC8D481EFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C76E986C93; Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 13:27:24 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 9dbb7a112c0d2e307fe0417a8bbd29a619520c92
X-Git-Newrev: 6b2e2e737bdabc6fe9c8d6b51198ee785eef64af
X-Patchwork-Hint: ignore
Message-Id: <20231108122825.C76E986C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libgeos: drop
 DISABLE_GEOS_INLINE
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b2e2e737bdabc6fe9c8d6b51198ee785eef64af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

DISABLE_GEOS_INLINE has ben dropped since version 3.11.0 and
https://github.com/libgeos/geos/commit/1516e42eeae3b3114585f1e94a0e723d835f7757

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5868ce7a50c84bdacb5c2636f5eeaa958ba9f1a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeos/libgeos.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index e0931dbb30..70f8ca3495 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -19,10 +19,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 LIBGEOS_CXXFLAGS += -O0
 endif
 
-ifeq ($(BR2_arm)$(BR2_armeb),y)
-LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
-endif
-
 ifeq ($(BR2_or1k),y)
 LIBGEOS_CXXFLAGS += -mcmodel=large
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
