Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9E0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 19:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179DC408E2;
	Sat,  4 Dec 2021 19:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p10EyiBNhQ45; Sat,  4 Dec 2021 19:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79AA3404BD;
	Sat,  4 Dec 2021 19:10:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 54B501BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C74827A5
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYjnqi2QSytY for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADDA682778
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 19:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C10248DAD3; Sat,  4 Dec 2021 19:04:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 20:09:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d00fecb7dd922ae2c003b46683173756372fd14
X-Git-Newrev: cba51c7f5af35bf00a09b7035cae525f5791879c
X-Patchwork-Hint: ignore
Message-Id: <20211204190452.C10248DAD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: really comment syntax colouring
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

commit: https://git.buildroot.net/buildroot/commit/?id=cba51c7f5af35bf00a09b7035cae525f5791879c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The unmatched escaped single-quote lies in the middle of a few
function calls, so they too must be fake-closed to properly fix
colour highlighting in some editors.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0f84122bd3..7b067ac275 100644
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
