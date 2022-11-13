Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B004AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 533AC4049A;
	Sun, 13 Nov 2022 16:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 533AC4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9PneIXsovep; Sun, 13 Nov 2022 16:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91062404A3;
	Sun, 13 Nov 2022 16:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91062404A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23A551BF40B
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F29CF80FB1
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F29CF80FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eIeqrdKr34zV for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BCB780D3D
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BCB780D3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B8B483736; Sun, 13 Nov 2022 16:34:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:23:17 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e30dd92ca7238b68b00135fa92cf09df80cfe3b2
X-Git-Newrev: 6ee6bd566dcbd673f88de507bcda05086039b0e0
X-Patchwork-Hint: ignore
Message-Id: <20221113163436.1B8B483736@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/exim: fix typo in
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ee6bd566dcbd673f88de507bcda05086039b0e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 55ef42e090b39fdf129b7e5e218019e0156fe166)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b45458b21b..0098e3884f 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -20,7 +20,7 @@ define exim-config-change # variable-name, variable-value
 		$(@D)/Local/Makefile
 endef
 
-# Comment-out a variable. Has no effect if it does not exits.
+# Comment-out a variable. Has no effect if it does not exist.
 define exim-config-unset # variable-name
 	$(SED) 's,^\([[:space:]]*$1[[:space:]]*=.*$$\),# \1,' \
 		$(@D)/Local/Makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
