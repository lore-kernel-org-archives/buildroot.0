Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC08C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 13:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814B682160;
	Sat, 11 Mar 2023 13:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814B682160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjCBNiYLDN8X; Sat, 11 Mar 2023 13:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCA4F81FE2;
	Sat, 11 Mar 2023 13:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA4F81FE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03E531BF33C
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 13:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93F8A8230F
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 13:09:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93F8A8230F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8M2C1eHbQ7HJ for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 13:09:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 255DD822DD
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 13:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255DD822DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E7F4861BF; Sat, 11 Mar 2023 13:09:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 14:08:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f
X-Git-Newrev: 243c76cfa6990d0743424fe5d1a30dda950166a3
X-Patchwork-Hint: ignore
Message-Id: <20230311130921.0E7F4861BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add dependency to
 host-python-glslang for Vulkan drivers
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

commit: https://git.buildroot.net/buildroot/commit/?id=243c76cfa6990d0743424fe5d1a30dda950166a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glslangValidator is needed since mesa3d-22.3.0:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/9786d9ef2abb45a4e832cf1347581e3ca3aae9f0#3968b0378040deeb22000cfaf80d720905d989fc_0_130

Fixes:
http://autobuild.buildroot.net/results/06a/06a429dcdf776ca32de4570f9a408da6a7e7333d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/mesa3d.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index cf2352a355..36b7151510 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -136,6 +136,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
 else
+MESA3D_DEPENDENCIES += host-python-glslang
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
