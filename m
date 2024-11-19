Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB410D6C2AF
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 21:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5434984EC8;
	Tue, 19 Nov 2024 21:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V34asPAhGNgh; Tue, 19 Nov 2024 21:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5411A85373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5411A85373;
	Tue, 19 Nov 2024 21:48:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40F17DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 219F640167
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s1Y9hwr0cqw for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 21:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CAB2C40114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB2C40114
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAB2C40114
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 21:48:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:e4f5:8dbb:490c:d591])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 337362003C8;
 Tue, 19 Nov 2024 22:48:01 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Robin Jarry <robin@jarry.cc>,
 Vincent Jardin <vjardin@free.fr>
Date: Tue, 19 Nov 2024 22:46:41 +0100
Message-ID: <20241119214641.60188-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732052884;
 bh=RU6ZDCbrxnhwkc8kJ+neCE3yjCzNMKxQN7BDzgCkpEs=;
 h=From:To:Cc:Subject:Date:From;
 b=jfWQATmB3Sv8RKMH5+L38g8bD/MSSsCN2gr0owBYwQE+2RaaLxoAbcgXbBXePKh1S
 QRifY0vFZefjgH+C45AZutsVSgtosa2By1xFNHuBn7bvTWJuSkUTsRYx7zjG07aGsW
 n6ZjxOvk5qBENJ4jwEsQ9jYyZIkZ0gqo0L4IrXucz6ytSdd7OGP6lkf8HFEZ2sz8DI
 4dTycEvEhqchJWaekGa9BzcLNrXtipC+v+bD5S4sF5ekwkdLwgrorsCrqmxpQcDg1M
 omYlV0mNLxKx1JpaLYU4yEM/vSt9/aoAJ5JySb0o4dLDU561Zc4aWoNmlIPK4YELo1
 IPwT+tZQLtDuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jfWQATmB
Subject: [Buildroot] [PATCH 1/1] package/grout: RFC do not apply
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new package, a DPDK application, grout.

This commit is a Request For Comment. It should not be merged
until the release of DPDK 24.11.

The proper dpdk.mk patch will be sent after the release of DPDK 24.11
There is a dependency on mstflint.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS              |  1 +
 package/Config.in       |  1 +
 package/dpdk/dpdk.mk    | 14 ++++++++++----
 package/grout/Config.in | 11 +++++++++++
 package/grout/grout.mk  | 20 ++++++++++++++++++++
 5 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 package/grout/Config.in
 create mode 100644 package/grout/grout.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..61a38f9aca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/grout/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..a977e30417 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2024,6 +2024,7 @@ menu "Networking"
 	source "package/gensio/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
+	source "package/grout/Config.in"
 	source "package/grpc/Config.in"
 	source "package/gssdp/Config.in"
 	source "package/gupnp/Config.in"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index b685e12408..b078706786 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -4,9 +4,12 @@
 #
 ################################################################################
 
-DPDK_VERSION = 24.07
-DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
-DPDK_SITE = https://fast.dpdk.org/rel
+DPDK_VERSION = 78383e9816a8efe2ba16ec2ce65d51b94e6114e7
+DPDK_SITE = $(call github,DPDK,dpdk,$(DPDK_VERSION))
+
+#DPDK_VERSION = 24.07
+#DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
+#DPDK_SITE = https://fast.dpdk.org/rel
 DPDK_LICENSE = \
 	BSD-3-Clause, \
 	MIT
@@ -37,7 +40,10 @@ DPDK_LICENSE_FILES = \
 
 DPDK_DEPENDENCIES = \
 	host-pkgconf \
-	host-python-pyelftools
+	host-python-pyelftools \
+	$(if $(BR2_PACKAGE_MSTFLINT),mstflint)
+
+DPDK_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_DPDK_EXAMPLES),y)
 DPDK_CONF_OPTS += -Dexamples=all
diff --git a/package/grout/Config.in b/package/grout/Config.in
new file mode 100644
index 0000000000..14a3a5caef
--- /dev/null
+++ b/package/grout/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GROUT
+	bool "grout"
+	depends on BR2_PACKAGE_DPDK
+	depends on BR2_PACKAGE_LIBEVENT
+	depends on BR2_PACKAGE_NUMACTL
+	depends on BR2_PACKAGE_LIBECOLI
+	depends on BR2_PACKAGE_UTIL_LINUX
+	help
+	  Graph router based on DPDK
+
+	  https://github.com/DPDK/grout/
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
new file mode 100644
index 0000000000..f62af05647
--- /dev/null
+++ b/package/grout/grout.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# grout
+#
+################################################################################
+
+GROUT_VERSION = cea579e524ac68bf26e0d302d2913b1faee9ea26
+GROUT_SITE = $(call github,DPDK,grout,$(GROUT_VERSION))
+GROUT_LICENSE = BSD-3-Clause
+GROUT_LICENSE_FILES = LICENSE
+
+GROUT_DEPENDENCIES = \
+	host-pkgconf \
+	dpdk \
+	libevent \
+	numactl \
+	libecoli \
+	util-linux
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
