Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF640E77188
	for <buildroot@archiver.kernel.org>; Sun, 22 Dec 2024 18:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655D64156C;
	Sun, 22 Dec 2024 18:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Av-ZM_mC0CgX; Sun, 22 Dec 2024 18:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3460E4156E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3460E4156E;
	Sun, 22 Dec 2024 18:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3675E
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 18:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF26681EEA
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 18:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1I_wzNUhn7lT for <buildroot@buildroot.org>;
 Sun, 22 Dec 2024 18:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB2F781EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB2F781EE8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB2F781EE8
 for <buildroot@buildroot.org>; Sun, 22 Dec 2024 18:20:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 40674B00571;
 Sun, 22 Dec 2024 19:20:36 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 22 Dec 2024 19:20:26 +0100
Message-ID: <20241222182026.1231497-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734891637;
 bh=zz/NagtVD1VQjuChtOOBCV7EhewR5l+9kNIAkee6cSc=;
 h=From:To:Cc:Subject:Date:From;
 b=P4XLEVpAiAOMPysRuyUqhHvNDS2CULJR0aTN/rX8JrlY2D5Iq5FdC828BD7ohDFRl
 e49LYiTXA75AegISUeWFJTr22uz/yHB8EfzGlvVmaZqlc9sxGTA/vcGuioYbkn29nk
 S3rihI6Dk+QtDLMUwkv/t54H4Dd4e/PShls4QfQIKlsA2163+zcW4ByUta8pADM75F
 Hj0blJKDSiJYKOM1+cL85wgNdZMXRYNT1bMCXSCQIwWWVRwbbLpUDEmL4UXUOUrARI
 kV/geCPDweGdPpfcKNZiZLHh1o+wjY+YwrogWL6LBeqiYKeIuYW0rE+aZTeA1NYFLJ
 q/hgPMuBveoxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P4XLEVpA
Subject: [Buildroot] [PATCH 1/1] package/acpica: security bump to version
 20241212
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8707592086
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
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
