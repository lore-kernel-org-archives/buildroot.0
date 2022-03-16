Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EE8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F6A611E5;
	Wed, 16 Mar 2022 21:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xIEe6tyqAnm; Wed, 16 Mar 2022 21:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A249F60BED;
	Wed, 16 Mar 2022 21:44:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49D691BF9C6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 365B24088B
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hHEXKCo02hd for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 825A64071E
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4E73884249; Wed, 16 Mar 2022 21:35:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:43:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fc2191845799ae2358b752fa29839817d33ad82
X-Git-Newrev: 3bcedaa732b539e4ad32776e867ef9626ffca5b7
X-Patchwork-Hint: ignore
Message-Id: <20220316213525.4E73884249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zynaddsubfx: add jack{1,
 2} optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=3bcedaa732b539e4ad32776e867ef9626ffca5b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jack{1,2} is an optional dependency (enabled by default) since the
addition of the package in commit
18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zynaddsubfx/zynaddsubfx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index aeeb0b6405..461146aae8 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -30,4 +30,11 @@ else
 ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_JACK1)$(BR2_PACKAGE_JACK2),y)
+ZYNADDSUBFX_DEPENDENCIES += $(if $(BR2_PACKAGE_JACK1),jack1,jack2)
+ZYNADDSUBFX_CONF_OPTS += -DJackEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DJackEnable=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
