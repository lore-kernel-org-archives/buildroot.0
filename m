Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFA8CAC5A5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 02:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1128D61314;
	Thu, 25 Sep 2025 02:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2Ke_OQjQXmv; Thu, 25 Sep 2025 02:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D73D612CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D73D612CE;
	Thu, 25 Sep 2025 02:55:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8132512D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6751740C47
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHD8-mykIBos for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 02:55:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 50B3240C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50B3240C32
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50B3240C32
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 02:55:45 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id EC8CF31E0CC8; Thu, 25 Sep 2025 04:55:42 +0200 (CEST)
Date: Thu, 25 Sep 2025 04:55:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aNSvLnYXHnj-5ZKJ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1758768942; bh=2yB8sa3vK6rJjrhKtgMcxStdVjkmnG4wUpiLYUVfwcA=;
 h=Date:From:To:Subject:From;
 b=HY6STXpmWbIUIqUm7lILWjnZqpIyn7rtH+XZZXkggQ29DKNf3k/CMgHdGXY0SmwOd
 L1lsDZpYXKgo08OVXatTMzvcj8EiPF+gv/fhgMzWxLA70YK6dsZViFnont0xOduezi
 Mp6tknVvL3OzPeviI8eepD8NBolw2pGFbbmgY1OAEJyIWupbCv9xPKk8n2K53qg+Hv
 sPLt+4UsROQDqpw8FzDKek/haerh+r+CvvAAheGTpqJguLAlMfj1DfG2j8riOcTi4T
 OOlVDPrsybup/HYyXSI51FAz6IvC7kHYnqgnT/HGwas1RTlLGFxaDjybobodfZa5dh
 s4RoC67gZnLmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=HY6STXpm
Subject: [Buildroot] [PATCH 2/5] package/libaom: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This contains a reference version of the Alliance for Open Media video codec.
This codec is a patent free alternative to H.265, and is starting to be
used throughout the internet.
This library is used by firefox.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libaom/Config.in   |  8 ++++++++
 package/libaom/libaom.hash |  2 ++
 package/libaom/libaom.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/libaom/Config.in
 create mode 100644 package/libaom/libaom.hash
 create mode 100644 package/libaom/libaom.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8403db636f..a15640906b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3406,6 +3406,7 @@ F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
+F:	package/libaom/
 F:	package/libjwt/
 F:	package/mksh/
 F:	package/ruby/
diff --git a/package/Config.in b/package/Config.in
index 85928509f8..465ea484df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1974,6 +1974,7 @@ menu "Multimedia"
 	source "package/dav1d/Config.in"
 	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
+	source "package/libaom/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
diff --git a/package/libaom/Config.in b/package/libaom/Config.in
new file mode 100644
index 0000000000..8ff06219be
--- /dev/null
+++ b/package/libaom/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBAOM
+	bool "libaom"
+	help
+	  This contains a reference version of the Alliance for Open Media
+	  video codec. This codec is a patent free alternative to H.265,
+	  and is starting to be used throughout the internet.
+
+	  https://aomedia.org/
diff --git a/package/libaom/libaom.hash b/package/libaom/libaom.hash
new file mode 100644
index 0000000000..5d5a8b0e32
--- /dev/null
+++ b/package/libaom/libaom.hash
@@ -0,0 +1,2 @@
+sha256  19e45a5a7192d690565229983dad900e76b513a02306c12053fb9a262cbeca7d  libaom-3.13.1.tar.gz
+sha256  4764a286d8b2faeaf42f4418e7d7a28d58fc8fd4d00a3d0a7f44b0a4099de7f2  LICENSE
diff --git a/package/libaom/libaom.mk b/package/libaom/libaom.mk
new file mode 100644
index 0000000000..733cc24c94
--- /dev/null
+++ b/package/libaom/libaom.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libaom
+#
+################################################################################
+
+LIBAOM_VERSION = 3.13.1
+LIBAOM_SITE = https://storage.googleapis.com/aom-releases
+LIBAOM_DEPENDENCIES = host-nasm
+LIBAOM_INSTALL_STAGING = YES
+LIBAOM_LICENSE = BSD-2-Clause
+LIBAOM_LICENSE_FILES = LICENSE
+LIBAOM_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
