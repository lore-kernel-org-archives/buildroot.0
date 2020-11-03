From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 23:04:08 +0100
Subject: [Buildroot] [git commit] package/busybox: update licensing info
Message-ID: <20201103215220.B677486B33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca76d0336d89b7380aadb23aad2d32d240f4ec1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Busybox is mainly licensed under the GPL-2.0, but the bzip2 part is a
modified copy of the bzip2/libbzip2 project, which comes with its own
license.

Update the licensing information accordingly.

Add the hash for the new license file, and fixup indentation (2 spaces).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.hash | 5 +++--
 package/busybox/busybox.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index cf744ffcda..2229379600 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,4 +1,5 @@
 # From https://busybox.net/downloads/busybox-1.32.0.tar.bz2.sha256
-sha256 c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689  busybox-1.32.0.tar.bz2
+sha256  c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689  busybox-1.32.0.tar.bz2
 # Locally computed
-sha256 bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
+sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
+sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 76ab30780c..8c8303a358 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,8 +7,8 @@
 BUSYBOX_VERSION = 1.32.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_LICENSE = GPL-2.0
-BUSYBOX_LICENSE_FILES = LICENSE
+BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
+BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
