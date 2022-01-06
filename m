Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C27C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D419440239;
	Thu,  6 Jan 2022 21:01:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCnCI-K2GA2o; Thu,  6 Jan 2022 21:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2459E401C4;
	Thu,  6 Jan 2022 21:01:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 548941BF340
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C3914298B
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Be_VdOwt8DCM for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40A724297C
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5B8EA40004;
 Thu,  6 Jan 2022 21:00:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:56 +0100
Message-Id: <20220106210000.397694-9-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 08/11] package/sentry-cli: re-add package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit d19077677fc71fc8c8cd73945606f773d907a99a, but the
package now uses the cargo-package infrastructure with its vendoring
mechanism, which allows us to avoid the problems that caused the
package to be removed in d19077677fc71fc8c8cd73945606f773d907a99a.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in.host             |  1 +
 package/sentry-cli/Config.in.host  | 10 ++++++++++
 package/sentry-cli/sentry-cli.hash |  3 +++
 package/sentry-cli/sentry-cli.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/sentry-cli/Config.in.host
 create mode 100644 package/sentry-cli/sentry-cli.hash
 create mode 100644 package/sentry-cli/sentry-cli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a52a8cfa38..55ea7805f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1508,6 +1508,7 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
+F:	package/sentry-cli/
 F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 7400da5894..b3e00bb482 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -81,6 +81,7 @@ menu "Host utilities"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/sdbusplus/Config.in.host"
+	source "package/sentry-cli/Config.in.host"
 	source "package/sloci-image/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/sentry-cli/Config.in.host b/package/sentry-cli/Config.in.host
new file mode 100644
index 0000000000..3124015367
--- /dev/null
+++ b/package/sentry-cli/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_SENTRY_CLI
+	bool "host sentry-cli"
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Official Sentry command line interface
+
+	  For managing debug information files and source maps.
+
+	  https://docs.sentry.io/cli/
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
new file mode 100644
index 0000000000..73f818125f
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  d687336379fd96c4ee73f24bd062d31672bd7453af53311b72977be3c8c78fef  sentry-cli-1.59.0.tar.gz
+sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
new file mode 100644
index 0000000000..58f5f1e325
--- /dev/null
+++ b/package/sentry-cli/sentry-cli.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# sentry-cli
+#
+################################################################################
+
+SENTRY_CLI_VERSION = 1.59.0
+SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
+SENTRY_CLI_LICENSE = BSD-3-clause
+SENTRY_CLI_LICENSE_FILES = LICENSE
+
+HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
+
+$(eval $(host-cargo-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
