Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2976FC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F26DD709FB;
	Fri, 28 Feb 2025 17:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOVeGBuhipO3; Fri, 28 Feb 2025 17:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E082470B2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E082470B2A;
	Fri, 28 Feb 2025 17:12:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E21B68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD44C41802
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpPECgbG3npQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A840042F66
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A840042F66
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A173D86A4C; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 14:01:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4772ecef6c44ade30f4befb38e32d6dc293aad3
X-Git-Newrev: 7dbd1c334d6a9f512b35721c8af6a8f2e74dc335
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.A173D86A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mender/readme.txt:
 update readme
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dbd1c334d6a9f512b35721c8af6a8f2e74dc335
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Add missing packages to the mender package list.
 - Update broken URL links.
 - Remove the example mender artifact post-image script in favor of directing
   the user to the board/mender/x86_64/post-image-efi.sh script.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/mender/readme.txt | 56 +++++++++++++----------------------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/package/mender/readme.txt b/package/mender/readme.txt
index c884524a1b..d78623aec9 100644
--- a/package/mender/readme.txt
+++ b/package/mender/readme.txt
@@ -28,13 +28,23 @@ In Buildroot the following packages are provided:
     - This will install the client on target rootfs
 - BR2_PACKAGE_HOST_MENDER_ARTIFACT
     - This will install the 'mender-artifact' tool in host rootfs.
+- BR2_PACKAGE_MENDER_CONNECT
+    - This installs a client that allows for remote terminal access
+      to mender clients registered on a mender server.
+- BR2_PACKAGE_MENDER_GRUBENV
+    - This package provides boot scripts to integrate mender into grub.
+      Mender recommends every client to use this package, including boards
+      using uboot as the primary bootloader.
 
 To fully utilize atomic image-based deployments using the A/B update
 strategy, additional integration is required in the bootloader. This
 integration is board specific.
 
-Currently supported bootloaders are GRUB and U-boot, and for reference
-integrations please visit:
+Currently supported bootloaders are GRUB and U-boot. Buildroot provides
+a reference integration at board/mender/x86_64/ using the
+mender_x86_64_efi_defconfig file.
+
+Additional support and integrations are found at:
 
     https://github.com/mendersoftware/buildroot-mender
 
@@ -46,12 +56,7 @@ files that need your attention:
 
 - /etc/mender/mender.conf
     - main configuration file for the Mender client
-    - https://docs.mender.io/client-configuration/configuration-file/configuration-options
-
-- /etc/mender/artifact_info
-    - The name of the image or update that will be built. This is what the
-      device will report that it is running, and different updates must have
-      different names
+    - https://docs.mender.io/client-installation/configuration/configuration-options
 
 - /var/lib/mender/device_type
     - A string that defines the type of device
@@ -110,40 +115,9 @@ Creating Mender Artifacts
 To create Mender Artifacts based on Buildroot build output you must
 include BR2_PACKAGE_HOST_MENDER_ARTIFACT in your configuration, and
 then you would typically create the Mender Artifact in a post image
-script (BR2_ROOTFS_POST_IMAGE_SCRIPT). Below is an example of such a
-script:
-
-    #!/bin/sh
-
-    set -e
-    set -x
-
-    device_type=$(cat ${TARGET_DIR}/var/lib/mender/device_type | sed 's/[^=]*=//')
-    artifact_name=$(cat ${TARGET_DIR}/etc/mender/artifact_info | sed 's/[^=]*=//')
-
-    if [ -z "${device_type}" ] || [ -z "${artifact_name}" ]; then
-        echo "missing files required by Mender"
-        exit 1
-    fi
-
-    ${HOST_DIR}/usr/bin/mender-artifact write rootfs-image \
-        --update ${BINARIES_DIR}/rootfs.ext4 \
-        --output-path ${BINARIES_DIR}/${artifact_name}.mender \
-        --artifact-name ${artifact_name} \
-        --device-type ${device_type}
-
-As you can see some properties are extracted from target rootfs, and
-this is because these values are used for compatibility checks,
-meaning that the information must be present in both rootfs and in
-Mender Artifact meta data.
-
-- device_type - must be an exact match between rootfs and Mender
-                Artifact meta-data to apply update. You can set an
-                array of devices here as well, e.g if your image is
-                compatible with multiple hardware revisions
+script (BR2_ROOTFS_POST_IMAGE_SCRIPT). See the generate_mender_image
+method in board/mender/x86_64/post-image-efi.sh for a working example.
 
-- artifact_name - must be an exact match between rootfs and Mender
-                  Artifact meta-data to apply update.
 
 Configuring Mender with certificates
 ------------------------------------
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
