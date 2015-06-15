From: Karoly Kasza <kaszak@gmail.com>
Date: Mon, 15 Jun 2015 08:56:26 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: move to GitHub
Message-ID: <1434351386-2515-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Open-vm-tools project is moved to GitHub.
Hash file removed.
Major version adjusted according to GitHub tags.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/openvmtools/openvmtools.hash | 3 ---
 package/openvmtools/openvmtools.mk   | 7 +++----
 2 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 package/openvmtools/openvmtools.hash

diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
deleted file mode 100644
index 80eb99f..0000000
--- a/package/openvmtools/openvmtools.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://sourceforge.net/projects/open-vm-tools/files/open-vm-tools/stable-9.10.0/
-md5	d19439b499f0cbc7001e0cc65aa1a5a7	open-vm-tools-9.10.0-2476743.tar.gz
-sha1	5954c2a3eb66f7ffe4be1861f3bf6b43a2b3c6fc	open-vm-tools-9.10.0-2476743.tar.gz
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 92ecd36..26e41bb 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION_MAJOR = 9.10.0
-OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-2476743
-OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
-OPENVMTOOLS_SITE = http://downloads.sourceforge.net/project/open-vm-tools/open-vm-tools/stable-$(OPENVMTOOLS_VERSION_MAJOR)
+OPENVMTOOLS_VERSION_MAJOR = stable-9.10
+OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR).0
+OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
 OPENVMTOOLS_LICENSE = LGPLv2.1
 OPENVMTOOLS_LICENSE_FILES = COPYING
 # Autoreconf needed or config/missing will run configure again at buildtime
-- 
2.1.4
