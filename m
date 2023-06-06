Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D8AC77B7A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C5A417B3;
	Tue,  6 Jun 2023 19:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C5A417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCL8p_lUnW6y; Tue,  6 Jun 2023 19:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1196C4177A;
	Tue,  6 Jun 2023 19:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1196C4177A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2ED071BF339
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 160324177A
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 19:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 160324177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z79QTl9ZllrI for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 19:40:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3676C41743
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 19:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3676C41743
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2193C86D07; Tue,  6 Jun 2023 19:40:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Jun 2023 21:26:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 757251a0deeb28cf4a682bb9db5a438be4c0f925
X-Git-Newrev: 7db2ab3041150ee382a257c6c7ce686f9ba24ce9
X-Patchwork-Hint: ignore
Message-Id: <20230606194038.2193C86D07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynq: fix shellcheck issues
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

commit: https://git.buildroot.net/buildroot/commit/?id=7db2ab3041150ee382a257c6c7ce686f9ba24ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch cleans up board/zynq shellcheck issues.

Signed-off-by: Neal Frager <neal.frager@amd.com>
[Peter: use ${} for variables, quotes around entire word]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore      | 2 --
 board/zynq/post-build.sh | 4 ++--
 board/zynq/post-image.sh | 8 ++++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 10e70f0787..90a1481e54 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -101,8 +101,6 @@ board/udoo/common/post-build.sh Shellcheck
 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch Upstream
 board/versal/post-build.sh Shellcheck
 board/versal/post-image.sh Shellcheck TrailingSpace
-board/zynq/post-build.sh Shellcheck
-board/zynq/post-image.sh Shellcheck
 board/zynqmp/kria/kv260/kv260.sh Shellcheck
 board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder Upstream
 board/zynqmp/post-build.sh Shellcheck
diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
index 9fd8bbf2c8..810fe99879 100755
--- a/board/zynq/post-build.sh
+++ b/board/zynq/post-build.sh
@@ -3,6 +3,6 @@
 # genimage will need to find the extlinux.conf
 # in the binaries directory
 
-BOARD_DIR="$(dirname $0)"
+BOARD_DIR="$(dirname "$0")"
 
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
+install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index ac74286cf6..627c8ac41a 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -6,10 +6,10 @@
 
 FIRST_DT=$(sed -n \
            's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
-           ${BR2_CONFIG})
+           "${BR2_CONFIG}")
 
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
