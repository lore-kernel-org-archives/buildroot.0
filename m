From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 10:45:14 +0200
Subject: [Buildroot] [git commit] knock: new package
Message-ID: <20130912084516.E6A389B722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ceff155ca4a368cd3a5898ddacfd8d6faecff73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A port knocking implementation with daemon and user application.

[Peter: drop trailing newline in Config.in]
Signed-off-by: Michael Rommel <rommel@layer-7.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/knock/Config.in |   12 ++++++++++++
 package/knock/knock.mk  |   14 ++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2351839..02e5afc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -789,6 +789,7 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
+source "package/knock/Config.in"
 source "package/lighttpd/Config.in"
 source "package/linknx/Config.in"
 source "package/links/Config.in"
diff --git a/package/knock/Config.in b/package/knock/Config.in
new file mode 100644
index 0000000..a50860b
--- /dev/null
+++ b/package/knock/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_KNOCK
+	bool "knock"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  A port knocking implementation.
+	  Provides a daemon and a user application. Port knocking can be
+	  used to run an arbitrary application, once the daemon detects
+	  a predefined sequence of incoming TCP/UDP packets on a network
+	  interface. This can be used, e.g. to open up ports in a
+	  firewall.
+
+	  http://www.zeroflux.org/projects/knock
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
new file mode 100644
index 0000000..8469b4f
--- /dev/null
+++ b/package/knock/knock.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# knock
+#
+################################################################################
+
+KNOCK_VERSION = 7666f2e86e
+KNOCK_SITE = https://github.com/jvinet/knock/tarball/master
+KNOCK_LICENSE = GPLv2+
+KNOCK_LICENSE_FILES = COPYING
+KNOCK_AUTORECONF = YES
+KNOCK_DEPENDENCIES = libpcap
+
+$(eval $(autotools-package))
