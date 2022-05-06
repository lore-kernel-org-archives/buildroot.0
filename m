Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB7DC433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 16:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 193FF404FF;
	Fri,  6 May 2022 16:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9JMKUylIdEf; Fri,  6 May 2022 16:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA45940447;
	Fri,  6 May 2022 16:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 877F41BF860
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 16:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7612C4097A
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 16:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=riseup.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ln7XHy1xq9Nt for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 16:42:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB14D40929
 for <buildroot@buildroot.org>; Fri,  6 May 2022 16:42:44 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4KvxFJ1dK7z9tjS;
 Fri,  6 May 2022 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1651855364; bh=ElHzTVEVf59DLmXKl8eGXjSKe6V5f7vdwhJykUIQpdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rJ1BteGQJ/EH93CHpagZx060n/ooISdNeEZH0TU4xsrgQTGmAc1RHTYzHJSq6lIN+
 ZX5oKxVqSmr2Kxz851O1FStsNYZnYsltdR3c9aSsvMhvmiXRig8+ElN9f5+bZOA/RL
 UMYUElJ6weZFgg03rIhnCEBdMkyYHkYasoEbPbHI=
X-Riseup-User-ID: 965E29D63D0005873EF418A4F6737C2E4184D583D1B46505BAF15A1014A19180
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4KvxFH2hcKz5vts;
 Fri,  6 May 2022 09:42:43 -0700 (PDT)
From: Rufus Segar <rhs@riseup.net>
To: buildroot@buildroot.org
Date: Fri,  6 May 2022 17:42:36 +0100
Message-Id: <20220506164236.1808958-2-rhs@riseup.net>
In-Reply-To: <20220506164236.1808958-1-rhs@riseup.net>
References: <20220506164236.1808958-1-rhs@riseup.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package: kdmx
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
 package/Config.in      |  1 +
 package/kdmx/Config.in | 12 ++++++++++++
 package/kdmx/kdmx.mk   | 24 ++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/kdmx/Config.in
 create mode 100644 package/kdmx/kdmx.mk

diff --git a/package/Config.in b/package/Config.in
index 8892134133..9adaf4c5a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -105,6 +105,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
 	source "package/iozone/Config.in"
+	source "package/kdmx/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/ktap/Config.in"
diff --git a/package/kdmx/Config.in b/package/kdmx/Config.in
new file mode 100644
index 0000000000..af338e6bda
--- /dev/null
+++ b/package/kdmx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_KDMX
+	bool "kdmx"
+	help
+	  kdmx is a program designed to split GDB packets and other
+	  trafic coming from a target on a serial line into 2 separate
+	  pseudo-ttys.
+
+	  The most common use of this is to run kgdb and console on a
+	  single serial port, but should be usable for alternating
+	  gdbserver or console over a serial line as well.
+
+	  git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
diff --git a/package/kdmx/kdmx.mk b/package/kdmx/kdmx.mk
new file mode 100644
index 0000000000..bb04282c0f
--- /dev/null
+++ b/package/kdmx/kdmx.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# kdmx
+#
+################################################################################
+
+KDMX_VERSION = agent-proxy-1.97
+KDMX_SITE = git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git
+KDMX_LICENSE = GPL-2.0+
+KDMX_LICENSE_FILES = COPYING
+
+define KDMX_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/kdmx
+endef
+
+define KDMX_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/kdmx/kdmx $(STAGING_DIR)/usr/bin
+endef
+
+define KDMX_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/kdmx/kdmx $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
