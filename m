From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Apr 2012 21:57:47 +0200
Subject: [Buildroot] [git commit] Add libcap-ng package.
Message-ID: <20120404200933.2D85596A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=defa173e08a34723f7a168ea4b76b10578591d6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/libcap-ng/Config.in    |   10 ++++++++++
 package/libcap-ng/libcap-ng.mk |   12 ++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e1629c8..e4f7dd2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -377,6 +377,7 @@ source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
+source "package/libcap-ng/Config.in"
 source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
new file mode 100644
index 0000000..d1663cd
--- /dev/null
+++ b/package/libcap-ng/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBCAP_NG
+	bool "libcap-ng"
+	help
+	  The libcap-ng library is intended to make programming with
+	  posix capabilities much easier than the traditional libcap
+	  library. It includes utilities that can analyse all currently
+	  running applications and print out any capabilities and whether
+	  or not it has an open ended bounding set.
+
+	  http://people.redhat.com/sgrubb/libcap-ng/
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
new file mode 100644
index 0000000..6ea5de4
--- /dev/null
+++ b/package/libcap-ng/libcap-ng.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# libcap-ng
+#
+#############################################################
+
+LIBCAP_NG_VERSION = 0.6.6
+LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng/
+LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
+LIBCAP_NG_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS))
