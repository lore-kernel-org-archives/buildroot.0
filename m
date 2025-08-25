Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA17CA0FE1
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 09:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D5561C62;
	Mon, 25 Aug 2025 09:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH2p6s1b-KXI; Mon, 25 Aug 2025 09:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A719C61C5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A719C61C5C;
	Mon, 25 Aug 2025 09:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CF7519C
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 09:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42B0261C5D
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zwvdyidq5wmN for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 09:55:43 +0000 (UTC)
X-Greylist: delayed 523 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Aug 2025 09:55:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B48D6116D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B48D6116D
Received-SPF: Neutral (mailfrom) identity=mailfrom; client-ip=54.37.254.54;
 helo=kmf2.trabucayre.com; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
Received: from kmf2.trabucayre.com (ns3108948.ip-54-37-254.eu [54.37.254.54])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B48D6116D
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 09:55:43 +0000 (UTC)
Received: from kmf3.. (localhost [IPv6:::1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id AA42E160224;
 Mon, 25 Aug 2025 09:46:56 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Mon, 25 Aug 2025 09:46:55 +0000
Message-Id: <20250825094655.3079246-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH] pacakge/gnuradio: added gr-soapy support
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

GNU Radio contains a block to uses Soapy SDR has sink or source.
Since the SoapySDR package is now available in Buildroot, it is possible
to update GNU Radio package to enable or disable the gr-soapy block.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 6 ++++++
 package/gnuradio/gnuradio.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index d9ad650672..98d87aed56 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -91,6 +91,12 @@ comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
 	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
+config BR2_PACKAGE_GNURADIO_SOAPY
+	bool "gr-soapy support"
+	select BR2_PACKAGE_SOAPY_SDR
+	help
+	  Soapy SDR support
+
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index fc98edc848..5d69201db1 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -145,6 +145,13 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_SOAPY),y)
+GNURADIO_DEPENDENCIES += soapy-sdr
+GNURADIO_CONF_OPTS += -DENABLE_GR_SOAPY=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_SOAPY=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=ON
 else
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
