From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Thu, 27 Dec 2007 04:00:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/acpid
	package/argus package/at p etc...
Message-ID: <20071227120015.E8AE31200F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2007-12-27 04:00:12 -0800 (Thu, 27 Dec 2007)
New Revision: 20692

Log:
Added BR2_DEBIAN_MIRROR


Modified:
   trunk/buildroot/package/acpid/acpid.mk
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/at/at.mk
   trunk/buildroot/package/cvs/cvs.mk
   trunk/buildroot/package/dash/dash.mk
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/flex/flex.mk
   trunk/buildroot/package/grep/grep.mk
   trunk/buildroot/package/hwdata/hwdata.mk
   trunk/buildroot/package/kexec/kexec.mk
   trunk/buildroot/package/l2tp/l2tp.mk
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libusb/libusb.mk
   trunk/buildroot/package/lighttpd/lighttpd.mk
   trunk/buildroot/package/lm-sensors/lm-sensors.mk
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/ltrace/ltrace.mk
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/mdadm/mdadm.mk
   trunk/buildroot/package/mrouted/mrouted.mk
   trunk/buildroot/package/mtd/20050122/mtd.mk
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/package/mutt/mutt.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/patch/patch.mk
   trunk/buildroot/package/pptp-linux/pptp-linux.mk
   trunk/buildroot/package/rp-pppoe/rp-pppoe.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/target/device/Config.in.mirrors
   trunk/buildroot/target/x86/grub/grub.mk
   trunk/buildroot/target/x86/grub2/grub2.mk


Changeset:
Modified: trunk/buildroot/package/acpid/acpid.mk
===================================================================
--- trunk/buildroot/package/acpid/acpid.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/acpid/acpid.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 ACPID_VERSION:=1.0.4
 ACPID_DIR=$(BUILD_DIR)/acpid-$(ACPID_VERSION)
 ACPID_SOURCE=acpid_$(ACPID_VERSION)-1.tar.gz
-ACPID_SITE=http://ftp.debian.org/debian/pool/main/a/acpid
+ACPID_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/acpid
 
 $(DL_DIR)/$(ACPID_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ACPID_SITE)/$(ACPID_SOURCE)

Modified: trunk/buildroot/package/argus/argus.mk
===================================================================
--- trunk/buildroot/package/argus/argus.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/argus/argus.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 ARGUS_VERSION:=3.0.0.rc.34
 ARGUS_SOURCE:=argus_$(ARGUS_VERSION).orig.tar.gz
 ARGUS_PATCH:=argus_$(ARGUS_VERSION)-1.diff.gz
-ARGUS_SITE:=ftp://ftp.debian.org/debian/pool/main/a/argus/
+ARGUS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
 ARGUS_DIR:=$(BUILD_DIR)/argus-$(ARGUS_VERSION)
 ARGUS_CAT:=$(ZCAT)
 ARGUS_BINARY:=bin/argus

Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/at/at.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 AT_VERSION:=3.1.10
 AT_SOURCE:=at_$(AT_VERSION).tar.gz
-AT_SITE:=http://ftp.debian.org/debian/pool/main/a/at
+AT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 AT_DIR:=$(BUILD_DIR)/at-$(AT_VERSION)
 AT_CAT:=$(ZCAT)
 AT_TARGET_SCRIPT:=etc/init.d/S99at

Modified: trunk/buildroot/package/cvs/cvs.mk
===================================================================
--- trunk/buildroot/package/cvs/cvs.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/cvs/cvs.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 CVS_VERSION:=1.12.13
 CVS_SOURCE:=cvs_$(CVS_VERSION).orig.tar.gz
 CVS_PATCH:=cvs_$(CVS_VERSION)-8.diff.gz
-CVS_SITE:=http://ftp.debian.org/debian/pool/main/c/cvs/
+CVS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cvs/
 CVS_DIR:=$(BUILD_DIR)/cvs-$(CVS_VERSION)
 CVS_CAT:=$(ZCAT)
 CVS_BINARY:=src/cvs

Modified: trunk/buildroot/package/dash/dash.mk
===================================================================
--- trunk/buildroot/package/dash/dash.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/dash/dash.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 DASH_VERSION:=0.5.3
 DASH_SOURCE:=dash_$(DASH_VERSION).orig.tar.gz
-DASH_SITE:=http://ftp.debian.org/debian/pool/main/d/dash
+DASH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
 DASH_CAT:=$(ZCAT)
 DASH_DIR:=$(BUILD_DIR)/dash-$(DASH_VERSION)
 DASH_PATCH1:=dash_$(DASH_VERSION)-7.diff.gz

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 FAKEROOT_VERSION:=1.8.10
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
+FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
 FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host

Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/file/file.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 FILE_VERSION:=4.21
 FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
-FILE_SITE:=http://ftp.debian.org/debian/pool/main/f/file
+FILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
 FILE_DIR1:=$(TOOL_BUILD_DIR)/file-$(FILE_VERSION)-host
 FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VERSION)-target

Modified: trunk/buildroot/package/flex/flex.mk
===================================================================
--- trunk/buildroot/package/flex/flex.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/flex/flex.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -7,7 +7,7 @@
 FLEX_PATCH_VERSION:=11
 FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
-FLEX_SITE:=http://ftp.debian.org/debian/pool/main/f/flex
+FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR:=$(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_CAT:=$(ZCAT)
 FLEX_BINARY:=flex

Modified: trunk/buildroot/package/grep/grep.mk
===================================================================
--- trunk/buildroot/package/grep/grep.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/grep/grep.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 GNUGREP_VERSION:=2.5.1
 GNUGREP_SOURCE:=grep_$(GNUGREP_VERSION).ds1.orig.tar.gz
-GNUGREP_SITE:=http://ftp.debian.org/debian/pool/main/g/grep/
+GNUGREP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grep/
 GNUGREP_DIR:=$(BUILD_DIR)/grep-$(GNUGREP_VERSION)
 GNUGREP_CAT:=$(ZCAT)
 GNUGREP_BINARY:=src/grep

Modified: trunk/buildroot/package/hwdata/hwdata.mk
===================================================================
--- trunk/buildroot/package/hwdata/hwdata.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/hwdata/hwdata.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 HWDATA_VERSION:=0.191
 HWDATA_SOURCE:=hwdata_$(HWDATA_VERSION).orig.tar.gz
 HWDATA_PATCH:=hwdata_$(HWDATA_VERSION)-1.diff.gz
-HWDATA_SITE:=http://ftp.debian.org/debian/pool/main/h/hwdata/
+HWDATA_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/h/hwdata/
 HWDATA_CAT:=$(ZCAT)
 HWDATA_DIR:=$(BUILD_DIR)/hwdata-$(HWDATA_VERSION)
 HWDATA_BINARY:=pci.ids

Modified: trunk/buildroot/package/kexec/kexec.mk
===================================================================
--- trunk/buildroot/package/kexec/kexec.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/kexec/kexec.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 KEXEC_VERSION:=1.101
 KEXEC_SOURCE:=kexec-tools_$(KEXEC_VERSION)-kdump10.orig.tar.gz
 KEXEC_PATCH:=kexec-tools_$(KEXEC_VERSION)-kdump10-2.diff.gz
-KEXEC_SITE:=ftp://ftp.debian.org/debian/pool/main/k/kexec-tools/
+KEXEC_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/k/kexec-tools/
 KEXEC_DIR:=$(BUILD_DIR)/kexec-tools-$(KEXEC_VERSION)
 KEXEC_CAT:=$(ZCAT)
 KEXEC_BINARY:=kexec

Modified: trunk/buildroot/package/l2tp/l2tp.mk
===================================================================
--- trunk/buildroot/package/l2tp/l2tp.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/l2tp/l2tp.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 L2TP_VERSION:=0.70-pre20031121
 L2TP_SOURCE:=l2tpd_$(L2TP_VERSION).orig.tar.gz
 L2TP_PATCH:=l2tpd_$(L2TP_VERSION)-2.2.diff.gz
-L2TP_SITE:=ftp://ftp.debian.org/debian/pool/main/l/l2tpd/
+L2TP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/l2tpd/
 L2TP_DIR:=$(BUILD_DIR)/l2tpd-$(L2TP_VERSION)
 L2TP_CAT:=$(ZCAT)
 L2TP_BINARY:=l2tpd

Modified: trunk/buildroot/package/libfloat/libfloat.mk
===================================================================
--- trunk/buildroot/package/libfloat/libfloat.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/libfloat/libfloat.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 LIBFLOAT_SOURCE:=libfloat_990616.orig.tar.gz
 LIBFLOAT_PATCH:=libfloat_990616-3.diff.gz
-LIBFLOAT_SITE:=http://ftp.debian.org/debian/pool/main/libf/libfloat
+LIBFLOAT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libf/libfloat
 LIBFLOAT_CAT:=$(ZCAT)
 LIBFLOAT_DIR:=$(BUILD_DIR)/libfloat
 

Modified: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 LIBLOCKFILE_VERSION=1.06.1
 LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).tar.gz
-LIBLOCKFILE_SITE:=http://ftp.debian.org/debian/pool/main/libl/liblockfile/
+LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
 LIBLOCKFILE_CAT:=$(ZCAT)
 LIBLOCKFILE_DIR:=$(BUILD_DIR)/liblockfile-$(LIBLOCKFILE_VERSION)
 LIBLOCKFILE_BINARY:=liblockfile.so.1.0

Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -7,7 +7,7 @@
 LIBUSB_PATCH_FILE:=libusb_$(LIBUSB_VERSION)-7.diff.gz
 LIBUSB_SOURCE:=libusb_$(LIBUSB_VERSION).orig.tar.gz
 #LIBUSB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libusb/
-LIBUSB_SITE:=http://ftp.debian.org/debian/pool/main/libu/libusb
+LIBUSB_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libu/libusb
 LIBUSB_DIR:=$(BUILD_DIR)/libusb-$(LIBUSB_VERSION)
 LIBUSB_CAT:=$(ZCAT)
 LIBUSB_BINARY:=usr/lib/libusb.so

Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 LIGHTTPD_VERSION:=1.4.18
 LIGHTTPD_SOURCE:=lighttpd_$(LIGHTTPD_VERSION).orig.tar.gz
 LIGHTTPD_PATCH:=lighttpd_$(LIGHTTPD_VERSION)-1.diff.gz
-LIGHTTPD_SITE:=http://ftp.debian.org/debian/pool/main/l/lighttpd
+LIGHTTPD_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lighttpd
 LIGHTTPD_DIR:=$(BUILD_DIR)/lighttpd-$(LIGHTTPD_VERSION)
 LIGHTTPD_CAT:=$(ZCAT)
 LIGHTTPD_BINARY:=src/lighttpd

Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 LM_SENSORS_VERSION:=2.10.4
 LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
 LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-3.diff.gz
-LM_SENSORS_SITE:=http://ftp.debian.org/debian/pool/main/l/lm-sensors/
+LM_SENSORS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lm-sensors/
 LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
 LM_SENSORS_CAT:=$(ZCAT)
 LM_SENSORS_BINARY:=prog/sensors/sensors

Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 LOCKFILE_PROGS_VERSION=0.1.11
 LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE:=http://ftp.debian.org/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_CAT:=$(ZCAT)
 LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
 LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create

Modified: trunk/buildroot/package/ltrace/ltrace.mk
===================================================================
--- trunk/buildroot/package/ltrace/ltrace.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/ltrace/ltrace.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 LTRACE_VERSION=0.5
 LTRACE_SOURCE=ltrace_$(LTRACE_VERSION).orig.tar.gz
 LTRACE_PATCH=ltrace_$(LTRACE_VERSION)-3.diff.gz
-LTRACE_SITE=http://ftp.debian.org/debian/pool/main/l/ltrace
+LTRACE_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/ltrace
 LTRACE_DIR=$(BUILD_DIR)/ltrace-$(LTRACE_VERSION)
 LTRACE_BINARY=ltrace
 LTRACE_TARGET_BINARY=usr/bin/ltrace

Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/lzo/lzo.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -8,7 +8,7 @@
 #############################################################
 LZO_VERSION:=1.08
 LZO_SOURCE:=lzo_$(LZO_VERSION).orig.tar.gz
-LZO_SITE:=http://ftp.debian.org/debian/pool/main/l/lzo
+LZO_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lzo
 #LZO_SOURCE:=lzo-$(LZO_VERSION).tar.bz2
 #LZO_SITE:=http://www.oberhumer.com/opensource/lzo/download
 LZO_DIR:=$(BUILD_DIR)/lzo-$(LZO_VERSION)

Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -7,7 +7,7 @@
 MDADM_SOURCE:=mdadm_$(MDADM_VERSION).orig.tar.gz
 MDADM_PATCH:=mdadm_$(MDADM_VERSION)-2.diff.gz
 MDADM_CAT:=$(ZCAT)
-MDADM_SITE:=http://ftp.debian.org/debian/pool/main/m/mdadm
+MDADM_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mdadm
 MDADM_DIR:=$(BUILD_DIR)/mdadm-$(MDADM_VERSION)
 MDADM_BINARY:=mdadm
 MDADM_TARGET_BINARY:=sbin/mdadm

Modified: trunk/buildroot/package/mrouted/mrouted.mk
===================================================================
--- trunk/buildroot/package/mrouted/mrouted.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/mrouted/mrouted.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 #############################################################
 MROUTED_VERSION:=3.9-beta3.orig
 MROUTED_SOURCE:=mrouted_$(MROUTED_VERSION).tar.gz
-MROUTED_SITE:=http://ftp.debian.org/debian/pool/non-free/m/mrouted
+MROUTED_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/non-free/m/mrouted
 MROUTED_DIR:=$(BUILD_DIR)/mrouted-$(MROUTED_VERSION)
 MROUTED_CAT:=$(ZCAT)
 MROUTED_PATCH:=mrouted_3.9-beta3-1.1.diff.gz

Modified: trunk/buildroot/package/mtd/20050122/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20050122/mtd.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/mtd/20050122/mtd.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -15,7 +15,7 @@
 else
 MTD_SOURCE:=$(strip $(subst ",, $(BR2_PACKAGE_MTD_ORIG_STRING)))
 #"))
-MTD_SITE:=http://ftp.debian.org/debian/pool/main/m/mtd
+MTD_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mtd
 MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
 MTD_CAT:=$(ZCAT)

Modified: trunk/buildroot/package/mtd/20061007/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20061007/mtd.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/mtd/20061007/mtd.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -4,7 +4,7 @@
 #
 #############################################################
 MTD_SOURCE=mtd_20061007.orig.tar.gz
-MTD_SITE=http://ftp.debian.org/debian/pool/main/m/mtd
+MTD_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mtd
 MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
 MTD_CAT:=$(ZCAT)

Modified: trunk/buildroot/package/mutt/mutt.mk
===================================================================
--- trunk/buildroot/package/mutt/mutt.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/mutt/mutt.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 MUTT_VERSION:=1.5.16
 MUTT_SOURCE:=mutt_$(MUTT_VERSION).orig.tar.gz
 MUTT_PATCH:=mutt_$(MUTT_VERSION)-3.diff.gz
-MUTT_SITE:=ftp://ftp.debian.org/debian/pool/main/m/mutt/
+MUTT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mutt/
 MUTT_DIR:=$(BUILD_DIR)/mutt-$(MUTT_VERSION)
 MUTT_CAT:=$(ZCAT)
 MUTT_BINARY:=mutt

Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -9,7 +9,7 @@
 NETSNMP_DIR:=$(BUILD_DIR)/net-snmp-$(NETSNMP_VERSION)
 NETSNMP_SOURCE:=net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_PATCH1:=net-snmp_$(NETSNMP_VERSION)-$(NETSNMP_PATCH_VERSION).diff.gz
-NETSNMP_PATCH1_URL:=http://ftp.debian.org/debian/pool/main/n/net-snmp/
+NETSNMP_PATCH1_URL:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/n/net-snmp/
 
 $(DL_DIR)/$(NETSNMP_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NETSNMP_URL)/$(NETSNMP_SOURCE)

Modified: trunk/buildroot/package/patch/patch.mk
===================================================================
--- trunk/buildroot/package/patch/patch.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/patch/patch.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -5,7 +5,7 @@
 #############################################################
 GNUPATCH_VERSION:=2.5.9
 GNUPATCH_SOURCE:=patch_$(GNUPATCH_VERSION).orig.tar.gz
-GNUPATCH_SITE:=http://ftp.debian.org/debian/pool/main/p/patch
+GNUPATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/patch
 GNUPATCH_CAT:=$(ZCAT)
 GNUPATCH_DIR:=$(BUILD_DIR)/patch-$(GNUPATCH_VERSION)
 GNUPATCH_BINARY:=patch

Modified: trunk/buildroot/package/pptp-linux/pptp-linux.mk
===================================================================
--- trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 PPTP_LINUX_VERSION:=1.7.0
 PPTP_LINUX_SOURCE:=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
 #PPTP_LINUX_PATCH:=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
-PPTP_LINUX_SITE:=http://ftp.debian.org/debian/pool/main/p/pptp-linux
+PPTP_LINUX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/pptp-linux
 PPTP_LINUX_DIR:=$(BUILD_DIR)/pptp-linux-$(PPTP_LINUX_VERSION).orig
 PPTP_LINUX_CAT:=$(ZCAT)
 PPTP_LINUX_BINARY:=pptp

Modified: trunk/buildroot/package/rp-pppoe/rp-pppoe.mk
===================================================================
--- trunk/buildroot/package/rp-pppoe/rp-pppoe.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/rp-pppoe/rp-pppoe.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 RP_PPPOE_VERSION:=3.8
 RP_PPPOE_SOURCE:=rp-pppoe_$(RP_PPPOE_VERSION).orig.tar.gz
 RP_PPPOE_PATCH:=rp-pppoe_$(RP_PPPOE_VERSION)-3.diff.gz
-RP_PPPOE_SITE:=ftp://ftp.debian.org/debian/pool/main/r/rp-pppoe
+RP_PPPOE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rp-pppoe
 RP_PPPOE_TOPDIR:=$(BUILD_DIR)/rp-pppoe-$(RP_PPPOE_VERSION)
 RP_PPPOE_DIR:=$(BUILD_DIR)/rp-pppoe-$(RP_PPPOE_VERSION)/src
 RP_PPPOE_CAT:=$(ZCAT)

Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/setserial/setserial.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -7,7 +7,7 @@
 SETSERIAL_PATCH_VERSION:=-44
 #SETSERIAL_PATCH_FILE:=
 SETSERIAL_SOURCE:=setserial_$(SETSERIAL_VERSION)$(SETSERIAL_PATCH_VERSION).tar.gz
-SETSERIAL_SITE:=http://ftp.debian.org/debian/pool/main/s/setserial/
+SETSERIAL_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/s/setserial/
 SETSERIAL_DIR:=$(BUILD_DIR)/setserial-$(SETSERIAL_VERSION)
 SETSERIAL_BINARY:=setserial
 SETSERIAL_TARGET_BINARY:=usr/bin/setserial

Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -6,7 +6,7 @@
 TIFF_VERSION:=3.8.2
 TIFF_SOURCE:=tiff_$(TIFF_VERSION).orig.tar.gz
 TIFF_SOURCE2:=tiff-$(TIFF_VERSION).tar.gz
-TIFF_SITE:=http://ftp.debian.org/pool/main/t/tiff/
+TIFF_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/t/tiff/
 TIFF_DIR:=$(BUILD_DIR)/tiff-$(TIFF_VERSION)
 TIFF_CAT:=$(ZCAT)
 

Modified: trunk/buildroot/target/device/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Config.in.mirrors	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/target/device/Config.in.mirrors	2007-12-27 12:00:12 UTC (rev 20692)
@@ -38,6 +38,16 @@
 	     http://ftp.gnu.org/pub/gnu
 	     http://mirror.aarnet.edu.au/pub/gnu
 
+config BR2_DEBIAN_MIRROR
+	string "Debian Software mirror"
+	default "http://ftp.debian.org"
+	help
+	  Debian has multiple software mirrors scattered around the world.
+	  The following allows you to select your preferred mirror.
+
+	  Usually, just add your country code like XX here:
+	  http://ftp.XX.debian.org
+
 source	"target/device/Atmel/Config.in.mirrors"
 
 endmenu

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/target/x86/grub/grub.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -22,8 +22,8 @@
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
 GRUB_PATCH:=grub_0.97-28.diff.gz
-GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
-GRUB_PATCH_SITE:=http://ftp.debian.org/debian/pool/main/g/grub
+GRUB_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
+GRUB_PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
 GRUB_BINARY:=grub/grub

Modified: trunk/buildroot/target/x86/grub2/grub2.mk
===================================================================
--- trunk/buildroot/target/x86/grub2/grub2.mk	2007-12-27 11:23:11 UTC (rev 20691)
+++ trunk/buildroot/target/x86/grub2/grub2.mk	2007-12-27 12:00:12 UTC (rev 20692)
@@ -22,8 +22,8 @@
 #############################################################
 GRUB2_SOURCE:=grub2_1.95.orig.tar.gz
 GRUB2_PATCH:=grub2_1.95-5.diff.gz
-GRUB2_SITE=http://ftp.debian.org/debian/pool/main/g/grub2
-GRUB2_PATCH_SITE:=http://ftp.debian.org/debian/pool/main/g/grub2
+GRUB2_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub2
+GRUB2_PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub2
 GRUB2_CAT:=$(ZCAT)
 GRUB2_DIR:=$(BUILD_DIR)/grub-1.95
 GRUB2_BINARY:=grub2/grub2
