Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75495C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E3E60D8E;
	Mon, 14 Nov 2022 07:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21E3E60D8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEpBADTnLy_z; Mon, 14 Nov 2022 07:22:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED7F60D87;
	Mon, 14 Nov 2022 07:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED7F60D87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16BF31BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8550141581
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8550141581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfBBtl7qBR28 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:20:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B719415A4
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B719415A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41589838BF; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 08:18:13 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4b648d371afcd888db113841a4ac8c27ccc4c3d0
X-Git-Newrev: b3f38e5d37447339b69b5e82aae5f2e35ee4edec
X-Patchwork-Hint: ignore
Message-Id: <20221114072057.41589838BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/multipath-tools:
 bump to version 0.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b3f38e5d37447339b69b5e82aae5f2e35ee4edec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Renumber patch
- Update hash of README.md (changes not related to license)
- FPIN support is fixed by setting LINUX_HEADERS_INCDIR and
  https://github.com/opensvc/multipath-tools/commit/63aa47d0327de2beacf86f6a8e2fd7575d62dadf
  FPIN support is (wrongly) enabled if ELS_DTAG_LNK_INTEGRITY is defined
  in /usr/include/scsi/fc/fc_els.h since bump to version 0.8.9 in commit
  b790ff27d5461df4de22732611a1eb4beee68f91 and
  https://github.com/opensvc/multipath-tools/commit/cfff03efbca753ef485ad717087464dced9c721a
  resulting in the following build failure:

  In file included from /nvmedata/autobuild/instance-7/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/include/scsi/scsi_netlink_fc.h:25,
                   from fpin_handlers.c:6:
  /nvmedata/autobuild/instance-7/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/include/scsi/scsi_netlink.h:44:2: error: unknown type name 'uint8_t'
     44 |  uint8_t version;
        |  ^~~~~~~

https://github.com/opensvc/multipath-tools/compare/0.8.9...0.9.0

Fixes:
 - http://autobuild.buildroot.org/results/32f4ada6c49261924ca78f62dee43241bda379a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4246d5055946b4e4c503fe69b5eab95fc6069b56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...> 0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch} | 0
 package/multipath-tools/multipath-tools.hash                          | 4 ++--
 package/multipath-tools/multipath-tools.mk                            | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/multipath-tools/0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch b/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
similarity index 100%
rename from package/multipath-tools/0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
rename to package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 58d8de369c..df0d24fb74 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  27a426facea0474e6dc48e026a94f7c86890d3f27b439b07ec26b0b9887b0cc4  multipath-tools-0.8.9.tar.gz
+sha256  d6d1d819a53d076a91828ede42d9786451a471c4b71ca3fd25d04ad5413e3f95  multipath-tools-0.9.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  a3777a6b4433a23246eed8a88ca8466e3d21a2f758c03d060201fe2c44ff5484  README.md
+sha256  fb0a5d2008c609fec129d2ffd01dd7f65f0e3868bcf465b6fda76e25ff896ce9  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index c0b7c5721e..f3ce3ca8b8 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.9
+MULTIPATH_TOOLS_VERSION = 0.9.0
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
@@ -21,6 +21,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
 MULTIPATH_TOOLS_MAKE_OPTS = \
+	LINUX_HEADERS_INCDIR=$(STAGING_DIR)/usr/include \
 	LIB="lib" \
 	RUN="run" \
 	OPTFLAGS="" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
