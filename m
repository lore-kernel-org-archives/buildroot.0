Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B15FC7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 11:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABBFF60C33;
	Fri,  9 Jun 2023 11:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABBFF60C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgUqLvRkiBOh; Fri,  9 Jun 2023 11:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD06A60BDD;
	Fri,  9 Jun 2023 11:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD06A60BDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9E51BF37F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B7441598
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 11:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B7441598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2p0itnOdxCaS for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 11:34:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F8F540025
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F8F540025
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 11:34:27 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id DE53A5FD8E;
 Fri,  9 Jun 2023 14:34:23 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Fri,  9 Jun 2023 14:34:23 +0300 (MSK)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Herve Codina <herve.codina@bootlin.com>
Date: Fri, 9 Jun 2023 14:34:15 +0300
Message-ID: <20230609113415.13856-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/09 07:08:00 #21465535
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1686310463;
 bh=XcoHKyHADT7RPMPnbFDPW1MpCJLuG5EBmwqG1+ldWN4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=TbOTXo9Fhh3cjvGXpWt2sqbVtBfLfuddGoYh2wk2kyOBbWyGTVqgSUMrGwjPb4qT8
 6Cs6lB8A30Y11/3n1UzN8GflxhPYQVXaa6JlVa9qaUUPL99y7fjdSkJjtVzEU//ji0
 n8xpVA3wM3Q2QeSVwW+8BPjD74z2kzeFQThXkugmqC4ZkczVXebFoCvSnHic0z78qD
 Rijbsmh0az3kMeLUJbnyy9ahhy1oe9ILLRYXoMOq92u7xtoUjzbnJTUgwAj5qwUE41
 GvAhyOj1pbPE18wA3zvJBvqXxtneckKvtPp0zFAxTBFmhr9edn3KIky/1DWFaJjUlC
 hp/4DLk2e0dHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=TbOTXo9F
Subject: [Buildroot] [PATCH v1] package/linux-tools: introduce linux mm tools
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
From: Dmitry Rokosov via buildroot <buildroot@buildroot.org>
Reply-To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: kernel@sberdevices.ru, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru, rockosov@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toolset was designed to facilitate the testing, monitoring, and
tracing of various things with virtual memory, pages, and slab objects.
It is an invaluable resource for identifying and analyzing
memory-related issues, such as leaks and bottlenecks, and can greatly
enhance one's understanding of memory utilization within a system.

The mm toolset includes:
    - page_owner_sort: userspace helper to sort the output of
      /sys/kernel/debug/page_owner, which helps to know who allocates
      the page from kernel context
    - slabinfo: the tool which gets reports about slabs, for example
      show empty slabs, modify of slab debug options at runtime, display
      all information about a slabcache
    - page-types: a handy tool for querying page flags

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 package/linux-tools/Config.in           | 18 ++++++++
 package/linux-tools/linux-tool-mm.mk.in | 59 +++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-mm.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 880ad08f0f1c..3ecc45574b82 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -171,4 +171,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
 
 endif # BR2_PACKAGE_LINUX_TOOLS_HV
 
+config BR2_PACKAGE_LINUX_TOOLS_MM
+	bool "mm"
+	select BR2_PACKAGE_LINUX_TOOLS
+	help
+	  mm is a toolset for testing/monitoring/tracing vm/pages/slabs objects.
+
+	  - page_owner_sort: userspace helper to sort the output of
+	  /sys/kernel/debug/page_owner, which helps to know who allocates
+	  the page from kernel context
+
+	  - slabinfo: the tool which gets reports about slabs, for example
+	  show empty slabs, modify of slab debug options at runtime, display
+	  all information about a slabcache
+
+	  - page-types: a handy tool for querying page flags
+
+	  These tools are available only from kernel version 3.4.
+
 endmenu
diff --git a/package/linux-tools/linux-tool-mm.mk.in b/package/linux-tools/linux-tool-mm.mk.in
new file mode 100644
index 000000000000..a59f1c46ff97
--- /dev/null
+++ b/package/linux-tools/linux-tool-mm.mk.in
@@ -0,0 +1,59 @@
+################################################################################
+#
+# mm
+#
+################################################################################
+
+LINUX_TOOLS += mm
+
+MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
+
+KVER = $(shell echo $(LINUX_VERSION_PROBED))
+KVER_MAJOR = $(word 1,$(subst ., ,$(KVER)))
+KVER_MINOR = $(word 2,$(subst ., ,$(KVER)))
+
+# For the first time tools/vm was introduced in the 3.4 kernel version
+KVER_MAJOR_MIN = 3
+KVER_MINOR_MIN = 4
+
+# Starting from 6.3 kernel version mm tools are located at tools/mm folder
+# instead of tools/vm
+KVER_MAJOR_MM = 6
+KVER_MINOR_MM = 3
+
+define MM_BUILD_CMDS
+	$(Q)if [ $(KVER_MAJOR) -lt $(KVER_MAJOR_MIN) ] || \
+		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MIN) -a \
+		  $(KVER_MINOR) -lt $(KVER_MINOR_MIN) ]; then \
+		echo -n "Your kernel version $(KVER_MAJOR).$(KVER_MINOR) is "; \
+		echo "too old and doesn't have the mm tools." ; \
+		echo -n "At least $(KVER_MAJOR_MIN).$(KVER_MINOR_MIN) "; \
+		echo "kernel must be used." ; \
+		exit 1 ; \
+	fi
+
+	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
+		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
+		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
+		MM=mm; \
+	else \
+		MM=vm; \
+	fi; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(MM_MAKE_OPTS) $${MM}
+endef
+
+define MM_INSTALL_TARGET_CMDS
+	$(Q)if [ $(KVER_MAJOR) -gt $(KVER_MAJOR_MM) ] || \
+		[ $(KVER_MAJOR) -eq $(KVER_MAJOR_MM) -a \
+		  $(KVER_MINOR) -ge $(KVER_MINOR_MM) ]; then \
+		MM=mm; \
+	else \
+		MM=vm; \
+	fi; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(MM_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		DESTDIR=$(TARGET_DIR) \
+		$${MM}_install
+endef
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
