Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0192C8303F
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 20:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEDE42ABE;
	Mon, 25 Aug 2025 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHcwPcXAfqGY; Mon, 25 Aug 2025 20:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A953441AA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A953441AA1;
	Mon, 25 Aug 2025 20:17:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13045B0B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED2096F52B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nehTCOTXniWi for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 20:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C2F6F52E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59C2F6F52E
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:17:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4757187B2F; Mon, 25 Aug 2025 20:17:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 22:09:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b1e6ec3f784951789c29db2bc32fa013fb1cc3a
X-Git-Newrev: 26135079b1bd911f93848bf0adb256762f95ed27
X-Patchwork-Hint: ignore
Message-Id: <20250825201726.4757187B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] pacakge/gnuradio: added
 gr-soapy support
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

commit: https://git.buildroot.net/buildroot/commit/?id=26135079b1bd911f93848bf0adb256762f95ed27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GNU Radio contains a block to uses Soapy SDR has sink or source.
Since the SoapySDR package is now available in Buildroot, it is possible
to update GNU Radio package to enable or disable the gr-soapy block.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
