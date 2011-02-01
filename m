From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Feb 2011 13:44:17 -0500
Subject: [Buildroot] [PATCH] cryptsetup: select e2fsprogs for libuuid
	dependency
In-Reply-To: <=> run ramboot>
References: <=> run ramboot>
Message-ID: <1296585857-5491-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/cryptsetup/Config.in     |    1 +
 package/cryptsetup/cryptsetup.mk |    1 -
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 23c4afa..8b543cd 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_E2FSPROGS
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for on-disk
           encryption.
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 5b0310f..33869c7 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -6,7 +6,6 @@ CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
 CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
 CRYPTSETUP_INSTALL_STAGING = NO
 CRYPTSETUP_INSTALL_TARGET = YES
-#CRYPTSETUP_CONF_OPT = --BLAH
 CRYPTSETUP_DEPENDENCIES = lvm2 libgcrypt popt e2fsprogs
 
 $(eval $(call AUTOTARGETS,package,cryptsetup))
-- 
1.5.6.5
