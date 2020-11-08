From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Nov 2020 19:14:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/busybox: update
 licensing info
Message-ID: <20201108180657.365BE82602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60b751a12611c16099846227666763b6713f51f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Busybox is mainly licensed under the GPL-2.0, but the bzip2 part is a
modified copy of the bzip2/libbzip2 project, which comes with its own
license.

Update the licensing information accordingly.

Add the hash for the new license file, and fixup indentation (2 spaces).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca76d0336d89b7380aadb23aad2d32d240f4ec1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 5 +++--
 package/busybox/busybox.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index e5b05ae731..d2431d74cd 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,4 +1,5 @@
 # From https://busybox.net/downloads/busybox-1.31.1.tar.bz2.sha256
-sha256 d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998  busybox-1.31.1.tar.bz2
+sha256  d0f940a72f648943c1f2211e0e3117387c31d765137d92bd8284a3fb9752a998  busybox-1.31.1.tar.bz2
 # Locally computed
-sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
+sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
+sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 55aa9b0bb1..3bbefc406b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,8 +7,8 @@
 BUSYBOX_VERSION = 1.31.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_LICENSE = GPL-2.0
-BUSYBOX_LICENSE_FILES = LICENSE
+BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
+BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
