Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522B9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C7984E1A;
	Fri, 28 Jan 2022 18:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yul3SkriI4Y4; Fri, 28 Jan 2022 18:37:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120A384E13;
	Fri, 28 Jan 2022 18:37:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8317C1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B1441D0D
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSZsa5OuArQO for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:37:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D186641D0A
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:37:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 448D482B2A; Fri, 28 Jan 2022 18:30:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 19:34:55 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1cee7b40cab2fd5cf4c9dbe34b41d71fa75677eb
X-Git-Newrev: 345edd4b4732cdd5d48b04fdce0a4b140ff6f058
X-Patchwork-Hint: ignore
Message-Id: <20220128183019.448D482B2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/efl: change
 download URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=345edd4b4732cdd5d48b04fdce0a4b140ff6f058
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: canonicalise homepage]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c3d5b27d5d24079d6c30c568c58e3a5e7c6e3fc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index cdb05aa551..1d7057c50b 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -6,7 +6,7 @@
 
 EFL_VERSION = 1.25.1
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
