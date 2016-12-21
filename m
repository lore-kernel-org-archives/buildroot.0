From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 17:08:06 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] gdk-pixbuf: security bump
	to version 2.36.2
Message-ID: <20161221161130.75E2981E79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3df927248e89b8547246341f501365cc22597b2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Fixes:
* Fix a NULL pointer dereference (#776026)
* Fix a memory leak (#776020)
* Avoid a buffer overrun in the qtif loader ($#775648)
* Fix a crash in the bmp loader (#775242)
* Fix crash opening pnm images with large dimensions (#775232)
* Prevent buffer overflow in the pixdata loader (#775693)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 75c3c94de92b3c8840306aefbfe8daeb3cb65c2c)
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 5508fd2..fc46b66 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.1.sha256sum
-sha256	9d5ba72070460c1b5b74115d395a3e33daeb7b7b67fb256cdccc9d7187c42a38	gdk-pixbuf-2.36.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.2.sha256sum
+sha256	3a082ad67d68b55970aed0b2034a06618167be98a42d5c70de736756b45d325d	gdk-pixbuf-2.36.2.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4f1fe59..3954602 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).1
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
