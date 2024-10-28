Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D33D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D35D607CA;
	Mon, 28 Oct 2024 21:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_R37yX8BBZh; Mon, 28 Oct 2024 21:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4C4607CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A4C4607CB;
	Mon, 28 Oct 2024 21:30:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3735CAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3260E607CA
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqO4yghWIaxC for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48628607CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48628607CB
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FB9F844C0; Mon, 28 Oct 2024 21:30:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:14:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70a777bb666764af476514bc6aa4e29c79abf7cf
X-Git-Newrev: 0f34e78818c9bc28a7a0e590bb73d72e616919f4
X-Patchwork-Hint: ignore
Message-Id: <20241028213023.3FB9F844C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f34e78818c9bc28a7a0e590bb73d72e616919f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/tailscale/Config.in      |  8 ++++++++
 package/tailscale/tailscale.hash |  3 +++
 package/tailscale/tailscale.mk   | 22 ++++++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9743ae30d4..76f15f708a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1516,6 +1516,7 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/stb/
+F:	package/tailscale/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index 57a95a6ea8..72b8d8bdc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2648,6 +2648,7 @@ endif
 	source "package/stunnel/Config.in"
 	source "package/suricata/Config.in"
 	source "package/system-config-printer/Config.in"
+	source "package/tailscale/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/tailscale/Config.in b/package/tailscale/Config.in
new file mode 100644
index 0000000000..c81a7134ee
--- /dev/null
+++ b/package/tailscale/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TAILSCALE
+	bool "tailscale"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  The easiest, most secure way to use WireGuard and 2FA.
+
+	  https://github.com/tailscale/tailscale
diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
new file mode 100644
index 0000000000..a5492684a1
--- /dev/null
+++ b/package/tailscale/tailscale.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  46b68067a8b91f0e32ea8c23c292b9eb6675fac4c7bba5471a1f787bc3ad7412  tailscale-1.76.1-go2.tar.gz
+sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
new file mode 100644
index 0000000000..91290ba4a3
--- /dev/null
+++ b/package/tailscale/tailscale.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tailscale
+#
+################################################################################
+
+TAILSCALE_VERSION = 1.76.1
+TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
+TAILSCALE_LICENSE = BSD-3-Clause
+TAILSCALE_LICENSE_FILES = LICENSE
+TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
+TAILSCALE_INSTALL_BINS = tailscale tailscaled
+TAILSCALE_LDFLAGS = \
+	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
+	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
+
+define TAILSCALE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
