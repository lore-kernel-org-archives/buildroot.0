From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 21 Feb 2014 13:53:17 +0000
Subject: [Buildroot] [PATCH 2/2] matchbox-lib: apply upstream based patch to
	include a missing header
In-Reply-To: <1392990797-40849-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1392990797-40849-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1392990797-40849-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream patch can't be applied as-is because the source code of
the file which is patched has changed. A version bump to the latest
release doesn't fix the problem because the upstream patch was applied
after the resease.

Upstream patch:
   http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/commit/?id=9315bcce1f01e7d6c00161442d61d3c676794d9d

Fixes:
   http://autobuild.buildroot.net/results/e4d/e4d510ab6ba69f95401e3120ab90ccdff22deb91/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../matchbox-lib-0003-include-setjmp-h.patch       |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/matchbox/matchbox-lib/matchbox-lib-0003-include-setjmp-h.patch

diff --git a/package/matchbox/matchbox-lib/matchbox-lib-0003-include-setjmp-h.patch b/package/matchbox/matchbox-lib/matchbox-lib-0003-include-setjmp-h.patch
new file mode 100644
index 0000000..72e1e45
--- /dev/null
+++ b/package/matchbox/matchbox-lib/matchbox-lib-0003-include-setjmp-h.patch
@@ -0,0 +1,17 @@
+matchbox-lib: include setjmp.h
+
+Based on this upstream patch:
+
+   http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/commit/?id=9315bcce1f01e7d6c00161442d61d3c676794d9d
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+--- libmatchbox-1.9/libmb/mbpixbuf.c.orig	2014-02-21 12:45:46.867035956 +0000
++++ libmatchbox-1.9/libmb/mbpixbuf.c	2014-02-21 12:46:43.482949583 +0000
+@@ -22,6 +22,7 @@
+ 
+ #include <strings.h>
+ #include "mbpixbuf.h"
++#include <setjmp.h>
+ 
+ #define BYTE_ORD_24_RGB  0
+ #define BYTE_ORD_24_RBG  1
-- 
1.7.1
