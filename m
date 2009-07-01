From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Jul 2009 15:36:19 +0200
Subject: [Buildroot] [git commit] package: add spawn-fcgi package
Message-ID: <20090701133733.15F92763B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0468be6e07185a57a8d01c57bfefcc2487a16875
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #417,

New package spawn-fcgi, basically a FastCGI process spawner.
This was previously included in lighttpd up to version 1.4.22 and is now
a separate project.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    1 +
 package/Config.in                |    1 +
 package/spawn-fcgi/Config.in     |    7 +++++++
 package/spawn-fcgi/spawn-fcgi.mk |   15 +++++++++++++++
 4 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/spawn-fcgi/Config.in
 create mode 100644 package/spawn-fcgi/spawn-fcgi.mk

diff --git a/CHANGES b/CHANGES
index 88fdabf..7e4facc 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,7 @@
 	#395: gst-plugins-bad: New package
 	#409: Bump php package to 5.2.10
 	#411: ipsec-tools: Bump version to 0.7.2
+	#417: New package spawn-fcgi
 	#419: Bump lighttpd package to 1.4.23
 
 2009.05, Released June 1st, 2009:
diff --git a/package/Config.in b/package/Config.in
index 0b09277..1dfdb20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -198,6 +198,7 @@ source "package/quagga/Config.in"
 source "package/rsync/Config.in"
 source "package/samba/Config.in"
 source "package/socat/Config.in"
+source "package/spawn-fcgi/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
 source "package/tftpd/Config.in"
diff --git a/package/spawn-fcgi/Config.in b/package/spawn-fcgi/Config.in
new file mode 100644
index 0000000..34cbbb1
--- /dev/null
+++ b/package/spawn-fcgi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SPAWN_FCGI
+	bool "spawn-fcgi"
+	help
+	  FastCGI process spawner.
+	  Project split from lighttpd.
+
+	  http://redmine.lighttpd.net/projects/spawn-fcgi
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
new file mode 100644
index 0000000..ac33d88
--- /dev/null
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# spawn-fcgi
+#
+#############################################################
+
+SPAWN_FCGI_VERSION = 1.6.2
+SPAWN_FCGI_SITE = http://www.lighttpd.net/download
+SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
+
+ifneq ($(BR2_INET_IPV6),y)
+SPAWN_FCGI_CONF_OPT = --disable-ipv6
+endif
+
+$(eval $(call AUTOTARGETS,package,spawn-fcgi))
-- 
1.6.3.3
