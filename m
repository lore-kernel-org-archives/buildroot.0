Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33315C28B28
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDFE460E45;
	Tue, 18 Mar 2025 15:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkHxfiiyBz2L; Tue, 18 Mar 2025 15:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D128B60D6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D128B60D6C;
	Tue, 18 Mar 2025 15:06:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 231E916E
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14F6481B0A
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5BQx3yk7l-E for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3AF081EF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3AF081EF9
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A11FF84755; Tue, 18 Mar 2025 15:02:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 22:22:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b36475315b974e1ac3120156745b55daf1b7557c
X-Git-Newrev: d038cc47cdf8877a7062c18e04bb687f38fcd1e7
X-Patchwork-Hint: ignore
Message-Id: <20250318150245.A11FF84755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/passt: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d038cc47cdf8877a7062c18e04bb687f38fcd1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in        |  1 +
 package/passt/Config.in  | 19 +++++++++++++++++++
 package/passt/passt.hash |  4 ++++
 package/passt/passt.mk   | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4297903fd8..8a5c992626 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2606,6 +2606,7 @@ endif
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
 	source "package/parprouted/Config.in"
+	source "package/passt/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
diff --git a/package/passt/Config.in b/package/passt/Config.in
new file mode 100644
index 0000000000..a2d2f4f1fe
--- /dev/null
+++ b/package/passt/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_PASST
+	bool "passt"
+	help
+	  passt: Plug A Simple Socket Transport
+	  pasta: Pack A Subtle Tap Abstraction
+
+	  passt implements a translation layer between a Layer-2
+	  network interface and native Layer-4 sockets (TCP, UDP,
+	  ICMP/ICMPv6 echo) on a host. It doesn't require any
+	  capabilities or privileges, and it can be used as a simple
+	  replacement for Slirp.
+
+	  pasta (same binary as passt, different command) offers
+	  equivalent functionality, for network namespaces: traffic
+	  is forwarded using a tap interface inside the namespace,
+	  without the need to create further interfaces on the host,
+	  hence not requiring any capabilities or privileges.
+
+	  https://passt.top/passt/about/
diff --git a/package/passt/passt.hash b/package/passt/passt.hash
new file mode 100644
index 0000000000..011ba84b89
--- /dev/null
+++ b/package/passt/passt.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  f76c12e0535b9f6af59ee747d8ed7a8f691bb1ac7429225484788f0bc6e23dac  passt-2025_02_17.a1e48a0-git4.tar.gz
+sha256  32dfe03d9985f5feb581da26a2fe6c84530cccb6b53ede0d8dab075cd048ac5b  LICENSES/BSD-3-Clause.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/passt/passt.mk b/package/passt/passt.mk
new file mode 100644
index 0000000000..5b9fcd831f
--- /dev/null
+++ b/package/passt/passt.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# passt
+#
+################################################################################
+
+PASST_VERSION = 2025_02_17.a1e48a0
+PASST_SITE = https://passt.top/passt
+PASST_SITE_METHOD = git
+
+PASST_LICENSE = \
+	BSD-3-Clause, \
+	GPL-2.0-or-later
+PASST_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GPL-2.0-or-later.txt
+
+define PASST_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+define PASST_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) \
+		prefix=/usr
+endef
+
+define PASST_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) \
+		prefix=/usr \
+		DESTDIR=$(TARGET_DIR) \
+		install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
