From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 31 Mar 2016 17:07:21 -0300
Subject: [Buildroot] [PATCH 1/2] alsa-lib: bump to version 1.1.1
Message-ID: <1459454842-5484-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0001-add-missing-include.patch since it's upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/alsa-lib/0001-add-missing-include.patch    | 29 ----------------------
 ...0005-musl-pcm-h.patch => 0001-musl-pcm-h.patch} |  0
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 4 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 package/alsa-lib/0001-add-missing-include.patch
 rename package/alsa-lib/{0005-musl-pcm-h.patch => 0001-musl-pcm-h.patch} (100%)

diff --git a/package/alsa-lib/0001-add-missing-include.patch b/package/alsa-lib/0001-add-missing-include.patch
deleted file mode 100644
index ac7dfa9..0000000
--- a/package/alsa-lib/0001-add-missing-include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Subject: [PATCH] topology: Add missing include sys/stat.h
-
-Necessary for proper definitions of S_IRUSR & co.  Otherwise it
-results in compile errors with old glibc:
-  parser.c: In function 'snd_tplg_build_file':
-  parser.c:262: error: 'S_IRUSR' undeclared (first use in this function)
-  parser.c:262: error: (Each undeclared identifier is reported only once
-  parser.c:262: error: for each function it appears in.)
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: upstream
-
-diff --git a/src/topology/parser.c b/src/topology/parser.c
-index 80a0ae0..18bb9c7 100644
---- a/src/topology/parser.c
-+++ b/src/topology/parser.c
-@@ -16,6 +16,7 @@
-            Liam Girdwood <liam.r.girdwood@linux.intel.com>
- */
- 
-+#include <sys/stat.h>
- #include "list.h"
- #include "tplg_local.h"
- 
--- 
-1.7.11.7
-
diff --git a/package/alsa-lib/0005-musl-pcm-h.patch b/package/alsa-lib/0001-musl-pcm-h.patch
similarity index 100%
rename from package/alsa-lib/0005-musl-pcm-h.patch
rename to package/alsa-lib/0001-musl-pcm-h.patch
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 506416d..49be643 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15	alsa-lib-1.1.0.tar.bz2
+sha256	8ac76c3144ed2ed49da7622ab65ac5415205913ccbedde877972383cbc234269	alsa-lib-1.1.1.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2075d41..ae0377d 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.0
+ALSA_LIB_VERSION = 1.1.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
-- 
2.7.3
