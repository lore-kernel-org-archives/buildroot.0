From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 16:12:08 +0100
Subject: [Buildroot] [git commit] dado: new package
Message-ID: <20140301151231.792C4903EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f33db65bd6a9e91819b1389cd5150746ad23a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/dado/Config.in |    6 ++++++
 package/dado/dado.mk   |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c4cdcc4..932015b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -372,6 +372,7 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/cosmo/Config.in"
 source "package/coxpcall/Config.in"
+source "package/dado/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
diff --git a/package/dado/Config.in b/package/dado/Config.in
new file mode 100644
index 0000000..fb469f4
--- /dev/null
+++ b/package/dado/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DADO
+	bool "dado"
+	help
+	  Database Facilities for LuaSQL.
+
+	  http://www.ccpa.puc-rio.br/software/dado/
diff --git a/package/dado/dado.mk b/package/dado/dado.mk
new file mode 100644
index 0000000..3a58215
--- /dev/null
+++ b/package/dado/dado.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# dado
+#
+################################################################################
+
+DADO_VERSION = 1.5.2-1
+DADO_LICENSE = MIT
+
+$(eval $(luarocks-package))
