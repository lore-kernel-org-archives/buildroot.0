Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BE9C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C2BB415AB;
	Sun, 17 Jul 2022 13:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C2BB415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28kVAhe0VCLl; Sun, 17 Jul 2022 13:07:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9C641592;
	Sun, 17 Jul 2022 13:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9C641592
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EB181BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCB1F40412
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCB1F40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3udGCf6Tqgs for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:07:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA78D400F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA78D400F2
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 96B0983AD4; Sun, 17 Jul 2022 12:54:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 15:07:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6319d97a7864314088dcc6d1199f35029cfcecb
X-Git-Newrev: 7f55bdc216beaa24611463e5861bb629d79efefc
X-Patchwork-Hint: ignore
Message-Id: <20220717125426.96B0983AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crucible: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7f55bdc216beaa24611463e5861bb629d79efefc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crucible is a useful tool that allows reading and writing
to the i.MX fuses via the Linux NVMEM framework.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/crucible/Config.in     |  8 ++++++++
 package/crucible/crucible.hash |  2 ++
 package/crucible/crucible.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0fc73f311f..5c3c24ff7a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -862,6 +862,7 @@ F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
 F:	configs/warpboard_defconfig
 F:	package/atest/
+F:	package/crucible/
 F:	package/kmscube/
 
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 3feb47c534..1a55e10f79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ endmenu
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cpuburn-arm/Config.in"
+	source "package/crucible/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
diff --git a/package/crucible/Config.in b/package/crucible/Config.in
new file mode 100644
index 0000000000..b27eb31ae5
--- /dev/null
+++ b/package/crucible/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CRUCIBLE
+	bool "crucible"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  Crucible is a One-Time-Programmable (OTP) fusing tool for the
+	  i.MX family.
+
+	  https://github.com/usbarmory/crucible
diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
new file mode 100644
index 0000000000..ad8a2cb35c
--- /dev/null
+++ b/package/crucible/crucible.hash
@@ -0,0 +1,2 @@
+sha256  51e911ce5e2a9f182a737b71f6e2bbf46fb80bb3252220cd99ffaf54d38e6c64  crucible-v2022.05.25.tar.gz
+sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
new file mode 100644
index 0000000000..e9038f8cff
--- /dev/null
+++ b/package/crucible/crucible.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# crucible
+#
+################################################################################
+
+CRUCIBLE_VERSION = v2022.05.25
+CRUCIBLE_SITE = $(call github,usbarmory,crucible,$(CRUCIBLE_VERSION))
+CRUCIBLE_LICENSE = GPL-3.0
+CRUCIBLE_LICENSE_FILES = LICENSE
+CRUCIBLE_GOMOD = ./cmd/crucible
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
