Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BFBC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63C6941836;
	Thu,  3 Nov 2022 21:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63C6941836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kx7gX9JyY8yL; Thu,  3 Nov 2022 21:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C9E641864;
	Thu,  3 Nov 2022 21:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C9E641864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC111BF8B4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECA0940BED
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECA0940BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Eons2DrP2Eb for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E23940BC6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E23940BC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E1C787C31; Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:02:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3164c0983ab0fa76c8c70ccb02164ad5085d7a65
X-Git-Newrev: 964eccb839eb169e8b3d883693dc921793287c8a
X-Patchwork-Hint: ignore
Message-Id: <20221103210547.0E1C787C31@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-traitlets: bump
 to version 5.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=964eccb839eb169e8b3d883693dc921793287c8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Migrate from distutils to hatchling pep517 build backend.

License hash changed due to formatting change:
https://github.com/ipython/traitlets/commit/9fd01cc7b279a46e58fddc3c29149e73c7d67ab1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-traitlets/python-traitlets.hash | 6 +++---
 package/python-traitlets/python-traitlets.mk   | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 01e2bf8e30..095e85c155 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  19483ec0685e837912cff128209aa845  traitlets-5.1.0.tar.gz
-sha256  bd382d7ea181fbbcce157c133db9a829ce06edffe097bcf3ab945b435452b46d  traitlets-5.1.0.tar.gz
+md5  d5f87bbea8acf897ac3e435c7b71acdc  traitlets-5.5.0.tar.gz
+sha256  b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79  traitlets-5.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
+sha256  3dcd47086529bf178cf7d10f35a8c188a1e9710391acecceef700898a4cf099b  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 5f41f6ee8f..25ab71047a 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.1.0
+PYTHON_TRAITLETS_VERSION = 5.5.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/d5/bc/37d490908e7ac949614d62767db3c86f37bc5adb6129d378c35859a75b87
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/dd/a8/278742d17c9e95ccb0dcb86ae216df114d2166d88e72f42b60a7b58b600b
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
-PYTHON_TRAITLETS_SETUP_TYPE = distutils
+PYTHON_TRAITLETS_SETUP_TYPE = pep517
+PYTHON_TRAITLETS_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
