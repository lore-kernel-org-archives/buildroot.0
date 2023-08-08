Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F6EC04A94
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E67F8210C;
	Tue,  8 Aug 2023 21:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E67F8210C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3XZ5d_GA2kV; Tue,  8 Aug 2023 21:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28AE882110;
	Tue,  8 Aug 2023 21:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28AE882110
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E99711BF966
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE82741742
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE82741742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-V1REvQvZd7 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:50:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23CB041712
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:50:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23CB041712
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E96884D86; Tue,  8 Aug 2023 21:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 23:39:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c46ba34cde7035a038a919d8a902f14071c2d1cf
X-Git-Newrev: 312fcbf0ed995738afbf21a507a3cedea65db876
X-Patchwork-Hint: ignore
Message-Id: <20230808215053.0E96884D86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/microchip-hss-payload-generator: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=312fcbf0ed995738afbf21a507a3cedea65db876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Buildroot icicle kit configuration uses the Hart Software
Service's (HSS) payload generator tool. This tool creates a formatted
payload image for the HSS zero-stage bootloader on PolarFire SoC,
given a configuration file and a set of ELF binaries. The
configuration file is used to map the ELF binaries or binary blobs to
the individual application harts (U54s). Add the HSS payload generator
as a host package to support this.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Reviewed-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in.host                             |  1 +
 .../microchip-hss-payload-generator/Config.in.host | 11 +++++++++
 .../microchip-hss-payload-generator.hash           |  3 +++
 .../microchip-hss-payload-generator.mk             | 28 ++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1357f150ce..6daff7c078 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1475,6 +1475,9 @@ F:	package/rpm/
 F:	package/swaybg/
 F:	package/yad/
 
+N:	Jamie Gibbons <jamie.gibbons@microchip.com>
+F:	package/microchip-hss-payload-generator/
+
 N:	Jan Heylen <jan.heylen@nokia.com>
 F:	package/opentracing-cpp/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index aa1f15e3ac..22e0dc64d4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -60,6 +60,7 @@ menu "Host utilities"
 	source "package/mender-artifact/Config.in.host"
 	source "package/meson-tools/Config.in.host"
 	source "package/mfgtools/Config.in.host"
+	source "package/microchip-hss-payload-generator/Config.in.host"
 	source "package/mkpasswd/Config.in.host"
 	source "package/moby-buildkit/Config.in.host"
 	source "package/mosquitto/Config.in.host"
diff --git a/package/microchip-hss-payload-generator/Config.in.host b/package/microchip-hss-payload-generator/Config.in.host
new file mode 100644
index 0000000000..38e11bd0e5
--- /dev/null
+++ b/package/microchip-hss-payload-generator/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR
+	bool "host microchip-hss-payload-generator"
+	help
+	  Microchip PolarFire SoC Payload Generator. This tool creates
+	  a formatted payload image for the HSS zero-stage bootloader
+	  on PolarFire SoC, given a configuration file and a set of
+	  ELF binaries. The configuration file is used to map the ELF
+	  binaries or binary blobs to the individual application harts
+	  (U54s).
+
+	  https://github.com/polarfire-soc/hart-software-services.git
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
new file mode 100644
index 0000000000..69e05e18af
--- /dev/null
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f6f69412caf886e88abbf26de0dee1db790c790b89571f2f0def1e2f3620f057  microchip-hss-payload-generator-2023.06.tar.gz
+sha256  0b67b1d44bcad078580fc5d8e9580a48a9466b769db58aeb1631d4c5ef97e08a  tools/hss-payload-generator/LICENSE.md
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
new file mode 100644
index 0000000000..63ae22ed60
--- /dev/null
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# microchip-hss-payload-generator
+#
+################################################################################
+
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
+# Some parts of the repository are under different licenses, but we
+# are only building/installing the code in
+# tools/hss-payload-generator/.
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE = MIT or GPL-2.0+
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_LICENSE_FILES = tools/hss-payload-generator/LICENSE.md
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_DEPENDENCIES = host-elfutils host-libyaml host-openssl
+
+define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_BUILD_CMDS
+	$(MAKE) -C $(@D)/tools/hss-payload-generator \
+		HOST_INCLUDES="$(HOST_CPPFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_INSTALL_CMDS
+	$(INSTALL) -D -m 755 \
+		$(@D)/tools/hss-payload-generator/hss-payload-generator \
+		$(HOST_DIR)/bin/hss-payload-generator
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
