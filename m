Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79004C0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BCC812EC;
	Tue,  1 Aug 2023 20:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BCC812EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdtCliUuMR0H; Tue,  1 Aug 2023 20:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A7E817B5;
	Tue,  1 Aug 2023 20:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A7E817B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 203DC1BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5F18400FF
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5F18400FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXu3Czdl0jLg for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:47:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F145C40524
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F145C40524
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA5DE83F67; Tue,  1 Aug 2023 20:47:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 22:47:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcc4f13857f77928b9197a4ca611784759925ea8
X-Git-Newrev: 8ca683b105f3192b3a56db1ecbb88635b6a6af39
X-Patchwork-Hint: ignore
Message-Id: <20230801204735.DA5DE83F67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mhz: add new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ca683b105f3192b3a56db1ecbb88635b6a6af39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mhz is a tool to mathematically calculate the real running CPU frequency
and as such has proved as invaluable tool for developing CPUFreq and
similar features in the kernel.

Its source finally got a license recently so it can be packaged.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/mhz/Config.in |  6 ++++++
 package/mhz/mhz.hash  |  3 +++
 package/mhz/mhz.mk    | 20 ++++++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1f1cad5e6..22d26ea961 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2540,6 +2540,7 @@ F:	package/azmq/
 
 N:	Robert Marko <robimarko@gmail.com>
 F:	package/mdio-tools/
+F:	package/mhz/
 
 N:	Robert Rose <robertroyrose@gmail.com>
 F:	package/grpc/
diff --git a/package/Config.in b/package/Config.in
index 5b65ed588f..54cddc3914 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -551,6 +551,7 @@ endmenu
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
+	source "package/mhz/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/mhz/Config.in b/package/mhz/Config.in
new file mode 100644
index 0000000000..2f4af5026e
--- /dev/null
+++ b/package/mhz/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_MHZ
+	bool "mhz"
+	help
+	  CPU frequency measurement utility.
+
+	  https://github.com/wtarreau/mhz.git
diff --git a/package/mhz/mhz.hash b/package/mhz/mhz.hash
new file mode 100644
index 0000000000..c399c4b56f
--- /dev/null
+++ b/package/mhz/mhz.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c4b49dc719846220b96ac6060f15dd917316189cbbd2e0896b1b5e796e063ede  mhz-11aac2399780a1f7ea9f007b14af0464797d5cf1.tar.gz
+sha256  9449d373cad921620bb8f1e4f7b39f957e263163ded159c1efc8de27f8997099  LICENSE
diff --git a/package/mhz/mhz.mk b/package/mhz/mhz.mk
new file mode 100644
index 0000000000..025a5c6b9f
--- /dev/null
+++ b/package/mhz/mhz.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mhz
+#
+################################################################################
+
+MHZ_VERSION = 11aac2399780a1f7ea9f007b14af0464797d5cf1
+MHZ_SITE = $(call github,wtarreau,mhz,$(MHZ_VERSION))
+MHZ_LICENSE = MIT
+MHZ_LICENSE_FILES = LICENSE
+
+define MHZ_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define MHZ_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/mhz $(TARGET_DIR)/usr/bin/mhz
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
