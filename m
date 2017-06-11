From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:37:54 +0200
Subject: [Buildroot] [git commit] lsscsi: add new package
Message-ID: <20170611163834.8FB078184E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fb6a73fa486eed42550cb8fb8ba2a03bcd2b0c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas:
 - add entry to DEVELOPERS file
 - use SPDX license code
 - license is GPL-2.0+, not GPL-2.0]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/lsscsi/Config.in   |  6 ++++++
 package/lsscsi/lsscsi.hash |  2 ++
 package/lsscsi/lsscsi.mk   | 13 +++++++++++++
 5 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 23946ac..7d8b410 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -98,6 +98,9 @@ F:	package/python-pydal/
 F:	package/python-web2py/
 F:	package/sysdig/
 
+N:	Antony Pavlov <antonynpavlov@gmail.com>
+F:	package/lsscsi/
+
 N:	Anthony Viallard <viallard@syscom-instruments.com>
 F:	package/gnuplot/
 
diff --git a/package/Config.in b/package/Config.in
index 10e51c1..3a99c86 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,6 +426,7 @@ endmenu
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
 	source "package/lshw/Config.in"
+	source "package/lsscsi/Config.in"
 	source "package/lsuio/Config.in"
 	source "package/lvm2/Config.in"
 	source "package/mali-t76x/Config.in"
diff --git a/package/lsscsi/Config.in b/package/lsscsi/Config.in
new file mode 100644
index 0000000..1c85686
--- /dev/null
+++ b/package/lsscsi/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LSSCSI
+	bool "lsscsi"
+	help
+	  lsscsi - list SCSI devices (or hosts) and their attributes
+
+	  http://sg.danny.cz/scsi/lsscsi.html
diff --git a/package/lsscsi/lsscsi.hash b/package/lsscsi/lsscsi.hash
new file mode 100644
index 0000000..d39da9b
--- /dev/null
+++ b/package/lsscsi/lsscsi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 025d009a1af42bc5b2fca664c44c9ecdfd754356e4a44f5c6aced2420afadd50  lsscsi-0.28.tgz
diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
new file mode 100644
index 0000000..649aad9
--- /dev/null
+++ b/package/lsscsi/lsscsi.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lsscsi
+#
+################################################################################
+
+LSSCSI_VERSION = 0.28
+LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
+LSSCSI_SITE = http://sg.danny.cz/scsi
+LSSCSI_LICENSE = GPL-2.0+
+LSSCSI_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
