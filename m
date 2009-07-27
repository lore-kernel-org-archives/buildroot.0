From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 17:24:01 +0200
Subject: [Buildroot] [git commit] xconfig: Change titlebar to Buildroot
	Configuration
Message-ID: <20090727153323.95B557775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=69f982cdade4050c89ab8ebfd97d43288e625179
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/kconfig-to-buildroot2.patch |   17 ++++++++++++++++-
 package/config/qconf.cc                    |    3 +--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
index 8e7ce42..5f5d8ee 100644
--- a/package/config/kconfig-to-buildroot2.patch
+++ b/package/config/kconfig-to-buildroot2.patch
@@ -7,10 +7,11 @@
  gconf.c             |    4 -
  gconf.glade         |    2 
  mconf.c             |   39 +++++++++----------
+ qconf.cc            |    3 -
  util.c              |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++-
  zconf.tab.c_shipped |    2 
  zconf.y             |    2 
- 11 files changed, 238 insertions(+), 101 deletions(-)
+ 12 files changed, 239 insertions(+), 103 deletions(-)
 
 Index: config/Makefile
 ===================================================================
@@ -726,6 +727,20 @@ Index: config/mconf.c
 +	return conf_write_autoconf();
  }
  
+Index: config/qconf.cc
+===================================================================
+--- config.orig/qconf.cc
++++ config/qconf.cc
+@@ -1277,8 +1277,7 @@
+ 	char title[256];
+ 
+ 	QDesktopWidget *d = configApp->desktop();
+-	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
+-		getenv("KERNELVERSION"));
++	snprintf(title, sizeof(title), _("Buildroot Configuration"));
+ 	setCaption(title);
+ 
+ 	width = configSettings->readNumEntry("/window width", d->width() - 64);
 Index: config/util.c
 ===================================================================
 --- config.orig/util.c
diff --git a/package/config/qconf.cc b/package/config/qconf.cc
index ce7d508..3e539c1 100644
--- a/package/config/qconf.cc
+++ b/package/config/qconf.cc
@@ -1277,8 +1277,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	char title[256];
 
 	QDesktopWidget *d = configApp->desktop();
-	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
-		getenv("KERNELVERSION"));
+	snprintf(title, sizeof(title), _("Buildroot Configuration"));
 	setCaption(title);
 
 	width = configSettings->readNumEntry("/window width", d->width() - 64);
-- 
1.6.3.3
