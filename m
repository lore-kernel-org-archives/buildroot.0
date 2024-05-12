Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7B0C25B5F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DEB41FDA;
	Sun, 12 May 2024 10:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-v4P0yd6oRM; Sun, 12 May 2024 10:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25E1C41FE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25E1C41FE2;
	Sun, 12 May 2024 10:03:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8EFE1BF303
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFAD484105
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drO7SoaSsrNs for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDCB840BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBDCB840BE
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B379F87065; Sun, 12 May 2024 10:03:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:02:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cfda1f0b87ebfb7686b82f319c531d4d28fdfd67
X-Git-Newrev: 322500d1bdad5cbcc229c75e766b58318bb12235
X-Patchwork-Hint: ignore
Message-Id: <20240512100302.B379F87065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qbee-agent: new package
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
Content-Type: multipart/mixed; boundary="===============6028498656480452842=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6028498656480452842==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=322500d1bdad5cbcc229c75e766b58318bb12235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add qbee-agent, an open source device management software
for Linux devices.

Signed-off-by: Jon Henrik Bjørnstad <jonhenrik@qbee.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/qbee-agent/Config.in       | 25 +++++++++++++++++++++++++
 package/qbee-agent/qbee-agent.hash |  3 +++
 package/qbee-agent/qbee-agent.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 70 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 67ce43e9cc..5a52550c27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1650,6 +1650,9 @@ F:	package/sdbusplus/
 N:	Jon Ringle <jringle@gridpoint.com>
 F:	package/mbpoll/
 
+N:	Jon Henrik Bjørnstad <jonhenrik@qbee.io>
+F:	package/qbee-agent/
+
 N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
 F:	package/autofs/
diff --git a/package/Config.in b/package/Config.in
index 2af63c124e..8aff995f63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2797,6 +2797,7 @@ menu "System tools"
 	source "package/procs/Config.in"
 	source "package/psmisc/Config.in"
 	source "package/pwgen/Config.in"
+	source "package/qbee-agent/Config.in"
 	source "package/quota/Config.in"
 	source "package/quotatool/Config.in"
 	source "package/rauc/Config.in"
diff --git a/package/qbee-agent/Config.in b/package/qbee-agent/Config.in
new file mode 100644
index 0000000000..e75adf5805
--- /dev/null
+++ b/package/qbee-agent/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_QBEE_AGENT
+	bool "qbee-agent"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # bash
+	depends on !BR2_STATIC_LIBS # shadow
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # shadow
+	select BR2_PACKAGE_IPTABLES # runtime
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_SHADOW # runtime
+	select BR2_PACKAGE_BASH # runtime
+	help
+	  Qbee is a device management platform that comprise of an
+	  open-source agent and a hosted SaaS backend.  This config
+	  installs pre-built static binaries made with the official
+	  public signing key for qbee.io. The binaries will work
+	  seamlessly with the qbee.io device management backend.
+
+	  https://github.com/qbee-io/qbee-agent
+	  https://qbee.io
+
+comment "qbee-agent needs a toolchain w/ headers >= 4.14, dynamic library"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
diff --git a/package/qbee-agent/qbee-agent.hash b/package/qbee-agent/qbee-agent.hash
new file mode 100644
index 0000000000..8e9e7230ea
--- /dev/null
+++ b/package/qbee-agent/qbee-agent.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d329d6d1c885ec4d410ab8c5f93320ab603cef860311a6b392edd5b903039a81  qbee-agent-2024.09-go2.tar.gz
+sha256  02d07d96be99eb042b01ba650079a440ce26a78c5e0e1e8060c33a8c9e200404  LICENSE
diff --git a/package/qbee-agent/qbee-agent.mk b/package/qbee-agent/qbee-agent.mk
new file mode 100644
index 0000000000..30219eebdc
--- /dev/null
+++ b/package/qbee-agent/qbee-agent.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# qbee-agent package
+#
+################################################################################
+
+# keep QBEE_AGENT_COMMIT_ID in sync when updating
+QBEE_AGENT_VERSION = 2024.09
+QBEE_AGENT_SITE = $(call github,qbee-io,qbee-agent,$(QBEE_AGENT_VERSION))
+QBEE_AGENT_LICENSE = Apache-2.0
+QBEE_AGENT_LICENSE_FILES = LICENSE
+
+QBEE_AGENT_COMMIT_ID = c30d43b8e64cfef960cee9475b58ae083e4ad246
+
+QBEE_AGENT_GOMOD = go.qbee.io/agent
+
+QBEE_AGENT_LDFLAGS = -s -w \
+	-X $(QBEE_AGENT_GOMOD)/app.Version=$(QBEE_AGENT_VERSION) \
+	-X $(QBEE_AGENT_GOMOD)/app.Commit=$(QBEE_AGENT_COMMIT_ID)
+
+define QBEE_AGENT_INSTALL_CERT
+	$(INSTALL) -D -m 0600 $(@D)/package/share/ssl/ca.cert \
+		$(TARGET_DIR)/etc/qbee/ppkeys/ca.cert
+endef
+
+QBEE_AGENT_POST_INSTALL_TARGET_HOOKS += QBEE_AGENT_INSTALL_CERT
+
+define QBEE_AGENT_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/package/init-scripts/systemd/qbee-agent.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/qbee-agent.service
+endef
+
+define QBEE_AGENT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(@D)/package/init-scripts/sysvinit/qbee-agent \
+		$(TARGET_DIR)/etc/init.d/S99qbee-agent
+endef
+
+$(eval $(golang-package))

--===============6028498656480452842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6028498656480452842==--
