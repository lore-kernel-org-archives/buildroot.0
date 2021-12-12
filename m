Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA433C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C1160F34;
	Sun, 12 Dec 2021 22:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxJ4BGrQfun0; Sun, 12 Dec 2021 22:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8656660F2B;
	Sun, 12 Dec 2021 22:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B77A21BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A62E96079A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7Dq6ydjKAoL for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F2E7606EB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 666B983654; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:14:49 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 7954aa6e60ec2bda715ecfb1b656360f0581d2e3
X-Git-Newrev: 8fef27a5207eb32c0d37c3187793659658028e7b
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.666B983654@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] Makefile: really comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fef27a5207eb32c0d37c3187793659658028e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
index beacab0661..abbeaa9fe6 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,7 +1068,7 @@ printvars:
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
