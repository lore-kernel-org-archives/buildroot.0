From: Samuel MARTIN <s.martin49@gmail.com>
Date: Wed, 21 Mar 2012 00:09:55 +0100
Subject: [Buildroot] [PATCH 05/11] manual: update make-tips.txt
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332285001-12881-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/make-tips.txt |   46 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 646efdf..a512689 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -1,2 +1,48 @@
+[[make-tips]]
 'make' tips
 -----------
+
+Because Buildroot is a set of Makefiles and patches, there are few
+things useful to know, such as:
+
+Display all command executed by make:
+
+--------------------
+ $ make V=0|1 <target>
+--------------------
+
+Display all available targets:
+
+--------------------
+ $ make help
+--------------------
+
+Note that, some settings in the +.config+ file may hide some targets
+like:
+
+* +busybox-menuconfig+ depends whether +busybox+ is enabled or not in
+  the +Package selection+ menu
+* +linux-menuconfig+ and +linux-savedefconfig+ depends on whether
+  +linux+ is enabled or not
+* +uclibc-menuconfig+ depends on whether the toolchain uses the
+  Buildroot internal toolchain backend or not
+* +ctng-menuconfig+ depends on whether the toolchain uses the
+  crosstool-NG backend or not
+* +barebox-menuconfig+ and +barebox-savedefconfig+ depends on whether
+  +barebox+ bootloader is enabled or not
+
+Delete all build products (including build directories, host, staging
+and target trees, the images and the toolchain):
+
+--------------------
+ $ make clean
+--------------------
+
+Delete all build products as well as the configuration:
+
+--------------------
+ $ make distclean
+--------------------
+
+Note that if +ccache+ is enabled, running +make clean|distclean+ does
+not empty the Buildroot's cache. To delete it, refer to xref:ccache[].
-- 
1.7.9.4
