From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Aug 2012 11:44:52 +0200
Subject: [Buildroot] [git commit] pkg-stats: support <pkg>_LICENSE = lines
	with spaces
Message-ID: <20120805095159.09EF597015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1f580731b7872684a4bef8930cd2f468e2dc69a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For alignement reasons, we sometimes add spaces between <pkg>_LICENSE
and the equal sign. Take this into account in pkg-stats.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index de73eeb..a07af55 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -155,7 +155,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	generic_packages=$(($generic_packages+1))
     fi
 
-    if grep -qE "^${pkgvariable}_LICENSE =" $i ; then
+    if grep -qE "^${pkgvariable}_LICENSE[ ]*=" $i ; then
 	packages_with_license=$(($packages_with_license+1))
 	license=1
     else
