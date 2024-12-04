Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A964E7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0783607C4;
	Sun,  8 Dec 2024 13:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX7nri7cnOBD; Sun,  8 Dec 2024 13:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA3F1607D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3F1607D8;
	Sun,  8 Dec 2024 13:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3249DED7
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5631D403A2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-5uCaJNshG5 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35125403CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35125403CB
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30C7C86B7A; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 21:20:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04d2c8689ef866a80a1e831bc3752ec57019fdf1
X-Git-Newrev: 312215ad6bc45a46b4ea5b3dc1826014b9c155de
X-Patchwork-Hint: ignore
Message-Id: <20241208130654.30C7C86B7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: bump version to 1.6.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=312215ad6bc45a46b4ea5b3dc1826014b9c155de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit removes the package patch, included in this release.

Signed-off-by: Jannik Becher <becher.jannik@gmail.com>
[Julien:
  - fix package hash
  - remove package patch
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-Remove-dev_base_lock-for-linux-6.9.0.patch | 51 ----------------------
 package/igh-ethercat/igh-ethercat.hash             |  2 +-
 package/igh-ethercat/igh-ethercat.mk               |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch b/package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch
deleted file mode 100644
index a71edb7be6..0000000000
--- a/package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 09eb1b9f73d677d10d18039305b9d974e52cc6d5 Mon Sep 17 00:00:00 2001
-From: Nicola Fontana <ntd@entidi.it>
-Date: Mon, 3 Jun 2024 12:45:48 +0200
-Subject: [PATCH] Remove dev_base_lock for linux >= 6.9.0
-
-Kernel commit 1b3ef46cb7f2618cc0b507393220a69810f6da12 removed
-`dev_base_lock` from v6.9 onward.
-
-Use the alternate iterator `for_each_netdev_rcu` introduced by commit
-c6d14c84566d6b70ad9dc1618db0dec87cca9300 in 2.6.33+.
-
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/95c25b50711ca7e1f990bdcbca8fa713c942ab01
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- devices/generic.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/devices/generic.c b/devices/generic.c
-index 4d4d9bbd..f30f1e17 100644
---- a/devices/generic.c
-+++ b/devices/generic.c
-@@ -420,14 +420,14 @@ int __init ec_gen_init_module(void)
-     INIT_LIST_HEAD(&generic_devices);
-     INIT_LIST_HEAD(&descs);
- 
--    read_lock(&dev_base_lock);
--    for_each_netdev(&init_net, netdev) {
-+    rcu_read_lock();
-+    for_each_netdev_rcu(&init_net, netdev) {
-         if (netdev->type != ARPHRD_ETHER)
-             continue;
-         desc = kmalloc(sizeof(ec_gen_interface_desc_t), GFP_ATOMIC);
-         if (!desc) {
-             ret = -ENOMEM;
--            read_unlock(&dev_base_lock);
-+            rcu_read_unlock();
-             goto out_err;
-         }
-         strncpy(desc->name, netdev->name, IFNAMSIZ);
-@@ -436,7 +436,7 @@ int __init ec_gen_init_module(void)
-         memcpy(desc->dev_addr, netdev->dev_addr, ETH_ALEN);
-         list_add_tail(&desc->list, &descs);
-     }
--    read_unlock(&dev_base_lock);
-+    rcu_read_unlock();
- 
-     list_for_each_entry_safe(desc, next, &descs, list) {
-         ret = offer_device(desc);
--- 
-2.45.2
-
diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 67a152c6ae..c655f9ac79 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7e4d8f3497c0bc0b64a151c0d074349fe7614767563642d6fedb19567eafa1e1  igh-ethercat-f5dc109176400f540a8682a2c9ee20d411d14d61.tar.gz
+sha256  6c8ce954f9c27de95ecce508fecfcc48767742f7cbbe967187dac6e817df2e70  igh-ethercat-1.6.2.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 5b618ab54a..374f8891e5 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = f5dc109176400f540a8682a2c9ee20d411d14d61
+IGH_ETHERCAT_VERSION = 1.6.2
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
