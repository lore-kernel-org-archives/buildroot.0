From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 20:04:59 +0100
Subject: [Buildroot] [git commit] libembryo: Add new package
Message-ID: <20120129222324.D88D890042@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20c79086f11c7e87e304350041732376d1e01781
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add upstream URL, remove redundant _INSTALL_TARGET]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in              |    1 +
 package/efl/libembryo/Config.in    |    9 +++++++++
 package/efl/libembryo/libembryo.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 3007783..0e27dab 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -12,6 +12,7 @@ source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
 source "package/efl/libevas/Config.in"
+source "package/efl/libembryo/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
new file mode 100644
index 0000000..63c7064
--- /dev/null
+++ b/package/efl/libembryo/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBEMBRYO
+	bool "libembryo"
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Embryo is primarily a shared library that gives you an API
+	  to load and control interpreted programs compiled into an
+	  abstract machine bytecode that it understands.
+
+	  http://trac.enlightenment.org/e/wiki/Embryo
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
new file mode 100644
index 0000000..0054ff4
--- /dev/null
+++ b/package/efl/libembryo/libembryo.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libembryo
+#
+#############################################################
+
+LIBEMBRYO_VERSION = 1.1.0
+LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
+LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
+LIBEMBRYO_INSTALL_STAGING = YES
+
+LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
