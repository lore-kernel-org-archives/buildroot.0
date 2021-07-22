Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E258C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB49760F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB49760F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9111400C7;
	Wed,  4 Aug 2021 00:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GSlo8Sl3Atj; Wed,  4 Aug 2021 00:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 585CC4051F;
	Wed,  4 Aug 2021 00:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 507651BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AB524148A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eCCjbgNkYLm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0940F40EAD
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6074B878D7; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 23:14:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6d4c9437c6351368ba33ee38b8334b8338e90413
X-Git-Newrev: ccfc90e1010e42e6529afae3a5ea8bf7226dabc1
X-Patchwork-Hint: ignore
Message-Id: <20210803211014.6074B878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libvirt: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccfc90e1010e42e6529afae3a5ea8bf7226dabc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Libvirt is collection of software that provides a convenient way to
manage virtual machines and other virtualization functionality, such as
storage and network interface management. These software pieces include
an API library, a daemon (libvirtd), and a command line utility (virsh).

   http://libvirt.org/

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
[Arnout:
 - Re-introduce BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
 - Put all Config.in comments on one line
 - Put the comment before the option itself (makes sure sub-option
   indention is good)
 - Remove spurious BR2_PACKAGE_NETCAT dependency
 - Alphabetically order dependencies in Config.in
 - Add select of libglib2
 - Alphabetically order CONF_OPTS
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                   |   3 +
 package/Config.in            |   1 +
 package/libvirt/90-kvm.rules |   1 +
 package/libvirt/Config.in    |  39 ++++++++
 package/libvirt/libvirt.hash |   3 +
 package/libvirt/libvirt.mk   | 213 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 260 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 04ef3cc1a9..72d76b1f44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1268,6 +1268,9 @@ F:	package/sysrepo/
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
 
+N:	Jared Bents <jared.bents@rockwellcollins.com>
+F:	package/libvirt/
+
 N:	Jarkko Sakkinen <jarkko.sakkinen@intel.com>
 F:	package/quota/
 
diff --git a/package/Config.in b/package/Config.in
index d49aff3de4..1a3b91304c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2474,6 +2474,7 @@ menu "System tools"
 	source "package/kmod/Config.in"
 	source "package/kvmtool/Config.in"
 	source "package/libostree/Config.in"
+	source "package/libvirt/Config.in"
 	source "package/lxc/Config.in"
 	source "package/makedumpfile/Config.in"
 	source "package/mender/Config.in"
diff --git a/package/libvirt/90-kvm.rules b/package/libvirt/90-kvm.rules
new file mode 100644
index 0000000000..5145c27e79
--- /dev/null
+++ b/package/libvirt/90-kvm.rules
@@ -0,0 +1 @@
+KERNEL=="kvm", OWNER="root", GROUP="kvm", MODE="0660"
diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
new file mode 100644
index 0000000000..6175cc489c
--- /dev/null
+++ b/package/libvirt/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_USE_MMU # fork()
+
+comment "libvirt needs udev /dev management, a toolchain w/ threads, dynamic library, kernel headers >= 3.12"
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || !BR2_USE_MMU || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+
+config BR2_PACKAGE_LIBVIRT
+	bool "libvirt"
+	depends on BR2_PACKAGE_LIBVIRT_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+	# configure: You must install the pciaccess module to build with udev
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_ZLIB
+	# run-time dependencies
+	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_INIT_SYSTEMD
+	help
+	  Libvirt is collection of software that provides a convenient
+	  way to manage virtual machines and other virtualization
+	  functionality, such as storage and network interface
+	  management. These software pieces include an API library, a
+	  daemon (libvirtd), and a command line utility (virsh).
+
+	  https://libvirt.org/
+
diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
new file mode 100644
index 0000000000..ec96dfc62c
--- /dev/null
+++ b/package/libvirt/libvirt.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 b366d73dee6ce77a226bedef592e0620ceb8e22e5998f60768017f79fc4ead26  libvirt-7.4.0.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
new file mode 100644
index 0000000000..80b9529404
--- /dev/null
+++ b/package/libvirt/libvirt.mk
@@ -0,0 +1,213 @@
+################################################################################
+#
+# libvirt
+#
+################################################################################
+
+LIBVIRT_VERSION = 7.4.0
+LIBVIRT_SITE = https://libvirt.org/sources
+LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
+LIBVIRT_LICENSE = LGPL-2.1+
+LIBVIRT_LICENSE_FILES = COPYING
+LIBVIRT_DEPENDENCIES = host-nfs-utils host-pkgconf host-python-docutils \
+	gnutls libglib2 libpciaccess libtirpc libxml2 udev zlib
+
+LIBVIRT_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
+
+LIBVIRT_CONF_OPTS = \
+	-Drpath=disabled \
+	-Dapparmor=disabled \
+	-Ddriver_bhyve=disabled \
+	-Ddriver_esx=disabled \
+	-Ddriver_hyperv=disabled \
+	-Ddriver_interface=enabled \
+	-Ddriver_libxl=disabled \
+	-Ddriver_lxc=disabled \
+	-Ddriver_network=disabled \
+	-Ddriver_openvz=disabled \
+	-Ddriver_qemu=disabled \
+	-Ddriver_remote=enabled \
+	-Ddriver_secrets=enabled \
+	-Ddriver_vbox=disabled \
+	-Ddriver_vmware=disabled \
+	-Ddriver_vz=disabled \
+	-Ddtrace=disabled \
+	-Dfirewalld=disabled \
+	-Dfirewalld_zone=disabled \
+	-Dglusterfs=disabled \
+	-Dhost_validate=enabled \
+	-Dinit_script=$(if $(BR2_INIT_SYSTEMD),systemd,none) \
+	-Dlibssh=disabled \
+	-Dlibvirtd=disabled \
+	-Dlogin_shell=disabled \
+	-Dnetcf=disabled \
+	-Dnss=disabled \
+	-Dnumad=disabled \
+	-Dopenwsman=disabled \
+	-Dpciaccess=enabled \
+	-Dpm_utils=disabled \
+	-Dsanlock=disabled \
+	-Dsasl=disabled \
+	-Dsecdriver_apparmor=disabled \
+	-Dssh2=disabled \
+	-Dstorage_iscsi=disabled \
+	-Dstorage_iscsi_direct=disabled \
+	-Dstorage_mpath=disabled \
+	-Dsysctl_config=enabled \
+	-Dtest_coverage=false \
+	-Dudev=enabled \
+	-Dwireshark_dissector=disabled
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+LIBVIRT_CONF_OPTS += -Dattr=enabled
+LIBVIRT_DEPENDENCIES += attr
+else
+LIBVIRT_CONF_OPTS += -Dattr=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+LIBVIRT_CONF_OPTS += -Daudit=enabled
+LIBVIRT_DEPENDENCIES += audit
+else
+LIBVIRT_CONF_OPTS += -Daudit=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBVIRT_CONF_OPTS += -Dbash_completion=enabled
+LIBVIRT_DEPENDENCIES += bash-completion
+else
+LIBVIRT_CONF_OPTS += -Dbash_completion=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+LIBVIRT_CONF_OPTS += -Dblkid=enabled
+LIBVIRT_DEPENDENCIES += util-linux
+else
+LIBVIRT_CONF_OPTS += -Dblkid=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
+LIBVIRT_CONF_OPTS += -Dcapng=enabled
+LIBVIRT_DEPENDENCIES += libcap-ng
+else
+LIBVIRT_CONF_OPTS += -Dcapng=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBVIRT_CONF_OPTS += -Dcurl=enabled
+LIBVIRT_DEPENDENCIES += libcurl
+else
+LIBVIRT_CONF_OPTS += -Dcurl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+LIBVIRT_CONF_OPTS += -Dfuse=enabled
+LIBVIRT_DEPENDENCIES += libfuse
+else
+LIBVIRT_CONF_OPTS += -Dfuse=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBISCSI),y)
+LIBVIRT_CONF_OPTS += -Dlibiscsi=enabled
+LIBVIRT_DEPENDENCIES += libiscsi
+else
+LIBVIRT_CONF_OPTS += -Dlibiscsi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+LIBVIRT_CONF_OPTS += -Dlibpcap=enabled
+LIBVIRT_DEPENDENCIES += libpcap
+else
+LIBVIRT_CONF_OPTS += -Dlibpcap=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+LIBVIRT_CONF_OPTS += -Dnumactl=enabled
+LIBVIRT_DEPENDENCIES += numactl
+else
+LIBVIRT_CONF_OPTS += -Dnumactl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+LIBVIRT_CONF_OPTS += -Dpolkit=enabled
+LIBVIRT_DEPENDENCIES += polkit
+else
+LIBVIRT_CONF_OPTS += -Dpolkit=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+LIBVIRT_CONF_OPTS += -Dreadline=enabled
+LIBVIRT_DEPENDENCIES += readline
+else
+LIBVIRT_CONF_OPTS += -Dreadline=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LIBVIRT_CONF_OPTS += -Dselinux=enabled -Dsecdriver_selinux=enabled \
+	-Dselinux_mount=/sys/fs/selinux
+LIBVIRT_DEPENDENCIES += libselinux
+else
+LIBVIRT_CONF_OPTS += -Dselinux=disabled -Dsecdriver_selinux=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LVM2),y)
+LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
+LIBVIRT_DEPENDENCIES += lvm2
+else
+LIBVIRT_CONF_OPTS += -Dstorage_lvm=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_YAJL),y)
+LIBVIRT_CONF_OPTS += -Dyajl=enabled
+LIBVIRT_DEPENDENCIES += yajl
+else
+LIBVIRT_CONF_OPTS += -Dyajl=disabled
+endif
+
+define LIBVIRT_INSTALL_UDEV_RULES
+	$(INSTALL) -D -m 644 package/libvirt/90-kvm.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/90-kvm.rules
+endef
+LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
+
+# Adjust directory ownerships and permissions. Notice /var/log is a symlink to
+# /tmp in the default sysvinit skeleton, so some directories may disappear at
+# run-time. Set the permissions anyway, since they are valid for the default
+# systemd skeleton.
+define LIBVIRT_PERMISSIONS
+	/etc/libvirt                             d  700  root  root  -  -  -  -  -
+	/etc/libvirt/nwfilter                    d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt                         d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/boot                    d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/dnsmasq                 d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
+	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
+	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
+	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
+	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
+endef
+
+# libvirt may need to create persistent files (e.g. VM definitions) in these
+# directories. Move them to /var/lib because /etc may be on a read-only or
+# volatile (initramfs) filesystem. We could tweak the code to change these
+# paths but the patch would be large and would break compatibility with
+# ordinary installations and with the documentation.
+define LIBVIRT_CREATE_SYMLINKS
+	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
+	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
+	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
+	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
+	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
+endef
+
+LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
