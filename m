From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 17:45:59 +0200
Subject: [Buildroot] [git commit branch/next] samba: add license info and
	smbta-util option
Message-ID: <20120817154924.52DE4971EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa9d3d758353f558dbc4f983f62ebbfb9728656e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add license info and the smbta-util config knob.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/Config.in |    7 +++++++
 package/samba/samba.mk  |    3 +++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index e88b360..928b40b 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -168,6 +168,13 @@ config BR2_PACKAGE_SAMBA_SWAT
 	help
 	  Samba Web Administration Tool
 
+config BR2_PACKAGE_SAMBA_SMBTA_UTIL
+	bool "smbta-util"
+	default y
+	help
+	  Tool to ease the configuration of the vfs_smb_traffic_analyzer
+	  module regarding data encryption.
+
 config BR2_PACKAGE_SAMBA_SMBTAR
 	bool "smbtar"
 	default y
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 301a39f..75e3173 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -8,6 +8,8 @@ SAMBA_VERSION = 3.6.7
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
+SAMBA_LICENSE = GPLv3+
+SAMBA_LICENSE_FILES = COPYING
 
 SAMBA_DEPENDENCIES = popt \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline) \
@@ -104,6 +106,7 @@ SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBPASSWD) += usr/bin/smbpasswd
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSHARESEC) += usr/bin/sharesec
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSPOOL) += usr/bin/smbspool
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSTATUS) += usr/bin/smbstatus
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBTA_UTIL) += usr/bin/smbta-util
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBTREE) += usr/bin/smbtree
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SWAT) += usr/sbin/swat
 SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbbackup
