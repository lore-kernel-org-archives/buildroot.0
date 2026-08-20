Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9089FC5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5655C813C6;
	Fri, 21 Aug 2026 15:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7v6mmibILCv; Fri, 21 Aug 2026 15:12:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325134;
	bh=qG0Nyu1aiZ4UF2oxUknKSk/3JwzuqL70iZEBfXZuzn4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VP/M9oUYzpEoTRTRUt8e6aB7pFD6qD2Cn7s86so0DgU6wdtS8DOEP7YhqS0WU0+24
	 wKiSBKSfBQ5O9fKqRwX2EO6GDHgrGuQYBYLSb4yF7Q/gt4Lyy8mT87NaUEhMsJ9SqY
	 I+Gt9LVNryBKxjmn2hmxUtbRE/yZl/rFXDvAn0Xj/upix0auQk83jitMeuI+EvxDbD
	 TMJkIq7C7DlPZ6kEk3yAdTMXWL2MnTom83Pch8b2rl2SNH425PLws2KjIzQdEMyL97
	 pGE3nNSqlk3Yfg4tNVtUvr/m20TCzy8KdZlyrlFOfIaKGYw28AiWXVIv9g6/Rts6ny
	 JO2Knz8VeRT2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F3181E13;
	Fri, 21 Aug 2026 15:12:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F0B29B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 253DC606A6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9BO143pEVCC for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81C066063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E85258E17F; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:53:31 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1705db05ae627738f29ee91e505d0b28edc64373
X-Git-Newrev: 6b0f605183db930be6a17c886750f280dbfdd6a5
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.E85258E17F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/intel-microcode:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b0f605183db930be6a17c886750f280dbfdd6a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
