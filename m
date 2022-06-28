Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38851C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF670415F0;
	Tue, 28 Jun 2022 06:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF670415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQc03BtBePPv; Tue, 28 Jun 2022 06:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B0441581;
	Tue, 28 Jun 2022 06:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B0441581
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A0281BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847034154F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 847034154F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3KEeCBKXqMm for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:09:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EEE8410DB
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EEE8410DB
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 78AF98779D; Tue, 28 Jun 2022 05:56:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 08:05:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e62db6c7cca5438d029ce89d5685f17cb6129a9e
X-Git-Newrev: 4bb0008aa57b083dca523064ff5eaffffe93a81a
X-Patchwork-Hint: ignore
Message-Id: <20220628055636.78AF98779D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: use official tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bb0008aa57b083dca523064ff5eaffffe93a81a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official tarball and so drop UUU_SET_VERSION

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 10efff0337..245c38879c 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  4fda8db488c4d3a98c2480c47b41907ad26b714c6400dd0a202baab4c17b0a9b  uuu-1.4.193.tar.gz
+sha256  a9b8b74e32e6718d591c66951b8b52276df7862db80ee943e046947f7313e57f  uuu_source-1.4.193.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index d8c480034a..d1d7824018 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -5,15 +5,10 @@
 ################################################################################
 
 UUU_VERSION = 1.4.193
-UUU_SITE = $(call github,NXPmicro,mfgtools,uuu_$(UUU_VERSION))
+UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
+UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
 HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
 
-define UUU_SET_VERSION
-	echo $(UUU_VERSION) > $(@D)/.tarball-version
-endef
-
-HOST_UUU_POST_EXTRACT_HOOKS += UUU_SET_VERSION
-
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
