Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04EFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 732B784200;
	Wed, 16 Mar 2022 21:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGtvArUpMl2u; Wed, 16 Mar 2022 21:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD345841D8;
	Wed, 16 Mar 2022 21:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E96601BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1BB14071E
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XO-Qc9JKhwFP for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90B8840882
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5D8128424A; Wed, 16 Mar 2022 21:35:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:43:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bcedaa732b539e4ad32776e867ef9626ffca5b7
X-Git-Newrev: e820feba362a29a310ed3a93c8ad5546ceb8a2ee
X-Patchwork-Hint: ignore
Message-Id: <20220316213525.5D8128424A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynaddsubfx: add portaudio
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e820feba362a29a310ed3a93c8ad5546ceb8a2ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

portaudio is an optional dependency (enabled by default) since the
addition of the package in commit
18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zynaddsubfx/zynaddsubfx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index 461146aae8..aff9ac4bf4 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -37,4 +37,11 @@ else
 ZYNADDSUBFX_CONF_OPTS += -DJackEnable=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+ZYNADDSUBFX_DEPENDENCIES += portaudio
+ZYNADDSUBFX_CONF_OPTS += -DPaEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DPaEnable=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
