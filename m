From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Sep 2020 22:46:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsvg: fix license
Message-ID: <20200913204609.2713172-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit df20e4546384d1c249a6a0541183590671e83d77 forgot to update hash of
COPYING.LIB which has been updated to use LGPL-2.1+ in version 2.47.0:
https://github.com/GNOME/librsvg/commit/96b34f865dc8465d2ab93c7ae8344178b0ea7ed7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librsvg/librsvg.hash | 2 +-
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 899c5ea760..c9fb23807f 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -2,4 +2,4 @@
 sha256  f480a325bbdf26d1874eb6fb330ebc5920ba64e3e08de61931bb4506dfef2692  librsvg-2.48.8.tar.xz
 
 # Locally computed
-sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 00be501e93..67bc743656 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -17,7 +17,7 @@ HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf host-rustc libglib2 libxml2 pango \
 	$(TARGET_NLS_DEPENDENCIES)
 HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml2 host-pango host-rustc
-LIBRSVG_LICENSE = LGPL-2.0+
+LIBRSVG_LICENSE = LGPL-2.1+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-- 
2.28.0
