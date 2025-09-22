Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C46CAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 18:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B86A06179E;
	Mon, 22 Sep 2025 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtP7GJkhlVao; Mon, 22 Sep 2025 18:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22B56153F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C22B56153F;
	Mon, 22 Sep 2025 18:42:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6FC7498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD6541F92
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogmTw9puqyIe for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 18:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FC0241F85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FC0241F85
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E59986192; Mon, 22 Sep 2025 18:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 20:30:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 059138326eb1e411dfcedc7947263e95a74efd4b
X-Git-Newrev: 79a489c683ee2d5f5562187d8ff492c9a2aa167d
X-Patchwork-Hint: ignore
Message-Id: <20250922184237.7E59986192@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skopeo: bump to 1.20.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79a489c683ee2d5f5562187d8ff492c9a2aa167d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 1.20.0, skopeo gained a new optional dependency on sqlite, so enable
that when available, and use that in the runtime tests.

Changes since 1.18.0:
    https://github.com/containers/skopeo/releases/tag/v1.19.0
    https://github.com/containers/skopeo/releases/tag/v1.20.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/skopeo.hash                                  | 2 +-
 package/skopeo/skopeo.mk                                    | 7 ++++++-
 support/testing/tests/package/test_distribution_registry.py | 1 +
 support/testing/tests/package/test_skopeo.py                | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/skopeo/skopeo.hash b/package/skopeo/skopeo.hash
index e663ac1f61..02cb76d6f1 100644
--- a/package/skopeo/skopeo.hash
+++ b/package/skopeo/skopeo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a711db2bba3a357bebbbaf607ec731df6ea24c2d3cd9e0fef5e8fe9cefb154b  skopeo-1.18.0-go2.tar.gz
+sha256  0c19fe51b2cd8d1bd5e38c03b97421e318fc08153bdf5ef2f816a29889eacdef  skopeo-1.20.0-go2.tar.gz
 sha256  716a8b80635c394681e652823e1e42e411ad2d254e1f202403422d74f4b0b106  LICENSE
diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index b3b213983f..a8587f06b8 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKOPEO_VERSION = 1.18.0
+SKOPEO_VERSION = 1.20.0
 SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
@@ -17,6 +17,11 @@ SKOPEO_DEPENDENCIES = \
 	libgpgme \
 	lvm2
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+SKOPEO_DEPENDENCIES += sqlite
+SKOPEO_TAGS += libsqlite3
+endif
+
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
 	host-libgpgme \
diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
index 956b76aa8b..65fe6d850e 100644
--- a/support/testing/tests/package/test_distribution_registry.py
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -21,6 +21,7 @@ class TestDistributionRegistry(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         BR2_PACKAGE_CA_CERTIFICATES=y
         BR2_PACKAGE_DISTRIBUTION_REGISTRY=y
+        BR2_PACKAGE_SQLITE=y
         BR2_PACKAGE_SKOPEO=y
         BR2_PACKAGE_HOST_GO_BIN=y
         BR2_TARGET_ROOTFS_CPIO=y
diff --git a/support/testing/tests/package/test_skopeo.py b/support/testing/tests/package/test_skopeo.py
index 99ba978de2..f19703bef2 100644
--- a/support/testing/tests/package/test_skopeo.py
+++ b/support/testing/tests/package/test_skopeo.py
@@ -9,6 +9,7 @@ class TestSkopeo(infra.basetest.BRTest):
         BR2_PER_PACKAGE_DIRECTORIES=y
         BR2_SYSTEM_DHCP="eth0"
         BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_SQLITE=y
         BR2_PACKAGE_SKOPEO=y
         BR2_PACKAGE_HOST_GO_BIN=y
         BR2_TARGET_ROOTFS_CPIO=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
