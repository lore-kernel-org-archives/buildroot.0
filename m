Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA67AC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 21:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64563408C9;
	Thu, 15 Aug 2024 21:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MThWF4YCSZlh; Thu, 15 Aug 2024 21:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3B6940167
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3B6940167;
	Thu, 15 Aug 2024 21:27:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3141E1BF5E6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EAD340167
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2sHzCYhd0ZC for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 21:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7CC11400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CC11400B5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CC11400B5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 21:27:12 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:32f:a6b0:999d:e98:388e:dae3])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C078B78034D;
 Thu, 15 Aug 2024 23:27:07 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 23:26:58 +0200
Message-ID: <20240815212658.48933-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723757229;
 bh=3LJWQ7Jg2COIYhpVBYiWsZgLCQFokQqZs3c/+WLVwps=;
 h=From:To:Cc:Subject:Date:From;
 b=K0sPGkUuKwD9w8gkkwV/PsDRrdzjEPAR3wiWts20Ea1dpE6ZifBu37/ZeNKK2LDyu
 ADeGgd7MEnfkqTVQonLUOT9Od4cqi/h4qJdHd/15vq/i9e61X2K9zUffYPPN8IkDn2
 QSj1xGzuV/BQr+zHMJzy5R4W3BJmPxpBbD3VDb2BTQjIZsirBXClIylImsouhbI95E
 r7C0uTxtPvZ/uh3IT2ACG9/8wW+O5OUVp2w+fjRHZpdM95mWYGdE2dFz687/igLk++
 oLYOPNkDuAkHYXYujqdKOBx/HkzA+p6WmV0wM3Vwh6q3XhXgutINMa+euKob3A2xs4
 fkJGnBByeGmtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=K0sPGkUu
Subject: [Buildroot] [PATCH 1/1] package/dpdk: add 24.03
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Vincent JARDIN <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent JARDIN <vjardin@free.fr>

This commit adds the integration of the Data Plane Development Kit (DPDK),
a suite of libraries and drivers designed for high-performance packet
processing from the user space. DPDK enables direct packet steering from
some network interfaces to the userland, bypassing the Linux kernel
network stack. This is achieved through userland PCI drivers or by
leveraging some userland memory mappings of the network devices.

Originally inspired by RDMA (Remote Direct Memory Access) concepts, DPDK
has been adapted to work with PCI devices that do not inherently support
RDMA. This adaptation allows for low-latency, high-throughput data
processing by minimizing the overhead typically associated with
kernel-space network drivers.

Importantly, this commit does not enforce the use of UIO or VFIO
kernel frameworks, as DPDK's architecture supports userland memory
mappings that do not require these technologies. By maintaining this
flexibility, DPDK can operate with a broader range of hardware and
software configurations, making it suitable for diverse Buildroot's
deployment scenarios.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/Config.in      |  1 +
 package/dpdk/Config.in | 14 ++++++++++++++
 package/dpdk/dpdk.hash |  1 +
 package/dpdk/dpdk.mk   | 39 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..5b21805e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1990,6 +1990,7 @@ menu "Networking"
 	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
 	source "package/dht/Config.in"
+	source "package/dpdk/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
new file mode 100644
index 0000000000..56dcb42a33
--- /dev/null
+++ b/package/dpdk/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DPDK
+	bool "dpdk"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glibc or uClibc toolchain required
+	select BR2_PACKAGE_HOST_PYTHON_PYELFTOOLS
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBEXECINFO
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_ZLIB
+	help
+	  DPDK (Data Plane Development Kit) is a set of libraries
+	  and drivers for fast packet processing.
+
+	  http://dpdk.org/
diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
new file mode 100644
index 0000000000..fd8ab5a6aa
--- /dev/null
+++ b/package/dpdk/dpdk.hash
@@ -0,0 +1 @@
+sha256  33ed973b3945af4f5923096ddca250b401dc80be3b5c6393b4e4fe43a1a6c2ad  dpdk-24.03.tar.xz
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
new file mode 100644
index 0000000000..56adcf1d00
--- /dev/null
+++ b/package/dpdk/dpdk.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# DPDK
+#
+################################################################################
+
+# DPDK_VERSION = main
+# DPDK_SITE = https://dpdk.org/git/dpdk
+# DPDK_SITE_METHOD = git
+DPDK_VERSION ?= 24.03
+DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
+DPDK_SITE = http://fast.dpdk.org/rel
+DPDK_LICENSE = BSD-3-Clause
+DPDK_LICENSE_FILES = license/bsd-3-clause.txt license/README license/bsd-2-clause.txt license/exceptions.txt license/gpl-2.0.txt license/isc.txt license/lgpl-2.1.txt license/mit.txt
+
+DPDK_DEPENDENCIES += host-pkgconf
+DPDK_DEPENDENCIES += host-python-pyelftools
+DPDK_DEPENDENCIES += libbsd
+DPDK_DEPENDENCIES += libexecinfo
+DPDK_DEPENDENCIES += jansson
+DPDK_DEPENDENCIES += libpcap
+DPDK_DEPENDENCIES += zlib
+#not yet DPDK_DEPENDENCIES += openssl
+#not yet DPDK_DEPENDENCIES += libbpf
+
+DPDK_MARCH = $(BR2_ARCH)
+DPDK_MTUNE = $(BR2_ARCH) # not used yet
+GCC_TARGET_CPU=$(BR2_GCC_TARGET_ARCH)
+
+# see meson_options.txt from DPDK
+#
+DPDK_CONF_OPTS += -Ddeveloper_mode=enabled
+
+DPDK_CONF_OPTS += -Dcpu_instruction_set=$(DPDK_MARCH)
+
+# platform can be: native, all, cn9k, cn10k
+DPDK_CONF_OPTS += -Dplatform=generic
+
+$(eval $(meson-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
