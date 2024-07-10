Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B91EC3DA45
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1F360FCE;
	Wed, 10 Jul 2024 09:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JK-9XzZu3Bhv; Wed, 10 Jul 2024 09:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7297360E9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7297360E9D;
	Wed, 10 Jul 2024 09:17:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D025D1BF573
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCCA040C28
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzdRkOwYCpO7 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 09:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA884409E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA884409E5
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5E36845D2; Wed, 10 Jul 2024 09:17:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 11:16:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 083de00fdfb8587b6c6fbcf40e5c25a1e23d3baa
X-Git-Newrev: eaa801af97b77dbbe1065ccc42ac147749b4e498
X-Patchwork-Hint: ignore
Message-Id: <20240710091706.A5E36845D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloudflared: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaa801af97b77dbbe1065ccc42ac147749b4e498
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/cloudflared/Config.in        |  8 ++++++++
 package/cloudflared/cloudflared.hash |  3 +++
 package/cloudflared/cloudflared.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c00fab70ed..bddd92d133 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1462,6 +1462,7 @@ F:	support/testing/tests/package/test_python_scipy.py
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/apcupsd/
 F:	package/bpftool/
+F:	package/cloudflared/
 F:	package/exfatprogs/
 F:	package/fxdiv/
 F:	package/gensio/
diff --git a/package/Config.in b/package/Config.in
index dc3806388c..6406fd410a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2385,6 +2385,7 @@ endif
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
+	source "package/cloudflared/Config.in"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
diff --git a/package/cloudflared/Config.in b/package/cloudflared/Config.in
new file mode 100644
index 0000000000..31319c01fd
--- /dev/null
+++ b/package/cloudflared/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_CLOUDFLARED
+	bool "cloudflared"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Cloudflare Tunnel client (formerly Argo Tunnel).
+
+	  https://github.com/cloudflare/cloudflared
diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
new file mode 100644
index 0000000000..1aa959f8b0
--- /dev/null
+++ b/package/cloudflared/cloudflared.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c61ef286962c3bb9c5edb580b89dbf8293083fa09a8f0f59379fe8ec2d04cada  cloudflared-2024.6.1-go2.tar.gz
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
new file mode 100644
index 0000000000..1796972be6
--- /dev/null
+++ b/package/cloudflared/cloudflared.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cloudflared
+#
+################################################################################
+
+CLOUDFLARED_VERSION = 2024.6.1
+CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
+CLOUDFLARED_LICENSE = Apache-2.0
+CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
+CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
