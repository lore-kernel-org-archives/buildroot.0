Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129CBC7EE37
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B52A0417CE;
	Tue,  6 Jun 2023 19:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B52A0417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_OVOryrOVid; Tue,  6 Jun 2023 19:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE037417CD;
	Tue,  6 Jun 2023 19:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE037417CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC6A1BF339
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7653841D6A
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7653841D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wO45hI7dzg6 for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 19:40:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 434C041C03
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 19:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 434C041C03
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EBFE86D08; Tue,  6 Jun 2023 19:40:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Jun 2023 21:37:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7db2ab3041150ee382a257c6c7ce686f9ba24ce9
X-Git-Newrev: 48c3d9f396dd7a9fa426e3f7ddbff65a6270aeaf
X-Patchwork-Hint: ignore
Message-Id: <20230606194038.2EBFE86D08@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynqmp: fix shellcheck issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=48c3d9f396dd7a9fa426e3f7ddbff65a6270aeaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch cleans up board/zynqmp shellcheck issues.

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Peter: wrap long lines, use quotes around entire word]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore              |  3 ---
 board/zynqmp/kria/kv260/kv260.sh | 10 +++++++---
 board/zynqmp/post-build.sh       |  7 +++----
 board/zynqmp/post-image.sh       |  8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 90a1481e54..2d838e7ff3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -101,10 +101,7 @@ board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
-board/zynqmp/kria/kv260/kv260.sh Shellcheck
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
-board/zynqmp/post-build.sh Shellcheck
-board/zynqmp/post-image.sh Shellcheck
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
 boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
diff --git a/board/zynqmp/kria/kv260/kv260.sh b/board/zynqmp/kria/kv260/kv260.sh
index e03d67d8b0..dc92c51d43 100755
--- a/board/zynqmp/kria/kv260/kv260.sh
+++ b/board/zynqmp/kria/kv260/kv260.sh
@@ -6,7 +6,11 @@
 # drivers are missing.
 # This will be removed when u-boot can build the kv260 u-boot.itb natively.
 
-UBOOT_DIR=$4
+UBOOT_DIR="$4"
 
-fdtoverlay -o ${UBOOT_DIR}/fit-dtb.blob -i ${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb ${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo
-${UBOOT_DIR}/tools/mkimage -E -f ${UBOOT_DIR}/u-boot.its -B 0x8 ${BINARIES_DIR}/u-boot.itb
+fdtoverlay -o "${UBOOT_DIR}/fit-dtb.blob" \
+	   -i "${UBOOT_DIR}/arch/arm/dts/zynqmp-smk-k26-revA.dtb" \
+	   "${UBOOT_DIR}/arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo"
+
+"${UBOOT_DIR}/tools/mkimage" -E -f "${UBOOT_DIR}/u-boot.its" \
+			     -B 0x8 "${BINARIES_DIR}/u-boot.itb"
diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh
index 0713bd1b05..747991e3f1 100755
--- a/board/zynqmp/post-build.sh
+++ b/board/zynqmp/post-build.sh
@@ -3,14 +3,13 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
-CONSOLE=$2
-ROOT=$3
+CONSOLE="$2"
+ROOT="$3"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
-	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
+	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
 	__HEADER_EOF
diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
index c5de2db820..f44b66342d 100755
--- a/board/zynqmp/post-image.sh
+++ b/board/zynqmp/post-image.sh
@@ -6,10 +6,10 @@
 
 FIRST_DT=$(sed -nr \
                -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               ${BR2_CONFIG})
+               "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
