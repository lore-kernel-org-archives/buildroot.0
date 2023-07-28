Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C5BC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34322614F7;
	Fri, 28 Jul 2023 21:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34322614F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5Cjdm5peBWZ; Fri, 28 Jul 2023 21:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51939614F5;
	Fri, 28 Jul 2023 21:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51939614F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB571BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7627F40447
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7627F40447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ts2d5172DI91 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:25:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 891844032B
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891844032B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70ABD83A36; Fri, 28 Jul 2023 21:25:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 23:15:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f187fad22d692f046441976efcd4385692a48261
X-Git-Newrev: 6e9cfd5488a6867f27131b159c5dc932af512d05
X-Patchwork-Hint: ignore
Message-Id: <20230728212512.70ABD83A36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbpoll: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e9cfd5488a6867f27131b159c5dc932af512d05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mbpoll is a tool that can be used to test communication
with modbus slave devices

Signed-off-by: Jon Ringle <jringle@gridpoint.com>
[Thomas:
- add MBPOLL_LICENSE, MBPOLL_LICENSE_FILES
- add host-pkgconf to dependencies
- improve Config.in help text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in          |  1 +
 package/mbpoll/Config.in   |  8 ++++++++
 package/mbpoll/mbpoll.hash |  3 +++
 package/mbpoll/mbpoll.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b07d4be98f..0e8cdd7c8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -124,6 +124,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mbpoll/Config.in"
 	source "package/mbw/Config.in"
 	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
diff --git a/package/mbpoll/Config.in b/package/mbpoll/Config.in
new file mode 100644
index 0000000000..3617e9fa88
--- /dev/null
+++ b/package/mbpoll/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MBPOLL
+	bool "mbpoll"
+	select BR2_PACKAGE_LIBMODBUS
+	help
+	  mbpoll is a command line utility to communicate with ModBus
+	  slave (RTU or TCP).
+
+	  https://github.com/epsilonrt/mbpoll
diff --git a/package/mbpoll/mbpoll.hash b/package/mbpoll/mbpoll.hash
new file mode 100644
index 0000000000..d72ebee7b8
--- /dev/null
+++ b/package/mbpoll/mbpoll.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  046fdac2d88eddb71a1091a87d0a4bb23fee39595a929cde50c546dae0fbcd6d  mbpoll-1.5.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/mbpoll/mbpoll.mk b/package/mbpoll/mbpoll.mk
new file mode 100644
index 0000000000..466d9a0ec1
--- /dev/null
+++ b/package/mbpoll/mbpoll.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# mbpoll
+#
+################################################################################
+
+MBPOLL_VERSION = 1.5
+MBPOLL_SITE = $(call github,epsilonrt,mbpoll,v$(MBPOLL_VERSION))
+MBPOLL_DEPENDENCIES = host-pkgconf libmodbus
+MBPOLL_LICENSE = GPL-3.0+
+MBPOLL_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
