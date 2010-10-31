From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 31 Oct 2010 17:35:09 +0100
Subject: [Buildroot] [PATCH 1/8] Makefile: move .NOTPARALLEL
In-Reply-To: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1288542916-21883-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1288542916-21883-2-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it down, users should not mess with it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
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
