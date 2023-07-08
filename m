Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499B4EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA44D400CB;
	Sat,  8 Jul 2023 19:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA44D400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zf4zaCv4tLve; Sat,  8 Jul 2023 19:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED2F5405A5;
	Sat,  8 Jul 2023 19:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2F5405A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 386C81BF863
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 138FD60ACC
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 138FD60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arN5K2VcfVK1 for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:44:53 +0000 (UTC)
X-Greylist: delayed 00:09:16 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B39A660A9D
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id B39A660A9D
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:44:53 +0000 (UTC)
Received: from localhost (80.red-83-50-209.dynamicip.rima-tde.net
 [83.50.209.80]) by iodev.co.uk (Postfix) with ESMTPSA id 3DB0F1E99C2;
 Sat,  8 Jul 2023 21:36:09 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:36:06 +0200
Message-Id: <20230708193606.32014-1-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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
index 188c579010a5..cbcd7a7527ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1322,6 +1322,7 @@ F:	package/exempi/
 N:	Ismael Luceno <ismael@iodev.co.uk>
 F:	package/axel/
 F:	package/mawk/
+F:	package/pounce/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
diff --git a/package/Config.in b/package/Config.in
index bff090a66163..b2bda179a402 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2444,6 +2444,7 @@ endif
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
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
