Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D47C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF4440321;
	Sun, 30 Oct 2022 20:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDF4440321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBiCrAZ_mB89; Sun, 30 Oct 2022 20:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52A5640335;
	Sun, 30 Oct 2022 20:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52A5640335
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3BB1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B6340277
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B6340277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iEUSfMsSpJTq for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:18:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054194025A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054194025A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5CD987603; Sun, 30 Oct 2022 20:18:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:06:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d64fff456890941f6bbe220d37f021437e0e0d0
X-Git-Newrev: ba74bc8b6783aa478d00f3318c13064d66274ca9
X-Patchwork-Hint: ignore
Message-Id: <20221030201810.E5CD987603@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: bump version to fix
 build failure with linux >= 6.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba74bc8b6783aa478d00f3318c13064d66274ca9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that we use latest commit from branch v5.2.2.4 instead of
branch master.

Fixes:
http://autobuild.buildroot.org/results/550/550640296a92826f6f04d2344adde75c3025ea35/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 9c7f2de4b6..0ad7786328 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
+sha256  50529c110e0a45fbe3169d0e237c4d0959300840f5e162c24256452976fb2670  rtl8188eu-c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index ebce4617ac..199362d7ae 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
+RTL8188EU_VERSION = c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
