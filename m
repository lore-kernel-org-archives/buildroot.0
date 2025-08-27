Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A1CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 22:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D900E8126E;
	Wed, 27 Aug 2025 22:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssSgrGqWYBZY; Wed, 27 Aug 2025 22:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E692781223
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E692781223;
	Wed, 27 Aug 2025 22:29:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEBDCB8C
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 22:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2CBD81220
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 22:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku5fnro21JZ3 for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 22:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F21A681212
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F21A681212
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F21A681212
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 22:29:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AD1565FFB4;
 Thu, 28 Aug 2025 00:29:40 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 28 Aug 2025 00:29:34 +0200
Message-ID: <20250827222934.1249498-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756333781;
 bh=FLkxQd0Ili7BzIH1juOVxtrPmU+1EHuSNvWhMMJXemA=;
 h=From:To:Cc:Subject:Date:From;
 b=Dk8nGdk9bmLELTAntW/gHAD58K5yOyEg9V8PlwcmG/HminezpydK1crKiq0Et4QLz
 jvrtavW+0T/kI2MMMP9BmuCMRT7Oa45A/RDUq82BtC1gpUOmLqj4fUgRIuqgbwuCwz
 /n183UVNlRNUlOMxuQNC9JkuTCsAF6dbyxdC6w1HrTejdrL7pbGz8jyu7udM6kRif/
 HV4bA97RRQ9Dmnm/9w4L4OJgX7KZ09tFT1s4oGm0BNVWB1e84/fGLuROEpyzWDPjF3
 LuoalxcC1uD43POErlTCRAM2R5/mK/FV9p7CxoDx2g7AwuRjbdFYRQyBeEODOs3Wje
 aEXsxwaxqDMkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dk8nGdk9
Subject: [Buildroot] [PATCH next 1/1] package/acpica: bump to version
 20250807
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 20241212, see:
https://github.com/acpica/acpica/blob/20250807/documents/changes.txt

License file hash is changed after a year update in upstream commit:
https://github.com/acpica/acpica/commit/53553c302b5fc57afe55dd3d96ce3aa861dea1df

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/acpica/acpica.hash | 4 ++--
 package/acpica/acpica.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
index 9972e34b3b..e88107e9c7 100644
--- a/package/acpica/acpica.hash
+++ b/package/acpica/acpica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  9dca83cfee390b710485fbdf787048370049c05723b10cc220cfef6e13c31961  acpica-unix-20241212.tar.gz
-sha256  b28f54dc421531bbe269afd8c28bf6fdfd6affbe50c2831464f777ec1766d4a5  source/include/acpi.h
+sha256  eaca4c0248db872a055ab38b0deab4f5f577d1a0cada0fcbc0d80955e2a98e33  acpica-unix-20250807.tar.gz
+sha256  dbfa87ff77586ffd8da1185981a9695e80db09b114b3b00c194a9bcc2292a95e  source/include/acpi.h
diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 2c97c04367..e236a81ed0 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ACPICA_VERSION = 20241212
+ACPICA_VERSION = 20250807
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://github.com/user-attachments/files/18117992
+ACPICA_SITE = https://github.com/user-attachments/files/21674610
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
