Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47357C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01194176D;
	Mon,  4 Dec 2023 20:14:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01194176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekqC0hU-aL78; Mon,  4 Dec 2023 20:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387D941770;
	Mon,  4 Dec 2023 20:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387D941770
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 078A51BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41FF74173C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FF74173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbDYX6zuw50O for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4752416C5
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4752416C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B138D879B6; Mon,  4 Dec 2023 20:13:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:51:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6d4b0170fc181f86116aa3bcc39a538cce25144
X-Git-Newrev: d153e58d13f262f96c6c7c9a2bc0d31b76c8973d
X-Patchwork-Hint: ignore
Message-Id: <20231204201327.B138D879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.2.0
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
Content-Type: multipart/mixed; boundary="===============3514524634031077091=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3514524634031077091==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d153e58d13f262f96c6c7c9a2bc0d31b76c8973d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed backported patch:
- https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch

Updated ZFS test to pass this new version; drop the explicit /pool
mountpoint option to rely on the default location (which happens to be
/pool already).

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zfs/zfs.hash                      | 5 ++---
 package/zfs/zfs.mk                        | 3 +--
 support/testing/tests/package/test_zfs.py | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 3a73e5e94f..b02c49234a 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,6 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.1.12/zfs-2.1.12.sha256.asc
-sha256  64daa26aed3e12c931f6f4413d7527c4ebdb8da35416b356152b5f9fdd4c6e6d  zfs-2.1.12.tar.gz
-sha256  96a27353fe717ff2c8b95deb8b009c4eb750303c6400e2d8a2582ab1ec12b25a  bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
+# Locally computed
+sha256  42035fd059faa25a09cd511b24a57b8ad1285cb69127f2a0043b98562c5ec690  zfs-2.2.0.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index f0461ea9ec..d85956c98b 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.1.12
+ZFS_VERSION = 2.2.0
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
-ZFS_PATCH = https://github.com/openzfs/zfs/commit/bc3f12bfac152a0c28951cec92340ba14f9ccee9.patch
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL
 ZFS_LICENSE_FILES = LICENSE COPYRIGHT
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 1f01ddd768..27dbc2869b 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -40,11 +40,11 @@ class TestZfsBase(infra.basetest.BRTest):
 
         cmds = [
             # Init
-            "modprobe zfs",
+            "modprobe zfs && sleep 2",
             "mount -o remount,size=132M /tmp",
             "fallocate -l 64M /tmp/container1.raw",
             "fallocate -l 64M /tmp/container2.raw",
-            "zpool create -m /pool pool raidz /tmp/container1.raw /tmp/container2.raw",
+            "zpool create pool raidz /tmp/container1.raw /tmp/container2.raw",
             "dd if=/dev/urandom bs=1M count=8 of=/pool/urandom",
             "sha256sum /pool/urandom > /tmp/urandom.sha256",
             # Check ZFS

--===============3514524634031077091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3514524634031077091==--
