Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9083C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A4D84B67;
	Sun, 12 Dec 2021 22:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8RTfRW5v0KK; Sun, 12 Dec 2021 22:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5E284B5D;
	Sun, 12 Dec 2021 22:24:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF321BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7AFB402A7
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUbuIMgtOMN1 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 227FE402AF
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 785CC836B8; Sun, 12 Dec 2021 22:18:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:14:31 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cd815834d79069797beae74e934f6f450750c835
X-Git-Newrev: 82db9f487f6569e0960df87955e721a9f643ee64
X-Patchwork-Hint: ignore
Message-Id: <20211212221808.785CC836B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Makefile: really comment
 syntax colouring
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

commit: https://git.buildroot.net/buildroot/commit/?id=82db9f487f6569e0960df87955e721a9f643ee64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The unmatched escaped single-quote lies in the middle of a few
function calls, so they too must be fake-closed to properly fix
colour highlighting in some editors.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cba51c7f5af35bf00a09b7035cae525f5791879c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 07301f2f10..47973344d3 100644
--- a/Makefile
+++ b/Makefile
@@ -1073,7 +1073,7 @@ printvars:
 		$(if $(QUOTED_VARS),\
 			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
-# ' Syntax colouring...
+# ')))) # Syntax colouring...
 
 .PHONY: clean
 clean:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
