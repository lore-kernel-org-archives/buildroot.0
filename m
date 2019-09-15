From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:03:06 +0200
Subject: [Buildroot] [git commit] package/libite: bump version to 2.1.0
Message-ID: <20190915205956.C063D8E6F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00135b03946ab850dbeadc2a06e2ed96568cb17c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.
Switched _SOURCE to .xz tarball provided by upstream.
This tarball contains a configure script so we do not need to
autoreconf anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libite/libite.hash | 4 +++-
 package/libite/libite.mk   | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 01859f0a21..db3f6232b2 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,7 @@
+# From https://github.com/troglobit/libite/releases/download/v2.1.0/libite-2.1.0.tar.xz.md5
+md5 701aa509f27ee35156bc53601e69fa74  libite-2.1.0.tar.xz
 # Locally calculated
-sha256 bd5d08066f3e53cc8967beb6f0620286aad7a24d49fb730caa1c6d09a26bb705  libite-2.0.2.tar.gz
+sha256 cf56e720146243749e0af5763d4a84eef738e20f2bef2d867497fefc39dee991  libite-2.1.0.tar.xz
 sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
 sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  src/chomp.c
 sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 7fe6ce33b8..c598da1b4a 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.0.2
-LIBITE_SITE = $(call github,troglobit,libite,v$(LIBITE_VERSION))
+LIBITE_VERSION = 2.1.0
+LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
+LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
-LIBITE_AUTORECONF = YES
 
 $(eval $(autotools-package))
