Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A527BC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 12:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50B7141868;
	Tue, 14 Mar 2023 12:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B7141868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kq_GX-ahfRg2; Tue, 14 Mar 2023 12:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F0641869;
	Tue, 14 Mar 2023 12:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33F0641869
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5C5F1BF3D4
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFA5A6108A
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 12:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA5A6108A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvKIOIjRsDZf for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 12:30:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7AFB61069
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7AFB61069
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 12:30:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id c3nTpHZLpcQY3c3nTpkjEt; Tue, 14 Mar 2023 13:30:31 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 13:30:30 +0100
Message-Id: <20230314123030.2523162-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230314085947.231281ad@windsurf>
References: <20230314085947.231281ad@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLJponuQ/X45/kSlZPeSCHSmAVX2vQ36QEtfWbIxoOutAb6lJYA5ZXkYnd12IvycdPL4gHoSUDuNahq7xULuPuBbubHkERpm+SM5ouyJaMihEOLg/tPe
 S2+y0IHArw+VboQuH+v8cuqMHTHrIgF4/n/mSapkffWHKJTBzltppbEb0nXscCHElEZUuKIqN6L7i9Pmkc5e/Np+9bvMeUfMCO7jiXjtVrMUkeGxl8CdZI/9
 qiaigWhJNGkA6upH5Y0kL0aW6DZjCVd/epDldOU44LmXLdmky+AVUZ9Oo0ZUnv1h08vnGDW4g0F2pdoKthIfGL/ZE8hydo/CmygQnFqE+Ds=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678797031; bh=B8EvUqXsO7iSt8lOxuiqJVf0Y9ZrKwTPcCgXhnCNvUo=;
 h=From:To:Subject:Date:MIME-Version;
 b=jfEbR59Q/DLY0NlEfGDTXXD2HX514Myqrp/Aml2Az6RYDQSibBLddGqYuIRXP/Vm6
 29ugJT+o1sdcuGjocz7CZUNM0CspmQXAlVsfutfMAflI3So3omXOUSeVnkMSaV63Kv
 qpdRwvaTXuc7f0CTPA2y/zV3LFJALXl9E967g0NzJsp49F0qCnbj8mtMXugo3F5aKx
 zymN0abj/S5ip4r9NAjXLJ/ZMyJOZwdAwT2meZY61jiKe3clpTdzUPx7umm4H1y8wk
 ngMOOZDnp4u2uSRHEJYq5DjdLIr5jWWyek0rOpJz/HGNRKoeAidnwieI4CboVQrR4l
 BOA3gAqRgd6Rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jfEbR59Q
Subject: [Buildroot] [PATCH v2] package/swugenerator: new package
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
V1->V2:
* use github macro for package _SITE as pointed by Thomas Petazzoni
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
index 0000000000..db43b18af6
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
+SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,v$(SWUGENERATOR_VERSION))
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
