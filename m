From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jan 2013 17:49:23 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: does not reqquire wordexp
Message-ID: <1357058963-18751-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Builds just fine without it (probably stray include?)

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend-no-wordexp.patch |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/tvheadend/tvheadend-no-wordexp.patch

diff --git a/package/tvheadend/tvheadend-no-wordexp.patch b/package/tvheadend/tvheadend-no-wordexp.patch
new file mode 100644
index 0000000..ae290ed
--- /dev/null
+++ b/package/tvheadend/tvheadend-no-wordexp.patch
@@ -0,0 +1,20 @@
+epggrab: do not include wordexp.h
+
+Nothing from wordexp.h is needed (stray include?)
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Patch sent upstream, but no mailing-list. :-(
+Status: awaiting feedback.
+
+diff -durN tvheadend-v3.3.orig/src/epggrab.c tvheadend-v3.3/src/epggrab.c
+--- tvheadend-v3.3.orig/src/epggrab.c	2012-09-25 15:32:31.000000000 +0200
++++ tvheadend-v3.3/src/epggrab.c	2012-12-31 19:22:29.768431849 +0100
+@@ -20,7 +20,6 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <assert.h>
+-#include <wordexp.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/un.h>
-- 
1.7.2.5
