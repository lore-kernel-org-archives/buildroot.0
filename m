Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198D5C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A788A4063C;
	Sat, 14 Jan 2023 21:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A788A4063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ax-YNl8wjIvp; Sat, 14 Jan 2023 21:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E05FF40614;
	Sat, 14 Jan 2023 21:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E05FF40614
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC7D71BF3C2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956CB81F18
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 21:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 956CB81F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B5lNSjAenqiu for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 21:17:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5983681F05
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 21:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5983681F05
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4735B87B5A; Sat, 14 Jan 2023 21:17:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 22:17:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52afc0b3b504c9616b3875dcdf67ab7be41455f5
X-Git-Newrev: dce238f045f25d75b31681ea56ea5b9c668912dd
X-Patchwork-Hint: ignore
Message-Id: <20230114211742.4735B87B5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmitool: use the standard github
 helper
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

commit: https://git.buildroot.net/buildroot/commit/?id=dce238f045f25d75b31681ea56ea5b9c668912dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipmitool/ipmitool.hash | 2 +-
 package/ipmitool/ipmitool.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index bb0b0d80b0..c3b298e3ba 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  IPMITOOL_1_8_19.tar.gz
+sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index b9f60d8151..5e34434a03 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 IPMITOOL_VERSION = 1_8_19
-IPMITOOL_SOURCE = IPMITOOL_$(IPMITOOL_VERSION).tar.gz
-IPMITOOL_SITE = https://github.com/ipmitool/ipmitool/archive/refs/tags
+IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 IPMITOOL_CPE_ID_VENDOR = ipmitool_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
