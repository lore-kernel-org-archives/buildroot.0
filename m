From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:46 +0200
Subject: [Buildroot] [PATCH 13/17] packages: add new flag for CPE ID
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-14-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the packages having cpeid fixup has CPE ID that has been
validated, so add the flag _CPE_ID_VALID.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 boot/grub2/grub2.mk                                      | 1 +
 boot/uboot/uboot.mk                                      | 1 +
 linux/linux.mk                                           | 1 +
 package/audit/audit.mk                                   | 1 +
 package/aufs/aufs.mk                                     | 1 +
 package/bash/bash.mk                                     | 1 +
 package/bc/bc.mk                                         | 1 +
 package/bind/bind.mk                                     | 1 +
 package/boost/boost.mk                                   | 1 +
 package/bridge-utils/bridge-utils.mk                     | 1 +
 package/busybox/busybox.mk                               | 1 +
 package/bzip2/bzip2.mk                                   | 1 +
 package/collectd/collectd.mk                             | 1 +
 package/conntrack-tools/conntrack-tools.mk               | 1 +
 package/coreutils/coreutils.mk                           | 1 +
 package/crda/crda.mk                                     | 1 +
 package/davici/davici.mk                                 | 1 +
 package/dbus-glib/dbus-glib.mk                           | 1 +
 package/dbus/dbus.mk                                     | 1 +
 package/dhcp/dhcp.mk                                     | 1 +
 package/dnsmasq/dnsmasq.mk                               | 1 +
 package/dropbear/dropbear.mk                             | 1 +
 package/ethtool/ethtool.mk                               | 1 +
 package/expat/expat.mk                                   | 1 +
 package/gdb/gdb.mk                                       | 1 +
 package/gesftpserver/gesftpserver.mk                     | 1 +
 package/glibc/glibc.mk                                   | 1 +
 package/gmp/gmp.mk                                       | 1 +
 package/gnupg/gnupg.mk                                   | 1 +
 package/gnutls/gnutls.mk                                 | 1 +
 package/grep/grep.mk                                     | 1 +
 package/gtest/gtest.mk                                   | 1 +
 package/gzip/gzip.mk                                     | 1 +
 package/hostapd/hostapd.mk                               | 1 +
 package/ifupdown/ifupdown.mk                             | 1 +
 package/iperf/iperf.mk                                   | 1 +
 package/iperf3/iperf3.mk                                 | 1 +
 package/ipset/ipset.mk                                   | 1 +
 package/iptables/iptables.mk                             | 1 +
 package/iw/iw.mk                                         | 1 +
 package/kmod/kmod.mk                                     | 1 +
 package/libarchive/libarchive.mk                         | 1 +
 package/libcurl/libcurl.mk                               | 1 +
 package/libestr/libestr.mk                               | 1 +
 package/libfastjson/libfastjson.mk                       | 1 +
 package/libfcgi/libfcgi.mk                               | 1 +
 package/libffi/libffi.mk                                 | 1 +
 package/libgcrypt/libgcrypt.mk                           | 1 +
 package/libglib2/libglib2.mk                             | 1 +
 package/libgpg-error/libgpg-error.mk                     | 1 +
 package/liblogging/liblogging.mk                         | 1 +
 package/libmbim/libmbim.mk                               | 1 +
 package/libmnl/libmnl.mk                                 | 1 +
 package/libnetfilter_conntrack/libnetfilter_conntrack.mk | 1 +
 package/libnetfilter_cthelper/libnetfilter_cthelper.mk   | 1 +
 package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk | 1 +
 package/libnetfilter_queue/libnetfilter_queue.mk         | 1 +
 package/libnfnetlink/libnfnetlink.mk                     | 1 +
 package/libopenssl/libopenssl.mk                         | 1 +
 package/libpcap/libpcap.mk                               | 1 +
 package/libselinux/libselinux.mk                         | 1 +
 package/libsemanage/libsemanage.mk                       | 1 +
 package/libsepol/libsepol.mk                             | 1 +
 package/libssh2/libssh2.mk                               | 1 +
 package/libsysfs/libsysfs.mk                             | 1 +
 package/libtasn1/libtasn1.mk                             | 1 +
 package/libunistring/libunistring.mk                     | 1 +
 package/libxml2/libxml2.mk                               | 1 +
 package/libxslt/libxslt.mk                               | 1 +
 package/libzlib/libzlib.mk                               | 1 +
 package/lighttpd/lighttpd.mk                             | 1 +
 package/linux-firmware/linux-firmware.mk                 | 1 +
 package/linux-headers/linux-headers.mk                   | 1 +
 package/linux-pam/linux-pam.mk                           | 1 +
 package/llvm/llvm.mk                                     | 1 +
 package/lxc/lxc.mk                                       | 1 +
 package/lz4/lz4.mk                                       | 1 +
 package/memtester/memtester.mk                           | 1 +
 package/mii-diag/mii-diag.mk                             | 1 +
 package/mpfr/mpfr.mk                                     | 1 +
 package/mrouted/mrouted.mk                               | 1 +
 package/mtd/mtd.mk                                       | 1 +
 package/ncurses/ncurses.mk                               | 1 +
 package/netsnmp/netsnmp.mk                               | 1 +
 package/nfs-utils/nfs-utils.mk                           | 1 +
 package/openssh/openssh.mk                               | 1 +
 package/pax-utils/pax-utils.mk                           | 1 +
 package/paxtest/paxtest.mk                               | 1 +
 package/pcre/pcre.mk                                     | 1 +
 package/pixman/pixman.mk                                 | 1 +
 package/policycoreutils/policycoreutils.mk               | 1 +
 package/pppd/pppd.mk                                     | 1 +
 package/proftpd/proftpd.mk                               | 2 ++
 package/protobuf/protobuf.mk                             | 1 +
 package/pure-ftpd/pure-ftpd.mk                           | 1 +
 package/python-lxml/python-lxml.mk                       | 1 +
 package/python-setuptools/python-setuptools.mk           | 1 +
 package/python/python.mk                                 | 1 +
 package/qemu/qemu.mk                                     | 1 +
 package/rapidjson/rapidjson.mk                           | 1 +
 package/readline/readline.mk                             | 1 +
 package/refpolicy/refpolicy.mk                           | 1 +
 package/rsyslog/rsyslog.mk                               | 1 +
 package/rt-tests/rt-tests.mk                             | 1 +
 package/sed/sed.mk                                       | 1 +
 package/setools/setools.mk                               | 1 +
 package/smcroute/smcroute.mk                             | 1 +
 package/spawn-fcgi/spawn-fcgi.mk                         | 1 +
 package/sqlite/sqlite.mk                                 | 1 +
 package/strongswan/strongswan.mk                         | 1 +
 package/tar/tar.mk                                       | 1 +
 package/tcl/tcl.mk                                       | 1 +
 package/tcpdump/tcpdump.mk                               | 1 +
 package/tftpd/tftpd.mk                                   | 1 +
 package/uboot-tools/uboot-tools.mk                       | 1 +
 package/util-linux/util-linux.mk                         | 1 +
 package/valgrind/valgrind.mk                             | 1 +
 package/vim/vim.mk                                       | 1 +
 package/wget/wget.mk                                     | 1 +
 package/wireless-regdb/wireless-regdb.mk                 | 1 +
 package/wireless_tools/wireless_tools.mk                 | 1 +
 package/wpa_supplicant/wpa_supplicant.mk                 | 1 +
 package/xerces/xerces.mk                                 | 1 +
 package/xz/xz.mk                                         | 1 +
 124 files changed, 125 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 9686815f4d..266bc9ad4e 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -37,6 +37,7 @@ GRUB2_INSTALL_TARGET = YES
 else
 GRUB2_INSTALL_TARGET = NO
 endif
+GRUB2_CPE_ID_VALID = y
 GRUB2_CPE_ID_VENDOR = gnu
 
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1de0b7b16a..c193469a75 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -11,6 +11,7 @@ UBOOT_LICENSE = GPL-2.0+
 ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
 UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 endif
+UBOOT_CPE_ID_VALID = y
 UBOOT_CPE_ID_VENDOR = denx
 UBOOT_CPE_ID_NAME = u-boot
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 648f6ea2a5..27dc49f3a2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -12,6 +12,7 @@ LINUX_LICENSE_FILES = \
 	LICENSES/preferred/GPL-2.0 \
 	LICENSES/exceptions/Linux-syscall-note
 endif
+LINUX_CPE_ID_VALID = y
 LINUX_CPE_ID_VENDOR = $(LINUX_NAME)
 LINUX_CPE_ID_NAME = $(LINUX_NAME)_kernel
 
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index a20767d24b..d0ff6b1b78 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -10,6 +10,7 @@ AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
 # 0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
 AUDIT_AUTORECONF = YES
+AUDIT_CPE_ID_VALID = y
 AUDIT_CPE_ID_VENDOR = linux_audit_project
 AUDIT_CPE_ID_NAME = linux_audit
 
diff --git a/package/aufs/aufs.mk b/package/aufs/aufs.mk
index 495e94e606..ec5d1aa78f 100644
--- a/package/aufs/aufs.mk
+++ b/package/aufs/aufs.mk
@@ -7,6 +7,7 @@
 AUFS_VERSION = $(call qstrip,$(BR2_PACKAGE_AUFS_VERSION))
 AUFS_LICENSE = GPL-2.0
 AUFS_LICENSE_FILES = COPYING
+AUFS_CPE_ID_VALID = y
 AUFS_CPE_ID_VERSION = 4.1
 
 ifeq ($(BR2_PACKAGE_AUFS_SERIES),3)
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index b4681c1085..938462040a 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -10,6 +10,7 @@ BASH_DEPENDENCIES = ncurses readline host-bison
 BASH_CONF_OPTS = --with-installed-readline --without-bash-malloc
 BASH_LICENSE = GPL-3.0+
 BASH_LICENSE_FILES = COPYING
+BASH_CPE_ID_VALID = y
 BASH_CPE_ID_VENDOR = gnu
 
 BASH_CONF_ENV += \
diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 06b6feae4f..be3b9665b2 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -9,6 +9,7 @@ BC_SITE = http://ftp.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
+BC_CPE_ID_VALID = y
 BC_CPE_ID_VENDOR = gnu
 BC_CONF_ENV = MAKEINFO=true
 
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 41b3146da1..abe6cb4d93 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -12,6 +12,7 @@ BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
+BIND_CPE_ID_VALID = y
 BIND_CPE_ID_VENDOR = isc
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
 BIND_TARGET_SERVER_SBIN += dnssec-importkey dnssec-keygen dnssec-revoke
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index d5c404a13c..27f404cda2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -10,6 +10,7 @@ BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
+BOOST_CPE_ID_VALID = y
 BOOST_CPE_ID_VENDOR = $(BOOST_NAME)
 
 # CVE-2009-3654 is misclassified (by our CVE tracker) as affecting to boost,
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index fa71c3a64e..1d022af2a4 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -10,6 +10,7 @@ BRIDGE_UTILS_SITE = \
 BRIDGE_UTILS_AUTORECONF = YES
 BRIDGE_UTILS_LICENSE = GPL-2.0+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
+BRIDGE_UTILS_CPE_ID_VALID = y
 BRIDGE_UTILS_CPE_ID_VENDOR = kernel
 
 # Avoid using the host's headers. Location is not important as
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a88168416f..184753b7c5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -9,6 +9,7 @@ BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
 BUSYBOX_LICENSE_FILES = LICENSE
+BUSYBOX_CPE_ID_VALID = y
 BUSYBOX_CPE_ID_VENDOR = $(BUSYBOX_NAME)
 
 define BUSYBOX_HELP_CMDS
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index c2e5f7610e..4033c2bf6d 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -9,6 +9,7 @@ BZIP2_SITE = https://sourceware.org/pub/bzip2
 BZIP2_INSTALL_STAGING = YES
 BZIP2_LICENSE = bzip2 license
 BZIP2_LICENSE_FILES = LICENSE
+BZIP2_CPE_ID_VALID = y
 BZIP2_CPE_ID_VENDOR = bzip
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 83bf01109a..4339ec418e 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -12,6 +12,7 @@ COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
+COLLECTD_CPE_ID_VALID = y
 COLLECTD_CPE_ID_VENDOR = $(COLLECTD_NAME)
 
 # These require unmet dependencies, are fringe, pointless or deprecated
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 55ea407924..7adbd6aaa0 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -12,6 +12,7 @@ CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_queue host-bison host-flex
 CONNTRACK_TOOLS_LICENSE = GPL-2.0+
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
+CONNTRACK_TOOLS_CPE_ID_VALID = y
 CONNTRACK_TOOLS_CPE_ID_VENDOR = netfilter
 
 CONNTRACK_TOOLS_CFLAGS = $(TARGET_CFLAGS)
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 18e9052dfd..7257ffc89a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -9,6 +9,7 @@ COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
+COREUTILS_CPE_ID_VALID = y
 COREUTILS_CPE_ID_VENDOR = gnu
 
 COREUTILS_CONF_OPTS = --disable-rpath \
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 31a64d004b..20f9925a10 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -9,6 +9,7 @@ CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snap
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
+CRDA_CPE_ID_VALID = y
 CRDA_CPE_ID_VENDOR = kernel
 
 define CRDA_BUILD_CMDS
diff --git a/package/davici/davici.mk b/package/davici/davici.mk
index 6c8df48b6a..1aaa5cdb66 100644
--- a/package/davici/davici.mk
+++ b/package/davici/davici.mk
@@ -8,6 +8,7 @@ DAVICI_VERSION = 1.3
 DAVICI_SITE = $(call github,strongswan,davici,v$(DAVICI_VERSION))
 DAVICI_LICENSE = LGPL-2.1+
 DAVICI_LICENSE_FILES = COPYING
+DAVICI_CPE_ID_VALID = y
 DAVICI_CPE_ID_VENDOR = strongswan
 DAVICI_DEPENDENCIES = strongswan
 DAVICI_INSTALL_STAGING = YES
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5eb158d954..c60256d5e7 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -9,6 +9,7 @@ DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
 DBUS_GLIB_LICENSE_FILES = COPYING
+DBUS_GLIB_CPE_ID_VALID = y
 DBUS_GLIB_CPE_ID_VENDOR = freedesktop
 
 DBUS_GLIB_CONF_ENV = \
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ae480f3bb2..7ff023b7ab 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -8,6 +8,7 @@ DBUS_VERSION = 1.12.18
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
+DBUS_CPE_ID_VALID = y
 DBUS_CPE_ID_VENDOR = d-bus_project
 DBUS_CPE_ID_NAME = d-bus
 DBUS_INSTALL_STAGING = YES
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 988c7792dc..85e0676677 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -10,6 +10,7 @@ DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
 DHCP_LICENSE_FILES = LICENSE
 DHCP_DEPENDENCIES = bind
+DHCP_CPE_ID_VALID = y
 DHCP_CPE_ID_VENDOR = isc
 
 # use libtool-enabled configure.ac
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index e0e8bed5aa..679a7f8b91 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -14,6 +14,7 @@ DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)" \
 DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
+DNSMASQ_CPE_ID_VALID = y
 DNSMASQ_CPE_ID_VENDOR = thekelleys
 
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d965b2eaf2..e8fb240ad0 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -11,6 +11,7 @@ DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
 DROPBEAR_LICENSE_FILES = LICENSE
 DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
 DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
+DROPBEAR_CPE_ID_VALID = y
 DROPBEAR_CPE_ID_VENDOR = $(DROPBEAR_NAME)_ssh_project
 DROPBEAR_CPE_ID_NAME = $(DROPBEAR_NAME)_ssh
 
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 0e94a918c2..87730eda9f 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -9,6 +9,7 @@ ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = LICENSE COPYING
+ETHTOOL_CPE_ID_VALID = y
 ETHTOOL_CPE_ID_VENDOR = kernel
 ETHTOOL_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_ETHTOOL_PRETTY_PRINT),--enable-pretty-dump,--disable-pretty-dump)
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index af3088b80c..3a1da2c7b6 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -12,6 +12,7 @@ EXPAT_DEPENDENCIES = host-pkgconf
 HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
+EXPAT_CPE_ID_VALID = y
 EXPAT_CPE_ID_VENDOR = libexpat
 
 EXPAT_CONF_OPTS = --without-docbook
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index de11b1e5e8..b3900e2587 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -22,6 +22,7 @@ endif
 
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
+GDB_CPE_ID_VALID = y
 GDB_CPE_ID_VENDOR = gnu
 
 # We only want gdbserver and not the entire debugger.
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 07718a4c42..9a660c313a 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -12,6 +12,7 @@ GESFTPSERVER_LICENSE_FILES = COPYING
 
 # "Missing prototype" warning treated as error
 GESFTPSERVER_CONF_OPTS = --disable-warnings-as-errors
+GESFTPSERVER_CPE_ID_VALID = y
 GESFTPSERVER_CPE_ID_VENDOR = green_end
 GESFTPSERVER_CPE_ID_NAME = sftpserver
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 032e642bb8..90cbd38d44 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -31,6 +31,7 @@ endif
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
+GLIBC_CPE_ID_VALID = y
 GLIBC_CPE_ID_VENDOR = gnu
 
 # glibc is part of the toolchain so disable the toolchain dependency
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index a79d5b7d9a..b2db9be2ea 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -10,6 +10,7 @@ GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPL-3.0+ or GPL-2.0+
 GMP_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
+GMP_CPE_ID_VALID = y
 GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index ba424fed96..4ba9e6d691 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -10,6 +10,7 @@ GNUPG_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+GNUPG_CPE_ID_VALID = y
 GNUPG_CPE_ID_VENDOR = $(GNUPG_NAME)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = \
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 65bb4893e8..cab3897ffe 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -17,6 +17,7 @@ GNUTLS_LICENSE_FILES += doc/COPYING
 endif
 
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
+GNUTLS_CPE_ID_VALID = y
 GNUTLS_CPE_ID_VENDOR = gnu
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 204c74f3b8..f3d2b35fa3 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,6 +9,7 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
+GREP_CPE_ID_VALID = y
 GREP_CPE_ID_VENDOR = gnu
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # install into /bin like busybox grep
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index fc51d9f7a2..f103854bc9 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -10,6 +10,7 @@ GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3-Clause
 GTEST_LICENSE_FILES = googletest/LICENSE
+GTEST_CPE_ID_VALID = y
 GTEST_CPE_ID_VENDOR = google
 GTEST_CPE_ID_NAME = google_test
 
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index c8fd3ddb7a..4fcab5817c 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -11,6 +11,7 @@ GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 GZIP_CONF_OPTS = --exec-prefix=/
 GZIP_LICENSE = GPL-3.0+
 GZIP_LICENSE_FILES = COPYING
+GZIP_CPE_ID_VALID = y
 GZIP_CPE_ID_VENDOR = gnu
 GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 HOST_GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index efeefd8b35..980757c4c2 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -23,6 +23,7 @@ HOSTAPD_IGNORE_CVES += CVE-2019-16275
 # 0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 HOSTAPD_IGNORE_CVES += CVE-2020-12695
 
+HOSTAPD_CPE_ID_VALID = y
 HOSTAPD_CPE_ID_VENDOR = w1.fi
 HOSTAPD_CONFIG_SET =
 
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index e62c2a79c5..f92950f3ee 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -9,6 +9,7 @@ IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
 IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160922T165503Z/pool/main/i/ifupdown
 IFUPDOWN_LICENSE = GPL-2.0+
 IFUPDOWN_LICENSE_FILES = COPYING
+IFUPDOWN_CPE_ID_VALID = y
 IFUPDOWN_CPE_ID_VENDOR = debian
 
 define IFUPDOWN_BUILD_CMDS
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index f1e65e7545..0080c04e09 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -8,6 +8,7 @@ IPERF_VERSION = 2.0.13
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
+IPERF_CPE_ID_VALID = y
 IPERF_CPE_ID_VENDOR = $(IPERF_NAME)2_project
 IPERF_CPE_ID_NAME = $(IPERF_NAME)2
 
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 234e04eae0..18a0c55860 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -9,6 +9,7 @@ IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
 IPERF3_LICENSE_FILES = LICENSE
+IPERF3_CPE_ID_VALID = y
 IPERF3_CPE_ID_VENDOR = es
 
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index cea3ee0e05..108fb29986 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -11,6 +11,7 @@ IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPTS = --with-kmod=no
 IPSET_LICENSE = GPL-2.0
 IPSET_LICENSE_FILES = COPYING
+IPSET_CPE_ID_VALID = y
 IPSET_CPE_ID_VENDOR = netfilter
 IPSET_INSTALL_STAGING = YES
 
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 053d0e3964..7d18c0bc52 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -12,6 +12,7 @@ IPTABLES_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 IPTABLES_LICENSE = GPL-2.0
 IPTABLES_LICENSE_FILES = COPYING
+IPTABLES_CPE_ID_VALID = y
 IPTABLES_CPE_ID_VENDOR = netfilter
 # Building static causes ugly warnings on some plugins
 IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index a232cc8baa..d72eafa09e 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -9,6 +9,7 @@ IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
 IW_LICENSE_FILES = COPYING
+IW_CPE_ID_VALID = y
 IW_CPE_ID_VENDOR = kernel
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_MAKE_ENV = \
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index c44764ea18..8f11adfd2b 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -15,6 +15,7 @@ HOST_KMOD_DEPENDENCIES = host-pkgconf
 KMOD_LICENSE = LGPL-2.1+ (library)
 KMOD_LICENSE_FILES = libkmod/COPYING
 
+KMOD_CPE_ID_VALID = y
 KMOD_CPE_ID_VENDOR = kernel
 
 # --gc-sections triggers binutils ld segfault
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 71c8a2e4cf..2a057acd8c 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,6 +9,7 @@ LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
+LIBARCHIVE_CPE_ID_VALID = y
 LIBARCHIVE_CPE_ID_VENDOR = $(LIBARCHIVE_NAME)
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 969325a485..5ac444cf20 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -12,6 +12,7 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_RTMPDUMP),rtmpdump)
 LIBCURL_LICENSE = curl
 LIBCURL_LICENSE_FILES = COPYING
+LIBCURL_CPE_ID_VALID = y
 LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_CPE_ID_NAME = libcurl
 LIBCURL_INSTALL_STAGING = YES
diff --git a/package/libestr/libestr.mk b/package/libestr/libestr.mk
index 6ce22efae2..da612cb853 100644
--- a/package/libestr/libestr.mk
+++ b/package/libestr/libestr.mk
@@ -8,6 +8,7 @@ LIBESTR_VERSION = 0.1.11
 LIBESTR_SITE = http://libestr.adiscon.com/files/download
 LIBESTR_LICENSE = LGPL-2.1+
 LIBESTR_LICENSE_FILES = COPYING
+LIBESTR_CPE_ID_VALID = y
 LIBESTR_CPE_ID_VENDOR = adiscon
 LIBESTR_INSTALL_STAGING = YES
 
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index 37dbd7e03e..a7f60d988e 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -12,6 +12,7 @@ LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBFASTJSON_AUTORECONF = YES
 LIBFASTJSON_LICENSE = MIT
 LIBFASTJSON_LICENSE_FILES = COPYING
+LIBFASTJSON_CPE_ID_VALID = y
 LIBFASTJSON_CPE_ID_VENDOR = rsyslog
 
 $(eval $(autotools-package))
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index c40d9c5970..79a1b52be8 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -8,6 +8,7 @@ LIBFCGI_VERSION = 2.4.2
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE.TERMS
+LIBFCGI_CPE_ID_VALID = y
 LIBFCGI_CPE_ID_VENDOR = fastcgi
 LIBFCGI_CPE_ID_NAME = fcgi
 LIBFCGI_INSTALL_STAGING = YES
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index e87a024040..2231fa7b71 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -6,6 +6,7 @@
 
 LIBFFI_VERSION = 3.3
 LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
+LIBFFI_CPE_ID_VALID = y
 LIBFFI_CPE_ID_VERSION = 3.3
 LIBFFI_CPE_ID_VERSION_MINOR = rc0
 LIBFFI_LICENSE = MIT
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index d928d2fd80..b0cbae98c6 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -12,6 +12,7 @@ LIBGCRYPT_SITE = https://gnupg.org/ftp/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
+LIBGCRYPT_CPE_ID_VALID = y
 LIBGCRYPT_CPE_ID_VENDOR = gnupg
 
 # Patching acinclude.m4 in 0001
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 7f726df29b..c396f4392f 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -10,6 +10,7 @@ LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
+LIBGLIB2_CPE_ID_VALID = y
 LIBGLIB2_CPE_ID_VENDOR = gnome
 LIBGLIB2_CPE_ID_NAME = glib
 LIBGLIB2_INSTALL_STAGING = YES
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 05c7f710f2..f5e73fdf67 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -9,6 +9,7 @@ LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
+LIBGPG_ERROR_CPE_ID_VALID = y
 LIBGPG_ERROR_CPE_ID_VENDOR = gnupg
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
index 24375b56b4..32cd4bf7d2 100644
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -8,6 +8,7 @@ LIBLOGGING_VERSION = 1.0.6
 LIBLOGGING_SITE = http://download.rsyslog.com/liblogging
 LIBLOGGING_LICENSE = BSD-2-Clause
 LIBLOGGING_LICENSE_FILES = COPYING
+LIBLOGGING_CPE_ID_VALID = y
 LIBLOGGING_CPE_ID_VENDOR = adiscon
 LIBLOGGING_INSTALL_STAGING = YES
 LIBLOGGING_CONF_OPTS = --enable-cached-man-pages
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 2cf245e6b6..9c38c38a61 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -9,6 +9,7 @@ LIBMBIM_SITE = https://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
+LIBMBIM_CPE_ID_VALID = y
 LIBMBIM_CPE_ID_VENDOR = freedesktop
 LIBMBIM_INSTALL_STAGING = YES
 
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index d3b33db2e0..98dae41de6 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -10,6 +10,7 @@ LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
 LIBMNL_LICENSE = LGPL-2.1+
 LIBMNL_LICENSE_FILES = COPYING
+LIBMNL_CPE_ID_VALID = y
 LIBMNL_CPE_ID_VENDOR = netfilter
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
index 0a5a94be8f..650a24f74d 100644
--- a/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter_conntrack.mk
@@ -11,6 +11,7 @@ LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
 LIBNETFILTER_CONNTRACK_LICENSE = GPL-2.0+
 LIBNETFILTER_CONNTRACK_LICENSE_FILES = COPYING
+LIBNETFILTER_CONNTRACK_CPE_ID_VALID = y
 LIBNETFILTER_CONNTRACK_CPE_ID_VENDOR = netfilter
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
index d74ea4d0fd..01b886eb91 100644
--- a/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
+++ b/package/libnetfilter_cthelper/libnetfilter_cthelper.mk
@@ -12,6 +12,7 @@ LIBNETFILTER_CTHELPER_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTHELPER_AUTORECONF = YES
 LIBNETFILTER_CTHELPER_LICENSE = GPL-2.0+
 LIBNETFILTER_CTHELPER_LICENSE_FILES = COPYING
+LIBNETFILTER_CTHELPER_CPE_ID_VALID = y
 LIBNETFILTER_CTHELPER_CPE_ID_VENDOR = netfilter
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
index f5c5067b64..b68a3e0520 100644
--- a/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter_cttimeout.mk
@@ -12,6 +12,7 @@ LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
 LIBNETFILTER_CTTIMEOUT_AUTORECONF = YES
 LIBNETFILTER_CTTIMEOUT_LICENSE = GPL-2.0+
 LIBNETFILTER_CTTIMEOUT_LICENSE_FILES = COPYING
+LIBNETFILTER_CTTIMEOUT_CPE_ID_VALID = y
 LIBNETFILTER_CTTIMEOUT_CPE_ID_VENDOR = netfilter
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_queue/libnetfilter_queue.mk b/package/libnetfilter_queue/libnetfilter_queue.mk
index 6cd35baea1..a301a040a0 100644
--- a/package/libnetfilter_queue/libnetfilter_queue.mk
+++ b/package/libnetfilter_queue/libnetfilter_queue.mk
@@ -12,6 +12,7 @@ LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
 LIBNETFILTER_QUEUE_AUTORECONF = YES
 LIBNETFILTER_QUEUE_LICENSE = GPL-2.0+
 LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
+LIBNETFILTER_QUEUE_CPE_ID_VALID = y
 LIBNETFILTER_QUEUE_CPE_ID_VENDOR = netfilter
 
 $(eval $(autotools-package))
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index a5ad47b85e..81efbe263f 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -11,6 +11,7 @@ LIBNFNETLINK_AUTORECONF = YES
 LIBNFNETLINK_INSTALL_STAGING = YES
 LIBNFNETLINK_LICENSE = GPL-2.0
 LIBNFNETLINK_LICENSE_FILES = COPYING
+LIBNFNETLINK_CPE_ID_VALID = y
 LIBNFNETLINK_CPE_ID_VENDOR = netfilter
 
 $(eval $(autotools-package))
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index bb4747f4c0..3d58e69cff 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -15,6 +15,7 @@ HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
 LIBOPENSSL_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH))
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
+LIBOPENSSL_CPE_ID_VALID = y
 LIBOPENSSL_CPE_ID_VENDOR = $(LIBOPENSSL_PROVIDES)
 LIBOPENSSL_CPE_ID_NAME = $(LIBOPENSSL_PROVIDES)
 
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index e323461529..b011290a42 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -8,6 +8,7 @@ LIBPCAP_VERSION = 1.9.1
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
+LIBPCAP_CPE_ID_VALID = y
 LIBPCAP_CPE_ID_VENDOR = tcpdump
 LIBPCAP_INSTALL_STAGING = YES
 LIBPCAP_DEPENDENCIES = host-flex host-bison
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 9bb1e57db6..d79da928ce 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -8,6 +8,7 @@ LIBSELINUX_VERSION = 3.1
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
+LIBSELINUX_CPE_ID_VALID = y
 LIBSELINUX_CPE_ID_VENDOR = selinuxproject
 
 LIBSELINUX_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) libsepol pcre
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 48e2bbbc8b..e07b0d15ee 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -9,6 +9,7 @@ LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/2
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = COPYING
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
+LIBSEMANAGE_CPE_ID_VALID = y
 LIBSEMANAGE_CPE_ID_VENDOR = selinuxproject
 LIBSEMANAGE_INSTALL_STAGING = YES
 
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index a4398bdc42..4f421de5cf 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -8,6 +8,7 @@ LIBSEPOL_VERSION = 3.1
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
+LIBSEPOL_CPE_ID_VALID = y
 LIBSEPOL_CPE_ID_VENDOR = selinuxproject
 
 LIBSEPOL_INSTALL_STAGING = YES
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index eb66ab5643..ed80408109 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -8,6 +8,7 @@ LIBSSH2_VERSION = 1.9.0
 LIBSSH2_SITE = https://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
+LIBSSH2_CPE_ID_VALID = y
 LIBSSH2_CPE_ID_VENDOR = $(LIBSSH2_NAME)
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index fd8bfa6724..2417dd3b62 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -10,6 +10,7 @@ LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING = YES
 LIBSYSFS_LICENSE = GPL-2.0 (utilities), LGPL-2.1+ (library)
 LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
+LIBSYSFS_CPE_ID_VALID = y
 LIBSYSFS_CPE_ID_VENDOR = sysfsutils_project
 LIBSYSFS_CPE_ID_NAME = sysfsutils
 
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index a354716824..e9336cec1f 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -9,6 +9,7 @@ LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
 LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
 LIBTASN1_LICENSE_FILES = LICENSE doc/COPYING doc/COPYING.LESSER
+LIBTASN1_CPE_ID_VALID = y
 LIBTASN1_CPE_ID_VENDOR = gnu
 LIBTASN1_INSTALL_STAGING = YES
 
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 1ed7ecf906..eb592132b8 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -10,6 +10,7 @@ LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
 LIBUNISTRING_LICENSE = LGPL-3.0+ or GPL-2.0
 LIBUNISTRING_LICENSE_FILES = COPYING COPYING.LIB
+LIBUNISTRING_CPE_ID_VALID = y
 LIBUNISTRING_CPE_ID_VENDOR = gnu
 
 $(eval $(autotools-package))
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index c531934dc3..c7a2e8d9aa 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -13,6 +13,7 @@ LIBXML2_LICENSE_FILES = COPYING
 LIBXML2_IGNORE_CVES += CVE-2020-7595
 # 0002-Fix-memory-leak-in-xmlSchemaValidateStream.patch
 LIBXML2_IGNORE_CVES += CVE-2019-20388
+LIBXML2_CPE_ID_VALID = y
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
 
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 3c603ad9f6..0c22013e9e 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -9,6 +9,7 @@ LIBXSLT_SITE = http://xmlsoft.org/sources
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
+LIBXSLT_CPE_ID_VALID = y
 LIBXSLT_CPE_ID_VENDOR = xmlsoft
 
 LIBXSLT_CONF_OPTS = \
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index a1e2640bac..1ea41c55df 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -11,6 +11,7 @@ LIBZLIB_LICENSE = Zlib
 LIBZLIB_LICENSE_FILES = README
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
+LIBZLIB_CPE_ID_VALID = y
 LIBZLIB_CPE_ID_VENDOR = gnu
 LIBZLIB_CPE_ID_NAME = $(LIBZLIB_PROVIDES)
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 39600ef94b..848bc1eaf1 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -10,6 +10,7 @@ LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
+LIGHTTPD_CPE_ID_VALID = y
 LIGHTTPD_CPE_ID_VENDOR = $(LIGHTTPD_NAME)
 LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPTS = \
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 938daf0ccd..dbfa3fd00b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -8,6 +8,7 @@ LINUX_FIRMWARE_VERSION = 20200122
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
+LINUX_FIRMWARE_CPE_ID_VALID = y
 LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
 
 # Intel SST DSP
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 4496295f2a..1486ed723a 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -102,6 +102,7 @@ LINUX_HEADERS_LICENSE_FILES = \
 	LICENSES/preferred/GPL-2.0 \
 	LICENSES/exceptions/Linux-syscall-note
 endif
+LINUX_HEADERS_CPE_ID_VALID = y
 LINUX_HEADERS_CPE_ID_VENDOR = linux
 LINUX_HEADERS_CPE_ID_NAME = linux_kernel
 
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index ecd4a723c4..7edea5990c 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -23,6 +23,7 @@ LINUX_PAM_LICENSE_FILES = Copyright
 # We're patching configure.ac
 LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_MAKE_OPTS += LIBS=$(TARGET_NLS_LIBS)
+LINUX_PAM_CPE_ID_VALID = y
 LINUX_PAM_CPE_ID_VENDOR = $(LINUX_PAM_NAME)
 LINUX_PAM_CPE_ID_NAME = $(LINUX_PAM_NAME)
 
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 177fff71bb..2d39156900 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -10,6 +10,7 @@ LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLV
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
+LLVM_CPE_ID_VALID = y
 LLVM_CPE_ID_VENDOR = $(LLVM_NAME)
 LLVM_SUPPORTS_IN_SOURCE_BUILD = NO
 LLVM_INSTALL_STAGING = YES
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index fbf0b28759..359b3c671c 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -8,6 +8,7 @@ LXC_VERSION = 4.0.4
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
+LXC_CPE_ID_VALID = y
 LXC_CPE_ID_VENDOR = linuxcontainers
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 7c91b6eecc..0436e615c3 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -9,6 +9,7 @@ LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
+LZ4_CPE_ID_VALID = y
 LZ4_CPE_ID_VENDOR = yann_collet
 
 # CVE-2014-4715 is misclassified (by our CVE tracker) as affecting version
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index ec821adbe8..1b4dd7516f 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -8,6 +8,7 @@ MEMTESTER_VERSION = 4.3.0
 MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions
 MEMTESTER_LICENSE = GPL-2.0
 MEMTESTER_LICENSE_FILES = COPYING
+MEMTESTER_CPE_ID_VALID = y
 MEMTESTER_CPE_ID_VENDOR = pryopus
 
 MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index a7c6483221..eb1fa1b6f8 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -10,6 +10,7 @@ MII_DIAG_PATCH = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
 MII_DIAG_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/m/mii-diag
 MII_DIAG_LICENSE = GPL # No version specified
 MII_DIAG_LICENSE_FILES = mii-diag.c
+MII_DIAG_CPE_ID_VALID = y
 MII_DIAG_CPE_ID_VENDOR = debian
 
 MII_DIAG_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 837aff3aa5..4630960c83 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -9,6 +9,7 @@ MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
 MPFR_LICENSE_FILES = COPYING.LESSER
+MPFR_CPE_ID_VALID = y
 MPFR_CPE_ID_VENDOR = gnu
 MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 6ee7fd5dfd..342ce22d53 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -9,6 +9,7 @@ MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
 MROUTED_DEPENDENCIES = host-bison
 MROUTED_LICENSE = BSD-3-Clause
 MROUTED_LICENSE_FILES = LICENSE
+MROUTED_CPE_ID_VALID = y
 MROUTED_CPE_ID_VENDOR = troglobit
 
 define MROUTED_CONFIGURE_CMDS
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index bbae4e13b2..aaa5c28beb 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -9,6 +9,7 @@ MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
 MTD_LICENSE_FILES = COPYING
+MTD_CPE_ID_VALID = y
 MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_NAME = mtd-utils
 MTD_INSTALL_STAGING = YES
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5c5e497488..ab46b50cb2 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -10,6 +10,7 @@ NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
+NCURSES_CPE_ID_VALID = y
 NCURSES_CPE_ID_VENDOR = gnu
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
 NCURSES_PATCH = \
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 09ca33f754..c8eead6988 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -9,6 +9,7 @@ NETSNMP_SITE = https://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NET
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
+NETSNMP_CPE_ID_VALID = y
 NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_NAME = $(NETSNMP_CPE_ID_VENDOR)
 NETSNMP_INSTALL_STAGING = YES
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 67f178cbff..8ca3278a65 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -10,6 +10,7 @@ NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VE
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
 NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libtirpc
+NFS_UTILS_CPE_ID_VALID = y
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 NFS_UTILS_AUTORECONF = YES
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index c8937229ab..c0447e5d1a 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION = 8.3p1
+OPENSSH_CPE_ID_VALID = y
 OPENSSH_CPE_ID_VERSION = 8.3
 OPENSSH_CPE_ID_VERSION_MINOR = p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
diff --git a/package/pax-utils/pax-utils.mk b/package/pax-utils/pax-utils.mk
index a6618851ba..9e2584faca 100644
--- a/package/pax-utils/pax-utils.mk
+++ b/package/pax-utils/pax-utils.mk
@@ -9,6 +9,7 @@ PAX_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 PAX_UTILS_SOURCE = pax-utils-$(PAX_UTILS_VERSION).tar.xz
 PAX_UTILS_LICENSE = GPL-2.0
 PAX_UTILS_LICENSE_FILES = COPYING
+PAX_UTILS_CPE_ID_VALID = y
 PAX_UTILS_CPE_ID_VENDOR = gentoo
 
 PAX_UTILS_DEPENDENCIES = host-pkgconf
diff --git a/package/paxtest/paxtest.mk b/package/paxtest/paxtest.mk
index 1b8d6699b6..fee8a84ddd 100644
--- a/package/paxtest/paxtest.mk
+++ b/package/paxtest/paxtest.mk
@@ -8,6 +8,7 @@ PAXTEST_VERSION = 0.9.15
 PAXTEST_SITE = https://www.grsecurity.net/~spender
 PAXTEST_LICENSE = GPL-2.0+
 PAXTEST_LICENSE_FILES = README
+PAXTEST_CPE_ID_VALID = y
 PAXTEST_CPE_ID_VENDOR = grsecurity
 
 define PAXTEST_BUILD_CMDS
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index b37a2ca9b7..b0ff7a499c 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -9,6 +9,7 @@ PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
 PCRE_LICENSE_FILES = LICENCE
+PCRE_CPE_ID_VALID = y
 PCRE_CPE_ID_VENDOR = $(PCRE_NAME)
 PCRE_INSTALL_STAGING = YES
 PCRE_CONFIG_SCRIPTS = pcre-config
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 52d4e36f2e..f08e954652 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -9,6 +9,7 @@ PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.xz
 PIXMAN_SITE = https://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_LICENSE = MIT
 PIXMAN_LICENSE_FILES = COPYING
+PIXMAN_CPE_ID_VALID = y
 PIXMAN_CPE_ID_VENDOR = $(PIXMAN_NAME)
 
 PIXMAN_INSTALL_STAGING = YES
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 0dfdc7af03..5307564145 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -8,6 +8,7 @@ POLICYCOREUTILS_VERSION = 3.1
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
+POLICYCOREUTILS_CPE_ID_VALID = y
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 118f9fc334..297de6aae6 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -10,6 +10,7 @@ PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
+PPPD_CPE_ID_VALID = y
 PPPD_CPE_ID_VENDOR = samba
 PPPD_CPE_ID_NAME = ppp
 
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 94276233c8..35fe2f2605 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -8,6 +8,8 @@ PROFTPD_VERSION = 1.3.6c
 PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
+PROFTPD_CPE_ID_VALID = y
+PROFTPD_CPE_ID_VALID = y
 PROFTPD_CPE_ID_VENDOR = $(PROFTPD_NAME)
 
 PROFTPD_CONF_ENV = \
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 82c814b65b..16bcb57bbc 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -12,6 +12,7 @@ PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
+PROTOBUF_CPE_ID_VALID = y
 PROTOBUF_CPE_ID_VENDOR = google
 
 # N.B. Need to use host protoc during cross compilation.
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 7e3d18b433..5852c48ee0 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -9,6 +9,7 @@ PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
+PURE_FTPD_CPE_ID_VALID = y
 PURE_FTPD_CPE_ID_VENDOR = pureftpd
 PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 0b95cf4dc6..6721579311 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -15,6 +15,7 @@ PYTHON_LXML_LICENSE_FILES = \
 	doc/licenses/BSD.txt \
 	doc/licenses/elementtree.txt \
 	src/lxml/isoschematron/resources/rng/iso-schematron.rng
+PYTHON_LXML_CPE_ID_VALID = y
 PYTHON_LXML_CPE_ID_VENDOR = lxml
 PYTHON_LXML_CPE_ID_NAME = lxml
 
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index ade5ca5521..55e54bf52f 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -11,6 +11,7 @@ PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
+PYTHON_SETUPTOOLS_CPE_ID_VALID = y
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
 PYTHON_SETUPTOOLS_CPE_ID_NAME = setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
diff --git a/package/python/python.mk b/package/python/python.mk
index 2d4c5a3721..fd58e8bc7c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -10,6 +10,7 @@ PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
 PYTHON_LICENSE_FILES = LICENSE
+PYTHON_CPE_ID_VALID = y
 PYTHON_CPE_ID_VENDOR = $(PYTHON_NAME)
 PYTHON_LIBTOOL_PATCH = NO
 
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index a4b5688605..937f627b18 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -12,6 +12,7 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
 #       the non-(L)GPL license texts are specified in the affected
 #       individual source files.
+QEMU_CPE_ID_VALID = y
 QEMU_CPE_ID_VENDOR = $(QEMU_NAME)
 
 #-------------------------------------------------------------
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index d3bcef7df1..3316e71d98 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -8,6 +8,7 @@ RAPIDJSON_VERSION = 1.1.0
 RAPIDJSON_SITE = $(call github,miloyip,rapidjson,v$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
+RAPIDJSON_CPE_ID_VALID = y
 RAPIDJSON_CPE_ID_VENDOR = tencent
 
 # rapidjson is a header-only C++ library
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 04872ac868..2624ddcdf9 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -14,6 +14,7 @@ READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 READLINE_CONF_OPTS = --disable-install-examples
 READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
+READLINE_CPE_ID_VALID = y
 READLINE_CPE_ID_VENDOR = gnu
 
 define READLINE_INSTALL_INPUTRC
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 63a1713e35..b212330924 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -6,6 +6,7 @@
 
 REFPOLICY_LICENSE = GPL-2.0
 REFPOLICY_LICENSE_FILES = COPYING
+REFPOLICY_CPE_ID_VALID = y
 REFPOLICY_CPE_ID_VENDOR = tresys
 REFPOLICY_INSTALL_STAGING = YES
 REFPOLICY_DEPENDENCIES = \
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index f9e1a0443a..4e1019e8bf 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -8,6 +8,7 @@ RSYSLOG_VERSION = 8.2004.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
+RSYSLOG_CPE_ID_VALID = y
 RSYSLOG_CPE_ID_VENDOR = $(RSYSLOG_NAME)
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index a52cfff3c3..9010119e47 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -10,6 +10,7 @@ RT_TESTS_VERSION = 1.8
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 RT_TESTS_DEPENDENCIES = numactl
+RT_TESTS_CPE_ID_VALID = y
 RT_TESTS_CPE_ID_VENDOR = kernel
 
 define RT_TESTS_BUILD_CMDS
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 64fb2035b0..f9e53c129e 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -9,6 +9,7 @@ SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
 SED_LICENSE_FILES = COPYING
+SED_CPE_ID_VALID = y
 SED_CPE_ID_VENDOR = gnu
 
 SED_CONF_OPTS = \
diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index a07b1367a2..ce81fa959f 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -10,6 +10,7 @@ SETOOLS_DEPENDENCIES = libselinux libsepol python-setuptools host-bison host-fle
 SETOOLS_INSTALL_STAGING = YES
 SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
 SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
+SETOOLS_CPE_ID_VALID = y
 SETOOLS_CPE_ID_VENDOR = selinuxproject
 SETOOLS_SETUP_TYPE = setuptools
 HOST_SETOOLS_DEPENDENCIES = host-python3-cython host-libselinux host-libsepol host-python-networkx
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0db0e084f6..2fa0cd02af 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -9,6 +9,7 @@ SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
+SMCROUTE_CPE_ID_VALID = y
 SMCROUTE_CPE_ID_VENDOR = troglobit
 
 SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 8caa1e2b3c..6cec9bbe04 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -9,6 +9,7 @@ SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
 SPAWN_FCGI_LICENSE = BSD-3-Clause
 SPAWN_FCGI_LICENSE_FILES = COPYING
+SPAWN_FCGI_CPE_ID_VALID = y
 SPAWN_FCGI_CPE_ID_VENDOR = lighttpd
 
 $(eval $(autotools-package))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 796292178c..24f32854e4 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 SQLITE_VERSION = 3320300
+SQLITE_CPE_ID_VALID = y
 SQLITE_CPE_ID_VERSION = 3.31.1
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2020
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 1f7437fa31..7b699a9a22 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -12,6 +12,7 @@ STRONGSWAN_PATCH = \
 	$(STRONGSWAN_SITE)/patches/28_gmp_pkcs1_overflow_patch/strongswan-4.4.0-5.7.0_gmp-pkcs1-overflow.patch
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
+STRONGSWAN_CPE_ID_VALID = y
 STRONGSWAN_CPE_ID_VENDOR = $(STRONGSWAN_NAME)
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 643eff1cbc..cba24607af 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -12,6 +12,7 @@ TAR_SITE = $(BR2_GNU_MIRROR)/tar
 TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
+TAR_CPE_ID_VALID = y
 TAR_CPE_ID_VENDOR = gnu
 
 ifeq ($(BR2_PACKAGE_ACL),y)
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 913891e897..82774cc2ac 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -10,6 +10,7 @@ TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
 TCL_LICENSE_FILES = license.terms
+TCL_CPE_ID_VALID = y
 TCL_CPE_ID_VENDOR = $(TCL_NAME)
 TCL_SUBDIR = unix
 TCL_INSTALL_STAGING = YES
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 9687e3c497..5a02a0c94f 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -8,6 +8,7 @@ TCPDUMP_VERSION = 4.9.3
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
+TCPDUMP_CPE_ID_VALID = y
 TCPDUMP_CPE_ID_VENDOR = $(TCPDUMP_NAME)
 TCPDUMP_CONF_ENV = \
 	ac_cv_linux_vers=2 \
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 301a222e39..7f7be4aef7 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -10,6 +10,7 @@ TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --without-tcpwrappers
 TFTPD_LICENSE = BSD-4-Clause
 TFTPD_LICENSE_FILES = tftpd/tftpd.c
+TFTPD_CPE_ID_VALID = y
 TFTPD_CPE_ID_VENDOR = $(TFTPD_NAME)-hpa_project
 TFTPD_CPE_ID_NAME = $(TFTPD_NAME)-hpa
 
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 61e22f6ae8..6a063e910b 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -9,6 +9,7 @@ UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 UBOOT_TOOLS_SITE = ftp://ftp.denx.de/pub/u-boot
 UBOOT_TOOLS_LICENSE = GPL-2.0+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
+UBOOT_TOOLS_CPE_ID_VALID = y
 UBOOT_TOOLS_CPE_ID_VENDOR = denx
 UBOOT_TOOLS_CPE_ID_NAME = u-boot
 UBOOT_TOOLS_INSTALL_STAGING = YES
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 96596fd8da..402d4de1a1 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -24,6 +24,7 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
 
+UTIL_LINUX_CPE_ID_VALID = y
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 7d0070a974..198fb2c728 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,6 +9,7 @@ VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
+VALGRIND_CPE_ID_VALID = y
 VALGRIND_CPE_ID_VENDOR = $(VALGRIND_NAME)
 VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 2bd3d437e4..f496332e74 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -23,6 +23,7 @@ VIM_CONF_ENV = \
 VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
+VIM_CPE_ID_VALID = y
 VIM_CPE_ID_VENDOR = $(VIM_NAME)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 65c132e453..0fbbc9c23c 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -10,6 +10,7 @@ WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
 WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
+WGET_CPE_ID_VALID = y
 WGET_CPE_ID_VENDOR = gnu
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index aaab7fc28b..acb40ca76d 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -9,6 +9,7 @@ WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
+WIRELESS_REGDB_CPE_ID_VALID = y
 WIRELESS_REGDB_CPE_ID_VENDOR = kernel
 
 ifeq ($(BR2_PACKAGE_CRDA),y)
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 01d03218d6..631d04d460 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -10,6 +10,7 @@ WIRELESS_TOOLS_SITE = https://hewlettpackard.github.io/wireless-tools
 WIRELESS_TOOLS_SOURCE = wireless_tools.$(WIRELESS_TOOLS_VERSION).tar.gz
 WIRELESS_TOOLS_LICENSE = GPL-2.0
 WIRELESS_TOOLS_LICENSE_FILES = COPYING
+WIRELESS_TOOLS_CPE_ID_VALID = y
 WIRELESS_TOOLS_CPE_ID_VERSION = $(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_CPE_ID_VERSION_MINOR = pre9
 WIRELESS_TOOLS_INSTALL_STAGING = YES
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 955f7fb98f..62149d255f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -8,6 +8,7 @@ WPA_SUPPLICANT_VERSION = 2.9
 WPA_SUPPLICANT_SITE = http://w1.fi/releases
 WPA_SUPPLICANT_LICENSE = BSD-3-Clause
 WPA_SUPPLICANT_LICENSE_FILES = README
+WPA_SUPPLICANT_CPE_ID_VALID = y
 WPA_SUPPLICANT_CPE_ID_VENDOR = w1.fi
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 5caf421132..1eb80224d1 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -9,6 +9,7 @@ XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
+XERCES_CPE_ID_VALID = y
 XERCES_CPE_ID_VENDOR = apache
 XERCES_CPE_ID_NAME = $(XERCES_NAME)-c\+\+
 XERCES_INSTALL_STAGING = YES
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index ffbae4c873..9f90de485f 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -11,6 +11,7 @@ XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
+XZ_CPE_ID_VALID = y
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.28.0
