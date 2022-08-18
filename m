Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A93C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 10:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0B06116A;
	Thu, 18 Aug 2022 10:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0B06116A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luCC3xW-sogs; Thu, 18 Aug 2022 10:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BBF961142;
	Thu, 18 Aug 2022 10:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBF961142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACC821BF2EC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 10:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87E2F8401D
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 10:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87E2F8401D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKOAbB1gwBCq for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 10:21:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1411483F6B
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.18.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1411483F6B
 for <buildroot@busybox.net>; Thu, 18 Aug 2022 10:21:33 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>) id 1oOcfU-0007vk-NC
 for buildroot@busybox.net; Thu, 18 Aug 2022 12:22:28 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.12; Thu, 18
 Aug 2022 12:21:28 +0200
Received: from go-sys.de (192.168.1.100) by exchange.go-sys.de (192.168.1.17)
 with Microsoft SMTP Server id 15.1.2507.12 via Frontend Transport;
 Thu, 18 Aug 2022 12:21:28 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
Date: Thu, 18 Aug 2022 12:21:15 +0200
Message-ID: <20220818102115.6310-1-mf@go-sys.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-C2ProcessedOrg: 77b28032-c882-4527-ad15-de6c89cb71cd
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH 1/1] package/gdb: add support for gdb 12.x
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
Cc: Michael Fischer <mf@go-sys.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All patch from gdb 11.2 are kept.

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gdb/Config.in      |  1 +
 package/gdb/Config.in.host |  5 +++++
 package/gdb/gdb.hash       |  1 +
 package/gdb/gdb.mk         | 14 ++++++++++++--
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 71fa6f6064..c50c3d517a 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -52,6 +52,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
+	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_12
 	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index a294103ca3..9ee0b3f913 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -57,6 +57,9 @@ config BR2_GDB_VERSION_10
 config BR2_GDB_VERSION_11
 	bool "gdb 11.x"
 
+config BR2_GDB_VERSION_12
+	bool "gdb 12.x"
+
 endchoice
 
 endif
@@ -68,6 +71,7 @@ config BR2_GDB_VERSION
 	default "9.2"      if BR2_GDB_VERSION_9_2
 	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
 	default "11.2"     if BR2_GDB_VERSION_11
+	default "12.1"     if BR2_GDB_VERSION_12
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 
 # recent gdb versions (>= 10) have gdbserver moved at the top-level,
@@ -77,5 +81,6 @@ config BR2_PACKAGE_GDB_TOPLEVEL
 	default y if BR2_arc
 	default y if BR2_GDB_VERSION_10
 	default y if BR2_GDB_VERSION_11
+	default y if BR2_GDB_VERSION_12
 	default y if !BR2_PACKAGE_HOST_GDB
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index cb7f4c805d..3a1027dbb5 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
+sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 86e57481de..1cf11695ba 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -65,12 +65,16 @@ GDB_DEPENDENCIES += host-flex host-bison
 HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
-# When BR2_GDB_VERSION_11=y, we're going to build gdb 11.x for the
+# When BR2_GDB_VERSION_{11,12}=y, we're going to build gdb for the
 # host (if enabled), so we add the necessary gmp dependency.
 ifeq ($(BR2_GDB_VERSION_11),y)
 HOST_GDB_DEPENDENCIES += host-gmp
 endif
 
+ifeq ($(BR2_GDB_VERSION_12),y)
+HOST_GDB_DEPENDENCIES += host-gmp
+endif
+
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
 # so we disable it (additionally the option --disable-install-libbfd
@@ -155,7 +159,7 @@ GDB_CONF_OPTS += \
 	--without-curses
 endif
 
-# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
+# When BR2_GDB_VERSION_{11,12}=y (because it's enabled for the host) and
 # we're building the full gdb for the target, we need gmp as a
 # dependency. For now the default gdb version in Buildroot doesn't
 # require gmp.
@@ -165,6 +169,12 @@ GDB_CONF_OPTS += \
 GDB_DEPENDENCIES += gmp
 endif
 
+ifeq ($(BR2_GDB_VERSION_12)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
+GDB_CONF_OPTS += \
+	--with-libgmp-prefix=$(STAGING_DIR)/usr
+GDB_DEPENDENCIES += gmp
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 GDB_CONF_OPTS += --enable-gdbserver
 GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
