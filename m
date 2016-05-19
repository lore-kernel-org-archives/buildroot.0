From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 19 May 2016 09:38:13 -0500
Subject: [Buildroot] [PATCH v4] igmpproxy: bump version to
	a731683d1a65956fa05024b0597b105fe6a3a122
Message-ID: <1463668693-1367-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds uclinux support.

Fixes the following musl use standard unsigned integer
types autobuilder failures.
http://autobuild.buildroot.net/results/c6a/c6a6eec34cffb2c7876595b36fb8a01f475583f9/
http://autobuild.buildroot.net/results/943/9432748bf7b1e24db9fcb0a8cce6942fcdf6be5b/
http://autobuild.buildroot.net/results/083/083c61f43c2f1f0dec69d44583b447a0520933b7/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
v3 -> v4
 - Squashed bump and uclinux removal patches (Suggested by Baruch/Thomas)
   - Removes uclinux 0001- patch as the work was upstreamed
 - Removed previous hash value from hash file (Suggested by Thomas)

v2-> v3
 - New upstream contains required changes, bumping version

v1 -> v2
(Suggested by Thomas)
 - Updated patch comment to correctly represent the origin
   and latest issue tracking
 - Updated title to reflect patch purpose
---
 package/igmpproxy/0001-uclinux.patch | 16 ----------------
 package/igmpproxy/igmpproxy.hash     |  2 +-
 package/igmpproxy/igmpproxy.mk       |  5 ++---
 3 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 package/igmpproxy/0001-uclinux.patch

diff --git a/package/igmpproxy/0001-uclinux.patch b/package/igmpproxy/0001-uclinux.patch
deleted file mode 100644
index 7fa4a23..0000000
--- a/package/igmpproxy/0001-uclinux.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-configure.ac: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura igmpproxy-0.1.orig/configure.ac igmpproxy-0.1/configure.ac
---- igmpproxy-0.1.orig/configure.ac	2014-03-12 18:43:02.369323771 -0300
-+++ igmpproxy-0.1/configure.ac	2014-03-12 18:43:22.129979179 -0300
-@@ -7,7 +7,7 @@
- 
- AC_CANONICAL_HOST
- case $host_os in
--	linux*) os=linux;;
-+	linux*|uclinux*) os=linux;;
- 	freebsd*) os=freebsd;;
- 	netbsd*) os=netbsd;;
- 	openbsd*) os=openbsd;;
diff --git a/package/igmpproxy/igmpproxy.hash b/package/igmpproxy/igmpproxy.hash
index f7d3b1e..98dc242 100644
--- a/package/igmpproxy/igmpproxy.hash
+++ b/package/igmpproxy/igmpproxy.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ee18ff3d8c3ae3a29dccb7e5eedf332337330020168bd95a11cece8d7d7ee6ae  igmpproxy-0.1.tar.gz
+sha256  2be2171cf273678810283937f7752dc9b8402456d0a03ee55f06ca52fadf075f  igmpproxy-a731683d1a65956fa05024b0597b105fe6a3a122.tar.gz
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index cdf3774..9816872 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-IGMPPROXY_VERSION = 0.1
-IGMPPROXY_SITE = http://downloads.sourceforge.net/project/igmpproxy/igmpproxy/$(IGMPPROXY_VERSION)
-# igmpproxy-01-uclinux.patch
+IGMPPROXY_VERSION = a731683d1a65956fa05024b0597b105fe6a3a122
+IGMPPROXY_SITE = $(call github,pali,igmpproxy,$(IGMPPROXY_VERSION))
 IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPLv2+
 IGMPPROXY_LICENSE_FILES = COPYING
-- 
1.9.1
