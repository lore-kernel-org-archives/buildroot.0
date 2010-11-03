From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: move .NOTPARALLEL
Message-ID: <20101103230449.816EC8A5A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d239bbe2771aa9f8ec5e02241a93c63195489a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move it down, users should not mess with it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index efc42ff..3780fe6 100644
--- a/Makefile
+++ b/Makefile
@@ -18,13 +18,14 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 #
 
-# This top-level Makefile can *not* be executed in parallel
-.NOTPARALLEL:
-
 #--------------------------------------------------------------
 # Just run 'make menuconfig', configure stuff, then run 'make'.
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
+
+# This top-level Makefile can *not* be executed in parallel
+.NOTPARALLEL:
+
 # absolute path
 TOPDIR:=$(shell pwd)
 CONFIG_CONFIG_IN=Config.in
-- 
1.7.1
