Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A948C10DC1
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC5A6F4CA;
	Thu, 30 Nov 2023 08:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC5A6F4CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yvfo_snCYm77; Thu, 30 Nov 2023 08:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E29306F535;
	Thu, 30 Nov 2023 08:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E29306F535
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60C341BF23B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CD5A84491
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CD5A84491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yR9XUkb_thm0 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B905584448
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B905584448
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A41B487600; Thu, 30 Nov 2023 08:31:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 08:58:33 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 50d5f8974e57b6e72015d877f3bd56d7d84acb22
X-Git-Newrev: 2f93db49d433c337fccad539c2d8a4169bff5045
X-Patchwork-Hint: ignore
Message-Id: <20231130083133.A41B487600@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/intel-microcode:
 security bump to version 20231114
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f93db49d433c337fccad539c2d8a4169bff5045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Includes fixes for INTEL-SA-00950:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00950.html
https://lock.cmpxchg8b.com/reptar.html
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20231114

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c54407541cfd50c3bd9f4f46337448cd3ed1423d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 64c50dd6f7..742332d552 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe49bb719441f20335ed6004090ab38cdc374134d36d4f5d30be7ed93b820313  intel-microcode-20230808.tar.gz
+sha256  cee26f311f7e2c039dd48cd30f995183bde9b98fb4c3039800e2ddaf5c090e55  intel-microcode-20231114.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 0a89d3a603..a159baa93d 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20230808
+INTEL_MICROCODE_VERSION = 20231114
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
