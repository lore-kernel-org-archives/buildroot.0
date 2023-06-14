Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25BDEB64DB
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 13:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 967A980DA3;
	Wed, 14 Jun 2023 13:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 967A980DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9TLz5etE7Mr; Wed, 14 Jun 2023 13:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0F883A6E;
	Wed, 14 Jun 2023 13:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0F883A6E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14A581BF2BA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05E2B839BF
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05E2B839BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPL3e8osXiel for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21CA7839D8
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21CA7839D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B64836BD; Wed, 14 Jun 2023 13:52:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 15:49:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 737a68f384771600561792960502f0f5ac242fa7
X-Git-Newrev: 457cc3325859afad28f761dc30281e916157a536
X-Patchwork-Hint: ignore
Message-Id: <20230614135235.11B64836BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] board/zynqmp: fix
 shellcheck issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=457cc3325859afad28f761dc30281e916157a536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This patch cleans up board/zynqmp shellcheck issues.

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Peter: wrap long lines, use quotes around entire word]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 48c3d9f396dd7a9fa426e3f7ddbff65a6270aeaf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynqmp/kria/kv260/kv260.sh | 10 +++++++---
 board/zynqmp/post-build.sh       |  7 +++----
 board/zynqmp/post-image.sh       |  8 ++++----
 3 files changed, 14 insertions(+), 11 deletions(-)

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
