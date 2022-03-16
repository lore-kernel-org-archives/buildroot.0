Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D2DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 07:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60A49400F1;
	Wed, 16 Mar 2022 07:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jm6S8Ed3y8p4; Wed, 16 Mar 2022 07:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E153F409D9;
	Wed, 16 Mar 2022 07:30:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 148961BF9C6
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F387540138
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 07:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KldjEhumV3_v for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 07:29:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3972E400F1
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 07:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 536F884196; Wed, 16 Mar 2022 07:20:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 08:27:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6c6a9bb51fb32f9036edd5522a933c4668eec6ca
X-Git-Newrev: 61796702964b500ec7548d142e2cbeef14dda544
X-Patchwork-Hint: ignore
Message-Id: <20220316072056.536F884196@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] docs/manual: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=61796702964b500ec7548d142e2cbeef14dda544
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
