Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB0EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6643D612D5;
	Tue, 19 Apr 2022 09:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPjZHZ_cCznG; Tue, 19 Apr 2022 09:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A37612D3;
	Tue, 19 Apr 2022 09:22:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B63F91BF299
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A34AA41855
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06Yb8-ph_ejX for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:22:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0068341815
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:22:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0ADFCC0E0A
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:22:05 +0000 (UTC)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 65E9FE0010;
 Tue, 19 Apr 2022 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650360121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wkr+l+kDgvmfJtF12Y/azhLAS8aqjQnxMj3ZncJKt5k=;
 b=fLgklyIXipMjiZxCOyBM+HMEUVh1UAfb3WjjfJefzIy0zyvMJpk2DjisDGu3viEZB1xTwo
 yIkeHVpn4yFEiBgx2MwBCAam8UfyLUsZTNz4ZIp2E4fb2JiR8zcAJjNjY+G1OSL1sxktjb
 vIl5ETNVk7JQpiZTw3/jpuZJjqO+2geGYAje8kumovtlqUpU2v9vwzDL630vWOvu1vm92a
 ebLy0O6FVU+uiwgNio1AW+MzzTHAgml1Hs+rGtQuLCE3/qHLux1K9wv4A6xuwtDji3RVYe
 333CXdX0OmtB+jcfQgm16hw1K6Nit62uX8ZKZZV7qp3Nl6NFh0z3AKB/xxC7qw==
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 11:21:50 +0200
Message-Id: <20220419092151.91638-2-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419092151.91638-1-thomas.perrot@bootlin.com>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/byacc: add new package
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
From: Thomas Perrot via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides a Berkeley LALR Yacc parser generator that has been use
by i.MX Code Signing tool.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/byacc/Config.in.host | 10 ++++++++++
 package/byacc/byacc.hash     |  3 +++
 package/byacc/byacc.mk       | 15 +++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/byacc/Config.in.host
 create mode 100644 package/byacc/byacc.hash
 create mode 100644 package/byacc/byacc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ca9decb58fec..e26cee2d776a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2765,6 +2765,9 @@ F:	package/frotz/
 F:	package/kvm-unit-tests/
 F:	package/xorcurses/
 
+N:	Thomas Perrot <thomas.perrot@bootlin.com>
+F:	package/byacc
+
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
diff --git a/package/byacc/Config.in.host b/package/byacc/Config.in.host
new file mode 100644
index 000000000000..040a37189bab
--- /dev/null
+++ b/package/byacc/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_BYACC
+	bool "host byacc"
+	help
+	  A parser generator utility that reads a grammar
+	  specification from a file and generates an LR(1)
+	  parser for it. The parsers consist of a set of
+	  LALR(1) parsing tables and a driver routine written
+	  in the C programming language.
+
+	  http://invisible-island.net/byacc/
diff --git a/package/byacc/byacc.hash b/package/byacc/byacc.hash
new file mode 100644
index 000000000000..d2ad441df39f
--- /dev/null
+++ b/package/byacc/byacc.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c  byacc-20220128.tgz
+sha256  654a231fe9cd4d36e580214962fa777a1df0771d6889cfc74d19a3d414f14711  LICENSE
diff --git a/package/byacc/byacc.mk b/package/byacc/byacc.mk
new file mode 100644
index 000000000000..103970aac9d2
--- /dev/null
+++ b/package/byacc/byacc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# byacc
+#
+################################################################################
+
+BYACC_SITE = https://invisible-mirror.net/archives/byacc
+BYACC_VERSION = 20220128
+BYACC_SOURCE = byacc-$(BYACC_VERSION).tgz
+BYACC_LICENSE = Public Domain
+BYACC_LICENSE_FILES = LICENSE
+
+HOST_BYACC_CONF_OPTS = --program-transform-name='s,^,b,'
+
+$(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
