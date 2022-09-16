Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4181ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 710A541CB7;
	Fri, 16 Sep 2022 11:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 710A541CB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W4xdvfTo3RGt; Fri, 16 Sep 2022 11:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C94741964;
	Fri, 16 Sep 2022 11:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C94741964
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF3B1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 721FA41C5F
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 721FA41C5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZZ5-317eOAj for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3DD419C7
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3DD419C7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B69A83CC0; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:20:15 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d0c57ba94cd0a0052e7a90d0f969dab24dc58bdd
X-Git-Newrev: 92e6ac8ae4bea28183159ed8fd253e1863d32ba6
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.5B69A83CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/freeswitch: fix
 typo on BR2_powerpc64le
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

commit: https://git.buildroot.net/buildroot/commit/?id=92e6ac8ae4bea28183159ed8fd253e1863d32ba6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The typo was added by commit from 2016
'0480bbc1a0 package/freeswitch: new package'

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a8753719312bdc99785f59896bbe4455ba69d8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeswitch/freeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index c576e5f267..24c1ee4dd4 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -80,7 +80,7 @@ FREESWITCH_CONF_OPTS = \
 
 # zrtp supports a limited set of archs, sparc support is also broken due
 # to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
-ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
+ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le)$(BR2_x86_64),y)
 FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c
 FREESWITCH_CONF_OPTS += --enable-zrtp
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
