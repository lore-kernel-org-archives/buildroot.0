Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C72414029F;
	Wed, 19 Jan 2022 21:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVGU4vD-OU7t; Wed, 19 Jan 2022 21:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5F2B401D8;
	Wed, 19 Jan 2022 21:38:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21C331BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F2E641552
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgS4o7oOrYE1 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:38:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 681B4408D2
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:38:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 91B398359C; Wed, 19 Jan 2022 21:32:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:34:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7527324132878f98999539bdd97bd3518747f585
X-Git-Newrev: c3d5b27d5d24079d6c30c568c58e3a5e7c6e3fc7
X-Patchwork-Hint: ignore
Message-Id: <20220119213205.91B398359C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: change download URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3d5b27d5d24079d6c30c568c58e3a5e7c6e3fc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: canonicalise homepage]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/efl/Config.in | 2 +-
 package/efl/efl.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 05ded72cf7..eb9c7aebd9 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_EFL
 	help
 	  Enlightenment Foundation Libraries
 
-	  https://enlightenment.org
+	  https://www.enlightenment.org/
 
 if BR2_PACKAGE_EFL
 
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 46bce29305..ed0a8acc1d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -6,7 +6,7 @@
 
 EFL_VERSION = 1.26.0
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
-EFL_SITE = http://download.enlightenment.org/rel/libs/efl
+EFL_SITE = https://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
 EFL_LICENSE_FILES = \
 	COMPLIANCE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
