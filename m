Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4494C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 17:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6516E40917;
	Sun, 19 Jun 2022 17:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6516E40917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWzdQnxUj7x8; Sun, 19 Jun 2022 17:35:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BCE04091C;
	Sun, 19 Jun 2022 17:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BCE04091C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36A961BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10A57410C5
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 17:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10A57410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiBW_sx4RuB1 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 17:35:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC61E40948
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 17:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC61E40948
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4A0998745B; Sun, 19 Jun 2022 17:23:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 19:22:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 467836357943f3a08a2ee3686e2878c51f9c4453
X-Git-Newrev: 776385d645b37cfc43479b37e106244aa9ab2e85
X-Patchwork-Hint: ignore
Message-Id: <20220619172329.4A0998745B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=776385d645b37cfc43479b37e106244aa9ab2e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UUU (Universal Update Utility) is a Freescale/NXP I.MX Chip image deploy
tools. It is an evolution of MFGTools (aka MFGTools v3). For this and
for backward compatibility we have created a new package instead of
updating the mfgtools package.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Arnout: fix check-package warnings]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                 |  3 +++
 package/Config.in.host     |  1 +
 package/uuu/Config.in.host | 18 ++++++++++++++++++
 package/uuu/readme.txt     | 13 +++++++++++++
 package/uuu/uuu.hash       |  4 ++++
 package/uuu/uuu.mk         | 19 +++++++++++++++++++
 6 files changed, 58 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6430a38296..62191e554c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -654,6 +654,9 @@ F:	package/lua-cjson/
 F:	package/luaexpat/
 F:	package/xinetd/
 
+N:	Dario Binacchi <dario.binacchi@amarula.solutions.com>
+F:	package/uuu/
+
 N:	Dario Binacchi <dariobin@libero.it>
 F:	package/davinci-bootcount/
 F:	package/libmnl/
diff --git a/package/Config.in.host b/package/Config.in.host
index 8d2a8f4801..71f2a9311c 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -97,6 +97,7 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/utp_com/Config.in.host"
+	source "package/uuu/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
 	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
diff --git a/package/uuu/Config.in.host b/package/uuu/Config.in.host
new file mode 100644
index 0000000000..0ed064feb6
--- /dev/null
+++ b/package/uuu/Config.in.host
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_HOST_UUU
+	bool "host uuu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
+	help
+	  UUU (Universal Update Utility) is Freescale/NXP I.MX Chip
+	  image deploy tool. UUU is an evolution of MFGTools
+	  (aka MFGTools v3).
+
+	  To be able to run uuu without root privileges, execute the
+	  following steps:
+
+	    sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
+	    sudo udevadm control --reload
+
+	  https://github.com/NXPmicro/mfgtools
+
+comment "host uuu needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/uuu/readme.txt b/package/uuu/readme.txt
new file mode 100644
index 0000000000..80dd90b933
--- /dev/null
+++ b/package/uuu/readme.txt
@@ -0,0 +1,13 @@
+uuu Howto
+=========
+
+Running uuu without root privileges
+-----------------------------------
+
+Accessing USB devices on Linux requires root privileges by default.
+To be able to run uuu without root priviles, execute the following
+steps:
+
+  sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
+  sudo udevadm control --reload
+
diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
new file mode 100644
index 0000000000..10efff0337
--- /dev/null
+++ b/package/uuu/uuu.hash
@@ -0,0 +1,4 @@
+# locally computed
+sha256  4fda8db488c4d3a98c2480c47b41907ad26b714c6400dd0a202baab4c17b0a9b  uuu-1.4.193.tar.gz
+sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
+sha256  77b90738ae98b7958d34d9f96caf2671210a133427f8f6b784914b54f406c29b  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
new file mode 100644
index 0000000000..d8c480034a
--- /dev/null
+++ b/package/uuu/uuu.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# uuu
+#
+################################################################################
+
+UUU_VERSION = 1.4.193
+UUU_SITE = $(call github,NXPmicro,mfgtools,uuu_$(UUU_VERSION))
+UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
+UUU_LICENSE_FILES = LICENSE README.md
+HOST_UUU_DEPENDENCIES = host-bzip2 host-zlib host-libusb
+
+define UUU_SET_VERSION
+	echo $(UUU_VERSION) > $(@D)/.tarball-version
+endef
+
+HOST_UUU_POST_EXTRACT_HOOKS += UUU_SET_VERSION
+
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
