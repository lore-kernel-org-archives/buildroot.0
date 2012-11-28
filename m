From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Nov 2012 10:24:03 -0300
Subject: [Buildroot] [PATCH 2/2] libdaemon: needs mmu
In-Reply-To: <1354109043-12022-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354109043-12022-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354109043-12022-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/avahi/Config.in     |    2 ++
 package/ifplugd/Config.in   |    2 ++
 package/libdaemon/Config.in |    2 ++
 package/nss-mdns/Config.in  |    2 ++
 package/radvd/Config.in     |    2 ++
 5 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 8ba33d5..e2f8c53 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
+	# libdaemon uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Avahi is a system which facilitates service
diff --git a/package/ifplugd/Config.in b/package/ifplugd/Config.in
index 0311ad7..cbb5128 100644
--- a/package/ifplugd/Config.in
+++ b/package/ifplugd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_IFPLUGD
 	bool "ifplugd"
+	# libdaemon uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBDAEMON
 	help
 	  Ifplugd is a daemon which will automatically configure your
diff --git a/package/libdaemon/Config.in b/package/libdaemon/Config.in
index 6943263..bfcedc1 100644
--- a/package/libdaemon/Config.in
+++ b/package/libdaemon/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBDAEMON
 	bool "libdaemon"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  libdaemon is a lightweight C library that eases the
 	  writing of UNIX daemons.
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index 485cfcd..1df0ce4 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NSS_MDNS
 	bool "nss-mdns"
+	# libdaemon->avahi uses fork()
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
 	depends on BR2_PACKAGE_AVAHI_DAEMON
 	help
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 90c1fd4..d0d9d70 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_RADVD
 	bool "radvd"
+	# libdaemon uses fork()
+	depends on BR2_USE_MMU
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
 	select BR2_PACKAGE_LIBDAEMON
-- 
1.7.8.6
