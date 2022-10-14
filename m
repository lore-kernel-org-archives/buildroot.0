Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90619C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1208E60B99;
	Fri, 14 Oct 2022 21:08:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1208E60B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTWfdg9zG0eo; Fri, 14 Oct 2022 21:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CDC060B46;
	Fri, 14 Oct 2022 21:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CDC060B46
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC7DD1BF300
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95E02403CA
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 21:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E02403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZa5zWPPDnPR for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 21:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B65400AB
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 21:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5B65400AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 985F186D4E; Fri, 14 Oct 2022 21:08:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 23:07:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b749d6dd7b5fc6cc8b85a316878721d42654759c
X-Git-Newrev: b69fe70c264fc2eda79b36a5d96e5cb1b900ad7b
X-Patchwork-Hint: ignore
Message-Id: <20221014210818.985F186D4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agent-proxy: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b69fe70c264fc2eda79b36a5d96e5cb1b900ad7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rufus Segar <rhs@riseup.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in.host               |  1 +
 package/agent-proxy/Config.in.host   | 11 +++++++++++
 package/agent-proxy/agent-proxy.hash |  3 +++
 package/agent-proxy/agent-proxy.mk   | 20 ++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bfde353c8a..c0e6f8bbef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2569,6 +2569,9 @@ F:	support/testing/tests/package/test_glxinfo.py
 F:	support/testing/tests/package/test_openssh.py
 F:	toolchain/
 
+N:	Rufus Segar <rhs@riseup.net>
+F:	package/agent-proxy/
+
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 84517787cc..d6b9ee0e2d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/abootimg/Config.in.host"
 	source "package/aespipe/Config.in.host"
+	source "package/agent-proxy/Config.in.host"
 	source "package/android-tools/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
diff --git a/package/agent-proxy/Config.in.host b/package/agent-proxy/Config.in.host
new file mode 100644
index 0000000000..80328790ad
--- /dev/null
+++ b/package/agent-proxy/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_AGENT_PROXY
+	bool "host agent-proxy"
+	help
+	  This is a simple, small proxy which was intended for use
+	  with kgdb, or gdbserver type connections where you want to
+	  share a text console and a debug session.
+
+	  The idea is that you use the agent-proxy to connect to a
+	  serial port directly or to a remote terminal server.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/agent-proxy/agent-proxy.hash b/package/agent-proxy/agent-proxy.hash
new file mode 100644
index 0000000000..bd0e814d20
--- /dev/null
+++ b/package/agent-proxy/agent-proxy.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  c4db014339b5bbdae3d98e814844e1b80d87b663a343f7d33fdb89fdbb02f16d  agent-proxy-agent-proxy-1.97-br1.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/agent-proxy/agent-proxy.mk b/package/agent-proxy/agent-proxy.mk
new file mode 100644
index 0000000000..46108aef02
--- /dev/null
+++ b/package/agent-proxy/agent-proxy.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# agent-proxy
+#
+################################################################################
+
+AGENT_PROXY_VERSION = agent-proxy-1.97
+AGENT_PROXY_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+AGENT_PROXY_LICENSE = GPL-2.0
+AGENT_PROXY_LICENSE_FILES = COPYING
+
+define HOST_AGENT_PROXY_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_AGENT_PROXY_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(HOST_DIR)/bin/agent-proxy
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
