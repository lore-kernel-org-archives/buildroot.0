Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE2EC07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4EB7408CB;
	Sat, 24 Sep 2022 08:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4EB7408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJ7wI1hZPoRG; Sat, 24 Sep 2022 08:24:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10A3B408C9;
	Sat, 24 Sep 2022 08:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A3B408C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D032E1BF966
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACA8F60A6B
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACA8F60A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewdhdU7m9kAY for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:24:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCAE860A4F
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCAE860A4F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5AD385C6D; Sat, 24 Sep 2022 08:24:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 09:25:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c05fe1d621c7c5147f687b39f61988918efec566
X-Git-Newrev: 2471520c6836123e65b2cfe96275d45c84e9781f
X-Patchwork-Hint: ignore
Message-Id: <20220924082402.C5AD385C6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: bump version to 3.1.40.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2471520c6836123e65b2cfe96275d45c84e9781f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/snort3/snort3/blob/master/ChangeLog.md

Removed flatbuffers support due to its upstream removal:
https://github.com/snort3/snort3/commit/3ec185030ef871dbe4a1df997b5880c098aa7101

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 0ba4505a83..7746547d18 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6e45c16b1815d832b5d6edcd2b705e7838e25c76bfd54b3e86c55ecba6de420a  snort3-3.1.18.0.tar.gz
+sha256  d787d954f21d4cd6a048e10b8c53c78cb6287ec448108fc573b951639c8947b3  snort3-3.1.40.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 6f15ce3c92..a76b831838 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.18.0
+SNORT3_VERSION = 3.1.40.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
@@ -17,13 +17,6 @@ SNORT3_CONF_OPTS = \
 	-DENABLE_STATIC_DAQ=OFF \
 	-DMAKE_DOC=OFF
 
-ifeq ($(BR2_PACKAGE_FLATBUFFERS),y)
-SNORT3_DEPENDENCIES += flatbuffers
-SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=ON
-else
-SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 SNORT3_DEPENDENCIES += libiconv
 SNORT3_CONF_OPTS += -DHAVE_ICONV=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
