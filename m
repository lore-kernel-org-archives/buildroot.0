Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A50DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B109E40498;
	Wed, 27 Jul 2022 10:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B109E40498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RiGvYAHBfRou; Wed, 27 Jul 2022 10:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B0EA4017E;
	Wed, 27 Jul 2022 10:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B0EA4017E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE0351C116E
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5D3E40977
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5D3E40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEp1p4HZDcXa for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A827C4094E
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A827C4094E
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D80ED8655E; Wed, 27 Jul 2022 09:47:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 874916567a6ad917ffc507270beecc45582f9519
X-Git-Newrev: b9e25d993778fec3080c35866befa43fc1fd3792
X-Patchwork-Hint: ignore
Message-Id: <20220727094717.D80ED8655E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tealdeer: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9e25d993778fec3080c35866befa43fc1fd3792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tealdeer is a fast and full-featured tldr client. tldr pages are
simplified and community-driven man pages, see https://tldr.sh/ for more
information.

https://github.com/dbrgn/tealdeer/

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/tealdeer/Config.in     | 10 ++++++++++
 package/tealdeer/tealdeer.hash |  4 ++++
 package/tealdeer/tealdeer.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82e5c200e8..1fee7554db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -657,6 +657,7 @@ F:	package/libftdi1/
 N:	Danilo Bargen <mail@dbrgn.ch>
 F:	board/pcengines/apu2/
 F:	configs/pcengines_apu2_defconfig
+F:	package/tealdeer/
 
 N:	Danomi Manchego <danomimanchego123@gmail.com>
 F:	package/cjson/
diff --git a/package/Config.in b/package/Config.in
index afdc563c2d..f039d83113 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2627,6 +2627,7 @@ menu "System tools"
 	source "package/systemd-bootchart/Config.in"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
+	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
new file mode 100644
index 0000000000..96ed81614b
--- /dev/null
+++ b/package/tealdeer/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TEALDEER
+	bool "tealdeer"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  A fast and full-featured tldr client. tldr pages are
+	  simplified and community-driven man pages, see
+	  https://tldr.sh/ for more information.
+
+	  https://github.com/dbrgn/tealdeer/
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
new file mode 100644
index 0000000000..0e53174841
--- /dev/null
+++ b/package/tealdeer/tealdeer.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60  tealdeer-1.5.0.tar.gz
+sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
+sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/tealdeer/tealdeer.mk b/package/tealdeer/tealdeer.mk
new file mode 100644
index 0000000000..c396225098
--- /dev/null
+++ b/package/tealdeer/tealdeer.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# tealdeer
+#
+################################################################################
+
+TEALDEER_VERSION = 1.5.0
+TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
+TEALDEER_LICENSE = Apache-2.0 or MIT
+TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
