Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1C7C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 22:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 126578195D;
	Mon, 13 Mar 2023 22:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 126578195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jMUuCKKJLlvy; Mon, 13 Mar 2023 22:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DD01818C0;
	Mon, 13 Mar 2023 22:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD01818C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAB911BF30C
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 22:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81AE7417B4
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 22:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81AE7417B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arONOnotTD95 for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 22:24:17 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D07FE417A8
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D07FE417A8
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 22:24:15 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bqTZp2EPN5klVbqTapwcPv; Mon, 13 Mar 2023 23:17:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 23:17:05 +0100
Message-Id: <20230313221705.1121868-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLDr4j8tjcTBGh2FjSJk6LNjkfBnIXo9IEpKQeB7zrYoeQ93dt/NBzKmvePxgWjqZJB06U4femLNk/cGkLwjcprp0QITuYZn4oAevgMz2xYocvxngT2T
 uu8Ie7YHCAxkV//BvLOXx7oPjp6gvGo4owhU1rpf2J9UBfonCkYE+TKIoacu9IVpvXe2Y3q9tr0/6L4U92FIIuE1vsKUfTjKuCQaJ5FLUEZaA38GsTHVQM38
 QKIrHwGBDecp6uyBFPI28nWkdR9Rqp+ZodQt8rJ6AEcFTaW5+rOklItan0VjKbsH1/IyztO8Sjhmt1uN8hv7swNnIvjAPQ6dciIJ5DdlgTI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678745826; bh=xv3VkR5KPqI2VkYJu9KoJ3l5KJIgYG/XKyofyWwONBU=;
 h=From:To:Subject:Date:MIME-Version;
 b=SX+hazCWXauO0EyzsFdn8sGbMOCdq4rHLgnaw261h1IPs8A/qduhRlE6bSLk2X/vu
 ECdCgxVX8oU18VoWQsqmGa0seziC1/d27y7syUi06fVUJgxLNORK0VmXfopOrikWTi
 CFmE+vLtdH//kcGjRjJ+oZHb3aVUxd2oco+O9voTQmDEifWqi2jUJPBwHFPdhVCDaT
 03t7NQL3suMh+/s0JfwEn+A6uIta0Sn0rKay1R3ntrpsbadBf5zrq85WRRfA/q1Bkb
 YSaCrV+PnjR3t3KNrxGSGEs64i8vQ6+9q5ti57Zoxzqspy6hll40ZAnd1JCj6GhFX5
 bSm4pJtd+AS7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SX+hazCW
Subject: [Buildroot] [PATCH] package/swugenerator: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add swugenerator as host utility to generate images for swupdate with all
the possible options available like encryption, passkey etc. Let's also
add Giulio Benetti as package maintainer to DEVELOPERS file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/swugenerator/Config.in.host    |  6 ++++++
 package/swugenerator/swugenerator.hash |  4 ++++
 package/swugenerator/swugenerator.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/swugenerator/Config.in.host
 create mode 100644 package/swugenerator/swugenerator.hash
 create mode 100644 package/swugenerator/swugenerator.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b49491da7a..3228f2b709 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1182,6 +1182,7 @@ F:	package/rtl8821cu/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
+F:	package/swugenerator/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..e47b7b5de9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -100,6 +100,7 @@ menu "Host utilities"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/swugenerator/Config.in.host"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
diff --git a/package/swugenerator/Config.in.host b/package/swugenerator/Config.in.host
new file mode 100644
index 0000000000..df0e9a5170
--- /dev/null
+++ b/package/swugenerator/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_SWUGENERATOR
+	bool "host swugenerator"
+	help
+	  A host tool to generate SWU update package for SWUpdate.
+
+	  https://github.com/sbabic/swugenerator
diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
new file mode 100644
index 0000000000..2125be3d1c
--- /dev/null
+++ b/package/swugenerator/swugenerator.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  b5c47c47be0df4df476d2bf596f58a7296a4b0cebe6c8de42251605475b37d25  swugenerator-0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
new file mode 100644
index 0000000000..506465f42d
--- /dev/null
+++ b/package/swugenerator/swugenerator.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# swugenerator
+#
+################################################################################
+
+SWUGENERATOR_VERSION = 0.2
+SWUGENERATOR_SITE = https://github.com/sbabic/swugenerator/archive/refs/tags/v$(SWUGENERATOR_VERSION)
+SWUGENERATOR_LICENSE = GPL-3.0
+SWUGENERATOR_LICENSE_FILES = LICENSE
+HOST_SWUGENERATOR_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
