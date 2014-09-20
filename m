From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 23:48:25 +0200
Subject: [Buildroot] [PATCH] package/genpart: make it a target package, too
Message-ID: <1411249705-13968-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

genpart comes handy when there is a need to programatically generate
partition tables, without the need for a full partitioning program like
fdisk et al.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in          | 1 +
 package/genpart/Config.in  | 8 ++++++++
 package/genpart/genpart.mk | 1 +
 3 files changed, 10 insertions(+)
 create mode 100644 package/genpart/Config.in

diff --git a/package/Config.in b/package/Config.in
index 73ba86a..f6bf295 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -150,6 +150,7 @@ menu "Filesystem and flash utilities"
 	source "package/f2fs-tools/Config.in"
 	source "package/flashbench/Config.in"
 	source "package/genext2fs/Config.in"
+	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
 	source "package/kobs-ng/Config.in"
 	source "package/makedevs/Config.in"
diff --git a/package/genpart/Config.in b/package/genpart/Config.in
new file mode 100644
index 0000000..8d9ec79
--- /dev/null
+++ b/package/genpart/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GENPART
+	bool "genpart"
+	help
+	  Generate a 16 byte partition table entry defined by command line
+	  arguments and dump it to stdout. No CHS magic is done, only lba
+	  entries are filled out.
+
+	  http://www.pengutronix.de/software/genpart/index_en.html
diff --git a/package/genpart/genpart.mk b/package/genpart/genpart.mk
index c95acaf..e2208b8 100644
--- a/package/genpart/genpart.mk
+++ b/package/genpart/genpart.mk
@@ -15,4 +15,5 @@ GENPART_SITE          = http://www.pengutronix.de/software/genpart/download
 # So, until the authors have clarified the licensing terms:
 GENPART_LICENSE       = Unknown (clarification has been asked to the authors)
 
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
