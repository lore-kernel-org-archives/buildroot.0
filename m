Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1799FC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F975066D;
	Fri, 28 Feb 2025 17:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcwz_6MiNE70; Fri, 28 Feb 2025 17:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1184F9F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A1184F9F6;
	Fri, 28 Feb 2025 17:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 149731DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5331B42EC8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64fSWVXMiAl0 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A36A44240B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A36A44240B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E62B87A09; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 21:04:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 67547b15796698143a3ed12429cb18f8eb67bdc1
X-Git-Newrev: 892e1608f55c6528c16562f347cb2ec7c7eb6430
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.9E62B87A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/acpica: security bump
 to version 20241212
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=892e1608f55c6528c16562f347cb2ec7c7eb6430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 20240927, see:
https://github.com/user-attachments/files/18117996/changes.txt

Note: the change log mention "Fix 2 critical CVE addressing memory
leaks" without providing actual CVE numbers. For reference, the
upstream commits for those security fixes are [1] and [2]. From the log
of those commits, it seems those memory leaks can only happen in old
Kernels <= 4.9 (which is end-of-life since January 2023). Technically
those leaks could happen in any program embedding the apcica code
files. The impact seems very low, if any, on the acpica standalone
tools.

[1] https://github.com/acpica/acpica/commit/987a3b5cf7175916e2a4b6ea5b8e70f830dfe732
[2] https://github.com/acpica/acpica/commit/8829e70e1360c81e7a5a901b5d4f48330e021ea5

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpica/acpica.hash | 2 +-
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index c3e7fda340..9972e34b3b 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  57988fb55541e694dfa3323bd19db74b65d37e942bebef559ed51e8cd9348b43  acpica-unix-20240927.tar.gz
+sha256  9dca83cfee390b710485fbdf787048370049c05723b10cc220cfef6e13c31961  acpica-unix-20241212.tar.gz
 sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index a2abcf7558..2c97c04367 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20240927
+ACPICA_VERSION = 20241212
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/user-attachments/files/17171019
+ACPICA_SITE = https://github.com/user-attachments/files/18117992
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
