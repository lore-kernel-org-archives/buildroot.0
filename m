Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39E0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA64C60D64;
	Mon,  6 Dec 2021 18:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25n6e0r7gwA1; Mon,  6 Dec 2021 18:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C90E60D62;
	Mon,  6 Dec 2021 18:35:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E22D1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ECCF41C3E
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hnN89usUrTGq for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C4741C31
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3C85681503; Mon,  6 Dec 2021 18:07:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:34:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 873dc46faf204439da1adc9deed5102cdc522f41
X-Git-Newrev: 12c01079bdb4a82ac91dee3e9826b070faaddb78
X-Patchwork-Hint: ignore
Message-Id: <20211206180740.3C85681503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: bump to version 0.13.05
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
Content-Type: multipart/mixed; boundary="===============4371064878334323409=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4371064878334323409==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=12c01079bdb4a82ac91dee3e9826b070faaddb78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project URL returns 404 error because:

Quoting Coling King:
"Unfortunately when I left Canonical last week they removed my tarballs"

So use github and update hash.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stress-ng/Config.in      | 2 +-
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

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
index f3eb76fa82..2e3f998769 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f37f739e4d15343360a47980b67dc8b2a6bf3d4d3ef727d55e2dd99a0b64f9ea  stress-ng-0.13.01.tar.xz
+sha256  3de49e1100866634f549e99c1644283d0cde817b844a69dcf7f80afa2227d350  stress-ng-0.13.05.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index e0b385e756..0b2287c7fb 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.13.01
-STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
-STRESS_NG_SITE = https://kernel.ubuntu.com/~cking/tarballs/stress-ng
+STRESS_NG_VERSION = 0.13.05
+STRESS_NG_SITE = $(call github,ColinIanKing,stress-ng,V$(STRESS_NG_VERSION))
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
 

--===============4371064878334323409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4371064878334323409==--
