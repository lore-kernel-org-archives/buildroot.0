Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3D1C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12AB6FBA6;
	Fri,  3 Nov 2023 09:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B12AB6FBA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OLd7cxsvYnyF; Fri,  3 Nov 2023 09:15:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1BB61327;
	Fri,  3 Nov 2023 09:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B1BB61327
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7291BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54BFD433DD
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54BFD433DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwAm3cBS1LUY for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:14:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87BAA43090
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87BAA43090
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71E158655D; Fri,  3 Nov 2023 09:14:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:13:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6da2b51a66a848cc9a7346302227fd4740fc7e67
X-Git-Newrev: 72de7890233026f020de4aba3e8e86c156e55773
X-Patchwork-Hint: ignore
Message-Id: <20231103091458.71E158655D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-mkimage: bump version to
 lf-6.1.36-2.1.0
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
Content-Type: multipart/mixed; boundary="===============8514175168609366893=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8514175168609366893==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=72de7890233026f020de4aba3e8e86c156e55773
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump imx-mkimage to the latest version to gain i.MX9 support.

Patch 0001 and 0004 are merged upstream:
https://github.com/nxp-imx/imx-mkimage/commit/ff23c4fd84bb88d73b52a0ccad733522d2faa477
https://github.com/nxp-imx/imx-mkimage/commit/bce82912c8206edd0cc97af8c6b30240229fae7f

Patch 0002 is no more needed, BUILD_LDFLAGS var is now available:
https://github.com/nxp-imx/imx-mkimage/commit/8185a000a7c6af562e773da812c6c8d141815531

Renumber the remaining patch.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  5 +-
 ...-for-overriding-BL32-and-BL33-not-only-BL.patch | 60 ---------------------
 ...on.patch => 0001-Add-unused-fake-version.patch} |  0
 .../0002-Add-LDFLAGS-to-link-step.patch            | 26 ---------
 ...support-for-overriding-BL31-BL32-and-BL33.patch | 61 ----------------------
 package/imx-mkimage/imx-mkimage.hash               |  4 +-
 package/imx-mkimage/imx-mkimage.mk                 |  9 ++--
 7 files changed, 8 insertions(+), 157 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d956951a87..45f175cd55 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -573,10 +573,7 @@ package/ifupdown-scripts/nfs_check Shellcheck
 package/ifupdown/0001-archcommon-define-GNU-only-FNM_EXTMATCH-to-zero-on-n.patch Upstream
 package/ifupdown/0001-dont-use-dpkg-architecture.patch Upstream
 package/igd2-for-linux/S99upnpd Indent Shellcheck Variables
-package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch Upstream
-package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch Upstream
-package/imx-mkimage/0003-Add-unused-fake-version.patch Upstream
-package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch Upstream
+package/imx-mkimage/0001-Add-unused-fake-version.patch Upstream
 package/inadyn/S70inadyn Indent NotExecutable
 package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
 package/initscripts/init.d/rcS ConsecutiveEmptyLines EmptyLastLine Shellcheck
diff --git a/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
deleted file mode 100644
index 66891ac8e7..0000000000
--- a/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From a4993eda7483cd01662f3f3e2965e7a568cb7178 Mon Sep 17 00:00:00 2001
-From: Erik Larsson <erik.larsson@combitech.se>
-Date: Thu, 8 Mar 2018 19:04:37 +0100
-Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
-
-Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
-Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
----
- iMX8M/mkimage_fit_atf.sh | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/iMX8M/mkimage_fit_atf.sh b/iMX8M/mkimage_fit_atf.sh
-index 4f2b3f3..0444ff0 100755
---- a/iMX8M/mkimage_fit_atf.sh
-+++ b/iMX8M/mkimage_fit_atf.sh
-@@ -18,23 +18,23 @@ if [ ! -f $BL31 ]; then
- 	echo "ERROR: BL31 file $BL31 NOT found" >&2
- 	exit 0
- else
--	echo "bl31.bin size: " >&2
--	ls -lct bl31.bin | awk '{print $5}' >&2
-+	echo "$BL31 size: " >&2
-+	ls -lct $BL31 | awk '{print $5}' >&2
- fi
- 
--BL32="tee.bin"
-+[ -z "$BL32" ] && BL32="tee.bin"
- LOADABLES="\"atf-1\""
- 
- if [ ! -f $BL32 ]; then
- 	BL32=/dev/null
- else
- 	echo "Building with TEE support, make sure your bl31 is compiled with spd. If you do not want tee, please delete tee.bin" >&2
--	echo "tee.bin size: " >&2
--	ls -lct tee.bin | awk '{print $5}' >&2
-+	echo "$BL32 size: " >&2
-+	ls -lct $BL32 | awk '{print $5}' >&2
- 	LOADABLES="$LOADABLES, \"tee-1\""
- fi
- 
--BL33="u-boot-nodtb.bin"
-+[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
- DEK_BLOB="dek_blob_fit_dummy.bin"
- 
- if [ ! -f $DEK_BLOB ]; then
-@@ -49,8 +49,8 @@ if [ ! -f $BL33 ]; then
- 	exit 0
- else
- 
--	echo "u-boot-nodtb.bin size: " >&2
--	ls -lct u-boot-nodtb.bin | awk '{print $5}' >&2
-+	echo "$BL33 size: " >&2
-+	ls -lct $BL33 | awk '{print $5}' >&2
- fi
- 
- for dtname in $*
--- 
-2.31.1
-
diff --git a/package/imx-mkimage/0003-Add-unused-fake-version.patch b/package/imx-mkimage/0001-Add-unused-fake-version.patch
similarity index 100%
rename from package/imx-mkimage/0003-Add-unused-fake-version.patch
rename to package/imx-mkimage/0001-Add-unused-fake-version.patch
diff --git a/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch b/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
deleted file mode 100644
index 086e634d23..0000000000
--- a/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b7ace564b419a05a375a205fd4df8933716b241a Mon Sep 17 00:00:00 2001
-From: Erik Larsson <erik.larsson@combitech.se>
-Date: Tue, 6 Mar 2018 12:28:39 +0100
-Subject: [PATCH] Add LDFLAGS to link step
-
-Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
----
- iMX8M/soc.mak | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
-index 4bfdc37..806b805 100644
---- a/iMX8M/soc.mak
-+++ b/iMX8M/soc.mak
-@@ -84,7 +84,7 @@ FW_DIR = imx-boot/imx-boot-tools/$(PLAT)
- $(MKIMG): mkimage_imx8.c
- 	@echo "PLAT="$(PLAT) "HDMI="$(HDMI)
- 	@echo "Compiling mkimage_imx8"
--	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) -lz
-+	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) $(LDFLAGS) -lz
- 
- lpddr4_imem_1d = lpddr4_pmu_train_1d_imem$(LPDDR_FW_VERSION).bin
- lpddr4_dmem_1d = lpddr4_pmu_train_1d_dmem$(LPDDR_FW_VERSION).bin
--- 
-2.31.1
-
diff --git a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch b/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
deleted file mode 100644
index 494aaf1566..0000000000
--- a/package/imx-mkimage/0004-Add-support-for-overriding-BL31-BL32-and-BL33.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From b1e77d8ccabc6a3910ede2441ff567326291a355 Mon Sep 17 00:00:00 2001
-From: Thomas Perrot <thomas.perrot@bootlin.com>
-Date: Tue, 26 Apr 2022 15:10:04 +0200
-Subject: [PATCH] Add support for overriding BL31, BL32 and BL33
-
-Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
----
- iMX8M/print_fit_hab.sh | 14 +++++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/iMX8M/print_fit_hab.sh b/iMX8M/print_fit_hab.sh
-index b915115..dbc28f2 100755
---- a/iMX8M/print_fit_hab.sh
-+++ b/iMX8M/print_fit_hab.sh
-@@ -1,12 +1,16 @@
- #!/bin/bash
- 
--BL32="tee.bin"
--
- let fit_off=$1
- 
- # keep backward compatibility
- [ -z "$TEE_LOAD_ADDR" ] && TEE_LOAD_ADDR="0xfe000000"
- 
-+[ -z "$BL31" ] && BL31="bl31.bin"
-+
-+[ -z "$BL32" ] && BL32="tee.bin"
-+
-+[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
-+
- if [ -z "$ATF_LOAD_ADDR" ]; then
- 	echo "ERROR: BL31 load address is not set" >&2
- 	exit 0
-@@ -26,7 +30,7 @@ else
- 	let uboot_sign_off=$((fit_off - 0x8000 - ivt_off + 0x3000))
- fi
- 
--let uboot_size=$(ls -lct u-boot-nodtb.bin | awk '{print $5}')
-+let uboot_size=$(ls -lct $BL33 | awk '{print $5}')
- let uboot_load_addr=0x40200000
- 
- let last_sign_off=$(((uboot_sign_off + uboot_size + 3) & ~3))
-@@ -64,13 +68,13 @@ done
- 
- let atf_sign_off=$((last_sign_off))
- let atf_load_addr=$ATF_LOAD_ADDR
--let atf_size=$(ls -lct bl31.bin | awk '{print $5}')
-+let atf_size=$(ls -lct $BL31 | awk '{print $5}')
- 
- if [ ! -f $BL32 ]; then
- 	let tee_size=0x0
- 	let tee_sign_off=$((atf_sign_off + atf_size))
- else
--	let tee_size=$(ls -lct tee.bin | awk '{print $5}')
-+	let tee_size=$(ls -lct $BL32 | awk '{print $5}')
- 
- 	let tee_sign_off=$(((atf_sign_off + atf_size + 3) & ~3))
- 	let tee_load_addr=$TEE_LOAD_ADDR
--- 
-2.31.1
-
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index 8346fd64b1..034b3d02ed 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  593bd94aac027844bc58c62aae55557c14e1f8a99e68ba235a46f083759df3d4  imx-mkimage-lf-5.10.72_2.2.0.tar.gz
-sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  fd538dc571ce06609d6a4d9ee8cfd7d0c93ec4685afa9f1079e5a5931ad3bdbc  imx-mkimage-lf-6.1.36_2.1.0.tar.gz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  LICENSE
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 54c948e0d3..6e70a946bf 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = lf-5.10.72_2.2.0
+IMX_MKIMAGE_VERSION = lf-6.1.36_2.1.0
 IMX_MKIMAGE_SITE = $(call github,nxp-imx,imx-mkimage,$(IMX_MKIMAGE_VERSION))
 IMX_MKIMAGE_LICENSE = GPL-2.0+
-IMX_MKIMAGE_LICENSE_FILES = COPYING
+IMX_MKIMAGE_LICENSE_FILES = LICENSE
 HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
@@ -15,7 +15,8 @@ ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLA
 define HOST_IMX_MKIMAGE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS) -std=c99" \
-		-C $(@D)/iMX8M -f soc.mak mkimage_imx8
+		BUILD_LDFLAGS="$(HOST_LDFLAGS)" \
+		-C $(@D)/iMX8M SOC_DIR=iMX8M -f soc.mak mkimage_imx8
 endef
 define HOST_IMX_MKIMAGE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
@@ -23,7 +24,7 @@ define HOST_IMX_MKIMAGE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/print_fit_hab.sh $(HOST_DIR)/bin/print_fit_hab.sh
 endef
 else
-# i.MX8 and i.MX8X
+# i.MX8, i.MX8X and i.MX9
 define HOST_IMX_MKIMAGE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS) -std=c99" \

--===============8514175168609366893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8514175168609366893==--
