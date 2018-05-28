From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 23:27:14 +0200
Subject: [Buildroot] [git commit] package/corkscrew: new package
Message-ID: <20180602101013.D5F7A8199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6f2feec458460d18b10734d59f9c6a35244ff94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Corkscrew is a tool for tunneling SSH through HTTP proxies

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Thomas: add hash for license file, add entry in DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/corkscrew/Config.in      |  7 +++++++
 package/corkscrew/corkscrew.hash |  3 +++
 package/corkscrew/corkscrew.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c2c032980..d2da9a2f80 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -143,6 +143,7 @@ N:	Andy Kennedy <andy.kennedy@adtran.com>
 F:	package/libunwind/
 
 N:	Angelo Compagnucci <angelo.compagnucci@gmail.com>
+F:	package/corkscrew/
 F:	package/i2c-tools/
 F:	package/mono/
 F:	package/mono-gtksharp3/
diff --git a/package/Config.in b/package/Config.in
index 6cd19ec97f..6a1606e568 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1699,6 +1699,7 @@ menu "Networking applications"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
+	source "package/corkscrew/Config.in"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
diff --git a/package/corkscrew/Config.in b/package/corkscrew/Config.in
new file mode 100644
index 0000000000..1266f86e7e
--- /dev/null
+++ b/package/corkscrew/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CORKSCREW
+	bool "corkscrew"
+	help
+	  Corkscrew is a tool for tunneling SSH through HTTP proxies,
+	  but... you might find another use for it.
+
+	  https://github.com/bryanpkc/corkscrew
diff --git a/package/corkscrew/corkscrew.hash b/package/corkscrew/corkscrew.hash
new file mode 100644
index 0000000000..5a580d1343
--- /dev/null
+++ b/package/corkscrew/corkscrew.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  ba28a7d123fe607b87ff9d399b33e7549d9ef1a13ae3b61e8f61982e8ae5571d  corkscrew-a94f745b40077172b8fe7d77e2d583b9cf900281.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/corkscrew/corkscrew.mk b/package/corkscrew/corkscrew.mk
new file mode 100644
index 0000000000..13612d4448
--- /dev/null
+++ b/package/corkscrew/corkscrew.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# corkscrew
+#
+################################################################################
+
+CORKSCREW_VERSION = a94f745b40077172b8fe7d77e2d583b9cf900281
+CORKSCREW_SITE = $(call github,bryanpkc,corkscrew,$(CORKSCREW_VERSION))
+CORKSCREW_LICENSE = GPL-2.0
+CORKSCREW_LICENSE_FILES = COPYING
+CORKSCREW_AUTORECONF = YES
+
+$(eval $(autotools-package))
