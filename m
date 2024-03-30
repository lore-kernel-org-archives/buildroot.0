Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AEACD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 14:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56DC6606CE;
	Sat, 30 Mar 2024 14:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_4tf3i_5S8C; Sat, 30 Mar 2024 14:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66C546075B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66C546075B;
	Sat, 30 Mar 2024 14:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4D1D1BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 14:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1FD06075B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 14:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldL_K3h8Ogal for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 14:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22F4E606CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F4E606CE
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22F4E606CE
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 14:30:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id qZigr6Ylv4yJYqZigrs6qV; Sat, 30 Mar 2024 15:30:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 15:30:05 +0100
Message-Id: <20240330143005.1621629-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHnVQ5m2E2d82TC4JVfZmc3ixT8k4VwFcYDxv4nreo0e7KjKuD6SGxmnUyHkzYkG1B/9qPsIm+l9Rxj9ELFJIM1zOMYwMgNPx1rSHZPK7c7OVc04BHCb
 YHbdMXEty/Dhl3lJ0p+LzgYKgM29prXGqIwZ3owq6p7BRNXU5iyMMlb7vwRfWB2EvqdZAxVT7Esq5kl0dcZj7SvqR6lHnUnwNbFU8/64DmMW2O1F1b3iVYPf
 79ApyBd6pLjJE7UwfVwXGx4WebLCx+/Fg1qVQgqnTrs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1711809007; bh=RYC9Wu4G0t6D/o9xGgLVwZU+tcdb8VSHGDH6Oq7dZDQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=OPbYqiw2amadTmlwUnF/bnq0R1g/Rgnhic4OfrLLk/S9UWt/F81VQXqQEekKD6g7o
 nByE8420OfHu59u46U7kw0Yi0JEIc1VVEAcZzBJ1sPsK1PlUuh7H3Gxyru1F3o3EgE
 w0GPOSRiLd3SosbR+8IJ/YCVV3uzipn9iPlLd0wr9pjSe+QCdsIkcJZY0C2bBE8MRT
 uTMxvMposIb+1qpClYRbedLtAP60Hy7eDmPhCNy03Ji5j0db8AvedOtMV8hbaKF+kQ
 rGe6/fFErZJQNkM8gwEaDShjzAci238Tp1yazJCqKuVpaEXNBfYGL/DoyoySwkXHMU
 b2r9ogY40ndZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OPbYqiw2
Subject: [Buildroot] [PATCH] package/swugenerator: bump to version 0.3
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream github tarball dropped prefix "v" while releasing version 0.3
so let's drop it in swugenerator.mk as well.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 2125be3d1c..301f168681 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b5c47c47be0df4df476d2bf596f58a7296a4b0cebe6c8de42251605475b37d25  swugenerator-0.2.tar.gz
+sha256  3f4885242bce9523d26567578793c828e2f07122c6b7e44cce8ede33e5618a01  swugenerator-0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index 466fe1f046..22ed799e99 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.2
-SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
+SWUGENERATOR_VERSION = 0.3
+SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
 HOST_SWUGENERATOR_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
