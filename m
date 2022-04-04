Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D36C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7648740335;
	Mon,  4 Apr 2022 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 875p1GJtA4tK; Mon,  4 Apr 2022 17:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53F7B402C3;
	Mon,  4 Apr 2022 17:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D08911BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7524017C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pePdiT9cgBjq for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 232BA4011C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:48:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9E22C8079C; Mon,  4 Apr 2022 17:38:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:47:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 8153c3620a436e5eca948aacb6a214424dbf834f
X-Git-Newrev: e67eaafd6fa96a6f1e8fe32edd8580613cbdf1cb
X-Patchwork-Hint: ignore
Message-Id: <20220404173850.9E22C8079C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/htop: fix sensors
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=e67eaafd6fa96a6f1e8fe32edd8580613cbdf1cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 811846df48745d58d96f6c0fbab0dec5f17d614b wrongly used
--{with,without}-sensors instead of --{dis,en}able-sensors

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a8289875b69e6377218ca1ab7712b932c24302c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
