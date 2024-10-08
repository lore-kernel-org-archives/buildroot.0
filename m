Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E20CEFC56
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9870560898;
	Tue,  8 Oct 2024 20:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNlTbbdf4eBr; Tue,  8 Oct 2024 20:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D3046089F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3046089F;
	Tue,  8 Oct 2024 20:42:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 932BE1BF97C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E6A940065
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id haQ6JMLV63GS for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A7994034B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A7994034B
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:42:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63F0A85BEB; Tue,  8 Oct 2024 20:42:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Oct 2024 22:19:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa3ba9755417eda35a68a6fdb4752a57fe5620a8
X-Git-Newrev: 451470b7a5f2bf26954673a87e74b580735f2d6e
X-Patchwork-Hint: ignore
Message-Id: <20241008204223.63F0A85BEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64: clean up post build
 and image scripts
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=451470b7a5f2bf26954673a87e74b580735f2d6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use function_name() {} instead of function function_name {}
- Use consistent double newlines between methods.
- Un-indent the comment aboe the mender_fixup method.
- Remove "Consecutive empty lines" check-package warning

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout: Remove "Consecutive empty lines" check-package warning]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                   |  1 -
 board/mender/x86_64/post-build.sh     |  8 ++++----
 board/mender/x86_64/post-image-efi.sh | 13 +++++--------
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ce638a7c39..207d72fd20 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -44,7 +44,6 @@ board/lego/ev3/post-image.sh Shellcheck
 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch lib_patch.Upstream
 board/lemaker/bananapro/post-build.sh Shellcheck
 board/lemaker/bananapro/post-image.sh Shellcheck
-board/mender/x86_64/post-image-efi.sh lib_shellscript.ConsecutiveEmptyLines
 board/minnowboard/post-build.sh Shellcheck
 board/nexbox/a95x/post-build.sh Shellcheck
 board/nexbox/a95x/post-image.sh Shellcheck
diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index 23d1120d45..bc4f4b8f11 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -3,7 +3,7 @@ set -e
 DEVICE_TYPE="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
-function parse_args {
+parse_args() {
     local o O opts
     o='a:o:d:'
     O='artifact-name:,data-part-size:,device-type:'
@@ -28,8 +28,8 @@ function parse_args {
     done
 }
 
-  # Create a persistent directory to mount the data partition at.
-function mender_fixup {
+# Create a persistent directory to mount the data partition at.
+mender_fixup() {
     pushd "${TARGET_DIR}"
     if [[ -L var/lib/mender ]]; then
         rm var/lib/mender
@@ -44,7 +44,7 @@ function mender_fixup {
     popd
 }
 
-function main {
+main() {
     parse_args "${@}"
     mender_fixup
     echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index 97b9e06d21..073b18c972 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -5,9 +5,8 @@ DATA_PART_SIZE="32M"
 DEVICE_TYPE="buildroot-x86_64"
 ARTIFACT_NAME="1.0"
 
-
 # Parse arguments.
-function parse_args {
+parse_args() {
     local o O opts
     o='a:o:d:'
     O='artifact-name:,data-part-size:,device-type:'
@@ -32,7 +31,7 @@ function parse_args {
 }
 
 # Create the data partition
-function make_data_partition {
+make_data_partition() {
     "${HOST_DIR}/sbin/mkfs.ext4" \
         -F \
         -r 1 \
@@ -42,9 +41,8 @@ function make_data_partition {
         "${BINARIES_DIR}/data-part.ext4" "${DATA_PART_SIZE}"
 }
 
-
 # Create a mender image.
-function generate_mender_image {
+generate_mender_image() {
     echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         --compression lzma \
@@ -55,13 +53,12 @@ function generate_mender_image {
         -o "${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
 }
 
-
-function generate_image {
+generate_image() {
     sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
 }
 
 # Main function.
-function main {
+main() {
     parse_args "${@}"
     make_data_partition
     generate_image
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
