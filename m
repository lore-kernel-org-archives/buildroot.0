Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D62EF48C4
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 629B540B18;
	Sat, 14 Feb 2026 11:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQbIsIpcId-a; Sat, 14 Feb 2026 11:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C60C40B1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771069055;
	bh=VAWLqF2kfuTbrUVKJNZZdJXcV+d2t27G3e4k9/0iQYE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qtxa2BgMIeBPXRATJlJUyZEsOg+C8dU7kdJbrP4ujonyUWlOQ+88kPZI7Bjwi5F1o
	 Cp++shyjwqa2GVn5hlEVJxANotjy9o1WlXs20cuP9BIerk+tpDIC+0+BIPHssEN2/+
	 ywKlMTzadfVZ31emsgYq2f2v0SJWyRAa7GBUg55cOuBtAIHa7HiSDtuksS/Ni+vgdz
	 nDGA4CbCWNdiUFSAegHc0D+HSKlIaxO7ZcPyKVJo0wLanF5DG3uy3xWgtTZVjRIaZ/
	 si5NW7VeYgjU46Ppfo91Jn++JXANizf3XYbuOy+YOhRMGMIgUoqp5zj9MbiQbZTSQ7
	 w4ryhfJB0O/iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C60C40B1C;
	Sat, 14 Feb 2026 11:37:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA170270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB51D83CC2
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5KjBENImM57 for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA1183CB4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA1183CB4
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:37:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAD5483C55; Sat, 14 Feb 2026 11:37:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 12:28:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 764f9171bcbaf6ef94985adb1c42d4fc6b4b21cf
X-Git-Newrev: 385fb9d1c1f02e94cc61e622ca10e112f6f43d46
X-Patchwork-Hint: ignore
Message-Id: <20260214113732.DAD5483C55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-microcode: security bump
 version to 20260210-rev1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/385fb9d1c1f02e94cc61e622ca10e112f6f43d46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/microcode-20260210-rev1/releasenote.md

CVE-2024-24853:
https://www.intel.com/content/www/us/en/security-center/advisory/INTEL-SA-01083.html
CVE-2025-31648:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01396.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 4c6676dfb0..41041370e2 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a9a0d17240f486461bc101ef74f2b8c10675cdd02d0ba0bd6168b061c62e970  intel-microcode-20251111.tar.gz
+sha256  9232313161ce9dee5facd2870a7bd361d6000b1d409552b5c12efc6498e7f402  intel-microcode-20260210-rev1.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index e8bbf15a81..9f6592132a 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20251111
+INTEL_MICROCODE_VERSION = 20260210-rev1
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
