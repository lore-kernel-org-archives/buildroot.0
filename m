From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Jan 2020 18:40:14 -0700
Subject: [Buildroot] [PATCH 2/2] package/ser2net: bump to version 4.1.1
In-Reply-To: <20200121014014.32703-1-james.hilliard1@gmail.com>
References: <20200121014014.32703-1-james.hilliard1@gmail.com>
Message-ID: <20200121014014.32703-2-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added new ser2net dependencies gensio and libyaml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ser2net/Config.in    | 2 ++
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index cb4d69f741..3d110b70f2 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GENSIO
+	select BR2_PACKAGE_LIBYAML
 	help
 	  Ser2net provides a way for a user to connect from a network
 	  connection to a serial port.
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index c736c726ac..5bd927d7d1 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5 e10e7c8c97e5bade5e85ce6e89bdf1f4  ser2net-3.5.tar.gz
-sha1 0ad0affd37ef544c23f42a3f46d09e969d0d9116  ser2net-3.5.tar.gz
+md5 44a69f573677d9f2bde87b3611db5817  ser2net-4.1.1.tar.gz
+sha1 502e11c3bee429de6550db459d83c9a0991cfc5c  ser2net-4.1.1.tar.gz
 # Locally computed:
-sha256 ba9e1d60a89fd7ed075553b4a2074352902203f7fbd9b65b15048c05f0e3f3be  ser2net-3.5.tar.gz
+sha256 ad6c8fb34d01be177570323899d840a44c8774399d594595393708162fc61e22  ser2net-4.1.1.tar.gz
 sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 5ab5c4d2ae..2ea68ccc43 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 3.5
+SER2NET_VERSION = 4.1.1
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
+SER2NET_DEPENDENCIES = gensio libyaml
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 SER2NET_CONF_OPTS += --with-pthreads
-- 
2.20.1
