Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8653ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C44843A6;
	Sat, 17 Sep 2022 15:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C44843A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9w5AvWn5ZvE; Sat, 17 Sep 2022 15:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CEB8439A;
	Sat, 17 Sep 2022 15:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CEB8439A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 085111BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D738360AF8
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D738360AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-fGjX8ygjaX for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:50:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DECAF61113
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DECAF61113
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C9B2784567; Sat, 17 Sep 2022 15:50:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:50:10 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f2e412f1a85219582ba767590420cc7b15455274
X-Git-Newrev: b631ea3aef6578fca2ed4917e089c876e72fe99b
X-Patchwork-Hint: ignore
Message-Id: <20220917155046.C9B2784567@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/v4l2loopback:
 security bump to version 0.12.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b631ea3aef6578fca2ed4917e089c876e72fe99b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-2652: Depending on the way the format strings in the card
label are crafted it's possible to leak kernel stack memory. There is
also the possibility for DoS due to the v4l2loopback kernel module
crashing when providing the card label on request (reproduce e.g. with
many %s modifiers in a row).

https://github.com/umlaeute/v4l2loopback/blob/v0.12.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 922fb6ac852af6ba7cb13c93ed361c8adaa668fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index f4491e02d0..d897fd48ff 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e152cd6df6a8add172fb74aca3a9188264823efa5a2317fe960d45880b9406ae  v4l2loopback-0.12.5.tar.gz
+sha256  e0782b8abe8f2235e2734f725dc1533a0729e674c4b7834921ade43b9f04939b  v4l2loopback-0.12.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 6ee4b69ef9..84e1927ce3 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.12.5
+V4L2LOOPBACK_VERSION = 0.12.7
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
