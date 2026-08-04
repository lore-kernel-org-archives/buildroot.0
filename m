Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAC6C55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D09A40595;
	Tue,  4 Aug 2026 16:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqfDjEdzgi5n; Tue,  4 Aug 2026 16:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C03A405AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785862172;
	bh=ES6Kd+RVyeAzhp2xhmBOEgZxpEcU5iFOyc1hnAlfM4A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DMjlHf7S79Jq3OioxUjf4nsXydc+bJtGcrKDJQWqS+LIuXYykQpwpoCDhuDXYDyCP
	 ZXpBtUcN8q4mtVFh7WM6nYVbM7BEXpYWsZlNpehxWeZuKU9wvVibVrlPFy/jrwscNE
	 AaKikQl0k5DxAmGRHtKimcVUJNaPQkKeTYT/XVHuegCJUn6SmkBv2unihgwkx7+eMj
	 /Fj0UGezByH45xqHdH0UL0EQdrAvKAlcoOom8bHPLvXYF2dPqPcGfivUmn/qy4btWz
	 06JE1/tAhEvOIB7ev8qiRabvUxQk0R1DZA634Gsi1pAnKsk/UBaHhjLx4B5W9dV0zr
	 UcXxTruHHSE+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C03A405AE;
	Tue,  4 Aug 2026 16:49:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D031F3A6
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C21EE6060B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYV1Nm23PEyy for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 033F3605EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 033F3605EE
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:49:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9A198BF63; Tue,  4 Aug 2026 16:48:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:31:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c01426fe964207a60ece28704e060495731b4f91
X-Git-Newrev: d046fd08833f91a1ed3bdfdb6394dc3b70fd92b0
X-Patchwork-Hint: ignore
Message-Id: <20260804164843.C9A198BF63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liblc3: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d046fd08833f91a1ed3bdfdb6394dc3b70fd92b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

liblc3 is the Google implementation of LC3, the mandatory codec of the
Bluetooth LE Audio profiles. The PipeWire bluez5 plugin can use it to
encode and decode LE Audio streams.

https://github.com/google/liblc3

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/liblc3/Config.in   |  8 ++++++++
 package/liblc3/liblc3.hash |  3 +++
 package/liblc3/liblc3.mk   | 16 ++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d8b1680c48..9b485a2d6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -166,6 +166,9 @@ F:	configs/hifive_unleashed_defconfig
 F:	package/libspdm/
 F:	package/xen/
 
+N:	Alsey Coleman Miller <alseycmiller@gmail.com>
+F:	package/liblc3/
+
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
 F:	package/libxmlrpc/
diff --git a/package/Config.in b/package/Config.in
index 67e88d3721..2045bcf135 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1571,6 +1571,7 @@ menu "Audio/Sound"
 	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
 	source "package/libilbc/Config.in"
+	source "package/liblc3/Config.in"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
diff --git a/package/liblc3/Config.in b/package/liblc3/Config.in
new file mode 100644
index 0000000000..8dbd1d00b4
--- /dev/null
+++ b/package/liblc3/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBLC3
+	bool "liblc3"
+	help
+	  LC3 is an efficient low latency audio codec, specified by
+	  the Bluetooth SIG for the LE Audio profiles. This is the
+	  Google implementation of the encoder and decoder.
+
+	  https://github.com/google/liblc3
diff --git a/package/liblc3/liblc3.hash b/package/liblc3/liblc3.hash
new file mode 100644
index 0000000000..269316d501
--- /dev/null
+++ b/package/liblc3/liblc3.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  276752ff54ce6a77d54ec133397b9d7e71f90caf3d9afa32d8b0e891b8ecb8af  liblc3-1.1.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/liblc3/liblc3.mk b/package/liblc3/liblc3.mk
new file mode 100644
index 0000000000..87ab68105a
--- /dev/null
+++ b/package/liblc3/liblc3.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# liblc3
+#
+################################################################################
+
+LIBLC3_VERSION = 1.1.3
+LIBLC3_SITE = $(call github,google,liblc3,v$(LIBLC3_VERSION))
+LIBLC3_LICENSE = Apache-2.0
+LIBLC3_LICENSE_FILES = LICENSE
+LIBLC3_INSTALL_STAGING = YES
+LIBLC3_CONF_OPTS = \
+	-Dpython=false \
+	-Dtools=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
