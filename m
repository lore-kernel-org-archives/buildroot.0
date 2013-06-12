From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Jun 2013 23:01:46 +0200
Subject: [Buildroot] [git commit] apply-patches.sh: ensure a fixed (and
	simple) sorting order is used
Message-ID: <20130612210546.7175B9AD50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15ceab14b4967711119587f0e7c3b324ce11fea8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So we always apply patches in the samme order.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/apply-patches.sh |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7d5856c..2995ea9 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -34,6 +34,9 @@ patchdir=${2-../kernel-patches}
 shift 2
 patchpattern=${@-*}
 
+# use a well defined sorting order
+export LC_COLLATE=C
+
 if [ ! -d "${builddir}" ] ; then
     echo "Aborting.  '${builddir}' is not a directory."
     exit 1
