Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818CEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492DD80C21;
	Mon,  6 Dec 2021 18:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oHS13SvIBlT; Mon,  6 Dec 2021 18:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72DB382640;
	Mon,  6 Dec 2021 18:23:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05AC81BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F072840492
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXWqklt8M7Dw for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1796C40124
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A574A81504; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 11:05:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33ad16bea96f3068c27c7282d8aaa7a03c42bc15
X-Git-Newrev: 4d0caefb9c83b106f2bb038926861670df128fff
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.A574A81504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: alphabetically
 order conditional blocks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d0caefb9c83b106f2bb038926861670df128fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional changes, code is just moved around. Ordering is based on
the name of the Buildroot option being tested.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 70 +++++++++++++++---------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 40da992089..a787c25c00 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -35,11 +35,19 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--disable-ifupdown \
 	--without-nm-cloud-setup
 
-ifeq ($(BR2_PACKAGE_OFONO),y)
-NETWORK_MANAGER_DEPENDENCIES += ofono
-NETWORK_MANAGER_CONF_OPTS += --with-ofono
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+NETWORK_MANAGER_DEPENDENCIES += audit
+NETWORK_MANAGER_CONF_OPTS += --with-libaudit
 else
-NETWORK_MANAGER_CONF_OPTS += --without-ofono
+NETWORK_MANAGER_CONF_OPTS += --without-libaudit
+endif
+
+ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
+NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
+endif
+
+ifeq ($(BR2_PACKAGE_DHCPCD),y)
+NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
 ifeq ($(BR2_PACKAGE_IWD),y)
@@ -49,13 +57,6 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-iwd
 endif
 
-ifeq ($(BR2_PACKAGE_AUDIT),y)
-NETWORK_MANAGER_DEPENDENCIES += audit
-NETWORK_MANAGER_CONF_OPTS += --with-libaudit
-else
-NETWORK_MANAGER_CONF_OPTS += --without-libaudit
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
 NETWORK_MANAGER_CONF_OPTS += --enable-concheck
@@ -77,18 +78,18 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-selinux
 endif
 
-ifeq ($(BR2_PACKAGE_READLINE),y)
-NETWORK_MANAGER_DEPENDENCIES += readline
-NETWORK_MANAGER_CONF_OPTS += --with-nmcli
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
+NETWORK_MANAGER_DEPENDENCIES += modem-manager
+NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmcli
+NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
 endif
 
-ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
-NETWORK_MANAGER_DEPENDENCIES += newt
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
+NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+NETWORK_MANAGER_DEPENDENCIES += jansson
 else
-NETWORK_MANAGER_CONF_OPTS += --without-nmtui
+NETWORK_MANAGER_CONF_OPTS += --disable-ovs
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
@@ -98,11 +99,18 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-ppp
 endif
 
-ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
-NETWORK_MANAGER_DEPENDENCIES += modem-manager
-NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
+NETWORK_MANAGER_DEPENDENCIES += newt
+NETWORK_MANAGER_CONF_OPTS += --with-nmtui
 else
-NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
+NETWORK_MANAGER_CONF_OPTS += --without-nmtui
+endif
+
+ifeq ($(BR2_PACKAGE_OFONO),y)
+NETWORK_MANAGER_DEPENDENCIES += ofono
+NETWORK_MANAGER_CONF_OPTS += --with-ofono
+else
+NETWORK_MANAGER_CONF_OPTS += --without-ofono
 endif
 
 ifeq ($(BR2_PACKAGE_POLKIT),y)
@@ -112,19 +120,11 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-polkit
 endif
 
-ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
-endif
-
-ifeq ($(BR2_PACKAGE_DHCPCD),y)
-NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
-endif
-
-ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
-NETWORK_MANAGER_CONF_OPTS += --enable-ovs
-NETWORK_MANAGER_DEPENDENCIES += jansson
+ifeq ($(BR2_PACKAGE_READLINE),y)
+NETWORK_MANAGER_DEPENDENCIES += readline
+NETWORK_MANAGER_CONF_OPTS += --with-nmcli
 else
-NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+NETWORK_MANAGER_CONF_OPTS += --without-nmcli
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
