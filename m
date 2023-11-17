Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF9DC197A0
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 09:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C337361147;
	Fri, 17 Nov 2023 09:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C337361147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cJ6IfwiroxYC; Fri, 17 Nov 2023 09:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8EA86FB05;
	Fri, 17 Nov 2023 09:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8EA86FB05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5CFD1BF3A0
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC1BE83AA0
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 09:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1BE83AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEai08Tu1lmW for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 09:44:40 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53FD783A9F
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 09:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FD783A9F
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 47D75120097;
 Fri, 17 Nov 2023 12:44:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 47D75120097
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Fri, 17 Nov 2023 12:44:38 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 17 Nov 2023 12:44:37 +0300
To: <buildroot@buildroot.org>
Date: Fri, 17 Nov 2023 12:44:28 +0300
Message-ID: <20231117094429.30820-2-svromanov@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117094429.30820-1-svromanov@salutedevices.com>
References: <20230825233328.35c4a920@windsurf>
 <20231117094429.30820-1-svromanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181430 [Nov 17 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: svromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 salutedevices.com:7.1.1; p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; github.com:7.1.1;
 100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/11/17 09:22:00
X-KSMG-LinksScanning: Clean, bases: 2023/11/17 09:21:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/17 08:13:00 #22469735
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1700214278;
 bh=1ggj2jogasDOXVTVJsFBV8MJ+QimkjRcRJJlb+mCs/o=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=uYzgRGpqm6/AfSGGeWff7qPvy9K2W4/gYXTrLNEx8EeSaUrcnPwiu1Lu46+RH71X/
 NqiGWp2j97DzzqQfaNSJ1162/OIs+4NC/HNh/AG5efdBZm9PhHz4kK33Fo0Jpp5ow9
 Oh49wewMB0qCsKPQtu83lwJjNGWta/24TurZTO5QqamPLYkGe7bwQlqPbSko8/cjmo
 sWesIaBx01COZitk9AGQ3SDRVetA6LoBLfTVh4XVfmd7TFTGZwFOF/D8gKVd9FJ1r6
 4P/+qW7WFpb7TvX84K1XjtDjRgvmcizZmSpkO43weevvyrbzqgzMc650xGykjHnCUj
 3LO6lUJNbokgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=uYzgRGpq
Subject: [Buildroot] [RFC PATCH v2 1/2] package/ck: new package
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
From: Sergey Romanov via buildroot <buildroot@buildroot.org>
Reply-To: Sergey Romanov <svromanov@salutedevices.com>
Cc: Sergey Romanov <svromanov@sberdevices.ru>, chip-club@ya.ru,
 akopytov@gmail.com, kernel@salutedevices.com, svromanov@salutedevices.com,
 sbahra@repnop.org, sdfw_system_team@salutedevices.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergey Romanov <svromanov@sberdevices.ru>

Concurrency primitives, safe memory reclamation
mechanisms and non-blocking data structures
for the research, design and implementation
of high performance concurrent systems.

https://github.com/concurrencykit/ck.git

Signed-off-by: Sergey Romanov <svromanov@salutedevices.com>
---
 DEVELOPERS           |  3 ++
 package/Config.in    |  1 +
 package/ck/Config.in | 19 ++++++++++++
 package/ck/ck.hash   |  3 ++
 package/ck/ck.mk     | 71 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+)
 create mode 100644 package/ck/Config.in
 create mode 100644 package/ck/ck.hash
 create mode 100644 package/ck/ck.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..f967b46842 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2717,6 +2717,9 @@ N:	Sergey Matyukevich <sergey.matyukevich@synopsys.com>
 F:	board/synopsys/nsim/
 F:	configs/snps_arc700_nsim_defconfig
 
+N:	Sergey Romanov <svromanov@salutedevices.com>
+F:	package/ck/
+
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	board/toradex/apalis-imx6/
 F:	configs/toradex_apalis_imx6_defconfig
diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..ed08cb69c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -91,6 +91,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/bpftool/Config.in"
 	source "package/cache-calibrator/Config.in"
+	source "package/ck/Config.in"
 	source "package/clinfo/Config.in"
 	source "package/clpeak/Config.in"
 	source "package/coremark/Config.in"
diff --git a/package/ck/Config.in b/package/ck/Config.in
new file mode 100644
index 0000000000..613a1f4dde
--- /dev/null
+++ b/package/ck/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_CK_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && !BR2_ARM_CPU_ARMV7M
+	default y if BR2_aarch64
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
+	default y if BR2_sparc_v9
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_CK
+	bool "concurrency kit"
+	depends on BR2_PACKAGE_CK_ARCH_SUPPORTS
+	help
+	  Concurrency primitives, safe memory reclamation mechanisms
+	  and non-blocking data structures for the research, design and
+	  implementation of high performance concurrent systems.
+
+	  https://github.com/concurrencykit/ck.git
diff --git a/package/ck/ck.hash b/package/ck/ck.hash
new file mode 100644
index 0000000000..6d77ae4bee
--- /dev/null
+++ b/package/ck/ck.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  97d2a21d5326ef79b4668be2e6eda6284ee77a64c0981b35fd9695c736c3d4ac  ck-0.7.1.tar.gz
+sha256  21a861f554f8f97047815e63ff5cbd57707b4c53dc1dd1b0f2dd43e6ca193464  LICENSE
diff --git a/package/ck/ck.mk b/package/ck/ck.mk
new file mode 100644
index 0000000000..41827a9636
--- /dev/null
+++ b/package/ck/ck.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# ck
+#
+################################################################################
+
+CK_VERSION = 0.7.1
+CK_SITE = $(call github,concurrencykit,ck,$(CK_VERSION))
+CK_LICENSE = Apache-2.0
+CK_LICENSE_FILES = LICENSE
+
+CK_INSTALL_STAGING = YES
+
+CK_CONF_OPTS = \
+	--platform=$(BR2_ARCH) \
+	--prefix="/usr"
+
+CK_LDFLAGS = -Wl,-soname,libck.so.0  -shared -fPIC
+CK_CFLAGS = $(TARGET_CFLAGS) -std=gnu99 -fPIC
+
+ifeq ($(BR2_arm)$(BR2_ARM_CPU_ARMV6),yy)
+CK_CONF_OPTS += --profile="arm"
+CK_CFLAGS +=  -march=armv6k
+else ifeq ($(BR2_arm)$(BR2_ARM_CPU_ARMV7A),yy)
+CK_CONF_OPTS += --profile="arm"
+CK_CFLAGS +=  -march=armv7-a
+else ifeq ($(BR2_arm),y)
+CK_CONF_OPTS += --profile="arm"
+else ifeq ($(BR2_aarch64),y)
+CK_CONF_OPTS += --profile="aarch64"
+else ifeq ($(BR2_powerpc),y)
+CK_CONF_OPTS += --profile="ppc"
+else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+CK_CONF_OPTS += --profile="ppc64"
+else ifeq ($(BR2_s390x),y)
+CK_CONF_OPTS += --profile="s390x"
+else ifeq ($(BR2_x86_64),y)
+CK_CONF_OPTS += --profile="x86_64"
+CK_LDFLAGS += -m64
+else ifeq ($(BR2_i386),y)
+CK_CONF_OPTS += --profile="x86"
+else ifeq ($(BR2_sparc_v9),y)
+CK_CONF_OPTS += --profile="sparcv9"
+endif
+
+define CK_CONFIGURE_CMDS
+	cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		LD=$(TARGET_CC) \
+		CC=$(TARGET_CC) \
+		LDFLAGS="$(CK_LDFLAGS)" \
+		CFLAGS="$(CK_CFLAGS)" \
+		ALL_LIBS="libck.so" \
+		INSTALL_LIBS="install-so" \
+		PTHREAD_CFLAGS="-pthread" \
+		./configure $(CK_CONF_OPTS)
+endef
+
+define CK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define CK_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define CK_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
