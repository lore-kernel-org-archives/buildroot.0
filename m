From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 21:22:19 +0100
Subject: [Buildroot] [git commit] libmhash: new package
Message-ID: <20130113203048.1EA9399E2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a029d7fc90387a66b64feb543696de4b9b19a24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/libmhash/Config.in   |    9 +++++++++
 package/libmhash/libmhash.mk |   14 ++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 770d842..01e3694 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -371,6 +371,7 @@ source "package/beecrypt/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
 source "package/libsha1/Config.in"
 source "package/nettle/Config.in"
diff --git a/package/libmhash/Config.in b/package/libmhash/Config.in
new file mode 100644
index 0000000..a9bd51a
--- /dev/null
+++ b/package/libmhash/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBMHASH
+	bool "libmhash"
+	help
+	  Mhash is a free (under GNU Lesser GPL) library which provides
+	  a uniform interface to a large number of hash algorithms.
+	  These algorithms can be used to compute checksums, message digests,
+	  and other signatures.
+
+	  http://mhash.sourceforge.net/
diff --git a/package/libmhash/libmhash.mk b/package/libmhash/libmhash.mk
new file mode 100644
index 0000000..aa05f93
--- /dev/null
+++ b/package/libmhash/libmhash.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libmhash
+#
+#############################################################
+
+LIBMHASH_VERSION = 0.9.9.9
+LIBMHASH_SITE = http://downloads.sourceforge.net/project/mhash/mhash/$(LIBMHASH_VERSION)
+LIBMHASH_SOURCE = mhash-$(LIBMHASH_VERSION).tar.bz2
+LIBMHASH_INSTALL_STAGING = YES
+LIBMHASH_LICENSE = LGPLv2
+LIBMHASH_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
