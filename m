Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B7CC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 10:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5413A60ECD;
	Wed, 15 Mar 2023 10:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5413A60ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4OvcWHXnUPu; Wed, 15 Mar 2023 10:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662C860EF2;
	Wed, 15 Mar 2023 10:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662C860EF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01C5F1BF962
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCE8A81CA3
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 10:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE8A81CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1vWhFRF1Rvtn for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 10:08:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93C05813CA
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93C05813CA
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 10:08:53 +0000 (UTC)
Received: from localhost.localdomain ([151.36.255.68])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cO3sppOaMBDVWcO3tpMB9N; Wed, 15 Mar 2023 11:08:50 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 11:08:48 +0100
Message-Id: <20230315100848.57061-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
References: <20230314233719.55e2f430@windsurf>
 <20230315100848.57061-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPGs+hhr5gvM+vqwYVMOGTHzqKsZagHGrsmTe7HxU1vgXRcO9o14Hm5z6uBUrcCHbHKgVIVooDMn37Yat5w8IK8016VAWKARIZBQzNrLHJlH3QyTKwO1
 v1WX/hwul+IOzRnW3n005kYn00D1o+yL7A8XTDowF1s4TQ9vkOmMtQJimBpyi0XaTtBDa4JbEVFdCcdcITMOeioC8djSqaeMTJHZ3JbxE632FrMVAFS19Yec
 nVQHMWQ6IPLV3OHAYjIZs8ZN6LhEcQ7bWyF0lkFNlEhJYPL78r8eBQVBSiZU60uJVCPLtlgZbP97JbYtPa2FXXOs342n1x4cFkB2iDoA2GezLExdzatOA6Zm
 +w+NxbPdJjnQyEMG1WzmDxUhxIkTerk3YpJoRWSJ24GSIDm3iIE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678874930; bh=S+QfmbKNOPtYyYxku6vrmeAM/D7SvQR5vnGsfQ9x/Vk=;
 h=From:To:Subject:Date:MIME-Version;
 b=UkLkOwPSH3X7DABr9n4WYfvvwmJZD+OwpF5EX2ZwEI7aQi/KeyU77AGFqsO4MC6mR
 amJBYJdPFoLCkbSLOoCPBTCJ0OwQe5VpeZZI134jg3+QoT+cj42lj2ZEp6g6hdON+7
 1XcMS3TG+ys2NpRgIbsaBNBzjgV0pNjAibjXBfxEI2WLcfuCOZAgBBPYP7qkQZHonQ
 oNJnZ8NQG4AG1Z/JFG37L4TrgMl37MU4ObM6607gZhWjRFHBVVvXdiNy5a+v2Uewtm
 K3APuTfAa7S+nPxwNDtfK9ENhDPLZ3uwY30jNinYzIUOUf8NeoHu9hgj/fRZJzvuCj
 rMn75dBVAsz9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UkLkOwPS
Subject: [Buildroot] [PATCH v2 2/2] package/swugenerator: new package
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
 Asaf Kahlon <asafka7@gmail.com>,
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
* add host dependency to python-libconf
---
 DEVELOPERS                             |  1 +
 package/Config.in.host                 |  1 +
 package/swugenerator/Config.in.host    |  6 ++++++
 package/swugenerator/swugenerator.hash |  4 ++++
 package/swugenerator/swugenerator.mk   | 14 ++++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/swugenerator/Config.in.host
 create mode 100644 package/swugenerator/swugenerator.hash
 create mode 100644 package/swugenerator/swugenerator.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ddffbf428..453fbf4b0f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1186,6 +1186,7 @@ F:	package/rtl8821cu/
 F:	package/sunxi-mali-utgard/
 F:	package/sunxi-mali-utgard-driver/
 F:	package/sunxi-tools/
+F:	package/swugenerator/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	package/wilc-driver/
diff --git a/package/Config.in.host b/package/Config.in.host
index edfe7ce4b3..7059d78eb8 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -101,6 +101,7 @@ menu "Host utilities"
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
index 0000000000..f4ead1d229
--- /dev/null
+++ b/package/swugenerator/swugenerator.mk
@@ -0,0 +1,14 @@
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
+HOST_SWUGENERATOR_DEPENDENCIES = host-python-libconf
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
