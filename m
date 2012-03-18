From: Samuel MARTIN <s.martin49@gmail.com>
Date: Sun, 18 Mar 2012 09:54:02 +0100
Subject: [Buildroot] [PATCH 4/5] manual: fix typo
In-Reply-To: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
References: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332060843-2786-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt   |    3 ++-
 docs/manual/adding-packages-handwritten.txt |   14 +++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 0852b04..04be820 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -8,12 +8,13 @@ Some packages have been grouped by topic in a sub-directory:
 +multimedia+, +java+, +x11r7+, and +games+. If your package fits in
 one of these categories, then create your package directory in these.
 
+
 +Config.in+ file
 ~~~~~~~~~~~~~~~~
 
 Then, create a file named +Config.in+. This file will contain the
 option descriptions related to our +libfoo+ software that will be used
-and displayed in the configuration tool. It should basically contain :
+and displayed in the configuration tool. It should basically contain:
 
 ---------------------------
 config BR2_PACKAGE_LIBFOO
diff --git a/docs/manual/adding-packages-handwritten.txt b/docs/manual/adding-packages-handwritten.txt
index a9d247c..54ccf65 100644
--- a/docs/manual/adding-packages-handwritten.txt
+++ b/docs/manual/adding-packages-handwritten.txt
@@ -14,12 +14,12 @@ existing manual makefiles and to help understand how they work.*
 03: # libfoo
 04: #
 05: #############################################################
-06: LIBFOO_VERSION:=1.0
-07: LIBFOO_SOURCE:=libfoo-$(LIBFOO_VERSION).tar.gz
-08: LIBFOO_SITE:=http://www.foosoftware.org/downloads
-09: LIBFOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
-10: LIBFOO_BINARY:=foo
-11: LIBFOO_TARGET_BINARY:=usr/bin/foo
+06: LIBFOO_VERSION = 1.0
+07: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
+08: LIBFOO_SITE = http://www.foosoftware.org/downloads
+09: LIBFOO_DIR = $(BUILD_DIR)/foo-$(FOO_VERSION)
+10: LIBFOO_BINARY = foo
+11: LIBFOO_TARGET_BINARY = usr/bin/foo
 12:
 13: $(DL_DIR)/$(LIBFOO_SOURCE):
 14: 	$(call DOWNLOAD,$(LIBFOO_SITE),$(LIBFOO_SOURCE))
@@ -65,7 +65,7 @@ existing manual makefiles and to help understand how they work.*
 54: #
 55: #############################################################
 56: ifeq ($(BR2_PACKAGE_LIBFOO),y)
-57: TARGETS+=libfoo
+57: TARGETS += libfoo
 58: endif
 ------------------------
 
-- 
1.7.9.4
