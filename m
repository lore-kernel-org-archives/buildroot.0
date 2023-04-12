Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A1DC7619A
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 22:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E0383C7B;
	Wed, 12 Apr 2023 22:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E0383C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFkN0BaU2ibv; Wed, 12 Apr 2023 22:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 787B581F95;
	Wed, 12 Apr 2023 22:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 787B581F95
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64A721C3D6E
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E16681FA8
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 22:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E16681FA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7X7bfMZeSQ0n for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 22:26:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA4681F95
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AA4681F95
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 22:26:09 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id c3so14121431pjg.1
 for <buildroot@buildroot.org>; Wed, 12 Apr 2023 15:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681338368; x=1683930368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NmRzd6f1jLCDNV+rmE7l71WjXepZEEn9O8MC6D81+lo=;
 b=jwpMA9WyueDgXtrbfuRZtTCk/akxTq+7u7OscezCgihnfSBNnP0m8e/dlkjdMx3dDd
 Ooc78gGuR/V0nzxs+sOHYgE/vNwuiTF73hjCtTI39ROlvKlVT3+kkiGnL6AYw8/m3C/E
 z+k0pCSZEAnvX2YZP1SacFu4Ee52W5oeEr7sAcpuELKLAnv1CTzxI8E5b/vMdfg6vs7F
 qtTzEKRMn2foWZ8IR/zA1b8nmS0nvyEKqt6qg5gTZfoadeyme62KAsaSG8cN5XcG4ImM
 6+aAs7WyRdZF0jpdyJk3bQNnlFX+ygbVYfP2Rsrvc9VsbZoJHj8dC2aHtBNnNZK97IRR
 aB0Q==
X-Gm-Message-State: AAQBX9f/LBdNYqeksJiX39ubFgSlWYHTnULgdXEFDFjgyO3Q1gxXuoWh
 DhuD8BtTx8HNTXOgLZyjBN370Wg2txeijw==
X-Google-Smtp-Source: AKy350YaVXXeZR2BUJuT09IJ+iaAXoOiQeZpCRBNbVb97H4O7C+5yTjW9WSi1wC1Cz66fP4pWX49bA==
X-Received: by 2002:a17:90b:388f:b0:247:8ed:4c12 with SMTP id
 mu15-20020a17090b388f00b0024708ed4c12mr2235197pjb.25.1681338367957; 
 Wed, 12 Apr 2023 15:26:07 -0700 (PDT)
Received: from adam-laptop.hsd1.wa.comcast.net ([2601:603:2180:ebe0::a8d0])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a17090ade9200b00246cf1a8d3dsm58155pjv.17.2023.04.12.15.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:26:07 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Apr 2023 15:26:02 -0700
Message-Id: <20230412222602.1975782-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412222602.1975782-1-aduskett@gmail.com>
References: <20230412222602.1975782-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681338368; x=1683930368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmRzd6f1jLCDNV+rmE7l71WjXepZEEn9O8MC6D81+lo=;
 b=i/wL6eAVE+inJQfWu8oP0BC/j5LjP6ASmQ3ZJwsuP84/K1Ud+N4QxL7jjbBK/2P4YS
 eCLmnGfRTC44OIOOhHVrxshW8X3cVO4gAw/sv+TZN3R2bQI8weEKB1bBD/MG/VM30Kgm
 5S2wUIi8nL5rk9vzvUoKfbLY4xQq+2MkqS/PqmsZN4oX5R1cMx3DWICFDOWB5+mig9+X
 yGNB7lnvwTBBtDUVjSiQulVtanL4d2HvkC6F5H33sEnXZGhmgqTXNOVQyEXGHmGYEIJY
 svMiw3mjQCOepggLgwkWqPd3UpIZwQQsRMuLVqirKU6WWgU9JypxzJI0/hm+ADsp/KAc
 4V7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=i/wL6eAV
Subject: [Buildroot] [PATCH 3/3] package/firewalld: new package
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Firewalld provides a dynamically managed firewall with
support for network or firewall zones to define the trust level of network
connections or interfaces.

Items of note:

 - Setting PYTHON="/usr/bin/env python$(PYTHON3_VERSION_MAJOR)" prevents
   Firewalld from setting the shebang in the installed python files to the
   full path to the python interpreter used when building.

 - The bundled provided SYSV init file has several bashisms and requires
   /etc/init.d/functions which buildroot doesn't provide. So instead, a more
   simple init.d file is provided in the package directory, which does not
   require bash.

 - Firewalld >= 1.0.0 requires a linux kernel version of 5.3 or later.
   Because Buildroot does not have a mechanism to detect what version a user
   is compiling if the kernel is external, there is no way to prevent a user
   with an external kernel older than 5.3 to select this package.

 - To run, Firewalld requires enabling almost every single nftables option in
   the kernel menuconfig. Indeed for a regular user, this task is quite a
   time-consuming operation, and missing even one required nftables option
   results in firewalld failing to start.

   Through a mix of trial and error and talking to the upstream developers,
   the package selects the minimum amount of kernel options required for
   runtime. Understandably the list is daunting. However, these options
   have passed run-time tests with kernel 5.3 (the minimum kernel version
   required) and kernel 6.2.10 (the latest kernel version as of this commit
   log.)

As such, it is safe to say these options will work for anybody wanting to
use firewalld with a supported kernel version of 4.18 or higher.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/Config.in                |   1 +
 package/firewalld/Config.in      |  43 ++++++
 package/firewalld/S46firewalld   |  66 ++++++++
 package/firewalld/firewalld.hash |   3 +
 package/firewalld/firewalld.mk   | 257 +++++++++++++++++++++++++++++++
 5 files changed, 370 insertions(+)
 create mode 100644 package/firewalld/Config.in
 create mode 100644 package/firewalld/S46firewalld
 create mode 100644 package/firewalld/firewalld.hash
 create mode 100644 package/firewalld/firewalld.mk

diff --git a/package/Config.in b/package/Config.in
index 760dda6ac1..78f3fca6ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2311,6 +2311,7 @@ endif
 	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
 	source "package/fcgiwrap/Config.in"
+	source "package/firewalld/Config.in"
 	source "package/flannel/Config.in"
 	source "package/fmc/Config.in"
 	source "package/fping/Config.in"
diff --git a/package/firewalld/Config.in b/package/firewalld/Config.in
new file mode 100644
index 0000000000..2265fe9dd4
--- /dev/null
+++ b/package/firewalld/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_FIREWALLD
+	bool "firewalld"
+	depends on BR2_USE_MMU # gobject-introspection, python-gobject
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # glib2, dbus-python, nftables
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
+	depends on BR2_PACKAGE_PYTHON3 # dbus-python, gobject-introspection
+	select BR2_PACKAGE_DBUS # dbus-python
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_GOBJECT_INTROSPECTION
+	select BR2_PACKAGE_JANSSON # Uses the nftables json interface
+	select BR2_PACKAGE_NFTABLES
+	select BR2_PACKAGE_PYTHON_GOBJECT
+	help
+	  Firewalld provides a dynamically managed firewall with
+	  support for network or firewall zones to define the trust
+	  level of network connections or interfaces. It has support
+	  for IPv4, IPv6 firewall settings and for ethernet bridges and
+	  a separation of runtime and permanent configuration options.
+	  It also provides an interface for services or applications to
+	  add ip*tables and ebtables rules directly.
+
+	  Note: Firewalld uses nftables as the backend as requires
+	  kernel version >= 4.18.
+
+	  https://github.com/firewalld/firewalld
+
+comment "firewalld needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+
+comment "firewalld needs a glibc toolchain w/ wchar, dynamic library, headers >= 3.12, gcc >= 4.9, host gcc >= 8"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_8
diff --git a/package/firewalld/S46firewalld b/package/firewalld/S46firewalld
new file mode 100644
index 0000000000..40f43e1f57
--- /dev/null
+++ b/package/firewalld/S46firewalld
@@ -0,0 +1,66 @@
+#!/bin/sh
+
+DAEMON=firewalld
+PIDFILE=/var/run/$DAEMON.pid
+
+start() {
+	printf "Starting firewalld: "
+	start-stop-daemon -S -q --exec $DAEMON
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+stop() {
+	printf "Stopping firewalld: "
+	start-stop-daemon --stop --quiet --pidfile $PIDFILE
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+reload(){
+	printf "Reloading firewalld: "
+	firewall-cmd --reload
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+}
+
+restart() {
+	stop
+	start
+}
+
+status(){
+	firewall-cmd --state
+}
+
+case "$1" in
+		start)
+			start
+			;;
+		stop)
+			stop
+			;;
+		restart)
+			restart
+			;;
+		reload)
+			reload
+			;;
+		status)
+			status
+			;;
+		*)
+			echo "Usage: $0 {start|stop|restart|reload|status}"
+			exit 1
+esac
diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
new file mode 100644
index 0000000000..462bff5b42
--- /dev/null
+++ b/package/firewalld/firewalld.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  bf26db8937305f1641798f9bf71545fec9c0241c4b2a512a6a93225e0b2cd310  firewalld-1.3.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
new file mode 100644
index 0000000000..efb0686720
--- /dev/null
+++ b/package/firewalld/firewalld.mk
@@ -0,0 +1,257 @@
+################################################################################
+#
+# firewalld
+#
+################################################################################
+
+FIREWALLD_VERSION = 1.3.0
+FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
+FIREWALLD_LICENSE = GPL-2.0
+FIREWALLD_LICENSE_FILES = COPYING
+FIREWALLD_AUTORECONF = YES
+
+FIREWALLD_DEPENDENCIES = \
+	host-intltool \
+	host-libglib2 \
+	host-libxml2 \
+	host-libxslt \
+	dbus-python \
+	gobject-introspection \
+	jansson \
+	nftables \
+	python3 \
+	python-gobject
+
+# Firewalld hard codes the python shebangs to the full path of the
+# python-interpreter. IE: #!/home/buildroot/output/host/bin/python.
+# Force the proper python path.
+FIREWALLD_CONF_ENV += PYTHON="/usr/bin/env python3"
+
+# /etc/sysconfig/firewalld is a Red Hat-ism, only referenced by
+# the Red Hat-specific init script which isn't used, so we set
+# --disable-sysconfig.
+FIREWALLD_CONF_OPTS += \
+	--disable-rpmmacros \
+	--disable-sysconfig \
+	--with-nft=/usr/sbin/nft \
+	--without-ebtables \
+	--without-ebtables-restore \
+	--without-ipset \
+	--without-xml-catalog
+
+ifeq ($(BR2_PACKAGE_IPTABLES),y)
+FIREWALLD_DEPENDENCIES += iptables
+FIREWALLD_CONF_OPTS += \
+	--with-ip6tables-restore=/usr/sbin/ip6tables-restore \
+	--with-ip6tables=/usr/sbin/ip6tables \
+	--with-iptables-restore=/usr/sbin/iptables-restore \
+	--with-iptables=/usr/sbin/iptables
+else
+FIREWALLD_CONF_OPTS += -without-iptables
+endif
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+FIREWALLD_CONF_OPTS += --enable-nls
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FIREWALLD_DEPENDENCIES += systemd
+FIREWALLD_CONF_OPTS += --with-systemd-unitdir=/usr/lib/systemd/system
+else
+FIREWALLD_CONF_OPTS += --disable-systemd
+endif
+
+define FIREWALLD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/config/firewalld.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/firewalld.service
+endef
+
+# The bundled sysvinit file requires /etc/init.d/functions which is not
+# provided by buildroot. As such, we provide our own firewalld init file.
+define FIREWALLD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(FIREWALLD_PKGDIR)/S46firewalld \
+		$(TARGET_DIR)/etc/init.d/S46firewalld
+endef
+
+# Firewalld requires almost every single nftable option selected.
+define FIREWALLD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MANGLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_AH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_EUI64)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_FRAG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_HL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_IPV6HEADER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_MH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_OPTS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_RPFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_RT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MATCH_SRH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_RAW)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_HL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_NPT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_REJECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_TARGET_SYNPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARP_MANGLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARPFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_ARPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MANGLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_AH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_ECN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_RPFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_MATCH_TTL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_RAW)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_CLUSTERIP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_ECN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_NETMAP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REDIRECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_REJECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_SYNPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_TTL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_IP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_IPMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_BITMAP_PORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPMAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPMARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPORTIP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_IPPORTNET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_MAC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETIFACE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETNET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_HASH_NETPORTNET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_SET_LIST_SET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_CONNCOUNT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_NETLINK_GLUE_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_SYNPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_AMANDA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_BROADCAST)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_EVENTS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_FTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_H323)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_IRC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_LABELS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_NETBIOS_NS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_PPTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_PROCFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SANE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SIP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_SNMP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TFTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TIMEOUT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_TIMESTAMP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_ZONES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK_HELPER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK_TIMEOUT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_DCCP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_GRE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_SCTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_PROTO_UDPLITE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DEFRAG_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DEFRAG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_DUP_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_FLOW_TABLE_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_ARP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_COMMON)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_LOG_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_AMANDA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_FTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_H323)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_IRC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_MASQUERADE_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_MASQUERADE_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_NEEDED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PPTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_DCCP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_GRE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_SCTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_PROTO_UDPLITE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_REDIRECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_SIP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_SNMP_BASIC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_NAT_TFTP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_REJECT_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_REJECT_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_SOCKET_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_SOCKET_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_ARP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_SET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TPROXY_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TPROXY_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_BRIDGE_REJECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_NAT_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_NAT_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_ROUTE_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CHAIN_ROUTE_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COMPAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CONNLIMIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_DUP_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FLOW_OFFLOAD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FWD_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_HASH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LIMIT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_LOG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NUMGEN)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_OBJREF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_OSF)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUEUE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_QUOTA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REDIR_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_REJECT_NETDEV)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SOCKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_SYNPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TPROXY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_TUNNEL)
+endef
+
+$(eval $(autotools-package))
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
