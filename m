Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ABDC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 19:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEA9A41548;
	Mon, 11 Sep 2023 19:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEA9A41548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AaPZH_BBn63i; Mon, 11 Sep 2023 19:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BC8A41547;
	Mon, 11 Sep 2023 19:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BC8A41547
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7E891BF860
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE2F41871
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 19:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE2F41871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihqXMGZMz6mf for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F05941829
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F05941829
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BE4186CC6; Mon, 11 Sep 2023 19:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 21:17:39 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 4564db20f3128d4177e3e8e1cc3fa1bcc6a26b0e
X-Git-Newrev: c8d3d288358c06eb076d4cce735e807c6a5e0ee8
X-Patchwork-Hint: ignore
Message-Id: <20230911192022.6BE4186CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/intel-microcode:
 security bump version to 20230808
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8d3d288358c06eb076d4cce735e807c6a5e0ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes CVE-2022-40982:
https://downfall.page/
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00828.html
https://www.phoronix.com/news/Linux-Git-INCEPTION-DOWNFALL

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b10ceec75520fab80f76081f50daaaab9df890f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 3f12b71191..64c50dd6f7 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  58f3321dcf900175d87d5b39455138c2a24e69df4ba997fb44e3e0d19e531ad1  intel-microcode-20230512.tar.gz
+sha256  fe49bb719441f20335ed6004090ab38cdc374134d36d4f5d30be7ed93b820313  intel-microcode-20230808.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 48c6340af8..0a89d3a603 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20230512
+INTEL_MICROCODE_VERSION = 20230808
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
