Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65C2C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C46A432B1;
	Wed,  1 Nov 2023 22:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C46A432B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgLwcaJUzE2n; Wed,  1 Nov 2023 22:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 720E3432AF;
	Wed,  1 Nov 2023 22:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 720E3432AF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5318E1BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C949703D8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C949703D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id em7xlDftcWP9 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:10:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F2786FBA2
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F2786FBA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A9BE864E2; Wed,  1 Nov 2023 22:10:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 23:10:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dd5390be6b210eaac1bf02af2fea84d4c87dcd1
X-Git-Newrev: 5868ce7a50c84bdacb5c2636f5eeaa958ba9f1a0
X-Patchwork-Hint: ignore
Message-Id: <20231101221057.7A9BE864E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgeos: drop DISABLE_GEOS_INLINE
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

commit: https://git.buildroot.net/buildroot/commit/?id=5868ce7a50c84bdacb5c2636f5eeaa958ba9f1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DISABLE_GEOS_INLINE has ben dropped since version 3.11.0 and
https://github.com/libgeos/geos/commit/1516e42eeae3b3114585f1e94a0e723d835f7757

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
