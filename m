Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA65BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A857D6159B;
	Wed, 20 Dec 2023 22:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A857D6159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zm0np7D8nRYI; Wed, 20 Dec 2023 22:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE0CC6158F;
	Wed, 20 Dec 2023 22:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE0CC6158F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53B311BF95D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28500610B1
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28500610B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZM2k_CPEhbag for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CD7D61098
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD7D61098
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39C8B87CD2; Wed, 20 Dec 2023 22:11:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 23:08:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e767c81a837883f8035bb7d7ee3925218adcd80
X-Git-Newrev: 996b786cfc03c3cf2ac631045650545c901e3075
X-Patchwork-Hint: ignore
Message-Id: <20231220221146.39C8B87CD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tllist: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=996b786cfc03c3cf2ac631045650545c901e3075
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/tllist/Config.in   |  6 ++++++
 package/tllist/tllist.hash |  3 +++
 package/tllist/tllist.mk   | 16 ++++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 311dcd9504..4c8a94ebb6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -39,6 +39,7 @@ F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/python-kmod/
 F:	package/python-versioneer/
+F:	package/tllist/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index a91ff8d345..ccef66e1ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2203,6 +2203,7 @@ endif
 	source "package/tbb/Config.in"
 	source "package/tinycbor/Config.in"
 	source "package/tl-expected/Config.in"
+	source "package/tllist/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
 	source "package/uvw/Config.in"
diff --git a/package/tllist/Config.in b/package/tllist/Config.in
new file mode 100644
index 0000000000..879119d13e
--- /dev/null
+++ b/package/tllist/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TLLIST
+	bool "tllist"
+	help
+	  A C header file only implementation of a typed linked list.
+
+	  https://codeberg.org/dnkl/tllist
diff --git a/package/tllist/tllist.hash b/package/tllist/tllist.hash
new file mode 100644
index 0000000000..2806d62355
--- /dev/null
+++ b/package/tllist/tllist.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3f3fe2f7433719cec816c63937a7aa36e566bd317763ef46d11562073ab6361d  1.1.0.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/tllist/tllist.mk b/package/tllist/tllist.mk
new file mode 100644
index 0000000000..88a28d2427
--- /dev/null
+++ b/package/tllist/tllist.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# tllist
+#
+################################################################################
+
+TLLIST_VERSION = 1.1.0
+TLLIST_SOURCE = $(TLLIST_VERSION).tar.gz
+TLLIST_SITE = https://codeberg.org/dnkl/tllist/archive
+TLLIST_LICENSE = MIT
+TLLIST_LICENSE_FILES = LICENSE
+# header only
+TLLIST_INSTALL_TARGET = NO
+TLLIST_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
