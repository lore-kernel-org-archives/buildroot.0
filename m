Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B712FC7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 12:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ECCE40721;
	Thu, 19 Jun 2025 12:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcEVYfdpjPbL; Thu, 19 Jun 2025 12:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D55408AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D55408AC;
	Thu, 19 Jun 2025 12:34:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB8B181
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 12:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8437C4051D
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 12:34:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Coyj-D6P1Z-E for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 12:34:15 +0000 (UTC)
Received-SPF: Neutral (mailfrom) identity=mailfrom; client-ip=54.37.254.54;
 helo=kmf2.trabucayre.com; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD15640169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD15640169
Received: from kmf2.trabucayre.com (ns3108948.ip-54-37-254.eu [54.37.254.54])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD15640169
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 12:34:14 +0000 (UTC)
Received: from kmf3.. (localhost [IPv6:::1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id ACC7216022E;
 Thu, 19 Jun 2025 12:34:11 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Thu, 19 Jun 2025 12:34:10 +0000
Message-Id: <20250619123410.2152859-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH] package/gqrx: bump version to 2.17.7
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

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gqrx/Config.in | 1 -
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 5 +++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 97f0b7de07..25a8a77d2f 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -25,7 +25,6 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_GNURADIO
 	select BR2_PACKAGE_GNURADIO_ANALOG
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 567ff947f9..154b43db1e 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  4a826b468b2fb38a59cbe1f1b566e62c3114509186a7a25ba27dc92833f3eb44  gqrx-2.15.9.tar.gz
+sha256  4aaab8a3c185cd99d6dda56d95b8f1b20128a6acfd2e86e0349d432a5fdcbce4  gqrx-2.17.7.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index d2518213b8..251b05cdf4 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.15.9
+GQRX_VERSION = 2.17.7
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
 GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr libsndfile qt5base qt5svg
 
-GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio
+GQRX_CONF_OPTS = -DLINUX_AUDIO_BACKEND=Gr-audio \
+	-DFORCE_QT5=ON
 
 # gqrx can use __atomic builtins, so we need to link with
 # libatomic when available
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
