From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 23:50:13 +0200
Subject: [Buildroot] [git commit] package/aumix: add debian patch for fixing
 build with gcc 10
Message-ID: <20200711214718.52A0A83F22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52e9d6e13b3ee289d8c9d443277e0de1371e10c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/aumix/aumix.hash | 1 +
 package/aumix/aumix.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/aumix/aumix.hash b/package/aumix/aumix.hash
index 2fbab4bda2..43c09dc54e 100644
--- a/package/aumix/aumix.hash
+++ b/package/aumix/aumix.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  d2ce43d532ef75072c8d4e7922e3bc06be6d97765a508d9ceb0d1766bbe70e29  aumix-2.9.1.tar.bz2
 sha256  1ca3e8f71b7de618968e7ea9fe47822d9e704dc476aef8544033abedec355225  COPYING
+sha256  3bfa74db4aeb68bfef7ee213bb1dbf236d784dea3d35a52f6e23a48c847375dd  19_no-common.patch
diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
index 9bcc19a37c..a4001f5bbb 100644
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -12,6 +12,9 @@ AUMIX_GETTEXTIZE = YES
 AUMIX_LICENSE = GPL-2.0+
 AUMIX_LICENSE_FILES = COPYING
 
+AUMIX_PATCH = \
+	https://sources.debian.org/data/main/a/aumix/2.9.1-7/debian/patches/19_no-common.patch
+
 AUMIX_CONF_OPTS = \
 	--without-gtk \
 	--without-gtk1 \
