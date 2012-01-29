From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 22:00:56 +0100
Subject: [Buildroot] [git commit] libefreet: Add new package
Message-ID: <20120129222325.2579A9092E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eed21084821591a7537f00edf826e427c7123078
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add upstream URL]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in              |    1 +
 package/efl/libefreet/Config.in    |   10 ++++++++++
 package/efl/libefreet/libefreet.mk |   14 ++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 258d99a..b747953 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -12,6 +12,7 @@ source "package/efl/expedite/Config.in"
 source "package/efl/libeina/Config.in"
 source "package/efl/libecore/Config.in"
 source "package/efl/libeet/Config.in"
+source "package/efl/libefreet/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
new file mode 100644
index 0000000..8687db4
--- /dev/null
+++ b/package/efl/libefreet/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBEFREET
+	bool "libefreet"
+	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_LIBEET
+	select BR2_PACKAGE_LIBECORE
+	help
+	  Efreet is a library designed to help apps work with several of the
+	  Freedesktop.org standards regarding Icons, Desktop files and Menus.
+
+	  http://trac.enlightenment.org/e/wiki/Efreet
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
new file mode 100644
index 0000000..14fb8cb
--- /dev/null
+++ b/package/efl/libefreet/libefreet.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libefreet
+#
+################################################################################
+
+LIBEFREET_VERSION = 1.1.0
+LIBEFREET_SOURCE = efreet-$(LIBEFREET_VERSION).tar.bz2
+LIBEFREET_SITE = http://download.enlightenment.org/releases/
+LIBEFREET_INSTALL_STAGING = YES
+
+LIBEFREET_DEPENDENCIES = libeina libeet libecore
+
+$(eval $(call AUTOTARGETS))
