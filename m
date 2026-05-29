Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FD0CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4FD83DF9;
	Fri, 29 May 2026 08:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtBzkuL5GZVN; Fri, 29 May 2026 08:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C4E183DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043294;
	bh=kBOeMUJJXCU9e+bD1bVhWZh6yz1Koj6+uDpb5J98JH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MYqofLjSizJNfvJFYcQsFXRU4fJNjYYcqqIpU1dy1w/tfX849rAQkQhILZU5vm6aJ
	 MwBuUxvBnXvwu0+2kOs4EqVuKyePNxRqZzHX9poI7OOwyha0d1bikDCYl4Lru8sALZ
	 dZvP0LeF2609/6U3f+J/6md2WWZ3Vy1PCrkLARkD4I46ke1cMP2GuvawXp45P7Vhe1
	 Or6YX/eI0V+l5753Cto9SLJYIEE6/006ge6TybIdnHACHFWCWMLUkvdsP7kXnLlihk
	 syIj7vh3pwaKc70GZaGmV+EQJ+v9+MM44YIb7qzYHrTXYNY79aO6ylasKqNl8iY9be
	 uL/uIqeOP2Mzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C4E183DC4;
	Fri, 29 May 2026 08:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2F0288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0C2D6145B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DK6wk3KvyPdy for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C576135E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C576135E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31D3A87099; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:08 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6d5e591cdf437fc645642d16c13f7a559d281fd1
X-Git-Newrev: 3c502cc273246fa47e98beb9450b3cca9726b4f3
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.31D3A87099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/intel-microcode:
 security bump version to 20260512
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c502cc273246fa47e98beb9450b3cca9726b4f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260512

Fixes CVE-2025-35979:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01420.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3dfde73b678dfab6e147a7420442cc42ba48014d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 588cf7cde3..bb36a52fc5 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
+sha256  5a07ce745d0bd8b360a4713564d46d5e38be797316a52abedaff0761e1b02370  intel-microcode-20260512.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 321272e10d..f6fbee54b4 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260227
+INTEL_MICROCODE_VERSION = 20260512
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
