Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40C5C87FC9
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 13:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B9081766;
	Mon, 28 Jul 2025 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oi8vpRGgZNjB; Mon, 28 Jul 2025 13:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A17A8175C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A17A8175C;
	Mon, 28 Jul 2025 13:01:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD48151
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B22FA403C7
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9EjZwvGj8JW for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 13:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.55.128.204;
 helo=mail.grinn-global.com; envelope-from=b.bilas@grinn-global.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 518194003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518194003A
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 518194003A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 13:01:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (25)
Received: from bartekk-pc (ip-194.4.60.197.edial.pl [194.4.60.197])
 by server220076.nazwa.pl (Postfix) with ESMTP id 777B21BD4EC;
 Mon, 28 Jul 2025 15:01:21 +0200 (CEST)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 28 Jul 2025 15:01:17 +0200
Message-ID: <20250728130118.18606-5-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728130118.18606-1-b.bilas@grinn-global.com>
References: <20250728130118.18606-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=grinn-global.com
Subject: [Buildroot] [PATCH 5/6] package/python-rich-click: new package
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

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/Config.in                                |  1 +
 package/python-rich-click/Config.in              | 10 ++++++++++
 package/python-rich-click/python-rich-click.hash |  5 +++++
 package/python-rich-click/python-rich-click.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/python-rich-click/Config.in
 create mode 100644 package/python-rich-click/python-rich-click.hash
 create mode 100644 package/python-rich-click/python-rich-click.mk

diff --git a/package/Config.in b/package/Config.in
index 08872aee84..5b34f73b63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1385,6 +1385,7 @@ menu "External python modules"
 	source "package/python-rfc3987/Config.in"
 	source "package/python-rgbmatrix/Config.in"
 	source "package/python-rich/Config.in"
+	source "package/python-rich-click/Config.in"
 	source "package/python-rpds-py/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
diff --git a/package/python-rich-click/Config.in b/package/python-rich-click/Config.in
new file mode 100644
index 0000000000..08e22471e2
--- /dev/null
+++ b/package/python-rich-click/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_RICH_CLICK
+	bool "python-rich-click"
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_IMPORTLIB_METADATA # runtime
+	select BR2_PACKAGE_PYTHON_RICH # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Format click help output nicely with rich.
+
+	  https://github.com/ewels/rich-click
diff --git a/package/python-rich-click/python-rich-click.hash b/package/python-rich-click/python-rich-click.hash
new file mode 100644
index 0000000000..7a0ada6186
--- /dev/null
+++ b/package/python-rich-click/python-rich-click.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rich-click/json
+md5  f1b6a6dd9b7150d553c25011679bc7ba  rich_click-1.8.9.tar.gz
+sha256  fd98c0ab9ddc1cf9c0b7463f68daf28b4d0033a74214ceb02f761b3ff2af3136  rich_click-1.8.9.tar.gz
+# Locally computed sha256 checksums
+sha256  d460cfe666617a2f86cb7c66f9041f0a87611c8b0c1f2f3f674a2022adc1f2af  LICENSE
diff --git a/package/python-rich-click/python-rich-click.mk b/package/python-rich-click/python-rich-click.mk
new file mode 100644
index 0000000000..7bf9f8ac75
--- /dev/null
+++ b/package/python-rich-click/python-rich-click.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rich-click
+#
+################################################################################
+
+PYTHON_RICH_CLICK_VERSION = 1.8.9
+PYTHON_RICH_CLICK_SOURCE = rich_click-$(PYTHON_RICH_CLICK_VERSION).tar.gz
+PYTHON_RICH_CLICK_SITE = https://files.pythonhosted.org/packages/b7/a8/dcc0a8ec9e91d76ecad9413a84b6d3a3310c6111cfe012d75ed385c78d96
+PYTHON_RICH_CLICK_SETUP_TYPE = setuptools
+PYTHON_RICH_CLICK_LICENSE = MIT
+PYTHON_RICH_CLICK_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
