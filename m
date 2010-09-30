From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Sep 2010 14:37:01 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: Force make to run
	serially in the top-level Makefile
Message-ID: <20100930123758.73C1A7F903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d487168c711388efbe8185e94e2690bdf7cd5b4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The top-level Makefile can be executed in parallel, as it causes problems.
We can force make to be not parallel.

It's been reported many times, and recent discussions on IRC with kos_tom,
and user nick-named knee, led to this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index aab346e..9c2e6af 100644
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
