Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D93C5DF6A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EECFB606A6;
	Sun, 16 Aug 2026 07:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O41gjEhgasvt; Sun, 16 Aug 2026 07:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C27605EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786866963;
	bh=mt5N17UR33Kr2Azij/FY6N4k3DVbhLH/yERwDTBe37o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ExK5GDFgHrIHPI0vD9Sqyp32km1daijdGNui7ClcjsCI/Ol3esc+85DMJdLAryGKS
	 1/N8UFHRjGMJIRig2LMW8x0fkxFn6d0GxAMvGGtAST55PTf3Ff5CxbNz7EuE8nYsF+
	 sZcKOngTYluzt5iKA3n2Robn3oEV/4yf5e2Ree37sy6eDQ+W53eiq/9RxGVaBoFKUb
	 FmbpxwueVPx9YW5U4IdImYsQgEtZiSuXvOPIoMkIPboJWOVC7C7/4dvswjFSk2BLl8
	 rzknKQrwH8VFfjB0fBdC4AEEO4A5oLescDuooC2yNJK3AioXT/UEklrLNfbYVXUiak
	 3+R68jKqe6yog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C27605EB;
	Sun, 16 Aug 2026 07:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09971334
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFFC8400FE
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHBOS7sLi_eQ for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EFC84006B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EFC84006B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:56:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A1008D9F3; Sun, 16 Aug 2026 07:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 09:51:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b2f111a10f75f01ab9d2dbb9b7a80a3266b0abf
X-Git-Newrev: 2c92087605c30bd5c1384a62198855f7836b5215
X-Patchwork-Hint: ignore
Message-Id: <20260816075510.4A1008D9F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-microcode: security bump
 version to 20260812
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2c92087605c30bd5c1384a62198855f7836b5215
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260812
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260811

Fixes the following CVEs:

CVE-2025-31936
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01379.html

CVE-2025-31938
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01404.html

CVE-2026-20917
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01423.html

CVE-2025-35973
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01428.html

CVE-2026-20716
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01435.html

CVE-2026-20760
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01441.html

CVE-2026-20713
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01442.html

CVE-2026-20707
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01443.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index bb36a52fc5..6f465fd679 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a07ce745d0bd8b360a4713564d46d5e38be797316a52abedaff0761e1b02370  intel-microcode-20260512.tar.gz
+sha256  7614616d7b2988c278060486f47de716ef44c19317928cb45ac9e288fafd5bd1  intel-microcode-20260812.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index f6fbee54b4..9c97b0aa5e 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260512
+INTEL_MICROCODE_VERSION = 20260812
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
