From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:15 -0000
Subject: [Buildroot] [git commit] alsa-lib: bump to version 1.1.0
Message-ID: <20151201232114.C3892821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f98e865074a6c6f9cc38721b3320f95de5f2967b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/0001-add-missing-include.patch | 29 +++++++++++++++++++++++++
 package/alsa-lib/alsa-lib.hash                  |  2 +-
 package/alsa-lib/alsa-lib.mk                    |  2 +-
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/0001-add-missing-include.patch b/package/alsa-lib/0001-add-missing-include.patch
new file mode 100644
index 0000000..ac7dfa9
--- /dev/null
+++ b/package/alsa-lib/0001-add-missing-include.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH] topology: Add missing include sys/stat.h
+
+Necessary for proper definitions of S_IRUSR & co.  Otherwise it
+results in compile errors with old glibc:
+  parser.c: In function 'snd_tplg_build_file':
+  parser.c:262: error: 'S_IRUSR' undeclared (first use in this function)
+  parser.c:262: error: (Each undeclared identifier is reported only once
+  parser.c:262: error: for each function it appears in.)
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Status: upstream
+
+diff --git a/src/topology/parser.c b/src/topology/parser.c
+index 80a0ae0..18bb9c7 100644
+--- a/src/topology/parser.c
++++ b/src/topology/parser.c
+@@ -16,6 +16,7 @@
+            Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ */
+ 
++#include <sys/stat.h>
+ #include "list.h"
+ #include "tplg_local.h"
+ 
+-- 
+1.7.11.7
+
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 3e132c8..506416d 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0	alsa-lib-1.0.29.tar.bz2
+sha256	dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15	alsa-lib-1.1.0.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 3115433..ea2351c 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.0.29
+ALSA_LIB_VERSION = 1.1.0
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
