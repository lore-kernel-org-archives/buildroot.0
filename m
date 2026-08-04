Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C0C55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79CF480B5F;
	Tue,  4 Aug 2026 16:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AmCT18tIA_by; Tue,  4 Aug 2026 16:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED9980B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860617;
	bh=DcyRR2vBFQekIMDsGMKmdAwMlKP+4v6xXgcgFSC2vY0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kWyNmEOtC4NE7fEtfyMIHESDYGnGpiq8bKVUMTWrOGsSjHHO7EM3Nb5jdWoEXoMLe
	 zZJPewH3LxhF+WtizQ05nto/KiWzjApvMsAfnlJae0WpihRUYgIENMZBtnij8bK2Tp
	 IlmuqrP4plDvvJSBIXfX/kC4x/vUe0xjxjppMzSnT9tEHubxHoaoOtH3VHKF5N+arv
	 gWwa0y9evrLt1JEQi49dn6q27gMdTwlaW0FJ4VBhoBkOvTVOLttXIpD6mqjVvzjjqq
	 43OOYvD/PAkY9dnCGw43tWCcOQt7GkwRlWQ+ozxBqJhUxHHljMNpzC7+0Wa2djkEnM
	 WnffGmXD2zGdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED9980B9C;
	Tue,  4 Aug 2026 16:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 544833A6
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45E746076B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zeZvFHdF5oC for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A07D6076F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A07D6076F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A9D68BE9A; Tue,  4 Aug 2026 16:22:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 18:22:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54485e075d86a468f213d0ffcd339edc338df1dc
X-Git-Newrev: 8aca1f26c103043e5a542eb5713235e760ef320c
X-Patchwork-Hint: ignore
Message-Id: <20260804162248.3A9D68BE9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mini-snmpd: enable optional .conf
 and ethtool support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8aca1f26c103043e5a542eb5713235e760ef320c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Both libConfuse and ethtool support is relatively new features.  Enable
optional support for them, including an example /etc/mini-snmpd.conf

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mini-snmpd/Config.in       | 17 ++++++++++++++++-
 package/mini-snmpd/mini-snmpd.conf | 36 ++++++++++++++++++++++++++++++++++++
 package/mini-snmpd/mini-snmpd.mk   | 19 +++++++++++++++++++
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/package/mini-snmpd/Config.in b/package/mini-snmpd/Config.in
index 1f61cddbcf..de83944528 100644
--- a/package/mini-snmpd/Config.in
+++ b/package/mini-snmpd/Config.in
@@ -4,4 +4,19 @@ config BR2_PACKAGE_MINI_SNMPD
 	  Mini SNMPd is a minimal implementation targeted at small or
 	  embedded UNIX systems with limited resources
 
-	  http://troglobit.com/mini-snmpd.html
+	  Enable BR2_PACKAGE_LIBCONFUSE for /etc/mini-snmpd.conf support
+	  with an example file.  Also enabling BR2_PACKAGE_ETHTOOL adds
+	  ethtool-based interface statistics.
+
+	  https://troglobit.com/mini-snmpd.html
+
+if BR2_PACKAGE_MINI_SNMPD
+
+config BR2_PACKAGE_MINI_SNMPD_INTERFACES
+	int "Number of network interfaces"
+	default 8
+	range 1 256
+	help
+	  Max number of network interfaces exposed in IF-MIB::ifTable
+
+endif
diff --git a/package/mini-snmpd/mini-snmpd.conf b/package/mini-snmpd/mini-snmpd.conf
new file mode 100644
index 0000000000..4679a8e43d
--- /dev/null
+++ b/package/mini-snmpd/mini-snmpd.conf
@@ -0,0 +1,36 @@
+# Require client authentication (SNMP v2c)
+authentication = true
+community      = "public"
+
+# Descriptive MIB-II system.* values, shown by snmpwalk
+#location      = "Server room, rack 4"
+#contact       = "ops@example.com"
+#description   = "Acme Gateway 3000"
+
+# Vendor OID tree (enterprises.*)
+#vendor        = ".1.3.6.1.4.1"
+
+# MIB poll timeout, seconds
+#timeout       = 1
+
+# Mount points to expose in UCD-SNMP-MIB::dskTable
+#disk-table    = { "/", "/var" }
+
+# Interfaces to expose in IF-MIB::ifTable
+#iface-table   = { "eth0", "eth1" }
+
+# SNMPv2 trap sinks
+#trap-table    = { "192.0.2.1", "[2001:db8::1]:1620" }
+
+# Emulate the respons of another device
+# custom ".1.3.6.1.4.1.11.2.3.9.1.1.7.0" {
+#    value = "MFG:Hewlett-Packard;MDL:HP LaserJet 1020;CLS:PRINTER;"
+#}
+
+# Map ethtool stats to IF-MIB counters:
+#ethtool "eth*" {
+#    rx_bytes   = ifInOctets
+#    rx_packets = ifInUcastPkts
+#    tx_bytes   = ifOutOctets
+#    tx_packets = ifOutUcastPkts
+#}
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index 99bef47477..9873ad2dee 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -11,6 +11,25 @@ MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_CPE_ID_VENDOR = minisnmpd_project
 MINI_SNMPD_CPE_ID_PRODUCT = minisnmpd
 MINI_SNMPD_DEPENDENCIES = host-pkgconf
+MINI_SNMPD_CONF_OPTS = --with-interfaces=$(BR2_PACKAGE_MINI_SNMPD_INTERFACES)
+
+ifeq ($(BR2_PACKAGE_LIBCONFUSE),y)
+MINI_SNMPD_DEPENDENCIES += libconfuse
+MINI_SNMPD_CONF_OPTS += --with-config
+# ethtool interface stats live in linux_ethtool.c, only built with libConfuse
+ifeq ($(BR2_PACKAGE_ETHTOOL),y)
+MINI_SNMPD_CONF_OPTS += --enable-ethtool
+else
+MINI_SNMPD_CONF_OPTS += --disable-ethtool
+endif
+define MINI_SNMPD_INSTALL_CONFIG
+	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd.conf \
+		$(TARGET_DIR)/etc/mini-snmpd.conf
+endef
+MINI_SNMPD_POST_INSTALL_TARGET_HOOKS += MINI_SNMPD_INSTALL_CONFIG
+else
+MINI_SNMPD_CONF_OPTS += --without-config
+endif
 
 define MINI_SNMPD_INSTALL_ETC_DEFAULT
 	$(INSTALL) -D -m 644 package/mini-snmpd/mini-snmpd \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
