Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0003C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F5C610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81F5C610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1F981763;
	Wed,  3 Nov 2021 21:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vio6SjFrxGVA; Wed,  3 Nov 2021 21:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 907C08175B;
	Wed,  3 Nov 2021 21:52:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5064C1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FAC060B01
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqqD1HmlidFm for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E19560AED
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:52:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B5E658A4E0; Wed,  3 Nov 2021 21:48:57 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:52:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e9b3f53a38c34e3295eb9dc0054093d571dab55
X-Git-Newrev: b0080a09feeec2071f71cba4e411cf5585118ca2
X-Patchwork-Hint: ignore
Message-Id: <20211103214857.B5E658A4E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mrouted: bump version to v4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0080a09feeec2071f71cba4e411cf5585118ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Upstream has .sha256 checksums now, drop redundant .md5
- Upstream has dropped RSRR support, drop Config.in support
- Add BR2_PACKAGE_MROUTED_RSRR to Config.in.legacy

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  9 +++++++++
 package/mrouted/Config.in    | 13 -------------
 package/mrouted/mrouted.hash |  5 ++---
 package/mrouted/mrouted.mk   |  8 +-------
 4 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 23c3ee29ee..66a166a2a9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_PACKAGE_MROUTED_RSRR
+	bool "RSRR for RSVP removed in mrouted v4.4"
+	select BR2_LEGACY
+	help
+	  The RSRR configure option and feature was dropped in upstream
+	  mrouted as of v4.4.  This feature was marked as experimental
+	  since its inception well before v4.0 and was never deployed
+	  in the field outside of academia.
+
 config BR2_BINUTILS_VERSION_CSKY
 	bool "binutils csky version removed"
 	select BR2_LEGACY
diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index f8dd173c4a..95b4fb3825 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -11,16 +11,3 @@ config BR2_PACKAGE_MROUTED
 	  Note: at least two interfaces with MULTICAST flag is requried.
 
 	  http://github.com/troglobit/mrouted
-
-if BR2_PACKAGE_MROUTED
-
-config BR2_PACKAGE_MROUTED_RSRR
-	bool "enable RSRR for RSVP"
-	help
-	  Routing Support for Resource Reservation, currently used by
-	  RSVP. This is an EXPERIMENTAL feature.
-
-	  For details, see:
-	    http://tools.ietf.org/html/draft-ietf-rsvp-routing-02
-
-endif
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index 188293025f..affb323b4b 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,6 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.2/mrouted-4.2.tar.gz.md5
-md5  b921f9e152e039efdac745438ef8362c  mrouted-4.2.tar.gz
+# From https://github.com/troglobit/mrouted/releases/download/4.4/mrouted-4.4.tar.gz.sha256
+sha256  095439e544d69c91ed64fa87db7e35bc2155eef48b7f268281d80946d2c6b953  mrouted-4.4.tar.gz
 
 # Locally calculated
-sha256  689541334ea951286054b771640e9d0f26b6a3242ff7f3894a3ef1b680811b34  mrouted-4.2.tar.gz
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 95da0c622c..4014b8f896 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.2
+MROUTED_VERSION = 4.4
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
@@ -12,12 +12,6 @@ MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CPE_ID_VENDOR = troglobit
 
-ifeq ($(BR2_PACKAGE_MROUTED_RSRR),y)
-MROUTED_CONF_OPTS += --enable-rsrr
-else
-MROUTED_CONF_OPTS += --disable-rsrr
-endif
-
 define MROUTED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
 		$(TARGET_DIR)/etc/init.d/S41mrouted
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
