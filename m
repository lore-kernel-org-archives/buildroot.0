From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Jul 2015 22:38:31 +0200
Subject: [Buildroot] [PATCH 05/12] libfreefare: Bump version and change site
In-Reply-To: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1437943118-18060-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1437943118-18060-6-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is a closing forge, libfreefare has already made the move to
Github.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libfreefare/libfreefare.hash | 2 ++
 package/libfreefare/libfreefare.mk   | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 package/libfreefare/libfreefare.hash

diff --git a/package/libfreefare/libfreefare.hash b/package/libfreefare/libfreefare.hash
new file mode 100644
index 0000000..4d23136
--- /dev/null
+++ b/package/libfreefare/libfreefare.hash
@@ -0,0 +1,2 @@
+# From https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-0.4.0/libfreefare-0.4.0.tar.bz2
+sha256 bfa31d14a99a1247f5ed49195d6373de512e3eb75bf1627658b40cf7f876bc64  libfreefare-0.4.0.tar.bz2
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 5d6d636..a8de617 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -4,8 +4,11 @@
 #
 ################################################################################
 
-LIBFREEFARE_VERSION = 0.3.4
-LIBFREEFARE_SITE = http://libfreefare.googlecode.com/files
+LIBFREEFARE_VERSION = 0.4.0
+LIBFREEFARE_SOURCE = libfreefare-$(LIBFREEFARE_VERSION).tar.bz2
+# Do not use the github helper here, the generated tarball is *NOT* the same
+# # as the one uploaded by upstream for the release.
+LIBFREEFARE_SITE = https://github.com/nfc-tools/libfreefare/releases/download/libfreefare-$(LIBFREEFARE_VERSION)
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 LIBFREEFARE_LICENSE = LGPLv3+ with exception
 LIBFREEFARE_LICENSE_FILES = COPYING
-- 
2.1.4
