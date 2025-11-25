Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D2BD0E6C3
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 11:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E518380793;
	Tue, 25 Nov 2025 11:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NCPzJ2n6fRy; Tue, 25 Nov 2025 11:04:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8642E8073F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8642E8073F;
	Tue, 25 Nov 2025 11:04:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C4F4359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EB8F40D0E
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 11:04:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1czSt_hGYxO0 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 11:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C5A340CFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5A340CFC
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C5A340CFC
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 11:04:23 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id NqqJvng0uiuHANqqKvPmEk; Tue, 25 Nov 2025 12:04:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Tue, 25 Nov 2025 12:04:19 +0100
Message-ID: <20251125110419.947350-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBJl7IcOWLknleEZv64e4b8v0FC6zDduD5b7Pf6gtfY6rK5XmLLjCVwYMdyfIC5V1IPQmF347O9WcwBJtyoDNLxipjgAVgQIWCGi7saZRAqHkxK/Gq9t
 1paa1/WDRXRszdb+4JvdKicuswLvD2t02JWMUTzrXOX/gDfYXHQN9zDMUoSo0I6c36pFjBgV/Z0NTnHeTi7Fi6bP95gKzf6NPs/VFQ9/vLbaXaSKEU+2VSK7
 y4INtzsLWtntaPDtB4q99g/Y0xtZ83Ntb8tSuYIELxtwMFhdc5AS6kh/AISU2G3YJm5Z5tprAQu2WgFjNE//wA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764068660; bh=8FGj+lupB6D2QxNbDC6D1b9wCV8+vxKwE7qdIbiJQYs=;
 h=From:To:Subject:Date:MIME-Version;
 b=dFG3BbMJWetdZxe8HZVZ9VJqwT75u6ASwcON0RjzZEPQJOZxSMXyc5GMR1gSIk10A
 hlY8F+ciMrZ3PeYPGIikevV0AXIfd2WtT1NneVHbWH5TYgTVfUXF+GNDovCqdtSSiA
 hE4AR234ldXPv1EBzGlHyWX+QfyopMGzL/BLVRNIfrSw8cvUP1RLZ7b1ZTsuySrtYm
 l0luQOLGb3+xjJmqRsf11b9a8gnX77Kv6nQiqhaTlwrU+sHT+nj8LLjs+Qt0nTeciR
 4GKuMjENvb0OY3pa4PMqAhbr40/W54pm9cfnqtYdfx9imqOkDnS8huilu3SIdfJfI8
 bbGEbWocvkqyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dFG3BbMJ
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.20
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

https://github.com/cesanta/mongoose/releases/tag/7.20

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index b2375309d9..07c0fc68c1 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7ae38c9d673559d1d9c1bd72c0bdd4a98a2cae995e87cae98b4604d5951762b8  mongoose-7.19.tar.gz
+sha256  ede2371ff4e41e95fd7b2de83a7df727388307a64d3706046ead320defe35e7e  mongoose-7.20.tar.gz
 sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index abc95dd311..44de3fa1e0 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.19
+MONGOOSE_VERSION = 7.20
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
