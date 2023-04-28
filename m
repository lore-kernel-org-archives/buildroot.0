Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3871CC77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB73822A2;
	Fri, 28 Apr 2023 10:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEB73822A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yq5SfgL3pho9; Fri, 28 Apr 2023 10:55:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AC083B35;
	Fri, 28 Apr 2023 10:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AC083B35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2C1E1BF28A
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 10:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCBF98221A
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 10:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBF98221A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7zxZEdrM3Zv for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 10:55:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF31783B35
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF31783B35
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 10:55:14 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout07.t-online.de (Postfix) with SMTP id 4F7A33D0DC
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 12:55:12 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd71.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psLku-1MHDKz0; Fri, 28 Apr 2023 12:55:12 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41474)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psLkt-0002bn-2a
 for buildroot@buildroot.org; Fri, 28 Apr 2023 12:55:11 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 12:55:11 +0200
Message-Id: <20230428105511.157103-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682679312-8F7FDC12-E021ECE3/0/0 CLEAN NORMAL
X-TOI-MSGID: 33bb8fa2-c12e-4b52-b8aa-27b0e88a23cc
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20230214
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/main/releasenote.md

CVE-2022-21216
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00700.html

CVE-2022-33196
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00738.html

CVE-2022-38090
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00767.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 56f0237277..acec71000f 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8d14a914815f56c27b1f41be0fd699d1afcfdbc05432056427e455100798975e  intel-microcode-20221108.tar.gz
+sha256  3a3cfe2c7642339af9f4c2ad69f5f367dfa4cd1f7f9fd4124dedefb7803591d4  intel-microcode-20230214.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 787537da78..6e7d66f482 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20221108
+INTEL_MICROCODE_VERSION = 20230214
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
