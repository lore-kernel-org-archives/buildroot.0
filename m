Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26F0C6FA8B
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 06:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B146107E;
	Thu, 22 Sep 2022 06:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B146107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVjzX05XUENE; Thu, 22 Sep 2022 06:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F94C60ADB;
	Thu, 22 Sep 2022 06:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F94C60ADB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 364C81BF957
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 06:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 169CB41992
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 06:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169CB41992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cq25avWI0Yi for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 06:37:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E332741990
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 06:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E332741990
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE6F985DF8; Thu, 22 Sep 2022 06:37:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 08:12:04 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 3a13c6f1c2ac76a1614dcf6aff870a2af0f2cdd4
X-Git-Newrev: b5100e5a65d606062b6e4bf08da08a7d5ee00e82
X-Patchwork-Hint: ignore
Message-Id: <20220922063708.CE6F985DF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8723bu: bump
 to latest version for kernel 5.17+ support
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5100e5a65d606062b6e4bf08da08a7d5ee00e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes:
http://autobuild.buildroot.net/results/4ba/4baf7b753a16e9cd798eaf51a4cb994a22f437e8/

Brings the following changes:
Denis Klester (1):
      fix build for 5.19.2

Larry Finger (4):
      rtl8723bu: Fix build under kernel 5.17 and clean up some warnings
      rtl8723bu: Fix multiple definition errors
      rtl8723bu: Fin compile warning
      rtl8723bu: Fix builds for kernel 6.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34f6a27f1086af7cf557f50fbd53466c0edc1a21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 1dad7154b4..9119abad76 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  1cd658742ce10b21c92877e09cecc98880680d5f150de3845553005abc542977  rtl8723bu-19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3.tar.gz
+sha256  07fece152704f4b5dbd0fd3af842816f95824317f3158fea774f15a6eddac009  rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 838bbedb74..3da8d9cecf 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
+RTL8723BU_VERSION = d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
