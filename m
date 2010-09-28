From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 28 Sep 2010 23:50:58 +0200
Subject: [Buildroot] [PATCH] Makefile: Force make to run serially in the
	top-level Makefile
Message-ID: <1285710658-17096-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The top-level Makefile can be executed in parallel, as it causes problems.
We can force make to be not parallel.

It's been reported many times, and recent discussions on IRC with kos_tom,
and user nick-named knee, led to this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index faa802b..e0cde26 100644
--- a/Makefile
+++ b/Makefile
@@ -18,6 +18,9 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 #
 
+# This top-level Makefile can *not* be executed in parallel
+.NOTPARALLEL:
+
 #--------------------------------------------------------------
 # Just run 'make menuconfig', configure stuff, then run 'make'.
 # You shouldn't need to mess with anything beyond this point...
-- 
1.7.1
