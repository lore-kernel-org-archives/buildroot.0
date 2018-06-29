From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 08:02:58 +0300
Subject: [Buildroot] [PATCH] linux-pam: bump to version 1.3.1
Message-ID: <e1427940f697c4406f6cf0f770829275a426fff2.1530248578.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tarball is now at github.

Switch to .tar.xz, that's the only format that upstream provides.

Add a note on tarball signature and key.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linux-pam/linux-pam.hash | 6 ++++--
 package/linux-pam/linux-pam.mk   | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index b9c91ef0f663..183bcca40147 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,2 +1,4 @@
-# Locally computed hashes, not provided by upstream
-sha256 241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb  Linux-PAM-1.3.0.tar.bz2
+# Locally computed hashes after checking signature at
+# https://github.com/linux-pam/linux-pam/releases/download/v1.3.1/Linux-PAM-1.3.1.tar.xz.asc
+# signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
+sha256 eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db  Linux-PAM-1.3.1.tar.xz
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 5c80e7841617..63610fcc57bf 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.3.0
-LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
-LINUX_PAM_SITE = http://linux-pam.org/library
+LINUX_PAM_VERSION = 1.3.1
+LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.xz
+LINUX_PAM_SITE = https://github.com/linux-pam/linux-pam/releases/download/v$(LINUX_PAM_VERSION)
 LINUX_PAM_INSTALL_STAGING = YES
 LINUX_PAM_CONF_OPTS = \
 	--disable-prelude \
-- 
2.18.0
