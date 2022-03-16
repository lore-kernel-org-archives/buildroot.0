Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3435C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 07:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF364175B;
	Wed, 16 Mar 2022 07:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qd8An5FYSw-l; Wed, 16 Mar 2022 07:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 269AD416D0;
	Wed, 16 Mar 2022 07:30:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE42C1BF409
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B97EA8419C
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5eUHuvCl6go for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B6484199
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 07:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D712841D2; Wed, 16 Mar 2022 07:21:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 08:27:37 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: ec2eea8e7ba5938b703d719269839700eb7cb61b
X-Git-Newrev: c80e612f5eeeaccf3bdefb8192507da6ae4997f4
X-Patchwork-Hint: ignore
Message-Id: <20220316072123.3D712841D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] docs/manual: remove
 override in conditional
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

commit: https://git.buildroot.net/buildroot/commit/?id=c80e612f5eeeaccf3bdefb8192507da6ae4997f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Remove override of FOO_{CONF_OPTS,DEPENDENCIES} in conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3d7f852ac5afb09f0a9a0b5f441403a98bc0f410)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-kernel-module.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-kernel-module.txt b/docs/manual/adding-packages-kernel-module.txt
index b609ecc90a..1d4251333d 100644
--- a/docs/manual/adding-packages-kernel-module.txt
+++ b/docs/manual/adding-packages-kernel-module.txt
@@ -70,11 +70,11 @@ Let's look at a more complex example:
 14: FOO_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
 15: 
 16: ifeq ($(BR2_PACKAGE_LIBBAR),y)
-17: FOO_DEPENDENCIES = libbar
-18: FOO_CONF_OPTS = --enable-bar
+17: FOO_DEPENDENCIES += libbar
+18: FOO_CONF_OPTS += --enable-bar
 19: FOO_MODULE_SUBDIRS += driver/bar
 20: else
-21: FOO_CONF_OPTS = --disable-bar
+21: FOO_CONF_OPTS += --disable-bar
 22: endif
 23: 
 24: $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
