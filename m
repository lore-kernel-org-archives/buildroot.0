Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32E4EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 09:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29D8760797;
	Sun, 20 Aug 2023 09:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29D8760797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sd5gImW0QoMM; Sun, 20 Aug 2023 09:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6140A60BC2;
	Sun, 20 Aug 2023 09:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6140A60BC2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE8E81BF5E6
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 910C080D6B
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 09:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 910C080D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bszn4nEx4mBk for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 09:58:31 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779EE80C37
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 09:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779EE80C37
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1FA3E13F8B6;
 Sun, 20 Aug 2023 11:58:27 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 11:58:21 +0200
Message-ID: <20230820095821.166705-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692525508;
 bh=wJT6TSHbIQHqWBkYjJYHupLiPTPKtzEHgPogS1VIhfg=;
 h=From:To:Cc:Subject:Date:From;
 b=OOz6V/JHjJ6AUE1mLzcuZ/Ut/ByOeN0UVA+CyEMDiLEvuzF0bAITjd44zMtSt8CUs
 QsEoGe4HZDTp9gk/O1dLoM2P3aAVE1ZBJVLjh2qyheVErZ2wBQzcobcv9JUEUeiNgN
 HXdnj2qGiF0kY5iqUMtd/CKj8Y0A0eI60YQOW2iuNjJrPsVmwxNG1U5akGALZM6+kf
 DKDCrbWvRxhz0DMGgjvTrsjmx21Z8TO6MPlNsmcFWN405s60Y5IEbDgfkf1xSiLUj3
 3ggNKSnh0pCjRpV6b0TKlVvfovqeENYJjqXQ0tss4pRvGz6WJY9MYy3ABBnWweQfDy
 okCZRqkFSI3+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OOz6V/JH
Subject: [Buildroot] [PATCH next 1/1] package/opencsd: bump to version 1.4.1
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://github.com/Linaro/OpenCSD/blob/v1.4.1/README.md?plain=1#L294

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit c614a7d with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p opencsd
    ...
    6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 84a762fb36..a3534976b5 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  e1bb6d8d09e87974cb5ca6db2a13b0e1ba9e51117ca2ed71879df07ff7af4de2  opencsd-1.4.0.tar.gz
+sha256  159a611535fd7d3bf179bcbdab3791852c6e7199401a6e59cdeef3ba2072edc4  opencsd-1.4.1.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 680364d01d..76135bf0b0 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.4.0
+OPENCSD_VERSION = 1.4.1
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
