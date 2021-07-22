Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AFDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40CF60EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E40CF60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4A0423F3;
	Wed,  4 Aug 2021 00:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0WwddsjXs04; Wed,  4 Aug 2021 00:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78C342405;
	Wed,  4 Aug 2021 00:23:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5343B1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5763340EAF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHU0hLV9066o for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3381640EB1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A3C481484; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 23:15:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fbf25acfbfd5a73b3560918bea081768abbe5723
X-Git-Newrev: ed12e2fbed3d4298ebff9da54fe56b91fa75c41e
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.7A3C481484@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvirt: add lxc and
 qemu options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ed12e2fbed3d4298ebff9da54fe56b91fa75c41e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to add lxc and qemu options for libvirt under the daemon
config option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libvirt/Config.in  | 28 ++++++++++++++++++++++++++++
 package/libvirt/libvirt.mk | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index deb1636c9f..1d17fc1621 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -56,4 +56,32 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+# Stateful drivers are useful only when building the daemon.
+if BR2_PACKAGE_LIBVIRT_DAEMON
+
+config BR2_PACKAGE_LIBVIRT_QEMU
+	bool "qemu"
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
+	select BR2_PACKAGE_HWDATA         # libpciaccess
+	select BR2_PACKAGE_HWDATA_PCI_IDS # libpciaccess
+	select BR2_PACKAGE_LIBSECCOMP
+	select BR2_PACKAGE_QEMU
+	select BR2_PACKAGE_QEMU_SYSTEM if BR2_PACKAGE_QEMU_CUSTOM_TARGETS = ""
+	select BR2_PACKAGE_YAJL
+	help
+	  QEMU/KVM support
+
+config BR2_PACKAGE_LIBVIRT_LXC
+	bool "lxc"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # lxc
+	select BR2_PACKAGE_LXC
+	help
+	  Linux Container support
+
+comment "lxc needs a toolchain w/ gcc >= 4.7"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+
+endif
+
 endif
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index a8099c936a..eeedfbdc51 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -24,9 +24,7 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_hyperv=disabled \
 	-Ddriver_interface=enabled \
 	-Ddriver_libxl=disabled \
-	-Ddriver_lxc=disabled \
 	-Ddriver_openvz=disabled \
-	-Ddriver_qemu=disabled \
 	-Ddriver_remote=enabled \
 	-Ddriver_secrets=enabled \
 	-Ddriver_vbox=disabled \
@@ -193,6 +191,19 @@ else
 LIBVIRT_CONF_OPTS += -Dssh2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_LXC),y)
+LIBVIRT_CONF_OPTS += -Dlogin_shell=enabled -Ddriver_lxc=enabled
+LIBVIRT_DEPENDENCIES += lxc
+else
+LIBVIRT_CONF_OPTS += -Dlogin_shell=disabled -Ddriver_lxc=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+LIBVIRT_CONF_OPTS += -Ddriver_qemu=enabled -Dqemu_user=qemu -Dqemu_group=kvm
+else
+LIBVIRT_CONF_OPTS += -Ddriver_qemu=disabled -Dqemu_user=no -Dqemu_group=no
+endif
+
 else # BR2_PACKAGE_LIBVIRT_DAEMON
 
 LIBVIRT_CONF_OPTS += -Dlibvirtd=disabled -Ddriver_network=disabled
@@ -218,13 +229,29 @@ define LIBVIRT_PERMISSIONS
 	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
 	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
 	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
+	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
+	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
+	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
 	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
+	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
+	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
 	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
 	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
 endef
 
 # libvirt may need to create persistent files (e.g. VM definitions) in these
@@ -235,14 +262,22 @@ endef
 define LIBVIRT_CREATE_SYMLINKS
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
+	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
+	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
 endef
 
 LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+define LIBVIRT_USERS
+	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 define LIBVIRT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
