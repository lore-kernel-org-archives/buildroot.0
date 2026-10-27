Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3043606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IxXySD4u
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9621240709;
	Tue, 27 Oct 2026 20:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LEdQowM0rKl9; Tue, 27 Oct 2026 20:03:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 971C940708
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131422;
	b=J4YFaxQW1+I4ho5t3twy6Bfq0keWbGNLIa7LyXh7dFT7zTF8leP97ArH8J3h69gdcZLA
	 haTa/qTsfxCq9OG9r9ZKlSmWW2kcZqPogr9Bj1mHySntVI2oPPrl9zi/2WW2KsptGcJyo
	 F5Vg+ncRn3ZEN2xhkg2eSzGMgJ2JH2xA5ICi6UwSvmwsZBPhCYxge1uicQ6o/4KKPC8nj
	 lkqtPWiRJ5usFbUVbzKJ7whf9OsjpJoHLASvyn7XJQz5uz1mg1rbQ130/2c2qwhbak573
	 SJdd4yavKKisjcv2XnB+zX2CnhzGpYqiv3SO+d3iBL8emO6KpUUTTS/gjXqdxWGLG2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131422;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XeC/uCSpjNkCnJNUXvdPBt7le1dtfLBG2kTHwSmmbmo=;
	b=fNTjbzq+88zO0zDIHEA27MiphxFMjK6/pKH3asrQGhfG9yWMHp4HDAj4SoCV3cDNA3nc
	 WJT79UbmJ8gqWfnXOyiOEPQLJdwl13Xrok4iPXuz0LV6u6c+IpOjKo2cazsctFAa6kVX3
	 A8Nk4uiA1j8ZhEOH69gSvOqwkBzpcV6o7EJJGG/9S2nKaoMSH/eR1k+wY4Jxyrk9iWx8J
	 NWivX7dFk/pu9bM3nu8YRk4i8FG20cqosPRCdK+Z/vcfRJ3Gy79kzHdny5QHOYm5NG4G/
	 p8lM6Jlj3/YNKHQXOWRnxt/H/8aNdYYN64xokyaSZYxSGInqJkn44l5veB76hS98RtA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131422;
	bh=XeC/uCSpjNkCnJNUXvdPBt7le1dtfLBG2kTHwSmmbmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IxXySD4uBbFx86pCH7oDDgY4HML8Y6+L8YwcVJH7biZ6xDW5lHvfhUQfFow1vJ8RW
	 pZkOFC7qHJzJLXX2aMrVytRYWHwwnXDnkFVG/YO1F4BmlZ1iIlfWQ81DmtlV0tPiNz
	 jw+jpv3Sn5lH82Nt663FRq0G/XgYDlla/U2ZZ8QGakpK/q2xLoqsI/PYs6xC/+YcW5
	 cgAyTOWH+WbfFztoCI24pfuVSPu5kvtJtzTLy1bY0RmrrOGZqaAVdtHwvLmQrSot+t
	 qcrYDgHJHZ+vyt7Hzt5JVR7H6R/Oam2iaYxDrREw7oJFv4rcdMgTA2UU8YN/y8vgr2
	 eY5VCVLd9KLtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 971C940708;
	Tue, 27 Oct 2026 20:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04387279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1D4F60681
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZj_oq-2oDaW for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:03:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 096706061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131418;
 b=kB9Iv/5ROy4kzeOWznlv22d3686b5MunzeGeTddLoJc4dQYefpMWhZQgXDFTHsRscLYt
 6qvCOmpbDYEf4GTIdDL7JdrbsKvqCAduufHaLVzL62C4MqpH7SNgPqhWAnmYnGr3noBIw
 mmGzTrR+ID2joDBI7lbQbvxCYpqI4cm2NSNyVNuKw6lD2c+Ky/LvSa6+jDzYJ67wQNMoQ
 GNUsY83T9gxsWooeKjayqBJBvE0dcVVWxzLabm32FBfyO2EB6tjM7HcpfmTbP9D8gWHKs
 fYVRYY4NsbpvvykjhyUtYMCmFM7meFxnaivmYh8nOLach423CDp7stEo9Awlxh+GjBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131418;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sPKW45bPDfMzPbWMbRq8EbtrvK6+fXdlrV+K+EGYgUw=;
 b=J/BL2JgaH3IMuWv6f06x52muRKfQhQzJxPnc3AjBGo40/l5+OxKCj3lOoGh1ORp7j0Vq
 8IKW6qDgIBLKuWwgIoNUIcjWf3MzRVbEAGYnA97Cro0JEplyZi/6LBTMmSrpuQQCaozrh
 hLLHwl4Yngpn3e1wqZSX0HfliSwONSFEoG4opLWmOckLNCB4MtUYxqD0+Rqr8jIRKeN5J
 lcCu9CWLvqMZvHPMRser9eE0txbdjEyjWJq/WWNGkem12JCKR1Pn9uZSGwYASL6bg10WT
 ct6x6LpdfS4eW/B5K5VphwC8folViITGhvIJn0GIIpj9y8CEAsy1ghMLY8b7lDBCWtw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 096706061D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:03:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 695979D166; Tue, 27 Oct 2026 20:02:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 21:03:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16e9d26454db405ea671709f83b4d96788ef0b80
X-Git-Newrev: 405f2ce36c6a4d2b43c1f2d79e5825e8d24afd96
X-Patchwork-Hint: ignore
Message-Id: <20261027200211.695979D166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender: change device type to
 compatible-types
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/405f2ce36c6a4d2b43c1f2d79e5825e8d24afd96
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Newer versions of mender-artifact echo deprecation warnings when using
the --device-type argument and tell users to use --compatible-types.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/post-build.sh                      | 12 ++++++------
 board/mender/x86_64/post-image-efi.sh                  | 18 +++++++++---------
 configs/mender_x86_64_efi_defconfig                    |  2 +-
 .../testing/tests/package/test_mender/post-build.sh    |  6 +++---
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 9e909e9281..3989b58b42 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -1,11 +1,11 @@
 #!/usr/bin/env bash
 set -e
-DEVICE_TYPE="buildroot-x86_64"
+COMPATIBLE_TYPES="buildroot-x86_64"
 
 parse_args() {
     local o O opts
-    o='a:o:d:'
-    O='artifact-name:,data-part-size:,device-type:'
+    o='a:o:c:'
+    O='artifact-name:,data-part-size:,compatible-types:'
     opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
     while [ ${#} -gt 0 ]; do
@@ -14,8 +14,8 @@ parse_args() {
             # Ignored to have same options as other scripts
             shift 2
             ;;
-        (-d|--device-type)
-            DEVICE_TYPE="${2}"; shift 2
+        (-c|--compatible-types)
+            COMPATIBLE_TYPES="${2}"; shift 2
             ;;
         (-a|--artifact-name)
             # Ignored to have same options as other scripts
@@ -42,7 +42,7 @@ mender_fixup() {
 main() {
     parse_args "${@}"
     mender_fixup
-    echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
+    echo "device_type=${COMPATIBLE_TYPES}" > "${TARGET_DIR}/etc/mender/device_type"
 }
 
 main "${@}"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index a3e262f8fe..a1dccb25b3 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -3,14 +3,14 @@ set -e
 BOARD_DIR="$(realpath "$(dirname "$0")")"
 DATA_PART="${BINARIES_DIR}"/data-part
 DATA_PART_SIZE="32M"
-DEVICE_TYPE="buildroot-x86_64"
+COMPATIBLE_TYPES="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
 # Parse arguments.
 parse_args() {
     local o O opts
-    o='a:o:d:'
-    O='artifact-name:,data-part-size:,device-type:'
+    o='a:o:c:'
+    O='artifact-name:,data-part-size:,compatible-types:'
     opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
     eval set -- "${opts}"
     while [ ${#} -gt 0 ]; do
@@ -18,8 +18,8 @@ parse_args() {
         (-o|--data-part-size)
             DATA_PART_SIZE="${2}"; shift 2
             ;;
-        (-d|--device-type)
-            DEVICE_TYPE="${2}"; shift 2
+        (-c|--compatible-types)
+            COMPATIBLE_TYPES="${2}"; shift 2
             ;;
         (-a|--artifact-name)
             ARTIFACT_NAME="${2}"; shift 2
@@ -55,7 +55,7 @@ generate_mender_bootstrap_artifact() {
     write bootstrap-artifact \
     --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
-    --device-type "${DEVICE_TYPE}" \
+    --compatible-types "${COMPATIBLE_TYPES}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
     --provides "rootfs-image.checksum:${img_checksum}" \
     --clears-provides "rootfs-image.*" \
@@ -65,14 +65,14 @@ generate_mender_bootstrap_artifact() {
 
 # Create a mender image.
 generate_mender_image() {
-    echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
         --compression none \
-        -t "${DEVICE_TYPE}" \
+        -c "${COMPATIBLE_TYPES}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-        -o "${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
+        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
 }
 
 generate_image() {
diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 619122f5c9..f10a461770 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -6,7 +6,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_OVERLAY="board/mender/x86_64/overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/mender/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/mender/x86_64/post-image-efi.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64 --artifact-name=1.0"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --compatible-types=buildroot-x86_64 --artifact-name=1.0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.59"
diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index 1afa231082..76698fb7d9 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -1,13 +1,13 @@
 #!/usr/bin/env bash
 set -e
-DEVICE_TYPE="buildroot-arm"
+COMPATIBLE_TYPE="buildroot-arm"
 ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
 
 generate_mender_bootstrap_artifact() {
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
     --artifact-name "${ARTIFACT_NAME}" \
-    --device-type "${DEVICE_TYPE}" \
+    --compatible-types "${COMPATIBLE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
     --clears-provides "rootfs-image.*" \
     --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
@@ -17,7 +17,7 @@ generate_mender_bootstrap_artifact() {
 function mender_fixup() {
   rm -rf "${TARGET_DIR}"/var/lib/mender
   mkdir -p "${TARGET_DIR}"/var/lib/mender
-  echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
+  echo "device_type=${COMPATIBLE_TYPE}" > "${TARGET_DIR}"/var/lib/mender/device_type
 
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
