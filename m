Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F2FC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2E9841571;
	Wed, 27 Jul 2022 14:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E9841571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jouBOlov6Mtz; Wed, 27 Jul 2022 14:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC0741551;
	Wed, 27 Jul 2022 14:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC0741551
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9304C1C1162
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BD4760D89
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD4760D89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBl5CMSr1L5t for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A51DC60ACE
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51DC60ACE
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6877786697; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:43:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 447323feac9606f827b166c4946b38b80fec456a
X-Git-Newrev: acb02354a128ef8e4b18f2f311cd51ac6b4cb7e5
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.6877786697@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dust: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=acb02354a128ef8e4b18f2f311cd51ac6b4cb7e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dust is an alternative of the command du from the Linux kernel,
written in Rust. It aims to be more intuitive and visual in order
to give the user a better view of his system's storage capacity.

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/dust/Config.in | 11 +++++++++++
 package/dust/dust.hash |  3 +++
 package/dust/dust.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5864601dd8..6d6f25affd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2188,6 +2188,7 @@ F:	package/exiv2/
 F:	package/ofono/
 
 N:	Nicolas Tran <nicolas.tran@smile.fr>
+F:	package/dust/
 F:	package/hyperfine/
 
 N:	Niklas Cassel <niklas.cassel@wdc.com>
diff --git a/package/Config.in b/package/Config.in
index 58ceaaa70b..9e355723d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ menu "Filesystem and flash utilities"
 	source "package/curlftpfs/Config.in"
 	source "package/davfs2/Config.in"
 	source "package/dosfstools/Config.in"
+	source "package/dust/Config.in"
 	source "package/e2fsprogs/Config.in"
 	source "package/e2tools/Config.in"
 	source "package/ecryptfs-utils/Config.in"
diff --git a/package/dust/Config.in b/package/dust/Config.in
new file mode 100644
index 0000000000..7b6e9304bc
--- /dev/null
+++ b/package/dust/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DUST
+	bool "dust"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  dust is an alternative written in Rust of the command "du"
+	  from the Linux kernel. It aims to be more intuitive and visual
+	  in order to give the user a better view of his system's
+	  current storage capacity.
+
+	  https://github.com/bootandy/dust.git
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
new file mode 100644
index 0000000000..d4f6bff4e4
--- /dev/null
+++ b/package/dust/dust.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549  dust-0.8.1.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
new file mode 100644
index 0000000000..2cffc336a9
--- /dev/null
+++ b/package/dust/dust.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# dust
+#
+################################################################################
+
+DUST_VERSION = 0.8.1
+DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
+DUST_LICENSE = APACHE-2.0
+DUST_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
