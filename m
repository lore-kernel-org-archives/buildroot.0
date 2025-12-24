Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F886E6B279
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 02:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B3260EA2;
	Wed, 24 Dec 2025 02:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HylcMqEt62MV; Wed, 24 Dec 2025 02:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4261560B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766542794;
	bh=+otWJqETha8drdkCy46S43rpRhiO4YFj+JNyrqgHO4o=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=TtyXJmApplkXUND9zZwhutuWgxY+7wsgDNls5IvnV5KxQHT3q6lCtPLTizL8cF/r/
	 EzXMF3tb1rI7nhhPuCfggAc0FbVbtWbBZEmOO38ByH8L1K1yJNBzG8k2Xy334IdW1K
	 oiFIm7j5+Xm8Xxmz3qcLgpLjzyt072zmSuJ8SibZiK0/WrvEGdlvQzB1agx4yWyHrf
	 cnwv4+qpOu1LOBFdSdACbzQBIyF6G9o7pkw2xXoV9nsjjbk9loSwQnZapZFHW20wbO
	 q90HvPANIUa488vHc/w3HDhf2s4uSwTpR1o7Dza0bNKu2bZa5wy5AI7W3vYJOYemfC
	 ahiJC86kcm+8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4261560B00;
	Wed, 24 Dec 2025 02:19:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86256119
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 02:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EAA4826E7
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 02:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-biWvZbQSrH for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 02:19:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.94.151.114;
 helo=mail-sh.amlogic.com; envelope-from=ye.he@amlogic.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23D55822E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23D55822E0
Received: from mail-sh.amlogic.com (unknown [114.94.151.114])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23D55822E0
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 02:19:51 +0000 (UTC)
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.61; Wed, 24 Dec 2025
 10:19:49 +0800
To: <buildroot@buildroot.org>
CC: Ye He <ye.he@amlogic.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 24 Dec 2025 10:19:46 +0800
Message-ID: <20251224021947.2350743-1-ye.he@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.98.11.201]
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amlogic.com
Subject: [Buildroot] [PATCH] package/liblc3: new package
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
From: Ye He via buildroot <buildroot@buildroot.org>
Reply-To: Ye He <ye.he@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ye He <ye.he@amlogic.com>
---
 package/Config.in        |  1 +
 package/liblc3/Config.in |  6 ++++++
 package/liblc3/lc3.pc.in | 10 ++++++++++
 package/liblc3/liblc3.mk | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/liblc3/Config.in
 create mode 100644 package/liblc3/lc3.pc.in
 create mode 100644 package/liblc3/liblc3.mk

diff --git a/package/Config.in b/package/Config.in
index 22970b4d45..44a7c91911 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1577,6 +1577,7 @@ menu "Audio/Sound"
 	source "package/portaudio/Config.in"
 	source "package/rnnoise/Config.in"
 	source "package/sbc/Config.in"
+	source "package/liblc3/Config.in"
 	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
 	source "package/speexdsp/Config.in"
diff --git a/package/liblc3/Config.in b/package/liblc3/Config.in
new file mode 100644
index 0000000000..41cf1d84d2
--- /dev/null
+++ b/package/liblc3/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBLC3
+	bool "liblc3"
+	help
+	  This option enables the Android liblc3 library for Bluetooth LE Audio.
+
+	  https://github.com/google/liblc3
diff --git a/package/liblc3/lc3.pc.in b/package/liblc3/lc3.pc.in
new file mode 100644
index 0000000000..222921ae90
--- /dev/null
+++ b/package/liblc3/lc3.pc.in
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include/lc3
+
+Name: LC3
+Description: LC3 LE Audio
+Version: @VERSION@
+Libs: -L${libdir} -llc3
+Cflags: -I${includedir}
diff --git a/package/liblc3/liblc3.mk b/package/liblc3/liblc3.mk
new file mode 100644
index 0000000000..bbf14488de
--- /dev/null
+++ b/package/liblc3/liblc3.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# liblc3
+#
+################################################################################
+
+LIBLC3_VERSION = 1.1.3
+LIBLC3_SOURCE = v$(LIBLC3_VERSION).tar.gz
+LIBLC3_SITE = https://github.com/google/liblc3/archive
+LIBLC3_LICENSE = Apache
+LIBLC3_LICENSE_FILES = LICENSE
+LIBLC3_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
