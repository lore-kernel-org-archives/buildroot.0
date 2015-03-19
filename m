From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:40:13 +0100
Subject: [Buildroot] [git commit] gawk: bump to version 4.1.1
Message-ID: <20150319124128.48CAA818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb256466f67e5841010a753612d0a2e4db3e8279
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.hash |    2 ++
 package/gawk/gawk.mk   |    5 ++++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
new file mode 100644
index 0000000..72d3cdc
--- /dev/null
+++ b/package/gawk/gawk.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	efd4c6aafb1ce996309fc903ceb625e7012221c464eb72483dbb23adef1ee8db	gawk-4.1.1.tar.xz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index af486c4..bf136fa 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,12 +4,15 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.0
+GAWK_VERSION = 4.1.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
 GAWK_LICENSE = GPLv3+
 GAWK_LICENSE_FILES = COPYING
+# beta libtool version
+GAWK_AUTORECONF = YES
+GAWK_GETTEXTIZE = YES
 
 # Prefer full-blown gawk over busybox awk
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
