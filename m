Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C144C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 16:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BEFC404FD;
	Fri,  6 May 2022 16:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TbHM8Rs2deI; Fri,  6 May 2022 16:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E3034041C;
	Fri,  6 May 2022 16:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF73F1BF860
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 16:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD33A4041C
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 16:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYZiaEhw5Qv8 for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 16:42:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B56F400E9
 for <buildroot@buildroot.org>; Fri,  6 May 2022 16:42:42 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4KvxFF4CD9z9tlp;
 Fri,  6 May 2022 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1651855361; bh=dR1IN3mpD9Tad5N8eCwIxH2hO3hxTuEBavaoqLh/4Gc=;
 h=From:To:Cc:Subject:Date:From;
 b=ac3Bq4cs7BFWGVORKAiNy8djE+tEGXA4urOoLpmpFjJuHvUIjnXijZNcFWf9aNoXV
 k9UCKNz+cEnEwty5r+ij/MR7ICYUSqveO+evlfSVMWs0wV/vX8t72Ns3xyoeTOGkQ6
 p7+tMb+JYN49HGsHWfG2ks8QIaq7X156F4LiNukI=
X-Riseup-User-ID: B0A4DF62C58D5662C3DDAD3BDBB27913372126488797E696FEBF5DC6A2F659A1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KvxFD4mhwz5w0R;
 Fri,  6 May 2022 09:42:40 -0700 (PDT)
From: Rufus Segar <rhs@riseup.net>
To: buildroot@buildroot.org
Date: Fri,  6 May 2022 17:42:35 +0100
Message-Id: <20220506164236.1808958-1-rhs@riseup.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package: agent-proxy
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
Cc: Rufus Segar <rhs@riseup.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Rufus Segar <rhs@riseup.net>
---
 package/Config.in                  |  1 +
 package/agent-proxy/Config.in      | 11 +++++++++++
 package/agent-proxy/agent-proxy.mk | 24 ++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/agent-proxy/Config.in
 create mode 100644 package/agent-proxy/agent-proxy.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..40e41d77a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -83,6 +83,7 @@ menu "Compressors and decompressors"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+	source "package/agent-proxy/Config.in"
 	source "package/babeltrace2/Config.in"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
diff --git a/package/agent-proxy/Config.in b/package/agent-proxy/Config.in
new file mode 100644
index 0000000000..fb66599589
--- /dev/null
+++ b/package/agent-proxy/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_AGENT_PROXY
+	bool "agent-proxy"
+	help
+	  This is a simple, small proxy which was intended for use with
+	  kgdb, or gdbserver type connections where you want to share a
+	  text console and a debug session.
+
+	  The idea is that you use the agent-proxy to connect to a
+	  serial port directly or to a remote terminal server.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/agent-proxy/agent-proxy.mk b/package/agent-proxy/agent-proxy.mk
new file mode 100644
index 0000000000..52b986c0d5
--- /dev/null
+++ b/package/agent-proxy/agent-proxy.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# agent-proxy
+#
+################################################################################
+
+AGENT_PROXY_VERSION = agent-proxy-1.97
+AGENT_PROXY_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+AGENT_PROXY_LICENSE = GPL-2.0+
+AGENT_PROXY_LICENSE_FILES = COPYING
+
+define AGENT_PROXY_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define AGENT_PROXY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(STAGING_DIR)/usr/bin
+endef
+
+define AGENT_PROXY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/agent-proxy $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
