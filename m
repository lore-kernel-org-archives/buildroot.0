From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:10:29 +0200
Subject: [Buildroot] [git commit branch/next] libfreefare: Bump version and
	change site
Message-ID: <20150808105642.A11A37FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27453f431a680c7bdf55ad7ae3b56b8cb422c69a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Google Code is a closing forge, libfreefare has already made the move
to Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libfreefare/libfreefare.hash |    2 ++
 package/libfreefare/libfreefare.mk   |    7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
new file mode 100644
index 0000000..4d23136
--- /dev/null
+++ b/package/libfreefare/libfreefare.hash
@@ -0,0 +1,2 @@
+# From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
+sha256 bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 5d6d636..e2d7bf1 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -4,8 +4,11 @@
 #
 ################################################################################
 
-LIBFREEFARE_VERSION = 0.3.4
-LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
+LIBFREEFARE_VERSION = 0.4.0
+LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
+# Do not use the github helper here, the generated tarball is *NOT*
+# the same as the one uploaded by upstream for the release.
+LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 LIBFREEFARE_LICENSE = LGPLv3+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
