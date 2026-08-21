Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE85C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99CEB81466;
	Fri, 21 Aug 2026 15:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duV-DUb3F863; Fri, 21 Aug 2026 15:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324901;
	bh=MvRZw1oJF0j5NIFuisR28IwOIrIpScdBYxrXgkuqKWs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hot3Un0MofwH+ha9MNXjlTJn4PAdtnvNuv7E2PdGIROrH3zD7SeRpf+n4HnnafNpj
	 ZXORnZl9+XITn3Pm+01xBVybkCPkH7Ay+OwcS4gWkm0az8r8wAmYf8bRre/QQe5kE9
	 CMbGFKfHMqsnoIkduRIC/GozHJ2aqPF/ziF3Gk7jD3hFMP0SaqOgy61Zt8z9yTeldN
	 SA/ceYHiULb7Owu/QIa9OduF7uQg3GylXXfjMXPy3V6PZMP2NbFcwFybB6lZl1+xz8
	 Mdb4osSQsiJWv6rVbh41NZl3xtDVXQP//qCbfcCaJ+PAqcS5WMCh64OFb5oQuFPNzO
	 Pefryu/G5srdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E55381443;
	Fri, 21 Aug 2026 15:08:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C104F29B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B35D7400B4
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXCZLWhNq1zE for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C116B40426
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4149B8E127; Fri, 21 Aug 2026 15:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 641c2ec18ef63fb0813606d778938eae5ad06fe8
X-Git-Newrev: 67002b7419bc06380606c88340e7a2c8c8477573
X-Patchwork-Hint: ignore
Message-Id: <20260821150615.4149B8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/intel-microcode:
 security bump version to 20260812
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67002b7419bc06380606c88340e7a2c8c8477573
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 2c92087605c30bd5c1384a62198855f7836b5215)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
