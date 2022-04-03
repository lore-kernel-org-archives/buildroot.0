Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08215C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 18:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94CC4160D;
	Sun,  3 Apr 2022 18:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gACbZa13gWH2; Sun,  3 Apr 2022 18:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76CFB415C8;
	Sun,  3 Apr 2022 18:58:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71CF61BF36E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BA004058A
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7M0lyf8qMBe3 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 18:58:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E01400D6
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 18:58:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5762585FF7; Sun,  3 Apr 2022 18:48:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Apr 2022 20:56:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5140d10bf6b9f01e7e1ecb2b357885e03e9d5fb4
X-Git-Newrev: a8289875b69e6377218ca1ab7712b932c24302c5
X-Patchwork-Hint: ignore
Message-Id: <20220403184853.5762585FF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: fix sensors option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8289875b69e6377218ca1ab7712b932c24302c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 811846df48745d58d96f6c0fbab0dec5f17d614b wrongly used
--{with,without}-sensors instead of --{dis,en}able-sensors

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/htop/htop.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 7caa47ce13..210518da2f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -28,10 +28,10 @@ HTOP_CONF_OPTS += --disable-capabilities
 endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-HTOP_CONF_OPTS += --with-sensors
+HTOP_CONF_OPTS += --enable-sensors
 HTOP_DEPENDENCIES += lm-sensors
 else
-HTOP_CONF_OPTS += --without-sensors
+HTOP_CONF_OPTS += --disable-sensors
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
