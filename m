Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9B4C001DB
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 11:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C4F408C9;
	Mon, 14 Aug 2023 11:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C4F408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ubm_GvMvWadZ; Mon, 14 Aug 2023 11:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8384D4096E;
	Mon, 14 Aug 2023 11:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8384D4096E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3F71BF3AF
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2151B81395
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 11:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2151B81395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mtwHdNSnd3v for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 11:44:19 +0000 (UTC)
X-Greylist: delayed 589 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Aug 2023 11:44:18 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3C4581394
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3C4581394
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 11:44:18 +0000 (UTC)
Received: from localhost (80.red-83-50-209.dynamicip.rima-tde.net
 [83.50.209.80]) by iodev.co.uk (Postfix) with ESMTPSA id 654E120888E;
 Mon, 14 Aug 2023 13:36:43 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 13:36:37 +0200
Message-ID: <20230814113637.28134-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam: Yes
Subject: [Buildroot] [PATCH] package/pounce: New package
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
Cc: Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simple IRC bouncer.

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/pounce/Config.in   | 18 ++++++++++++++++++
 package/pounce/pounce.hash |  3 +++
 package/pounce/pounce.mk   | 14 ++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/pounce/Config.in
 create mode 100644 package/pounce/pounce.hash
 create mode 100644 package/pounce/pounce.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ffa3ee693a8..4dad3d474ad0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1338,6 +1338,7 @@ F:	package/exempi/
 N:	Ismael Luceno <ismael@iodev.co.uk>
 F:	package/axel/
 F:	package/mawk/
+F:	package/pounce/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
diff --git a/package/Config.in b/package/Config.in
index 54cddc39140d..783683dd5201 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2458,6 +2458,7 @@ endif
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
 	source "package/pixiewps/Config.in"
+	source "package/pounce/Config.in"
 	source "package/pound/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
diff --git a/package/pounce/Config.in b/package/pounce/Config.in
new file mode 100644
index 000000000000..83bb66643652
--- /dev/null
+++ b/package/pounce/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_POUNCE
+	bool "pounce"
+	select BR2_PACKAGE_LIBRESSL
+	help
+	  pounce is a multi-client, TLS-only IRC bouncer. It maintains a
+	  persistent connection to an IRC server, acting as a proxy and
+	  buffer for a number of clients. When a client connects, any
+	  messages received since it last disconnected will be relayed to
+	  it. Unlike some other bouncers, pounce uses a single buffer for
+	  all IRC messages, which acts as a queue from which each client
+	  reads messages independently.
+
+	  pounce speaks regular modern IRC to both servers and clients, using
+	  the server-time extension to indicate when messages originally
+	  occurred. Clients identify themselves to pounce by their IRC
+	  usernames.
+
+	  https://git.causal.agency/pounce/
diff --git a/package/pounce/pounce.hash b/package/pounce/pounce.hash
new file mode 100644
index 000000000000..a827bd389f40
--- /dev/null
+++ b/package/pounce/pounce.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  97f245556b1cc940553fca18f4d7d82692e6c11a30f612415e5e391e5d96604e  pounce-3.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/pounce/pounce.mk b/package/pounce/pounce.mk
new file mode 100644
index 000000000000..b0a28efd91bd
--- /dev/null
+++ b/package/pounce/pounce.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# pounce
+#
+################################################################################
+
+POUNCE_VERSION = 3.1
+POUNCE_SITE = https://git.causal.agency/pounce/snapshot
+POUNCE_SOURCE = pounce-$(POUNCE_VERSION).tar.gz
+POUNCE_LICENSE = GPL-3.0+
+POUNCE_LICENSE_FILES = LICENSE
+POUNCE_DEPENDENCIES = libressl
+
+$(eval $(autotools-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
