Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F97BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407DE820F1;
	Tue,  6 Feb 2024 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8u0_aNotK7Bq; Tue,  6 Feb 2024 19:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA6082023
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BA6082023;
	Tue,  6 Feb 2024 19:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9287A1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BB7B4032B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g4-B6PzmLb7E for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:31:26 +0000 (UTC)
X-Greylist: delayed 323 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 Feb 2024 19:31:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1027140150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1027140150
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=37.18.73.165;
 helo=mx1.sberdevices.ru; envelope-from=ddrokosov@salutedevices.com;
 receiver=<UNKNOWN> 
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1027140150
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:31:25 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 0817B100013;
 Tue,  6 Feb 2024 22:25:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0817B100013
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Tue,  6 Feb 2024 22:25:58 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 22:25:58 +0300
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Herve Codina <herve.codina@bootlin.com>
Date: Tue, 6 Feb 2024 22:25:33 +0300
Message-ID: <20240206192543.7179-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206192543.7179-1-ddrokosov@salutedevices.com>
References: <20240206192543.7179-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183246 [Feb 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a,
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 smtp.sberdevices.ru:5.0.1,7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 100.64.160.123:7.1.2;
 salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/06 15:39:00 #23379857
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1707247559;
 bh=j2WiFjqj9VdzjtVzwmcGuif/Vui9zLIl5ite77jl9W4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=EolAnqs1Pw2BIm7cLFZ2O3pRniw44cqnfeXwlFuzAL8R8vWPiyvVWBghIl9BgvzoZ
 UWM0DNFA3qVc4WK4w5wM+6vwPzaVj3PoJ5oNRriFusBZDYAZlDuE1l3rQpzNOm4Lsj
 5SECcy9FDhLjyog1W02MMByZ214cKgLaURxc6/pNPaQ4DbNNBlVf9taN3UTZ57i7bJ
 +hZnuu/rO7nDkBcXhfAbjxmGGhUMOtevBSfCG/1Nl/B4TrIkpFVeeF8iqLPyjgETVt
 cvi5wdl7z/qP887KF34Hrs6V+5HGR5C33BcFF/5qVz4UMwPfDJLUy63ba8srDAnzoh
 wf+JzAILz46/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=salutedevices.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=EolAnqs1
Subject: [Buildroot] [PATCH v2 1/2] package/linux-tools: introduce linux mm
 tools
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
Reply-To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, chopps@chopps.org,
 Alexey Romanov <avromanov@salutedevices.com>, sdfw_system_team@sberdevices.ru,
 kernel@sberdevices.ru, rockosov@gmail.com, buildroot@buildroot.org
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

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
---
 package/linux-tools/Config.in           | 18 +++++++++++
 package/linux-tools/linux-tool-mm.mk.in | 41 +++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 package/linux-tools/linux-tool-mm.mk.in

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 8a0b6d5802cc..ede966ec792d 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -185,4 +185,22 @@ config BR2_PACKAGE_LINUX_TOOLS_HV_VSS_DAEMON
 
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
index 000000000000..5431e0574b04
--- /dev/null
+++ b/package/linux-tools/linux-tool-mm.mk.in
@@ -0,0 +1,41 @@
+################################################################################
+#
+# mm
+#
+################################################################################
+
+LINUX_TOOLS += mm
+
+MM_DEPENDENCIES = linux
+MM_MAKE_OPTS = $(LINUX_MAKE_FLAGS) CC="$(TARGET_CC)"
+
+define MM_BUILD_CMDS
+	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+		MM_SUBDIR=vm; \
+	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
+		MM_SUBDIR=mm; \
+	else \
+		echo "Your kernel version is too old and does not have the mm tool." ; \
+		echo "At least kernel 3.4 must be used." ; \
+		exit 1 ; \
+	fi ; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(MM_MAKE_OPTS) $${MM_SUBDIR}
+endef
+
+define MM_INSTALL_TARGET_CMDS
+	$(Q)if test -f $(LINUX_DIR)/tools/vm/Makefile ; then \
+		MM_SUBDIR=vm; \
+	elif test -f $(LINUX_DIR)/tools/mm/Makefile ; then \
+		MM_SUBDIR=mm; \
+	else \
+		echo "Your kernel version is too old and does not have the mm tool." ; \
+		echo "At least kernel 3.4 must be used." ; \
+		exit 1 ; \
+	fi ; \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
+		$(MM_MAKE_OPTS) \
+		INSTALL_ROOT=$(TARGET_DIR) \
+		DESTDIR=$(TARGET_DIR) \
+		$${MM_SUBDIR}_install
+endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
