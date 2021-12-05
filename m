Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA19C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 15:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A329C83083;
	Sun,  5 Dec 2021 15:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gX-SnuRWtCsN; Sun,  5 Dec 2021 15:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0333883065;
	Sun,  5 Dec 2021 15:15:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE81A1BF57C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB57D606DA
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 15:15:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzEIaJPgrXI3 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 15:15:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22406606A8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 15:15:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D31A240004;
 Sun,  5 Dec 2021 15:15:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mttEZ-00054V-7w; Sun, 05 Dec 2021 16:15:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 16:15:17 +0100
Message-Id: <20211205151518.19449-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/stress-ng: move to github
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current project URL returns 404 error because:

Quoting Coling King:
"Unfortunately when I left Canonical last week they removed my tarballs"

So use github and update hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stress-ng/Config.in      | 2 +-
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 64b473b75c..839cbb1cc0 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_STRESS_NG
 	  subsystems of a computer as well as the various operating
 	  system kernel interfaces.
 
-	  http://kernel.ubuntu.com/~cking/stress-ng/
+	  https://github.com/ColinIanKing/stress-ng
 
 comment "stress-ng needs a toolchain w/ headers >= 3.3"
 	depends on !BR2_nios2 && !BR2_arc
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index f3eb76fa82..bbdcd155c8 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f37f739e4d15343360a47980b67dc8b2a6bf3d4d3ef727d55e2dd99a0b64f9ea  stress-ng-0.13.01.tar.xz
+sha256  1973b142b9b731952dd4ce77c3618a7e3c62494587e23bf37c8683503d048f68  stress-ng-0.13.01.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index e0b385e756..54572383c4 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 STRESS_NG_VERSION = 0.13.01
-STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
-STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
+STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
