Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E25C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6624B409DD;
	Tue, 26 Dec 2023 21:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6624B409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnZGCAqRc44z; Tue, 26 Dec 2023 21:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69A30409E9;
	Tue, 26 Dec 2023 21:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A30409E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9DC1BF36A
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1355582245
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1355582245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgQc8cySk8I4 for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:40:42 +0000 (UTC)
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9458082244
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9458082244
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IFAErx3q3fPPQIFAErxEx0; Tue, 26 Dec 2023 22:40:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 22:40:37 +0100
Message-Id: <20231226214037.144870-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224121121.401724a3@windsurf>
References: <20231224121121.401724a3@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBcjGj8LENyfxZRNomf1wOypwF3+kuOe9V5lXEvOk3PaFHsLz4pC5iVlGkc/nHYnLRLHmf+IF6toeXgegPi/UOigwZfogTFbDyTAHDU/4TKhOtk8Bzhs
 jvzG/drl9FZf240tcN0S2y2lvdD7s0BCiqChGAtEhI3S8FR8MeWkR6KSOWWw+nkTRj9W7jyq2Gb+DOkCBPaDqFhpviSexnyxdxzdWMil/zVegPwolW0jt859
 aYUEBtIOLayXvHCiRHDsIYldD8IMIV1B1Xe0sI2HCi1SrdHs9nZQWxUayYtrZvvgur+pZm4xyBxFpxZhFibIFGN5HMvfaVC/SMmGtEetAAs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1703626839; bh=Cp/Z7DqfRswBYnoFTCKOp/jhDPmXK5JnXbmNGzJk1ZI=;
 h=From:To:Subject:Date:MIME-Version;
 b=P8bS3obzT7iqToD47UQivoGmbUpwtx4sYQ/5Rw6QQoKNF6f5sJ8CewCde70hYRTrZ
 sD27K8AZkl9mRDc3D3cmWkK4H8InxUzjQroGBRa+MB4rwgFgitOgaT6TGVEERFWhvP
 uzrjbnc6GcHhrQSOlknYVSekFq21dl2++1IlUjrAPdVwtr9rVfL5BV0Xeti3Qs2EsP
 OIxBRkBas7KU6rFSuaaXDSpxmDAa3+X4BDMhJT/aiq3zuUs5zi37cCCISXfpyFUUR5
 KaTpjSa8YT8vE1kSqAHeVGjnfLAmsVxYIzhI5Ouki1uS2Kmz6Qc3ew0CCQIReEPLBq
 ufzB510Uf5/aA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=P8bS3obz
Subject: [Buildroot] [PATCH v2] package/swugenerator: add missing runtime
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
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

At the moment swugenerator package lacks host-openssl, host-gzip and
host-zstd runtime dependency so let's add them to prevent swugenerator from
failing to run.

Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
V1->V2:
* add host-zstd and clarify in commit log these are runtime dependencies as
  pointed by Thomas Petazzoni
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
