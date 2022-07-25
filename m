Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81583C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D2684C34;
	Mon, 25 Jul 2022 15:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D2684C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Df7yEo-spwdu; Mon, 25 Jul 2022 15:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149EA83E88;
	Mon, 25 Jul 2022 15:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 149EA83E88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C790C1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E693410AA
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E693410AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dz847J1Hf1Rq for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:25:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11D1410A7
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B11D1410A7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:25:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A67E0240011;
 Mon, 25 Jul 2022 15:25:28 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Buildroot List <buildroot@buildroot.org>
Date: Mon, 25 Jul 2022 17:25:17 +0200
Message-Id: <20220725152522.1579992-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
References: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658762729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mH6eY0F6xkao1lHVIArwQjcJCrXfl3g6wDQKZyofmpw=;
 b=Dc2HdUtD6gNnLjYFurcm/XcTyUYEWqhC1Fmo8+qK3IksRVBrJH3rjPs6FdGcX0TVxRDD9x
 Cudm7b0ZxqIx9Z3l0SXA30IgB2sjFVldfqa0Pklf2ZDNLQViH2RCyUCscuLfoshax8lKWv
 iAcDh7LrCmuqcLI9uLb5DVJSFsdKCAcF5pprX0aOSY/zP/Sr7ecmqy0LsjDbJvpQ5Qnemg
 bgLEorf6ayQDQjsj4Xvlq0W0bRS63mw1DjR0Tc5l1SySdcyYUC8aPSMYskJyYe/WVa1FHD
 OrXIDnCd+7SVoPbSYpgjXVQS494z1TW9X0aQoSV9R7VcU7bK3oXfTWN/wyzB4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dc2HdUtD
Subject: [Buildroot] [PATCH 1/5] package/double-conversion: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Seiderer <ps.report@gmx.net>

Both the target and host variants of this package will be needed by
qt6base.

Our reading of double-conversion/utils.h in the code base seems to
show that all architectures currently supported in Buildroot (to the
exception of csky, which we intend to remove, and is anyway not
usable/testable today) are supported by double-conversion.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  2 ++
 package/Config.in                                |  1 +
 package/double-conversion/Config.in              | 11 +++++++++++
 package/double-conversion/double-conversion.hash |  3 +++
 package/double-conversion/double-conversion.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/double-conversion/Config.in
 create mode 100644 package/double-conversion/double-conversion.hash
 create mode 100644 package/double-conversion/double-conversion.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a07ae100b..c580d3ebd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2320,6 +2320,7 @@ F:	package/bcm2835/
 F:	package/ddrescue/
 F:	package/dejavu/
 F:	package/dillo/
+F:	package/double-conversion/
 F:	package/edid-decode/
 F:	package/ell/
 F:	package/ghostscript-fonts/
@@ -2835,6 +2836,7 @@ F:	package/cloop/
 F:	package/cmake/
 F:	package/cramfs/
 F:	package/dmidecode/
+F:	package/double-conversion/
 F:	package/flashrom/
 F:	package/gcc/
 F:	package/genext2fs/
diff --git a/package/Config.in b/package/Config.in
index bd3d167487..b9a17c12ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1951,6 +1951,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
diff --git a/package/double-conversion/Config.in b/package/double-conversion/Config.in
new file mode 100644
index 0000000000..b858b56c27
--- /dev/null
+++ b/package/double-conversion/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOUBLE_CONVERSION
+	bool "double-conversion"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Provides binary-decimal and decimal-binary routines for
+	  IEEE doubles.
+
+	  https://github.com/google/double-conversion
+
+comment "double-conversion needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
new file mode 100644
index 0000000000..8124ec2f82
--- /dev/null
+++ b/package/double-conversion/double-conversion.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  3dbcdf186ad092a8b71228a5962009b5c96abde9a315257a3452eb988414ea3b  double-conversion-3.2.0.tar.gz
+sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
new file mode 100644
index 0000000000..ae46fa06fe
--- /dev/null
+++ b/package/double-conversion/double-conversion.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# double-conversion
+#
+################################################################################
+
+DOUBLE_CONVERSION_VERSION = 3.2.0
+DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
+DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
+DOUBLE_CONVERSION_LICENSE_FILES = COPYING
+DOUBLE_CONVERSION_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
