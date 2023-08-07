Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC05BEC8737
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95DC382321;
	Thu,  7 Sep 2023 15:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95DC382321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id roiwUysGehnK; Thu,  7 Sep 2023 15:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88241832A9;
	Thu,  7 Sep 2023 15:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88241832A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 129881BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C74D41E1F
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C74D41E1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wAiMWzThvOj for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE03641DA9
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE03641DA9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4A14869E0; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 00:06:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df8b0643b538f33cd605a002cdee65a5a4a8b3e9
X-Git-Newrev: b831bac16a2a61caf1d738e9dbfa9f89797f2296
X-Patchwork-Hint: ignore
Message-Id: <20230907145127.C4A14869E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal: clean shellcheck issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=b831bac16a2a61caf1d738e9dbfa9f89797f2296
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch cleans up the shellcheck issues in the versal post scripts.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore        |  2 --
 board/versal/post-build.sh |  5 ++---
 board/versal/post-image.sh | 14 +++++++-------
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b229a4e015..3b3be0b18f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -99,8 +99,6 @@ board/technologic/ts4900/post-image.sh Shellcheck
 board/toradex/apalis-imx6/post-image.sh Shellcheck
 board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
-board/versal/post-build.sh Shellcheck
-board/versal/post-image.sh Shellcheck TrailingSpace
 boot/afboot-stm32/0003-Makefile-disable-stack-protector.patch Upstream
 boot/at91bootstrap/0001-eabi-fix.patch Upstream
 boot/at91bootstrap/0002-gcc-4.6.x-ldscript-fix.patch Upstream
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
index ff8f8a6071..ed08ea2d49 100755
--- a/board/versal/post-build.sh
+++ b/board/versal/post-build.sh
@@ -3,9 +3,8 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
-CONSOLE=$2
-ROOT=$3
+CONSOLE="$2"
+ROOT="$3"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 92e65ed3b7..1d9802c34d 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -6,12 +6,12 @@
 
 FIRST_DT=$(sed -nr \
                -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
-               ${BR2_CONFIG})
+               "${BR2_CONFIG}")
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
+[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
-BOARD_DIR="$(dirname $0)"
-BOARD_NAME=$4
+BOARD_DIR="$(dirname "$0")"
+BOARD_NAME="$4"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
@@ -23,7 +23,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
 	  }
 	  image {
-	    id = 0x1c000000, name=apu_subsystem 
+	    id = 0x1c000000, name=apu_subsystem
 	    { type=raw, load=0x00001000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a72-0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
 	    { core=a72-0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
@@ -31,5 +31,5 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	}
 	__HEADER_EOF
 
-${HOST_DIR}/bin/bootgen -arch versal -image ${BINARIES_DIR}/bootgen.bif -o ${BINARIES_DIR}/boot.bin -w on
-support/scripts/genimage.sh -c ${BOARD_DIR}/genimage.cfg
+"${HOST_DIR}/bin/bootgen" -arch versal -image "${BINARIES_DIR}/bootgen.bif" -o "${BINARIES_DIR}/boot.bin" -w on
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
