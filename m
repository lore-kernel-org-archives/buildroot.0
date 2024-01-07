Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFFFC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 12:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC3341B2F;
	Sun,  7 Jan 2024 12:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC3341B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zh26fOc-lWo; Sun,  7 Jan 2024 12:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8371741AE0;
	Sun,  7 Jan 2024 12:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8371741AE0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5E151BF295
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA0F3836C5
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA0F3836C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6svmcxdb71oa for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 12:00:05 +0000 (UTC)
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A06A836EA
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 12:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A06A836EA
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MRourOtLi1f5IMRour6rks; Sun, 07 Jan 2024 13:00:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 12:59:58 +0100
Message-Id: <20240107115958.173945-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105140611.6a19a037@windsurf>
References: <20240105140611.6a19a037@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEqP7Yc6awECBV4soBaVEEHHSkveHJZWCjdicnfCUwvk2WD3Wu/1tyzxKdp3BSxS/jnTFwk5g9FeLnkqCShMzblVHF0IDoqB7Q/vrsQbgjXAG1hOO1ki
 dJR4WJm4wZO4h3tUKlPseNqfBLvCG9wsLacY+KmKR8XghyxUP2dsxK8a5nGm1q6u//5JrPhxXQDztitFMt2fLMkiw6LPlcH6U9SHLXdZCkEm+mqhymzyAm0X
 HpZ5OrwZrcMW7tWHiGr+wg3Zep4xeY6yXGX1RWhsOHGKhcgBUoBBDcdNgSZkENYHZj3zLtU/70DxLP63dz9RRikpcPfaizc7hU+M3hFnRmq/QF37aM7OpXNm
 F1punka5GCyU7bc/FJ2uSv5CNTlVPw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704628801; bh=FSqDbbUyZ5TqHlUEGMYFFWcEIKrrLRaY4hEekFXT+Gk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Jfa4i2vWlkKSbuL6i6Sy09vpNYMTH6Tgw3+JtZTgh6CdEVyXgwW1uxoiFuXT6hW0U
 XL563yz7wWdpMkmhVK75am4RgwRWYIQJAjcbe8xSISQmOoREAj6BMbpGKSFITLDRZ2
 tDQM+3gfP78t6sZaulnTNvWnxkFDupPHLr57xMLV55zoXQkLjst+dlhbDRRa61+fTc
 jftulB+4KGQYvCZzGbBvTNqVEL5bN0vUUjrkhsTD8rx/f4bAsuECjQCr8EYuKy3Yqy
 kzc+gtzZpqdiZmo6/gc1X1v3UH53DI7C+jbF/88wS1+agw0ONp+AZcME49hrpJ1cK9
 Li1JP9lAZhKhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Jfa4i2vW
Subject: [Buildroot] [PATCH v3] package/swugenerator: add missing runtime
 dependencies
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

Package swugenerator can use openssl to encrypt files in .swu(cpio)
resulting output archive and gzip or zlib to compress the same files but
we're not sure build environment have or not openssl, gzip and zlib
installed so add them as host dependencies like:
* host-openssl
* host-gzip
* host-zlib

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
V1->V2:
* V1->V2:
* add host-zstd and clarify in commit log these are runtime dependencies as
  pointed by Thomas Petazzoni
V2->V3:
* improve commit log explaining why we need this patch as pointed by
  Thomas Petazzoni
---
 package/swugenerator/swugenerator.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index f4ead1d229..466fe1f046 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -9,6 +9,10 @@ SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
 HOST_SWUGENERATOR_SETUP_TYPE = setuptools
-HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
+HOST_SWUGENERATOR_DEPENDENCIES = \
+	host-gzip \
+	host-openssl \
+	host-python-libconf \
+	host-zstd
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
