From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:07 +0100
Subject: [Buildroot] [PATCH 01/51] bmon: Bump version
Message-ID: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The release contains the configure scripts, as such we don't need the
autoreconf anymore.

Also add a hash file since there is a release tarball uploaded by the
maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/bmon/bmon.hash | 2 ++
 package/bmon/bmon.mk   | 6 ++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 create mode 100644 package/bmon/bmon.hash

diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
new file mode 100644
index 0000000..dbe2e68
--- /dev/null
+++ b/package/bmon/bmon.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  78ab9e46840178fbc874cdbc94fde34e72e41a18a27383660b50b4c3cd0d1f9c  bmon-3.5.tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index d4c7a49..d440156 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-BMON_VERSION = 3.2
-BMON_SITE = $(call github,tgraf,bmon,v$(BMON_VERSION))
-# configure not shipped
-BMON_AUTORECONF = YES
+BMON_VERSION = 3.5
+BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)/
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c
 BMON_LICENSE_FILES = LICENSE
-- 
2.1.1
