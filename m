From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Nov 2014 11:09:06 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.2
Message-ID: <1415023746-3969-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch now upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...np-Discovery-add-missing-stdlib.h-include.patch | 30 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch

diff --git a/package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch b/package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch
deleted file mode 100644
index ff581c3..0000000
--- a/package/mpd/0001-upnp-Discovery-add-missing-stdlib.h-include.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1901bd9d6be651fbaa5c7659d92d3361e6d6a823 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 28 Oct 2014 07:25:48 -0300
-Subject: [PATCH] upnp/Discovery: add missing stdlib.h include
-
-Used for free().
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: Sent upstream.
-
- src/lib/upnp/Discovery.cxx | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/lib/upnp/Discovery.cxx b/src/lib/upnp/Discovery.cxx
-index 9ea78c6..2c91e37 100644
---- a/src/lib/upnp/Discovery.cxx
-+++ b/src/lib/upnp/Discovery.cxx
-@@ -26,6 +26,8 @@
- 
- #include <upnp/upnptools.h>
- 
-+#include <stdlib.h>
-+
- #include <string.h>
- 
- // The service type string we are looking for.
--- 
-2.0.4
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 7676b37..0861706 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	8b3afcd440181c9bd18b229b5974e529d59648344dd371370d6f7d62ec2847c5	mpd-0.19.1.tar.xz
+sha256	73f0ed6b4001628287a71d077c624a2ca8200b24e3e877b725fcbf54dfe6a108	mpd-0.19.2.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6d2918d..8ec3c0e 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).1
+MPD_VERSION = $(MPD_VERSION_MAJOR).2
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.0.4
